"Remap leader to comma 
let mapleader = ","

set t_Co=256
set background=dark

"map sort function to a key
vnoremap <leader>s :sort<CR>

"set no auto change directory
"set noautochdir

filetype plugin on

filetype indent on

set foldmethod=manual

"4 space for tab"
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set wildignore=*.swp,*.bak,*.pyc,*.jar,*.gif,*.png,*.jpg

"syntax highlight enable"
syntax enable

"wrap text when line exceeds more than the windows size"
set wrap

"Ctags {
"set tags=tags;
set tags=.tags,$VIRTUAL_ENV/.tags;/
nmap <F12> :!ctags -f $VIRTUAL_ENV/.tags -R $VIRTUAL_ENV/lib/python2.7/site-packages /home/rojan/.virtualenvs/mysite &> /dev/null & disown<CR>

"Keep backup files
set backup

"locate backup directory
set backupdir=~/vimbackup

"locate swap file directory
set dir=~/vimtmp


"completion popup doesn’t select first item and typing new letters updates the completion list.
set completeopt=menuone,longest,preview
"if you prefer the Omni-Completion tip window to close when a selection is
" made, these lines close it on movement in insert mode or when leaving
" " insert mode
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

autocmd FileType python set omnifunc=pythoncomplete#Complete
"autocmd FileType python set omnifunc=pysmell#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
"set complete-=i
"omni auto complete {
set ofu=syntaxcomplete#Complete
"}

"xclip package needed to copy from system clipboard
"copy
vmap <F6> :!xclip -f -sel clip<CR>
"paste
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

"Set colorcolumn to 80
set colorcolumn=80
highlight ColorColumn ctermbg=lightgrey

"Don't lose selected lines
vnoremap < <gv
vnoremap > >gv

" highlight search text - get rid of highlight :noh
set hlsearch

"Toggle Search Highlights 
"noremap <space> :set hlsearch! hlsearch?<CR>
noremap <silent><Leader>/ :nohls<CR>

" automatically reload vimrc when it's saved
au BufWritePost .vimrc so ~/.vimrc

" to toggle the file browser
noremap <silent><leader>] :NERDTreeToggle<cr>
"Ignore .pyc file
let NERDTreeIgnore = ['\.pyc$']

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

"Improve up/down movement on wrapped lines 
nnoremap j gj
nnoremap k gk

"Escape from command-t list
let g:CommandTCancelMap=['<ESC>','<C-c>']

"Load Django autocompletion.
" arg1 - name of project 
function! LoadDjango(arg1)
py << EOF
import os.path
import sys
import vim

DJANGO_SETTINGS_MODULE=vim.eval("a:arg1") + '.settings'
print DJANGO_SETTINGS_MODULE
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
    os.environ['DJANGO_SETTINGS_MODULE'] = DJANGO_SETTINGS_MODULE
EOF
endfunction
"End of LoadDjango function

"find and replace selected text
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>
vnoremap <C-f> "hy:vimgrep "<C-r>h" **/*.* \| copen<left><left><left><left><left><left><left><left><left>

" colorscheme solarized
"let g:solarized_termcolors=256
colorscheme solarized

"Ultisnips settings
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsSnippetDirectories=["/home/rojan/.ultisnips/","bundle/ultisnips/UltiSnips/"]

"Insert <Tab> or complete identifier
" if the cursor is after a keyword character
function MyTabOrComplete()
    let col = col('.')-1
    if !col || getline('.')[col-1] !~ '\k'
        return "\<tab>"
    else
        return "\<C-N>"
    endif
endfunction
inoremap <Tab> <C-R>=MyTabOrComplete()<CR>

set rtp+=~/opt/powerline/powerline/bindings/vim
