" ###############################
" ########## dein.vim ###########
" ###############################
if &compatible
  set nocompatible
endif
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

call dein#begin(expand('~/.cache/dein'))

call dein#add('Shougo/dein.vim')

" For :Tabular
call dein#add('godlygeek/tabular')

" For :Alignta
call dein#add('h1mesuke/vim-alignta')

" For :AnsiEsc
call dein#add('powerman/vim-plugin-AnsiEsc')

" For :FixWhitespae
call dein#add('bronson/vim-trailing-whitespace')

" vim-abolish
call dein#add('tpope/vim-abolish')

call dein#end()

syntax enable
filetype plugin indent on
filetype indent on
syntax on
