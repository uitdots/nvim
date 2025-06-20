local M = {}

---@private
-- M.spinners = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
M.spinners = { "", "󰪞", "󰪟", "󰪠", "󰪡", "󰪢", "󰪣", "󰪤", "󰪥" }

---@private
-- M.done = " "
M.done = ""

---Process notification
---@param opts table { id: string, message: string, title: string, is_done: boolean }
function M.processing(opts)
  vim.notify(opts.message, vim.log.levels.INFO, {
    id = opts.id,
    title = opts.title,
    opts = function(notif)
      notif.icon = opts.is_done and M.done or M.spinners[math.floor(vim.uv.hrtime() / (1e6 * 80)) % #M.spinners + 1]
    end,
  })
end

return M
