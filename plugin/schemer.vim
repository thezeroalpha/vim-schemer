function! s:edit_colors()
  execute "split ~/.vim/colors/".g:colors_name.".schemer"
endfunction

function! s:synstack()
  if !exists("*synstack")
    return
  endif
  echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"
endfunction

nnoremap <Plug>SchemerEdit :call <SID>edit_colors()<CR>
nnoremap <Plug>SchemerSynstack :call <SID>synstack()<CR>
