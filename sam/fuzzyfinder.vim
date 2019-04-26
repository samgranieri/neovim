" function! Fzf_dev()
"   function! s:files()
"     let files = split(system($FZF_DEFAULT_COMMAND), '\n')
"     return s:prepend_icon(files)
"   endfunction
"
"   function! s:prepend_icon(candidates)
"     let result = []
"     for candidate in a:candidates
"       let filename = fnamemodify(candidate, ':p:t')
"       let icon = WebDevIconsGetFileTypeSymbol(filename, isdirectory(filename))
"       call add(result, printf("%s %s", icon, candidate))
"     endfor
"
"     return result
"   endfunction
"
"   function! s:edit_file(item)
"     let parts = split(a:item, ' ')
"     let file_path = get(parts, 1, '')
"     execute 'silent e' file_path
"   endfunction
"
"   call fzf#run({
"         \ 'source': <sid>files(),
"         \ 'sink':   function('s:edit_file'),
"         \ 'options': '-m -x +s',
"         \ 'down':    '40%' })
" endfunction
"
" command! FilesWithIcon :call Fzf_dev()

" https://github.com/ryanoasis/vim-devicons/issues/106#issuecomment-439714391
" Files + devicons
function! Fzf_files_with_dev_icons(command)
  let l:fzf_files_options = '--preview "bat --color always --style numbers {2..} | head -'.&lines.'"'
  function! s:edit_devicon_prepended_file(item)
    let l:file_path = a:item[4:-1]
    execute 'silent e' l:file_path
  endfunction
  call fzf#run({
        \ 'source': a:command.' | devicon-lookup',
        \ 'sink':   function('s:edit_devicon_prepended_file'),
        \ 'options': '-m ' . l:fzf_files_options,
        \ 'down':    '40%' })
endfunction

function! Fzf_git_diff_files_with_dev_icons()
  let l:fzf_files_options = '--ansi --preview "sh -c \"(git diff --color=always -- {3..} | sed 1,4d; bat --color always --style numbers {3..}) | head -'.&lines.'\""'
  function! s:edit_devicon_prepended_file_diff(item)
    echom a:item
    let l:file_path = a:item[7:-1]
    echom l:file_path
    let l:first_diff_line_number = system("git diff -U0 ".l:file_path." | rg '^@@.*\+' -o | rg '[0-9]+' -o | head -1")
    execute 'silent e' l:file_path
    execute l:first_diff_line_number
  endfunction

  call fzf#run({
        \ 'source': 'git -c color.status=always status --short --untracked-files=all | devicon-lookup',
        \ 'sink':   function('s:edit_devicon_prepended_file_diff'),
        \ 'options': '-m ' . l:fzf_files_options,
        \ 'down':    '40%' })
endfunction

" nnoremap <C-p> :<C-u>FZF<CR>
nnoremap <C-p> :<C-u> :call Fzf_files_with_dev_icons($FZF_DEFAULT_COMMAND)<CR>
