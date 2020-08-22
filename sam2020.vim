if empty(glob('~/.config/nvim/autoload/plug.vim'))
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.config/nvim/plugged')

" TIM POPE
Plug 'tpope/vim-sensible'

" COLORSCHEME
"
Plug 'iCyMind/NeoSolarized'

" NAVIGATION
"
Plug 'tpope/vim-projectionist'
Plug 'scrooloose/nerdtree'
Plug 'christoomey/vim-tmux-navigator'

" VIM CHROME 
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'airblade/vim-gitgutter'
Plug 'edkolev/tmuxline.vim'

" TEXT EDITING
Plug 'tomtom/tcomment_vim'

" SEARCHING
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'jremmen/vim-ripgrep'
Plug 'mhinz/vim-grepper'
call plug#end()

" COLORSCHEME
source ~/.config/nvim/sam/colorscheme.vim

" NAVIGATION
source ~/.config/nvim/sam/projectionist.vim
source ~/.config/nvim/sam/nerdtree.vim


" VIM CHROME
source ~/.config/nvim/sam/airline.vim
source ~/.config/nvim/sam/devicons.vim
source ~/.config/nvim/sam/gitgutter.vim

" TEXT EDITING
source ~/.config/nvim/sam/tcomment.vim

" SEARCHING
source ~/.config/nvim/sam/searching.vim
source ~/.config/nvim/sam/fuzzyfinder.vim
source ~/.config/nvim/sam/grepping.vim
