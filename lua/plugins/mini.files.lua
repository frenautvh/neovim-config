return {
  {
    'echasnovski/mini.files',
    version = '*',
    config = function()
      local minifiles = require('mini.files')
      minifiles.setup()
      vim.keymap.set('n', '<leader>j', function()
        minifiles.open(vim.api.nvim_buf_get_name(0), false)
      end)
    end
  }
}
