local options = {
  number = true,
  autochdir = true,
  lazyredraw = true,
  undofile = true,
  expandtab = true,
  tabstop = 2,
  shiftwidth = 2,
  softtabstop = 2,
  ignorecase = true,
  smartcase = true,
  clipboard = 'unnamedplus',
  scrolloff = 10,
  cursorline = true,
  background = "dark",
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.g.mapleader = " "
vim.g.maplocalleader = ","
-- vim.cmd [[colorscheme delek]]
