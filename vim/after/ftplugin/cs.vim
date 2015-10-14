setlocal omnifunc=OmniSharp#Complete
" OmnisharpのキーマップをVisualstudio風にする
nnoremap <silent> <buffer> <F12> :OmniSharpGotoDefinition<CR>
nnoremap <silent> <buffer> <S-F12> :OmniSharpFindUsages<CR>
