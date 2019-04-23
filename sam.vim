if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif
call plug#begin('~/.config/nvim/plugged')
" Plug 'altercation/vim-colors-solarized'
Plug 'iCyMind/NeoSolarized'
Plug 'scrooloose/nerdtree'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-sensible'
Plug 'neomake/neomake'
Plug 'sheerun/vim-polyglot'
Plug 'mhinz/vim-mix-format'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'tpope/vim-dadbod'
Plug 'tpope/vim-eunuch'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" Plug 'itchyny/lightline.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'jremmen/vim-ripgrep'
Plug 'mhinz/vim-grepper'
Plug 'tpope/vim-projectionist'
Plug 'direnv/direnv.vim'
Plug 'sgur/vim-editorconfig'
Plug 'coderifous/textobj-word-column.vim'
Plug 'wellle/visual-split.vim'
Plug 'airblade/vim-gitgutter'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'slashmili/alchemist.vim'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'schickling/vim-bufonly'
Plug 'tsandall/vim-rego'
Plug 'vim-scripts/Align'
Plug 'majutsushi/tagbar'
Plug 'godlygeek/csapprox'
Plug 'chrisbra/Colorizer'
Plug 'gregsexton/gitv'
Plug 'mattn/gist-vim'
Plug 'https://gitlab.com/Lenovsky/nuake.git'

" Ruby
Plug 'tpope/vim-rails'

" Plug 'slashmili/alchemist.vim'
" Plug 'terryma/vim-multiple-cursors'
" Plug 'aliou/mix.vim'
" Plug 'samgranieri/vim-projectionist-elixir'
call plug#end()

source ~/.config/nvim/sam/colorscheme.vim
source ~/.config/nvim/sam/airline.vim
source ~/.config/nvim/sam/nerdtree.vim
source ~/.config/nvim/sam/tcomment.vim
source ~/.config/nvim/sam/text.vim
source ~/.config/nvim/sam/neomake.vim
source ~/.config/nvim/sam/tagbar.vim
" source ~/.config/nvim/sam/lightline.vim
source ~/.config/nvim/sam/folding.vim
source ~/.config/nvim/sam/searching.vim
source ~/.config/nvim/sam/statusbar.vim
source ~/.config/nvim/sam/abbreviations.vim
source ~/.config/nvim/sam/leader.vim
source ~/.config/nvim/sam/git.vim
source ~/.config/nvim/sam/projectionist.vim
source ~/.config/nvim/sam/fuzzyfinder.vim
source ~/.config/nvim/sam/grepping.vim
source ~/.config/nvim/sam/gitgutter.vim
"
" " Sane tabs
" syntax on
