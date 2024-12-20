return {
  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      defaults = {
        formatter = "path.filename_first",
        winopts = {
          width = 0.95
        }
      },
    },
    keys = {
      { "<leader>b",        "<cmd>FzfLua buffers<cr>",               desc = "Buffers" },
      { "<leader>r",        "<cmd>FzfLua oldfiles<cr>",              desc = "Recent files" },
      { "<leader><leader>", "<cmd>FzfLua resume<cr>",                desc = "Resume fzf" },
      { "<leader>ff",       "<cmd>FzfLua files<cr>",                 desc = "Find files" },
      { "<leader>fg",       "<cmd>FzfLua live_grep<cr>",             desc = "Grep" },
      { "<leader>gs",       "<cmd>FzfLua git_status<cr>",            desc = "Git status" },
      { "<leader>d",        "<cmd>FzfLua diagnostics_workspace<cr>", desc = "Diagnostics" },
      { "gi",               "<cmd>FzfLua lsp_implementations<cr>",   desc = "Implementations" },
      { "gk",               "<cmd>FzfLua lsp_refereces<cr>",         desc = "References" },
    },
    config = function(_, opts)
      require("fzf-lua").setup(opts)
    end
  },
}
