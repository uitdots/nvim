#!/usr/bin/env python3
"""Generate opencode_models.lua from `opencode models --verbose`.

Usage:
    python3 scripts/update_opencode_models.py [--check]

Flags:
    --check   Verify the generated file is up-to-date (exit 1 if stale)

Output:
    lua/configs/codecompanion/opencode_models.lua
"""

import subprocess
import sys
import json
import os

SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
PROJECT_ROOT = os.path.dirname(SCRIPT_DIR)
OUTPUT_PATH = os.path.join(
    PROJECT_ROOT, "lua", "configs", "codecompanion", "opencode_models.lua"
)

# Provider detection from api.npm field
PROVIDER_MAP = {
    "anthropic": "anthropic",
    "google": "google",
    "openai": "openai",
    "openai_compatible": "openai_compatible",
}


def detect_provider(npm: str) -> str:
    """Detect provider from npm package name."""
    npm_lower = npm.lower()
    for keyword, provider in PROVIDER_MAP.items():
        if keyword in npm_lower:
            return provider
    return "openai_compatible"


def parse_models(raw: str) -> dict:
    """Parse opencode models --verbose output into a dict of models."""
    models = {}
    lines = raw.split("\n")
    i = 0

    while i < len(lines):
        line = lines[i].strip()

        if line == "{":
            json_lines = [line]
            brace_count = 1
            i += 1

            while i < len(lines) and brace_count > 0:
                l = lines[i].strip()
                json_lines.append(l)
                brace_count += l.count("{") - l.count("}")
                i += 1

            json_str = "\n".join(json_lines)
            try:
                model = json.loads(json_str)
                if model.get("providerID") == "opencode":
                    models[model["id"]] = model
            except json.JSONDecodeError as e:
                print(f"Warning: Failed to parse JSON: {e}", file=sys.stderr)
        else:
            i += 1

    return models


def lua_value(val) -> str:
    """Convert a Python value to a Lua literal."""
    if val is None:
        return "nil"
    if isinstance(val, bool):
        return "true" if val else "false"
    if isinstance(val, (int, float)):
        return str(val)
    if isinstance(val, str):
        escaped = val.replace("\\", "\\\\").replace('"', '\\"')
        return '"' + escaped + '"'
    if isinstance(val, list):
        if not val:
            return "{}"
        items = [lua_value(v) for v in val]
        return "{" + ", ".join(items) + "}"
    if isinstance(val, dict):
        if not val:
            return "{}"
        parts = []
        for k, v in val.items():
            if isinstance(k, str) and (not k.isidentifier() or "." in k or "-" in k):
                key = '["' + k + '"]'
            else:
                key = k if isinstance(k, str) and k.isidentifier() else '["' + str(k) + '"]'
            parts.append(key + " = " + lua_value(v))
        return "{ " + ", ".join(parts) + " }"
    return str(val)


def generate_lua(models: dict) -> str:
    """Generate Lua source from parsed model data."""
    out = []
    out.append("-- Auto-generated from `opencode models --verbose`")
    out.append("-- Do not edit manually.")
    out.append("-- Update: python3 scripts/update_opencode_models.py")
    out.append("")
    out.append("local M = {}")
    out.append("")

    for model_id in sorted(models.keys()):
        model = models[model_id]
        name = model.get("name", model_id)
        family = model.get("family", "")
        npm = model.get("api", {}).get("npm", "")
        provider = detect_provider(npm)
        caps = model.get("capabilities", {})
        limit = model.get("limit", {})
        variants = model.get("variants", {})
        cost = model.get("cost", {})

        out.append('M["' + model_id + '"] = {')
        out.append("  name = " + lua_value(name) + ",")
        out.append("  family = " + lua_value(family) + ",")
        out.append("  provider = " + lua_value(provider) + ",")

        out.append("  capabilities = {")
        out.append("    reasoning = " + lua_value(caps.get("reasoning", False)) + ",")
        out.append("    toolcall = " + lua_value(caps.get("toolcall", False)) + ",")
        out.append("    attachment = " + lua_value(caps.get("attachment", False)) + ",")
        out.append("    temperature = " + lua_value(caps.get("temperature", False)) + ",")
        out.append("  },")

        out.append("  limit = {")
        out.append("    context = " + lua_value(limit.get("context", 0)) + ",")
        out.append("    output = " + lua_value(limit.get("output", 0)) + ",")
        out.append("  },")

        if cost:
            out.append("  cost = {")
            out.append("    input = " + lua_value(cost.get("input", 0)) + ",")
            out.append("    output = " + lua_value(cost.get("output", 0)) + ",")
            out.append("  },")

        if variants:
            out.append("  variants = {")
            for var_name in sorted(variants.keys()):
                var_config = variants[var_name]
                out.append('    ["' + var_name + '"] = ' + lua_value(var_config) + ",")
            out.append("  },")

        out.append("}")
        out.append("")

    out.append("return M")
    out.append("")
    return "\n".join(out)


def main():
    check_mode = "--check" in sys.argv

    try:
        result = subprocess.run(
            ["opencode", "models", "--verbose"],
            capture_output=True,
            text=True,
            timeout=30,
        )
        if result.returncode != 0:
            print("Error: opencode models --verbose failed: " + result.stderr, file=sys.stderr)
            sys.exit(1)
    except FileNotFoundError:
        print("Error: opencode not found in PATH", file=sys.stderr)
        sys.exit(1)
    except subprocess.TimeoutExpired:
        print("Error: opencode models --verbose timed out", file=sys.stderr)
        sys.exit(1)

    models = parse_models(result.stdout)
    if not models:
        print("Error: No opencode models found in output", file=sys.stderr)
        sys.exit(1)

    lua_source = generate_lua(models)

    if check_mode:
        try:
            with open(OUTPUT_PATH, "r") as f:
                existing = f.read()
            if existing != lua_source:
                print("Stale: " + OUTPUT_PATH + " needs regeneration", file=sys.stderr)
                sys.exit(1)
            print("OK: " + OUTPUT_PATH + " is up-to-date (" + str(len(models)) + " models)")
        except FileNotFoundError:
            print("Missing: " + OUTPUT_PATH + " needs generation", file=sys.stderr)
            sys.exit(1)
    else:
        os.makedirs(os.path.dirname(OUTPUT_PATH), exist_ok=True)
        with open(OUTPUT_PATH, "w") as f:
            f.write(lua_source)
        print("Generated " + OUTPUT_PATH + " with " + str(len(models)) + " models")


if __name__ == "__main__":
    main()
