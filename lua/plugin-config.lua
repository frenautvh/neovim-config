require('gitsigns').setup()
require("nvim-autopairs").setup {}
require('Comment').setup()

local lspconfig = require('lspconfig')
lspconfig.tsserver.setup {}
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
lspconfig.html.setup {
  capabilities = capabilities,
}
lspconfig.eslint.setup {}

local cmp = require('cmp')
cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then cmp.select_next_item() else fallback() end
    end, { "i", "s", "c" }),
    ["<S-Tab>"] = cmp.mapping(function()
      if cmp.visible() then cmp.select_prev_item() end
    end, { "i", "s", "c" }),
    ['<Up>'] = cmp.mapping(cmp.mapping.select_prev_item({
      behavior = cmp.SelectBehavior.Select
    }), {'i', 's', 'c'}),
    ['<CR>'] = cmp.mapping(cmp.mapping.confirm({ select = false }), {'i', 's', 'c'}),
    ['<Down>'] = cmp.mapping(cmp.mapping.select_next_item({
      behavior = cmp.SelectBehavior.Select
    }), {'i', 's', 'c'}),
  }), 
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
  }, {
    { name = 'buffer', option = { get_bufnrs = function() return vim.api.nvim_list_bufs() end } }
  }, {
    { name = 'path' },
  })
})
cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})
