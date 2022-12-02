" Run Neomake when I save any buffer
augroup neomake
  autocmd! BufReadPost,BufWritePost * Neomake
augroup END

source $XDG_CONFIG_HOME/nvim/sam/neomake/elixir.vim
source $XDG_CONFIG_HOME/nvim/sam/neomake/markdown.vim
source $XDG_CONFIG_HOME/nvim/sam/neomake/javascript.vim
