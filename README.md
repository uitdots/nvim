# Project Configuration

## Prerequisites

- **Neovim** >= 0.11
- **Make**
- **Delta**
- **ripgrep** (telescope, good for vimgrep replacement)
- **fd** (telescope)

## Note

If NvChad UI's color is broken, use the command: `:NvChadLoadAllHighlights`

## References

- Special thanks to [Alexis](https://github.com/Alexis12119/) for his [nvim-config](https://github.com/Alexis12119/nvim-config)

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
