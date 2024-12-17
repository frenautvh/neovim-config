return {
  {
    'stevearc/conform.nvim',
    config = function()
      local conform = require("conform")
      conform.setup({
        formatters_by_ft = {
          lua = { lsp_format = "fallback" },
          javascript = { "prettier" },
          javascriptreact = { "prettier" },
          typescript = { "prettier" },
          typescriptreact = { "prettier" },
          ["_"] = { "vim" }
        },
        formatters = {
          nodePrettier = {
            command = "npx",
            args = { "prettier", "$FILENAME" },
          },
          vim = {
            format = function(_, ctx, _, callback)
              local cmd = ctx.range == nil and 'gg=G' or '='
              vim.cmd.normal({ 'm`' .. cmd .. '``', bang = true })
              callback()
            end,
          }
        },
      })
      vim.keymap.set("n", "<leader>cf", function() require("conform").format {} end)
    end
  },
}
