set number autochdir undofile
set expandtab tabstop=2 shiftwidth=2 softtabstop=2
set ignorecase smartcase
set clipboard+=unnamedplus

nno j gj
nno k gk
nno <bs> :b#<cr>
nno <cr> O<esc>j
nno <space> :nohl<cr>

nno == :Neoformat<cr>
nno ge :Telescope find_files layout_strategy=vertical<CR>
nno go :Telescope buffers layout_strategy=vertical<CR>
nno gh :Telescope oldfiles layout_strategy=vertical<CR>
nno gf :Telescope git_files layout_strategy=vertical cwd=<c-r>=expand('%:p:h')<cr><cr>
ino ,, <c-r>=emmet#util#closePopup()<cr><c-r>=emmet#expandAbbr(0,"")<cr>

call plug#begin("~/local/share/nvim/plugged")
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'williamboman/mason.nvim'
  Plug 'neovim/nvim-lspconfig'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-cmdline'
  Plug 'hrsh7th/nvim-cmp'
  Plug 'sbdchd/neoformat'
  Plug 'stevearc/oil.nvim'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'numToStr/Comment.nvim'
  Plug 'windwp/nvim-autopairs'
  Plug 'lewis6991/gitsigns.nvim'
  Plug 'shaunsingh/solarized.nvim'
  Plug 'mattn/emmet-vim'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
call plug#end()

color solarized
let g:airline_theme="solarized"
let g:airline_powerline_fonts = 1

lua << EOF
  require('plugin-config')
EOF
