return {
  ["g++"] = "g++ % -o $fileBase && $fileBase",
  clang = "clang++ % -o $fileBase && $fileBase",
}
