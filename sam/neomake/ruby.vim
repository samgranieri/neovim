function! s:maybeUseBundler(jobinfo) abort
  let l:gemfile = findfile('Gemfile', '.;~') " This could be project-root/Gemfile
  if len(l:gemfile) > 0
    if executable('bin/' . self.exe)
      let self.exe = 'bin/' . self.exe
    elseif executable('exe/' . self.exe)
      let self.exe = 'exe/' . self.exe
    elseif !empty(filter(readfile(l:gemfile), { line -> line =~# 'gem\s+[''"]' . self.exe }))
      let self.args = ['exec', self.exe] + self.args
      let self.exe = 'bundle'
    endif
  endif
endfunction

call neomake#config#set('ft.ruby.InitForJob', function('s:maybeUseBundler'))
