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
"set tags=tags;
set tags=./tags,$VIRTUAL_ENV/tags;/
nmap <F12> :!ctags -f $VIRTUAL_ENV/tags -R $VIRTUAL_ENV/lib/python2.7/site-packages /home/rojan/.virtualenvs/mysite &> /dev/null & disown<CR>

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


"Don't lose selected lines
vnoremap < <gv
vnoremap > >gv

" highlight search text - get rid of highlight :noh
set hlsearch

"Toggle Search Highlights 
noremap <space> :set hlsearch! hlsearch?<CR>

" \] to toggle the file browser
noremap <silent>,] :NERDTreeToggle<cr>

" Auto indent after pasting 
nnoremap <leader>p p
nnoremap <leader>P P
nnoremap p p'[v']=
nnoremap P P'[v']=

"The Smash Escape 
inoremap jj <Esc>

"Insert blank lines without going into insert mode 
nmap t o<ESC>k
nmap T O<ESC>j

"In xterm, set the name of the current file as title 
set title

"Remap leader to comma 
let mapleader = ","

"Improve up/down movement on wrapped lines 
nnoremap j gj
nnoremap k gk

" python syntax checker
let g:syntastic_python_checker = 'pylint'

" colorscheme solarized
"let g:solarized_termcolors=256
colorscheme solarized

"Escape from command-t list
let g:CommandTCancelMap=['<ESC>','<C-c>']

"set noautochdir
