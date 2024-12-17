return {
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      { "williamboman/mason.nvim", config = true }
    },
    config = function()
      require('mason-lspconfig').setup({
        ensure_installed = { "eslint", "lua_ls", "tailwindcss", "ts_ls" }
      })
    end,
  }
}
