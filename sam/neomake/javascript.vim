" you can set your enabled makers globally (like below) or on the buffer level 
" as part of an autocmd - see Neomake docs for details
let g:neomake_javascript_enabled_makers = ['eslint']
" when switching/opening a JS buffer, set neomake's eslint path
" , and enable it as a maker
au BufEnter *.js,*.jsx let b:neomake_javascript_eslint_exe = nrun#Which('eslint')
au BufWinEnter,BufWritePost *.js,*.jsx, Neomake
