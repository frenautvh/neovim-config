-- local function lsp_organize_imports()
--   local params = { command = "_typescript.organizeImports", arguments = { vim.api.nvim_buf_get_name(0) }, title = "" }
--   vim.lsp.buf.execute_command(params)
-- end

return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "hrsh7th/nvim-cmp",
    },
    opts = {
      servers = {
        eslint = {},
        html = {
          on_init = function(client, _)
            client.server_capabilities.semanticTokensProvider = nil
          end,
        },
        lua_ls = {
          settings = {
            Lua = {
              diagnostics = {
                globals = { 'vim' }
              }
            }
          }
        },
        ts_ls = {
          -- on_init = function(client, _)
          --   client.server_capabilities.semanticTokensProvider = nil
          -- end,
        }
      },
    },
    config = function(_, opts)
      local lspconfig = require('lspconfig')
      local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
      for server, config in pairs(opts.servers) do
        config.capabilities = lsp_capabilities
        lspconfig[server].setup(config)
      end
      vim.keymap.set('n', '==', vim.lsp.buf.format)
      vim.keymap.set('n', 'K', vim.lsp.buf.hover)
      vim.keymap.set('n', 'ga', vim.lsp.buf.code_action)
    end,
  }
}
