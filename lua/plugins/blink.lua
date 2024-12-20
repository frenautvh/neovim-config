return {
  {
    'saghen/blink.cmp',
    version = 'v0.*',
    opts = {
      keymap = {
        preset = 'enter',
        ['<C-j>'] = { 'show', 'show_documentation', 'hide_documentation' },
        ['<Tab>'] = { 'select_next', 'fallback' },
        ['<S-Tab>'] = { 'select_prev', 'fallback' },
      },
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },
      completion = {
        accept = {
          auto_brackets = {
            enabled = true,
          },
        },
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 50,
        }
      },
      signature = {
        enabled = true
      },
    },
    opts_extend = { "sources.default" },
    config = function(_, opts)
      require('blink.cmp').setup(opts)
      vim.api.nvim_set_hl(0, "BlinkCmpMenu", { bg = "#000000" })
      vim.api.nvim_set_hl(0, "BlinkCmpDoc", { bg = "#000000" })
      vim.api.nvim_set_hl(0, "BlinkCmpSignatureHelp", { bg = "#000000" })
    end
  }
}
