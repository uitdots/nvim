# 💫 Neovim

A fast and highly customisable Neovim IDE with lazy loading, and modular configurations.

> Heavy and bloated

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
- [📒 Notes](#-notes)
  - [Keymaps](#keymaps)
  - [Should read](#should-read)
  - [For configuring](#for-configuring)
- [✏️ Others](#-others)
  - [Questions](#questions)
    - [Control space in Windows Terminal doesn't work](#control-space-in-windows-terminal-doesnt-work)
    - [Change the behavior of completion](#change-the-behavior-of-completion)
    - [Change the NvChad UI](#change-the-nvchad-ui)
  - [Tips & Tricks](#tips--tricks)
  - [References](#references)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

---

## 📸 Showcase

| Dashboard                                                                                     | Editor                                                                                     |
| --------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------ |
| ![Dashboard](https://github.com/user-attachments/assets/fdf3a649-264b-4443-8faf-e5b5d77095c2) | ![Editor](https://github.com/user-attachments/assets/77cc3e3f-7b73-4b83-acc2-8b96faf81c3a) |

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
- Others: translate, session, chezmoi, wakatime

> [!NOTE]
> And much more...! You will get lost in this config.

### Languages

> [!NOTE]
> The higher the order, the better configured the language is

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
  - `hcl`+ `terraform`
  - `kubernetes`
  - `helm`
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
- `curl`
- `delta`
- `ripgrep`: telescope, vimgrep replacement
- `fd`: telescope

### Install

```sh
# echo 'please star this repo!'
# sudo rm -rf /
```

> [!NOTE]
>
> I suggest forking this repo in order to up to date with the upstream (this repo)

> [!WARNING]
>
> We all know how to do that
>
> You shouldn't entering nvim for now. Use `nvim --clean ./lua/plugins/extras/languages/init.lua` or another editor to edit the [`lua/plugins/extras/languages/init.lua`](./lua/plugins/extras/languages/init.lua)!!! Otherwise you will install tons of plugins and requirements from what I'm using.

### Structure

```
lua
├── configs                 Extendable settings for builtin, plugins options
│   ├── runner              Builtin file runner
│   ├── dap                 nvim-dap config
│   │   ├── adapters
│   │   ├── configurations
│   │   └── utils
│   ├── diagnostic          (Neo)vim diagnostic setup
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
│   │   ├── chezmoi         Chezmoi stuff
│   │   ├── coding          Package manager, lint, format
│   │   ├── dap             Debug
│   │   ├── database        Database
│   │   ├── git             Easier to interact with git
│   │   ├── languages       User's preference to enable
│   │   │   ├── ...
│   │   ├── lsp             Enhance LSP usage
│   │   ├── mason           Mason package manager
│   │   ├── motion          Extend neovim motions
│   │   ├── others          Others
│   │   ├── silly           When you are stress
│   │   ├── telescope       Telescope extensions
│   │   ├── test            Testing
│   │   ├── ui              Extend UI things
│   └── main                Shouldn't disable, you don't want to break the config
├── types                   Custom types, overriding types for lua annotating
└── utils                   Utilities
```

> [!NOTE]
> Extra plugins in [lua/plugins/extras](lua/plugins/extras) are (may) safely disabled. You should disable by group in [lua/plugins/extras/init.lua](lua/plugins/extras/init.lua), [lua/plugins/extras/languages/init.lua](./lua/plugins/extras/languages/init.lua), and individually in [lua/plugins/extras/others](./lua/plugins/extras/others).

---

## 📒 Notes

### Keymaps

There are some keymaps you should know in this config (and native neovim keymaps)

> [!NOTE]
>
> - `leader` is <kbd>Space</kbd>
> - Buffer and tab are different in vim
> - You should learn how to use vim register
> - Neovim's LSP keymaps styles: <https://neovim.io/doc/user/lsp.html#lsp-defaults>

| Mode | Keymap             | Descriptions                                                                 |
| ---- | ------------------ | ---------------------------------------------------------------------------- |
| `n`  | `<leader><leader>` | Find Files                                                                   |
| `n`  | `<leader>e`        | Toggle File Tree                                                             |
| `n`  | `<leader>Tab`      | Open File Tree and Focus Current File                                        |
| `n`  | `<leader>y`        | Yank all into System Clipboard                                               |
| `n`  | `H`                | Navigate Left Buffer in NvChad Tabufline                                     |
| `n`  | `L`                | Navigate Right Buffer in NvChad Tabufline                                    |
| `n`  | `<leader>c`        | Close Buffer                                                                 |
| `n`  | `<leader><Esc>`    | No Highlight Search Matches                                                  |
| `n`  | `<C-s>`            | Save Buffer                                                                  |
| `n`  | `ZZ`               | Write Quit                                                                   |
| `n`  | `ZQ`               | Quit                                                                         |
| `i`  | `<C-k>`            | LSP Show Signature                                                           |
| `n`  | `<C-w><C-d>`       | LSP Float Diagnostic                                                         |
| `n`  | `K`                | LSP Hover Documentation                                                      |
| `n`  | `<leader>at`       | Toggle AI Completion Suggestion                                              |
| `n`  | `<leader>oH`       | Uncloak The File [`laytan/cloak.nvim`](https://github.com/laytan/cloak.nvim) |

> [!WARNING]
> With completion behavior, see [questions](#questions) below

### Should read

- Setting up new LSP in [`after/lsp/`](./after/lsp/)
  > For better overriding
- Use mason tools to install all packages (Language servers, linters, formatters, runtime)
  ```vim
  :MasonToolsInstall
  ```
- Plugins are updated every week _(set in lazy config)_
- Some `languages` pack require others, you should (or must?) enable yourself:
  - `rest`: `http`
  - `jenkins`: `groovy`
  - `react`: `typescript`
  - `ansible`: `yaml` (for yaml syntax highlighting)
- Set `$NVIM_NO_IDE` to any value to disable lsp, format, lint (quick editing)
  > Ex:
  >
  > ```sh
  >  NVIM_NO_IDE=1 lazygit # commit, quick edit
  > ```
- Working with `sql`:
  - Use compound filetype
  - Set the file type `sql` or `plsql` for treesitter highlighting, then the **custom filetype** after it _(for linter and formatter attach to)_
    > Ex:
    >
    > - `sql.postgresql`, `plsql.postgresql`
    > - ```yaml
    >   # vim: set ft=sql.postgresql:
    >   ```
- Working with `latex`:
  - on Arch:
    ```sh
    pacman -Sy texlive-binextra texlive-latex
    ```
  - other: idk
- `helm_ls` includes `yaml_ls` already, no need to run `yaml_ls`
- With `groovy-language-server`, ensure you are using `java@18` or so...

### For configuring

- `lazy.nvim` only run `config` and `init` once. Not like `opts`
- If NvChad UI's color is broken, use `<leader>ur`
- Don't use NvChad's auto command
- lsp currently not enabled by compound filetype
- nvim-lint can lint the compound filetype
- conform format the last filetype in the compound file, one by one

---

## ✏️ Others

### Questions

#### Control space in Windows Terminal doesn't work

On windows terminal which cannot send <kbd>Ctrl</kbd> + <kbd>Space</kbd> into shell, you can send <kbd>Ctrl</kbd> + <kbd>Space</kbd> as <kbd>Alt</kbd> + <kbd>;</kbd> by editing windows terminal config json _(`LocalState/settings.json`)_:

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

#### Change the behavior of completion

See <https://cmp.saghen.dev/configuration/keymap.html> and change [lua/plugins/main/blink-cmp.lua](lua/plugins/main/blink-cmp.lua). You should read all the docs.

#### Change the NvChad UI

It may be possible. But it may require times to config.

### Tips & Tricks

- Typing VNI, Telex, VIQR, set

  ```vim
  :set keymap=vietnamese-telex_utf-8
  ```

  > <https://neovim.io/doc/user/vietnamese.html>

### References

- [Alexis12119](https://github.com/Alexis12119/nvim-config)
  > Special thanks to Alexis!
- [nikolovlazar](https://github.com/nikolovlazar/dotfiles/blob/main/.config/nvim/)
- [Integralist](https://github.com/Integralist/nvim)
  > Has ghostty type
- [catgoose](https://github.com/catgoose/nvim)
- [cameronr](https://github.com/cameronr/dotfiles)
- [dynamo](https://gitlab.com/dynamo-config/neovim)
