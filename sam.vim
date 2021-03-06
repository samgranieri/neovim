if empty(glob('~/.config/nvim/autoload/plug.vim'))
  autocmd VimEnter * PlugInstall
endif
call plug#begin('~/.config/nvim/plugged')

" Color Schemes
" Plug 'altercation/vim-colors-solarized'
Plug 'iCyMind/NeoSolarized'

" File tree
Plug 'scrooloose/nerdtree'

" Tag Bar
" Plug 'majutsushi/tagbar'

" Switch back and forth with tmux nicely
Plug 'christoomey/vim-tmux-navigator'

" Comment out code nicely
Plug 'tomtom/tcomment_vim'

" Not sure I need this
Plug 'tpope/vim-sensible'
" Plug 'direnv/direnv.vim'

" Code syntax
Plug 'sheerun/vim-polyglot'

" Async linting and make
Plug 'neomake/neomake'

" Code Completion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Tim Pope is a vim wizard
Plug 'tpope/vim-surround'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-dadbod'
Plug 'tpope/vim-eunuch'

" Fuzzy finding
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" Awesome searchijng
Plug 'jremmen/vim-ripgrep'

" Plug 'itchyny/lightline.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'mhinz/vim-grepper'

" Project settings
Plug 'tpope/vim-projectionist'

Plug 'sgur/vim-editorconfig'
Plug 'coderifous/textobj-word-column.vim'
Plug 'wellle/visual-split.vim'
Plug 'slashmili/alchemist.vim'

Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'

" Seriousy, there's sometimes I just want to have one buffer loaded
Plug 'schickling/vim-bufonly'
Plug 'tsandall/vim-rego'
Plug 'earthly/earthly.vim', { 'branch': 'main' }
Plug 'vim-scripts/Align'

" Appearance
Plug 'godlygeek/csapprox'
Plug 'chrisbra/Colorizer'

" Git
"
Plug 'gregsexton/gitv'
Plug 'mattn/gist-vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'airblade/vim-gitgutter'

" Doom terminal
" Plug 'https://gitlab.com/Lenovsky/nuake.git'

" Ruby
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'

" Elixir
Plug 'mhinz/vim-mix-format'

" JavaScript neomake npm haxx
Plug 'jaawerth/nrun.vim'


Plug 'kyuhi/vim-emoji-complete'

Plug 'junegunn/vim-github-dashboard'

Plug 'jtratner/vim-flavored-markdown'
Plug 'nelstrom/vim-markdown-preview'
Plug 'edkolev/tmuxline.vim'

Plug 'SirVer/ultisnips'

Plug 'honza/vim-snippets'

Plug 'chrisbra/Colorizer'
Plug 'jparise/vim-graphql'
Plug 'christophermca/meta5'
Plug 'chrisbra/NrrwRgn'
Plug 'jceb/vim-orgmode'
Plug 'ryanoasis/vim-devicons'
" Cool dev icons
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Earthly
Plug 'earthly/earthly.vim', { 'branch': 'main' }

Plug 'depuracao/vim-rdoc'

" NVIM 0.5
" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" " Plug 'nvim-treesitter/playground'
" Plug 'neovim/nvim-lspconfig'
" Plug 'hrsh7th/vim-vsnip'
" Plug 'hrsh7th/vim-vsnip-integ'
" Plug 'hrsh7th/nvim-compe'
" " " dependencies
" Plug 'nvim-lua/popup.nvim'
" Plug 'nvim-lua/plenary.nvim'
" " " telescope
" Plug 'nvim-telescope/telescope.nvim'
call plug#end()

source ~/.config/nvim/sam/colorscheme.vim
source ~/.config/nvim/sam/airline.vim
source ~/.config/nvim/sam/nerdtree.vim
source ~/.config/nvim/sam/tcomment.vim
source ~/.config/nvim/sam/text.vim
source ~/.config/nvim/sam/neomake.vim
" source ~/.config/nvim/sam/tagbar.vim
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
source ~/.config/nvim/sam/devicons.vim

" Sane tabs
" syntax on
set clipboard=unnamedplus
