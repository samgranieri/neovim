" Don't tell me to use smartquotes in markdown ok?
let g:neomake_markdown_enabled_makers = []
" Support for github flavored markdown
" via https://github.com/jtratner/vim-flavored-markdown
augroup markdown
    au!
    au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END

