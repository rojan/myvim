"for color scheme"
set t_Co=256


filetype plugin on

filetype indent on

"4 space for tab"
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

"syntax highlight enable"
syntax enable

"wrap text when line exceeds more than the windows size"
set wrap

"omni auto complete {
set ofu=syntaxcomplete#Complete
"}

"Ctags {
set tags=tags;
"}


"Keep backup files
set backup

"locate backup directory
set backupdir=~/vimbackup

"locate swap file directory
set dir=~/vimtmp

"autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType python set omnifunc=pysmell#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType php set omnifunc=phpcomplete#CompletePHP

"xclip package needed to copy from system clipboard
vmap <F6> :!xclip -f -sel clip<CR>
map <F7> :-1r !xclip -o -sel clip<CR>

"pathogen
call pathogen#infect()

"user mouser pointer
set mouse=a

"Tag list (Tlist) show tags of current buffer
let Tlist_Show_One_File = 1

"Tag list (Tlist) open list in right window
let Tlist_Use_Right_Window = 1

let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview

"Set colorcolumn to 80
set colorcolumn=80
highlight ColorColumn ctermbg=lightgrey

" For local replace
nnoremap gr gd[{V%:s/<C-R>///gc<left><left><left>

" For global replace
nnoremap gR gD:%s/<C-R>///gc<left><left><left>
