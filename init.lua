-- lazy.nvim bootstrap

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
print(lazypath)

-- vim options

vim.opt.number = true
vim.opt.autochdir = true
vim.opt.undofile = true
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.clipboard = 'unnamedplus'
vim.opt.scrolloff = 10
vim.opt.background = "light"

vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')
vim.keymap.set('n', '<bs>', ':b#<cr>')
vim.keymap.set('n', '<cr>', '0<esc>j')
vim.keymap.set('n', '<space>', ':nohl<cr>')

-- plugins

require("lazy").setup({
  {
    "shaunsingh/solarized.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require('solarized').set()
    end,
  },
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('telescope').setup({
        defaults = {
          layout_strategy = "vertical"
        }
      })
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "go", builtin.buffers, {})
      vim.keymap.set("n", "gh", builtin.oldfiles, {})
      vim.keymap.set("n", "gf", builtin.git_files, {})
      vim.keymap.set("n", "gd", builtin.lsp_implementations, {})
      vim.keymap.set("n", "gj", builtin.jumplist, {})
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      {
        "williamboman/mason.nvim",
        config = true,
      },
    },
    config = function()
      require('mason-lspconfig').setup({
        ensure_installed = {
          "tsserver",
          "eslint",
          "tailwindcss",
        }
      })
    end,
  },
  {
      "nvim-lualine/lualine.nvim",
      config = function()
        require('lualine').setup({
          options = {
            theme = 'solarized_light',
          },
          sections = {
            lualine_x = {
              'encoding',
              {'fileformat', icons_enabled = false},
              'filetype',
            }
          }
        })
      end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = { 'hrsh7th/cmp-nvim-lsp' },
    config = function()
      local lspconfig = require('lspconfig')
      -- local capabilities = vim.lsp.protocol.make_client_capabilities()
      local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
      -- capabilities.textDocument.completion.completionItem.snippetSupport = true
      lspconfig.html.setup { capabilities = lsp_capabilities }
      lspconfig.eslint.setup { capabilities = lsp_capabilities }
      lspconfig.tsserver.setup { capabilities = lsp_capabilities }
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
      vim.keymap.set('n', 'gr', vim.lsp.buf.rename)
      vim.keymap.set('n', 'ge', vim.diagnostic.open_float)
      vim.keymap.set("n", "==", vim.lsp.buf.format, {})
    end,
  },
  {
    "stevearc/oil.nvim",
    config = function()
      local oil = require("oil")
      oil.setup({
        columns = {
          "icon",
        },
        keymaps = {
          ["<bs>"] = "actions.parent",
          ["<esc>"] = "actions.close",
        },
        float = {
          padding = 4,
        },
      })
      vim.keymap.set('n', '<tab>', oil.open_float)
    end,
  },
  {
    "editorconfig/editorconfig-vim",
  },
  {
    "numToStr/Comment.nvim",
    config = true,
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
  },
  {
    "lewis6991/gitsigns.nvim",
    config = true,
  },
  {
    "mattn/emmet-vim",
    event = "InsertEnter",
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
    },
    event = 'InsertEnter',
    config = function()
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
          ['<Down>'] = cmp.mapping(cmp.mapping.select_next_item({
            behavior = cmp.SelectBehavior.Select
          }), {'i', 's', 'c'}),
          ['<CR>'] = cmp.mapping(cmp.mapping.confirm({ select = false }), {'i', 's', 'c'}),
        }), 
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          -- { name = 'buffer', option = { get_bufnrs = function() return vim.api.nvim_list_bufs() end } },
          { name = 'path' },
        }),
        -- sorting = {
        --   comparators = {
        --     cmp.config.compare.offset,
        --     cmp.config.compare.scores,
        --     -- cmp.config.compare.locality,
        --   }
        -- }
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
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      require('lspconfig').tsserver.setup {
        capabilities = capabilities,
      }
    end
  },
})

