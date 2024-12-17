return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require 'nvim-treesitter.configs'.setup {
        ensure_installed = { "lua", "vim", "vimdoc", "tsx", "html", "javascript", "json" },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = ",",
            node_incremental = ",",
            node_decremental = "V",
          },
        },
      }
    end
  }
}
