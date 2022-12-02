nmap <C-n>:NERDTreeToggle<CR>

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
let s:green = "719e07"
let s:red = "AE403F"
let s:beer = "f28e1c"
let g:NERDTreeExtensionHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExtensionHighlightColor['ex'] = s:purple " sets the color of css files to blue
let g:NERDTreeExtensionHighlightColor['exs'] = s:purple " sets the color of css files to blue
let g:NERDTreeExtensionHighlightColor['leex'] = s:purple " sets the color of css files to blue
let g:NERDTreeExtensionHighlightColor['heex'] = s:purple " sets the color of css files to blue
let g:NERDTreeExtensionHighlightColor['vim'] = s:green " sets the color of css files to blue
let g:NERDTreeExtensionHighlightColor['gemspec'] = s:red " sets the color of css files to blue
let g:NERDTreeExactMatchHighlightColor = {}
let g:NERDTreeExactMatchHighlightColor['mix.exs'] = s:purple
let g:NERDTreeExactMatchHighlightColor['mix.lock'] = s:purple
let g:NERDTreeExactMatchHighlightColor['config.ru'] = s:red
let g:NERDTreeExactMatchHighlightColor['gemfile'] = s:red
let g:NERDTreeExactMatchHighlightColor['gemfile.lock'] = s:red
let g:NERDTreeExactMatchHighlightColor['rakefile'] = s:red
let g:NERDTreeExactMatchHighlightColor['brewfile'] = s:beer
let g:NERDTreeExactMatchHighlightColor['brewfile.lock.json'] = s:beer
highlight! link NERDTreeFlags NERDTreeDir

let NERDTreeHighlightCursorline = 0
