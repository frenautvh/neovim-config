return {
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'debugloop/telescope-undo.nvim',
    },
    config = function()
      local telescope = require('telescope')
      local builtin = require("telescope.builtin")
      telescope.setup({
        defaults = {
          path_display = { "filename_first", "truncate" },
          layout_config = {
            horizontal = { width = 0.95 },
          }
        }
      })
      telescope.load_extension("undo")
      vim.keymap.set("n", "<leader>b", function()
        builtin.buffers(require('telescope.themes').get_dropdown({
          initial_mode = "normal",
          sort_mru = true,
          ignore_current_buffer = true,
        }))
      end)
      vim.keymap.set("n", "<leader>r", function() builtin.oldfiles() end)
      vim.keymap.set("n", "<leader>u", function() telescope.extensions.undo.undo() end)
      vim.keymap.set("n", "<leader><leader>", function() builtin.resume() end)
      vim.keymap.set("n", "<leader>ff", function() builtin.find_files() end)
      vim.keymap.set("n", "<leader>fg", function() builtin.live_grep() end)
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
