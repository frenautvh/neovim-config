return {
  {
    'echasnovski/mini.files',
    version = '*',
    opts = {
      mappings = {
        close = "<esc>"
      }
    },
    config = function(_, opts)
      local minifiles = require('mini.files')
      minifiles.setup(opts)
      vim.keymap.set('n', '<leader>j', function()
        minifiles.open(vim.api.nvim_buf_get_name(0), false)
      end)
    end
  }
}
