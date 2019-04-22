" Run Neomake when I save any buffer
augroup neomake
  autocmd! BufReadPost,BufWritePost * Neomake
augroup END

source ~/.config/nvim/sam/neomake/elixir.vim
source ~/.config/nvim/sam/neomake/markdown.vim
