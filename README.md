# UIT - Neovim

From UIT, for UIT (and others :v)

## Preview

| Dashboard                                                                                     | Editor                                                                                     |
| --------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------ |
| ![Dashboard](https://github.com/user-attachments/assets/3affbe03-ee4b-421f-a455-5931cb996c75) | ![Editor](https://github.com/user-attachments/assets/f51e91e5-6af5-47a7-b354-35c52352ecea) |

## Prerequisites

- neovim:
  > version \>= 0.11
- make: Some plugins require this
- delta
- ripgrep: telescope, vimgrep replacement
- fd: telescope

## Note

If NvChad UI's color is broken, use the command: `:NvChadLoadAllHighlights`

## References

- [Alexis12119](https://github.com/Alexis12119/nvim-config)
  > Special thanks to Alexis!
- [nikolovlazar](https://github.com/nikolovlazar/dotfiles/blob/main/.config/nvim/)
- [Integralist](https://github.com/Integralist/nvim)
  > Has ghostty type

## Tips & Tricks

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
