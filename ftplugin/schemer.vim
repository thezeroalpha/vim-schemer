augroup schemer_buffer
  autocmd! * <buffer>
  autocmd BufWritePost <buffer> silent call Schemer#ProcessFile(expand('%:p')) | execute 'colorscheme '.expand('%:p:t:r')
augroup END

map <buffer> <leader>CH <Plug>Colorizer
nnoremap <buffer> <leader>CC :ColorClear<CR>

if !exists('b:undo_ftplugin')
  let b:undo_ftplugin = ''
end
let b:undo_ftplugin .= '|setlocal makeprg< '
let b:undo_ftplugin .= '|exe "au! schemer_buffer * <buffer>"'
let b:undo_ftplugin .= '|mapc <buffer>'
let b:undo_ftplugin .= '|nmapc <buffer>'
