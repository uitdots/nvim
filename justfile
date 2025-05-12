[unix]
format:
  stylua $(find . -type f -name "*.lua")

[unix]
make-spell-vi:
  curl 'https://raw.githubusercontent.com/1ec5/hunspell-vi/refs/heads/main/dictionaries/vi-DauMoi.dic' -o ./tmp/vi.dic --create-dirs
  mkdir ./spell || true
  nvim -Es -u NONE -c 'mkspell vi ./tmp/vi.dic'
  mv vi*.spl spell
  rm ./tmp -rf
