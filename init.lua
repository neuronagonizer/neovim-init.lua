local vim = vim
local Plug = vim.fn['plug#']

-- mini.nvim init
local path_pkg = vim.fn.stdpath('data') .. '/site'
local mini_path = path_pkg .. '/pack/deps/start/mini.nvim'

if not vim.loop.fs_stat(mini_path) then
  vim.cmd('echo "Installing `mini.nvim`" | redraw')
  local clone_cmd = {
    'git', 'clone', '--filter=blob:none',
    -- Uncomment next line to use 'stable' branch
    -- '--branch', 'stable',
    'https://github.com/echasnovski/mini.nvim', mini_path
    }
    vim.fn.system(clone_cmd)
    vim.cmd('packadd mini.nvim | helptags ALL')
end

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
Plug('pigpigyyy/yuescript-vim')
Plug('neovim/nvim-lspconfig')
Plug('ziglang/zig.vim')
Plug('ryanoasis/vim-devicons')
vim.call('plug#end')

vim.g.tokyonight_style = "night"
vim.cmd[[colorscheme tokyonight]]
vim.opt.termguicolors = true

-- Don't show parse errors in a separate window
vim.g.zig_fmt_parse_errors = 0
-- Disable format-on-save from nvim-lspconfig + ZLS
vim.g.zig_fmt_autosave = 0
-- Enable format-on-save from nvim-lspconfig + ZLS
--
-- Formatting with ZLS matches `zig fmt`
-- For more about `zig fmt` see:
-- https://github.com/ziglang/zig/wiki/FAQ
vim.api.nvim_create_autocmd('BufWritePre',{
  pattern = {"*.zig", "*.zon"},
  callback = function(ev)
    vim.lsp.buf.format()
  end })

require('feline').setup()
require('cokeline').setup()
require 'lspconfig'.zls.setup{}
require 'lspconfig'.pyright.setup{}
require 'lspconfig'.bashls.setup{}
require 'lspconfig'.lua_ls.setup{}
