return {
  gcc = "gcc % -o $fileBase && $fileBase",
  clang = "clang % -o $fileBase && $fileBase",
}
