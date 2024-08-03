" copilot
" -----------------------------------------------
" let g:copilot_filetypes = {
"             \ 'markdown': v:false,
"             \ }

" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif
let g:hardhacker_darker = 1
" colorscheme hardhacker
" set background=dark
" colorscheme plain

" vim-cpp-modern
" -----------------------------------------------
" Enable highlighting of C++11 attributes
let g:cpp_attributes_highlight = 1
" Highlight struct/class member variables (affects both C and C++ files)
let g:cpp_member_highlight = 1
" Put all standard C and C++ keywords under Vim's highlight group 'Statement'
" (affects both C and C++ files)
let g:cpp_simple_highlight = 1

" fzf
" -----------------------------------------------
let g:fzf_layout = { 'down': '25%' }
" Empty value to disable preview window altogether
let g:fzf_preview_window = ['hidden,right', 'ctrl-/']

" vim wiki
" -----------------------------------------------
let mainwiki = {}
let mainwiki.path = '~/Documents/vimwiki/wiki/'
let mainwiki.index = 'main'
let mainwiki.name = 'wiki'
let mainwiki.syntax = 'markdown'
let mainwiki.ext = '.md'
let kywik = {}
let kywik.path = '~/Documents/vimwiki/kywiki/'
let kywik.syntax = 'markdown'
let kywik.ext = '.md'
let kywik.name = 'kywiki'
let smt = {}
let smt.path = '~/Documents/vimwiki/smt/'
let smt.syntax = 'markdown'
let smt.ext = '.md'
let smt.name = 'smt'
let g:vimwiki_list = [mainwiki, kywik, smt]
let g:vimwiki_table_mappings = 0
au filetype vimwiki silent! iunmap <buffer> <Tab>
" Vim automatically opens the Vimwiki homepage after starting up without any
" file specified.
" autocmd VimEnter * if argc() == 0 | execute 'VimwikiUISelect ' | endif
" if argc() == 0 && exists(":VimwikiIndex")
"     autocmd VimEnter * VimwikiIndex
" endif

" vimtex
" -----------------------------------------------
let g:vimtex_view_method = 'zathura'
let g:vimtex_compiler_method = 'latexmk'
" let g:vimtex_compiler_latexmk_engines = {'_': '-xelatex'}
let g:vimtex_compiler_latexmk = {
            \ 'executable' : 'latexmk',
            \ 'out_dir'    : 'pdf',
            \ 'aux_dir'    : {-> 'aux/' . expand("%:t:r")},
            \ 'options'    : [
            \   '-pdf',
            \],
            \}
let g:vimtex_compiler_latexmk_engines = {
            \ '_'                : '-xelatex',
            \ 'pdflatex'         : '-pdf',
            \ 'luatex'           : '-lualatex',
            \ 'lualatex'         : '-lualatex',
            \ 'xelatex'          : '-xelatex',
            \}
let g:vimtex_quickfix_mode=2

" vim Leetcode
" -----------------------------------------------
" The preferred programming language.
let g:leetcode_solution_filetype = 'cpp'
" Set to the browser that stores the LeetCode session cookie.
let g:leetcode_browser = 'chrome'
" Hide the paid only problems on the list.
let g:leetcode_hide_paid_only = 0
" Set the problemset to get from leetcode.
let g:leetcode_problemset = 'algorithms'
" Set python 
" let g:python3_host_prog = '/home/riczzoe/.pyenv/shims/python'
" let g:python3_host_prog = '/home/riczzoe/.pyenv/versions/3.12.0/bin/python'

