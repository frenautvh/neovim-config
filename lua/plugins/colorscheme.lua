return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup {
        background = {
          light = "latte",
          dark = "mocha",
        },
        transparent_background = true
      }
      vim.cmd.colorscheme("catppuccin")
      vim.api.nvim_set_hl(0, "Visual", { bold = true, bg = "#6c7086" })
    end
  }
}
