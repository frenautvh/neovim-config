return {
  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "LspAttach",
    priority = 1000,
    config = function()
      require('tiny-inline-diagnostic').setup({
        preset = "simple",
        signs = {
          diag = "●",
        }
      })
      vim.diagnostic.config({
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = '●',
            [vim.diagnostic.severity.WARN] = '●',
            [vim.diagnostic.severity.HINT] = '●',
          },
          numhl = {
            [vim.diagnostic.severity.ERROR] = 'DiffDelete',
            [vim.diagnostic.severity.WARN] = 'DiffText',
            [vim.diagnostic.severity.HINT] = 'DiffText',
          },
        },
        virtual_text = false
      })
    end
  },
}
