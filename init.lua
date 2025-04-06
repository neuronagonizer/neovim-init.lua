local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')
Plug('folke/which-key.nvim')
Plug('nvim-telescope/telescope.nvim')
Plug('chrisgrieser/nvim-tinygit')
Plug('junegunn/fzf', { ['dir'] ='~/.fzf', ['do'] = './install --all' })
Plug('junegunn/vim-easy-align')
Plug('feline-nvim/feline.nvim')
Plug('tpope/vim-sensible')
Plug('nvimdev/dashboard-nvim')
Plug('neoclide/coc.nvim', { ['branch'] = 'release' })
Plug('preservim/nerdtree')
Plug('catppuccin/vim', { ['as'] = 'catppuccin' })
Plug('folke/tokyonight.nvim', { ['branch'] = 'main' })
Plug('nvim-lua/plenary.nvim')
Plug('nvim-tree/nvim-web-devicons')
Plug('willothy/nvim-cokeline')
Plug('leafo/moonscript-vim')
Plug('ziglang/zig.vim')
Plug('pluffie/neoproj')
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
require'neoproj'.setup{
  project_path = '~/dev/distant-hill'
  }
