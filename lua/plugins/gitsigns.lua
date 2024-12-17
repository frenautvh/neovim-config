return {
  {
    "lewis6991/gitsigns.nvim",
    event = "VeryLazy",
    config = function ()
      require("gitsigns").setup {
        on_attach = function ()
          local gitsigns = require('gitsigns')
          vim.keymap.set('n', 'gsp', function() gitsigns.nav_hunk('prev') end)
          vim.keymap.set('n', 'gsn', function() gitsigns.nav_hunk('next') end)
        end
      }
    end
  },
}
