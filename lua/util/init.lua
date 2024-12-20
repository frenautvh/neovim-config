local M = {}

M.buffer_close = function()
  local has_buffers = false
  for _, v in pairs(vim.fn.getbufinfo()) do
    if (v.listed == 1 and v.name ~= "") then
      has_buffers = true
      break
    end
  end
  vim.cmd(has_buffers and "bd!" or "q!")
end

return M
