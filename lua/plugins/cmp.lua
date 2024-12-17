return {
  {
    "hrsh7th/nvim-cmp",
    event = { "VeryLazy" },
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'windwp/nvim-autopairs',
    },
    config = function()
      local cmp = require('cmp')
      local cmp_autopairs = require('nvim-autopairs.completion.cmp')
      cmp.setup({
        formatting = {
          fields = { 'menu', 'abbr', 'kind' },
          format = function(entry, item)
            local menu_icon = {
              nvim_lsp = '•',
              luasnip = '⋗',
              buffer = '~',
              path = '⚑',
            }
            item.menu = menu_icon[entry.source.name]
            return item
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
          ['<Tab>'] = cmp.mapping(function(fallback)
            return cmp.visible() and cmp.select_next_item() or fallback()
          end),
          ['<S-Tab>'] = cmp.mapping(function(fallback)
            return cmp.visible() and cmp.select_prev_item() or fallback()
          end),
        }),
        sources = {
          { name = 'nvim_lsp' },
          { name = 'path' },
          { name = 'buffer' },
        },
        performance = {
          max_view_entries = 25,
        }
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
      cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
    end
  },
}
