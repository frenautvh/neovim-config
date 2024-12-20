return {
  {
    'nvim-telescope/telescope.nvim',
    enabled = false,
    dependencies = {
      'nvim-lua/plenary.nvim',
      'debugloop/telescope-undo.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    config = function()
      local telescope = require('telescope')
      local builtin = require("telescope.builtin")
      telescope.setup({
        defaults = {
          path_display = {
            "filename_first",
            "truncate"
          },
          layout_config = {
            horizontal = { width = 0.95 },
          }
        },
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
          }
        }
      })
      telescope.load_extension("fzf")
      telescope.load_extension("undo")
      vim.keymap.set("n", "<leader>b", function()
        builtin.buffers(require('telescope.themes').get_dropdown({
          initial_mode = "normal",
          sort_mru = true,
          ignore_current_buffer = true,
        }))
      end)
      vim.keymap.set("n", "<leader>r", builtin.oldfiles)
      vim.keymap.set("n", "<leader>u", telescope.extensions.undo.undo)
      vim.keymap.set("n", "<leader><leader>", builtin.resume)
      vim.keymap.set("n", "<leader>ff", builtin.find_files)
      vim.keymap.set("n", "<leader>fg", builtin.live_grep)
      vim.keymap.set("n", "<leader>gs", function()
        builtin.git_status({
          initial_mode = "normal",
        })
      end)
      vim.keymap.set("n", "<leader>d", function()
        builtin.diagnostics({
          builtin.lsp_implementations({
            initial_mode = "normal",
          })
        })
      end)
      vim.keymap.set("n", "gi", function()
        builtin.lsp_implementations({
          initial_mode = "normal",
        })
      end)
      vim.keymap.set("n", "gk", function()
        builtin.lsp_references({
          initial_mode = "normal",
        })
      end)
    end
  }
}
