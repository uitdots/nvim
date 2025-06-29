# UIT - Neovim

From UIT, for UIT (and others :v)

## ToC

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

- [Showcase](#showcase)
- [Supports](#supports)
  - [Plugins](#plugins)
  - [Languages](#languages)
  - [Others](#others)
- [Prerequisites](#prerequisites)
- [Others](#others-1)
  - [Note](#note)
  - [Tips & Tricks](#tips--tricks)
  - [References](#references)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

---

## Showcase

| Dashboard                                                                                     | Editor                                                                                     |
| --------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------ |
| ![Dashboard](https://github.com/user-attachments/assets/3affbe03-ee4b-421f-a455-5931cb996c75) | ![Editor](https://github.com/user-attachments/assets/f51e91e5-6af5-47a7-b354-35c52352ecea) |

---

## Supports

### Plugins

- Plugin manager: [lazy.nvim](https://github.com/folke/lazy.nvim)
- Package manager _(optional, you can disable this, and install package yourself)_:
  - [mason.nvim](https://github.com/mason-org/mason.nvim)
  - [mason-tool-installer](https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim)
- UI: [NvChad](https://github.com/NvChad/)
- Formatting: [conform.nvim](https://github.com/stevearc/conform.nvim)
- Linting: [nvim-lint.nvim](https://github.com/mfussenegger/nvim-lint)
- Debugging:
  - [nvim-dap](https://github.com/mfussenegger/nvim-dap/)
  - [nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui)
- Database:
  - [vim-dadbod](https://github.com/tpope/vim-dadbod)
  - [vim-dadbod-ui](https://github.com/kristijanhusak/vim-dadbod-ui)
- Task runner: [overseer.nvim](https://github.com/stevearc/overseer.nvim/)
- Completion engine:
  - [blink.cmp](https://github.com/Saghen/blink.cmp)
  - [cmp-sql](https://github.com/ray-x/cmp-sql)
    > Suggest SQL keyword when in string
  - [blink-cmp-git](https://github.com/Kaiser-Yang/blink-cmp-git/)
- Editing:
  - [flash.nvim](https://github.com/folke/flash.nvim)
  - [neoscroll.nvim](https://github.com/karb94/neoscroll.nvim)
  - [markview.nvim](https://github.com/OXY2DEV/markview.nvim)
- Others:
  - [snacks.nvim](https://github.com/folke/snacks.nvim)
    > Support image viewer, fast file picker
  - [auto-session](https://github.com/rmagatti/auto-session)

And much more!

### Languages

- For developing _(as I'm using them)_:
  - JavaScript, TypeScript (NodeJS)
    > No deno
  - Go
  - Python
  - SQL (postgres)
    > Use [vim-dadbod](https://github.com/tpope/vim-dadbod)
    >
    > With postgres, use [postgrestools](https://github.com/supabase-community/postgres-language-server)
  - C/C++
  - Shell
  - TOML
  - Vim
  - YAML
  - XML
- Others that have configured:
  - Config (tmux, sshconfig)
  - C# (cs)
  - CSS
  - React
  - Flutter (Dart)
  - Docker
  - Github Action
  - HTML
  - Java
  - Kotlin
  - Latex
  - SQL (MSSQL)
    > It's here because I haven't test it yet
  - Nginx
  - Powershell
  - Rust
  - Tailwind

> [!NOTE]
> See [`lua/plugins/extras/languages/`](lua/plugins/extras/languages) for more detail

### Others

- chezmoi
- wakatime

---

## Prerequisites

- neovim:
  > version \>= 0.11
- make: Some plugins require this
- delta
- ripgrep: telescope, vimgrep replacement
- fd: telescope

---

## Others

### Note

If NvChad UI's color is broken, use the command: `:NvChadLoadAllHighlights`

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
  > Special thanks to Alexis!
- [nikolovlazar](https://github.com/nikolovlazar/dotfiles/blob/main/.config/nvim/)
- [Integralist](https://github.com/Integralist/nvim)
  > Has ghostty type
