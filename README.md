# 💫 UIT - Neovim

A fast and highly customisable Neovim IDE with lazy loading, featuring the best trending plugins _(not FOMO)_, and modular configurations.

> From [UITer](https://uit.edu.vn/) :(

---

## 📑 ToC

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

- [📸 Showcase](#-showcase)
- [🔥 Supports](#-supports)
  - [Plugins](#plugins)
  - [Languages](#languages)
- [🥴 Usage](#-usage)
  - [Prerequisites](#prerequisites)
  - [Install](#install)
  - [Structure](#structure)
  - [Notes](#notes)
- [✏️ Others](#-others)
  - [Tips & Tricks](#tips--tricks)
  - [References](#references)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

---

## 📸 Showcase

| Dashboard                                                                                     | Editor                                                                                     |
| --------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------ |
| ![Dashboard](https://github.com/user-attachments/assets/71ca08b3-8a52-403e-8d4b-804b11e4fca9) | ![Editor](https://github.com/user-attachments/assets/77cc3e3f-7b73-4b83-acc2-8b96faf81c3a) |

| Debugging                                                                                     | AI                                                                                     |
| --------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------- |
| ![Debugging](https://github.com/user-attachments/assets/5705f91b-ac87-4de1-b509-dfe0ebeed6b2) | ![AI](https://github.com/user-attachments/assets/dff7a7aa-a3d3-468a-a986-8ee9beb4eecf) |

---

## 🔥 Supports

### Plugins

- Highly customisable plugin manager with [lazy.nvim](https://github.com/folke/lazy.nvim)
- Package manager with [mason.nvim](https://github.com/mason-org/mason.nvim)
  > optional, you can disable this, and install package yourself
- [NvChad](https://github.com/NvChad/) UI
- Task runner, builtin file runner
- Formatting, linting, debugging, testing
- Querying database, rest api, json, yaml
- AI integration with tab completion, MCP, VectorCode
- Fast find files, image viewer with [snacks.nvim](https://github.com/folke/snacks.nvim)
- Others:
  - Save session
  - chezmoi
  - wakatime

> [!NOTE]
> And much more...! You will get lost in this config.

### Languages

> [!NOTE]
> The higher order, the well configured

- Author using:
  - `javascript`, `typescript` _(nodejs, deno)_
    > deno: Install from mason or external yourself
  - `go`
  - `python`
  - `sql` _(postgresql)_
    > - Use [vim-dadbod](https://github.com/tpope/vim-dadbod)
    > - With postgresql, use [postgrestools](https://github.com/supabase-community/postgres-language-server)
  - `github` _(github_action)_
  - `shell`
  - `docker`
- Others:
  - `java`
  - `c`, `cpp`
  - `html`
  - `css`
  - `react`
  - `tailwind`
  - `c#`/`cs`
  - `flutter` _(dart)_
  - `vim`
  - `rust`
  - `kotlin`
  - `powershell`
  - `sql`
    > mssql: Haven't test
  - `lua`
    > Just for configuring neovim :((
- Ops:
  - `groovy` + `jenkinsfile`
  - `terraform`
  - `helm` _(kubernetes)_
  - `nginx`
  - `ansible`
- Configuring languages:
  - `toml`
  - `yaml`
  - `xml`
  - `config` _(sshconfig, tmux)_
  - `kmonad`
- Writing:
  - `markdown`
  - `latex`

> [!NOTE]
> See [`lua/plugins/extras/languages/`](lua/plugins/extras/languages) for more detail

---

## 🥴 Usage

### Prerequisites

- neovim:
  > version \>= 0.11
- `make`: Some plugins require this
- `delta`
- `ripgrep`: telescope, vimgrep replacement
- `fd`: telescope

### Install

```sh
# echo 'please star this repo!'
# sudo rm -rf ./
```

> [!WARNING]
> We all know how to do that

### Structure

```
lua
├── configs                 Extendable settings for builtin, plugins options
│   ├── runner              Builtin file runner
│   ├── dap                 nvim-dap config
│   │   ├── adapters
│   │   ├── configurations
│   │   └── utils
│   ├── lazy                lazy.nvim config
│   ├── lsp                 Neovim's lsp setting
│   └── ui                  UI (mostly for nvchad)
│       ├── nvdash
│       │   ├── headers
│       │   └── utils
│       ├── statusline
│       └── tabufline
├── core                    (Neo)vim native settings
├── overseer                overseer.nvim templates
│   └── template
│       └── default
├── plugins                 lazy.nvim plugins specs
│   ├── extras              Plugins can be toggle
│   │   ├── ai              AI integration
│   │   ├── blink           blink.cmp extensions
│   │   ├── coding          Package manager, lint, format
│   │   ├── dap             Debug
│   │   ├── database        Database
│   │   ├── git             Easier to interact with git
│   │   ├── languages       User's preference to enable
│   │   │   ├── ansible
│   │   │   ├── assembly
│   │   │   ├── c
│   │   │   ├── config
│   │   │   ├── cs
│   │   │   ├── css
│   │   │   ├── dart
│   │   │   ├── docker
│   │   │   ├── env
│   │   │   ├── git
│   │   │   ├── github
│   │   │   ├── go
│   │   │   ├── graphql
│   │   │   ├── groovy
│   │   │   ├── helm
│   │   │   ├── html
│   │   │   ├── http
│   │   │   ├── java
│   │   │   ├── jenkins
│   │   │   ├── json
│   │   │   ├── just
│   │   │   ├── kbd
│   │   │   ├── kotlin
│   │   │   ├── latex
│   │   │   ├── lua
│   │   │   ├── make
│   │   │   ├── markdown
│   │   │   ├── mssql
│   │   │   ├── nginx
│   │   │   ├── powershell
│   │   │   ├── python
│   │   │   ├── react
│   │   │   ├── rust
│   │   │   ├── shell
│   │   │   ├── sql
│   │   │   ├── tailwind
│   │   │   ├── terraform
│   │   │   ├── toml
│   │   │   ├── typescript
│   │   │   ├── vim
│   │   │   ├── xml
│   │   │   └── yaml
│   │   ├── lsp             Enhance LSP usage
│   │   ├── mason           Mason package manager
│   │   ├── motion          Extend neovim motions
│   │   ├── nvim-treesitter Treesitter extensions
│   │   ├── others          Others
│   │   ├── silly           When you are stress
│   │   ├── telescope       Telescope extensions
│   │   ├── test            Testing
│   │   ├── ui              Extend UI things
│   └── main                Shouldn't disable, you don't want to break the config
├── types                   Custom types for lua annotating
└── utils                   Utilities, no rewriting again and again
```

> [!NOTE]
> Extra plugins in [lua/plugins/extras](lua/plugins/extras) are (may) safely disabled. You should disable by group in [lua/plugins/extras/init.lua](lua/plugins/extras/init.lua) _(except others)_

### Notes

- Setting up new LSP in [`after/lsp/`](./after/lsp/)
  > For better overriding
- Enable languages packs you want to use in [`lua/plugins/extras/languages/init.lua`](./lua/plugins/extras/languages/init.lua)
- Use mason tools to install all packages (Language servers, linters, formatters, runtime)
  ```vim
  :MasonToolsInstall
  ```
- If NvChad UI's color is broken, run:
  ```vim
  :NvChadLoadAllHighlights
  ```
- Some `languages` pack require others, you must enable yourself:
  - `rest`: `http`
  - `jenkins`: `groovy`
  - `mssql`: `sql`
  - `react`: `typescript`
  - `ansible`: `yaml` (for yaml syntax highlighting)
- These plugins are optional, which are tight to aspects they belong to (languages,...). Set `optional = false` to enable them independently:
  - [`gradle.nvim`](./lua/plugins/extras/others/gradle.lua)
  - [`maven.nvim`](./lua/plugins/extras/others/maven.lua)
- Working with `sql`:
  - Use compound filetype
  - Set the file type `sql` or `plsql` for treesitter highlighting, then the **custom filetype** after it _(for linter and formatter attach to)_
    > Ex:
    >
    > - `sql.postgresql`, `plsql.postgresql`
    >
    > ```yaml
    > # vim: set ft=sql.postgresql:
    > ```
- Working with `latex`:
  - on Arch:
    ```sh
    pacman -Sy texlive-binextra texlive-latex
    ```
  - other: idk
- `helm_ls` includes `yaml_ls` already, no need to run `yaml_ls`
- With `groovy-language-server`, ensure you are using `java@18` or so...
- `lazy.nvim` only run `config` and `init` once. Not like `opts`
- On windows terminal which cannot send <kbd>Ctrl</kbd> + <kbd>Space</kbd> into shell, you can send <kbd>Ctrl</kbd> + <kbd>Space</kbd> as <kbd>Alt</kbd> + <kbd>;</kbd> by editing windows terminal config json _(`LocalState/settings.json`)_:
  ```json
  {
    "actions": [
      {
        "command": {
          "action": "sendInput",
          "input": "\u001b;"
        },
        "id": "User.sendInput.63E68121",
        "keys": "ctrl+space"
      }
    ]
  }
  ```

---

## ✏️ Others

### Tips & Tricks

- Typing VNI, Telex, VIQR, set

  ```vim
  :set keymap=vietnamese-telex_utf-8
  ```

  > <https://neovim.io/doc/user/vietnamese.html>

- Use spell check `vi`
  1. run
  ```sh
  just make-spell-vi
  ```
  2. Set spell lang in neovim
  ```vim
  :set spell spellang=vi
  ```

### References

- [Alexis12119](https://github.com/Alexis12119/nvim-config)
  > Special thanks to Alexis!!! He helps me mature
- [nikolovlazar](https://github.com/nikolovlazar/dotfiles/blob/main/.config/nvim/)
- [Integralist](https://github.com/Integralist/nvim)
  > Has ghostty type
- [catgoose](https://github.com/catgoose/nvim)
