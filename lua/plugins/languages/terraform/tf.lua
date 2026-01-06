---@type LazySpec
return {
  "Allaman/tf.nvim",
  cmd = {
    "TerraformDoc",
    "TerraformDocCopy",
    "TerraformDocOpen",
    "TerraformState",
    "TerraformValidate",
  },
  filetypes = {
    "terraform",
    "tf",
    "terraform-vars",
    "tfvars",
    "hcl",
  },
  config = true,
}
