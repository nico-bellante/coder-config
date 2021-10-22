" Ensure all directories are setup properly and download plug.vim
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  execute '!curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
endif


call plug#begin("~/.local/share/nvim/site/plugged") " where the plugs will be dled

" themes
Plug 'kaicataldo/material.vim'
Plug 'gosukiwi/vim-atom-dark'
Plug 'olimorris/onedarkpro.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }

" editor functionality
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'luochen1990/rainbow' " rainbow parens
Plug 'akinsho/toggleterm.nvim'
Plug 'nvim-telescope/telescope.nvim'

" improved vim features
Plug 'tpope/vim-surround'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'itchyny/lightline.vim'

" language stuffs 
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'nvim-lua/plenary.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'jose-elias-alvarez/null-ls.nvim'

Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'jparise/vim-graphql'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()


source ~/.config/nvim/theme.vim
source ~/.config/nvim/editor.vim
source ~/.config/nvim/binding.vim
source ~/.config/nvim/language-config.vim
source ~/.config/nvim/coc-config.vim
source ~/.config/nvim/nico.vim
source ~/.config/nvim/util.vim

