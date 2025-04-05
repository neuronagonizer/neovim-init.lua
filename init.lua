local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')
Plug('junegunn/fzf', { ['dir'] ='~/.fzf', ['do'] = './install --all' })
Plug('junegunn/vim-easy-align')
Plug('feline-nvim/feline.nvim')
Plug('tpope/vim-sensible')
Plug('nvimdev/dashboard-nvim')
Plug('neoclide/coc.nvim', { ['branch'] = 'release' })
Plug('preservim/nerdtree')
Plug('folke/tokyonight.nvim', { ['branch'] = 'main' })
Plug('nvim-lua/plenary.nvim')
Plug('nvim-tree/nvim-web-devicons')
Plug('willothy/nvim-cokeline')
Plug('leafo/moonscript-vim')
Plug('ziglang/zig.vim')
Plug('ryanoasis/vim-devicons')


vim.call('plug#end')

vim.g.tokyonight_style = "night"
vim.cmd[[colorscheme tokyonight]]
vim.opt.termguicolors = true

require('feline').setup()
require('cokeline').setup()
require'lspconfig'.pyright.setup{}
require'lspconfig'.bashls.setup{}
require'lspconfig'.lua_ls.setup{}
