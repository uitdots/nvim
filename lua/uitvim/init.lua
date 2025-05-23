_G.UitVim = {}

UitVim.json = require("uitvim.json")

UitVim.json.setup()

---@type UitVimConfig
UitVim.config = UitVim.json.get_merged_config()
-- UitVim.config = require("uitvim.config")
