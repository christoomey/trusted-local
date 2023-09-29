" Trusted Local
"--------------

autocmd VimEnter * call s:LoadTrustedVimrcLocal()
autocmd BufWrite .vimrc.local call s:TrustVimrcLocal()

let s:GIT_SAFE_DIR = ".git/safe"
let s:VIMRC_LOCAL = ".vimrc.local"

" function! s:FetchGitRoot() abort
"   let output = system("git rev-parse --show-toplevel")
"   if v:shell_error == 0
"     return { 'kind': "success", 'data': output }
"   else
"     return { 'kind': "failure" }
"   endif
" endfunction

function! s:TrustVimrcLocal()
  if isdirectory('.git') && !isdirectory(s:GIT_SAFE_DIR)
    call mkdir(s:GIT_SAFE_DIR)
  endif
endfunction

function! s:LoadTrustedVimrcLocal()
  let trused_local_path = s:GIT_SAFE_DIR . "/../../" . s:VIMRC_LOCAL
  let trused_local_path_nested = "../" . s:GIT_SAFE_DIR . "/../../" . s:VIMRC_LOCAL
  if filereadable(trused_local_path)
    execute "source " . trused_local_path
  elseif filereadable(trused_local_path_nested)
    execute "source " . trused_local_path_nested
  endif
endfunction

function! s:EditVimrcLocal()
  execute "edit " . s:VIMRC_LOCAL
endfunction

function! s:SmartSplit()
  let split_cmd = (winwidth(0) >= 100) ? 'vsplit' : 'split'
  execute split_cmd . " " . s:VIMRC_LOCAL
endfunction

command! EditVimrcLocal call <sid>SmartSplit()

nnoremap <Plug>(EditVimrcLocal) :EditVimrcLocal<cr>

" vim:ft=vim
