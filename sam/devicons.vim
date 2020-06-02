let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '
let g:WebDevIconsNerdTreeBeforeGlyphPadding = ""
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 0
let g:WebDevIconsOS = 'Darwin'
let g:WebDevIconsUnicodeDecorateFolderNodes = v:true
let g:WebDevIconsUnicodeGlyphDoubleWidth = 0
let g:NERDTreeDirArrowExpandable = "\u00a0"
let g:NERDTreeDirArrowCollapsible = "\u00a0"
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols = {} " needed
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['Gemfile'] = 'ƛ'
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['Gemfile.lock'] = 'ƛ'

let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['gemfile'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['gemfile.lock'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['config.ru'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['rakefile'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['dockerfile'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['jenkinsfile'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['.git'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['.github'] = ''
let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_airline_statusline = 1
let g:webdevicons_enable_ctrlp = 1

if exists("g:loaded_webdevicons")
  call webdevicons#refresh()
endif
