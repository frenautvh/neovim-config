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
vim.keymap.set('n', '<esc>', '<esc>:nohl<cr>')
vim.keymap.set('i', '<tab>', [[pumvisible() ? "\<c-n>" : "\<tab>"]], { expr = true })
vim.keymap.set('i', '<s-tab>', [[pumvisible() ? "\<c-p>" : "\<s-tab>"]], { expr = true })

vim.g.neoformat_try_node_exe = 1

vim.o.updatetime = 250
vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
  group = vim.api.nvim_create_augroup("float_diagnostic_cursor", { clear = true }),
  callback = function ()
    vim.diagnostic.open_float(nil, { focus=false, scope="cursor" })
  end
})

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
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('telescope').setup({
        defaults = {
          layout_strategy = "vertical"
        }
      })
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<space>", function()
        builtin.buffers({ initial_mode = "normal", sort_mru = true, ignore_current_buffer = true })
      end, {})
      vim.keymap.set("n", "<up>", function()
        builtin.oldfiles({ initial_mode = "normal"  })
      end, {})
      vim.keymap.set("n", "<f1>", function()
        builtin.lsp_references({ initial_mode = "normal"  })
      end, {})
      vim.keymap.set("n", "<f2>", function()
        builtin.diagnostics({ initial_mode = "normal"  })
      end, {})
      vim.keymap.set("n", "<right>", builtin.git_files, {})
    end
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    dependencies = { 'nvim-telescope/telescope.nvim' },
    config = function()
      require("telescope").load_extension("ui-select")
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
    config = function()
      local lspconfig = require('lspconfig')
      lspconfig.html.setup { }
      lspconfig.eslint.setup { }
      lspconfig.tsserver.setup { }
      vim.keymap.set('n', 'ga', vim.lsp.buf.code_action)
      vim.keymap.set('n', 'gr', vim.lsp.buf.rename)
      vim.keymap.set('n', 'gm', vim.lsp.buf.format)
    end,
  },
  {
    'echasnovski/mini.nvim',
    version = false,
    config = function()
      require('mini.ai').setup()
      require('mini.icons').setup()
      require('mini.files').setup({
        mappings = {
          close = '<esc>',
        },
      })
      require('mini.comment').setup()
      require('mini.completion').setup()
      vim.keymap.set('n', '<tab>', MiniFiles.open)
    end,
  },
  {
    "editorconfig/editorconfig-vim",
  },
  {
    'tpope/vim-surround',
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
    'sbdchd/neoformat',
    config = function()
      vim.keymap.set('n', '==', ':Neoformat<cr>')
    end,
  },
})
