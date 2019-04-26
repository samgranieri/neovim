nmap <C-n> :NERDTreeToggle<CR>

" nmap <Leader>n :NERDTreeToggle<CR>
" Make nerdtree look nice
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeWinSize = 30
" Auto open nerd tree on startup
let g:nerdtree_tabs_open_on_gui_startup = 1
" Focus in the main content window
let g:nerdtree_tabs_focus_on_files = 1

let s:purple = "834F79"
let g:NERDTreeExtensionHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExtensionHighlightColor['ex'] = s:purple " sets the color of css files to blue
let g:NERDTreeExtensionHighlightColor['exs'] = s:purple " sets the color of css files to blue

if exists("g:loaded_webdevicons")
  call webdevicons#refresh()
endif
