if !exists('g:schemer_no_autocmd')
  augroup schemer_buffer
    autocmd! * <buffer>
    autocmd BufWritePost <buffer> SchemerGenerate | execute 'colorscheme '.expand('%:p:t:r')
  augroup END
endif

command! -bar -buffer SchemerGenerate silent call Schemer#ProcessFile(expand('%:p'))

if !exists('b:undo_ftplugin')
  let b:undo_ftplugin = ''
end
let b:undo_ftplugin .= '|exe "au! schemer_buffer * <buffer>"'
let b:undo_ftplugin .= '|delcommand SchemerGenerate'
