" reserved for vimscript exercices & examples



"echom "HELLO Maaddy"
set numberwidth=4
set wrap
set hidden
set bs=2

set tabstop=2
set shiftwidth=2
set expandtab
set encoding=utf-8

set ignorecase
set smartcase
set incsearch
setlocal colorcolumn=120

"let &pythonthreedll='C:\Users\m.berriri\AppData\Local\Programs\Python\Python38-32\python38.dll'
"let g:ycm_server_python_interpreter = "C:\Python27\python.exe"
"let g:loaded_youcompleteme = 1
"to make buffer unlisted:
":setlocal nobuflisted


"doc:
"_________________________________________________
"echo
"prints something to the user

"echom
"prints sthg and saves it in the log, you can then view it by running 'messages'

"messages
"shows the log of previously printed messages

"set number
"set rnu
"set wrap
"wraps the text when it exceeds the window
"set numberwidth=4

"comments doesn't work in map commands

"map
"maps commands in normal and visual mode

"nmap, imap, vmap
"nnoremap, inoremap, vnoremap, noremap
"non recursive mapping. always use these (strict mapping) and not the previous bare mappings.

"nunmap
"unmap some mapped keyset

"U in visual mode makes the selected text uppercase. u makes it lowercase.

"let mapleader = "-"
"nnoremap <leader>d dd
"you can groupe your mappings by prefixing all of them by the same prefix, or 'leader'. then you can change it just once and all your mappings prefixed by <leader> will change automatically.

"iabbrev

"use <nop> to map keys to no operation
"what is source & how to use it


"key mappings & abbreviations:
iabbrev fori for ( int k = 0; k < n; k++ ){}<esc>%a
iabbrev { {}<esc>%a
iabbrev ( ()<esc>%a
"iabbrev >> <esc>Bi<<esc>Ea></<C-x><C-o><esc>%i


let mapleader = "8"

"this is how I prefer to navigate in files.
nnoremap j h
nnoremap k j
nnoremap l k
nnoremap ; l
vnoremap j h
vnoremap k j
vnoremap l k
vnoremap ; l
"________________________
nnoremap <C-n> :tabnext<Cr>
nnoremap <C-t> :tabnew<Cr>:e .<Cr>
nnoremap ss :w<Cr>
inoremap jk <Esc>
"nnoremap <leader>e <C-w>v<C-w>w:vertical res -45<Cr>:term<Cr><C-w>w:e testS/test0.txt<Cr>:res -8<Cr><C-w><Left>
"nnoremap <leader>r :wa<Cr><C-w><Left><C-w><Up><C-w>w<C-w><Up>clear<Cr>car<Cr><C-w><Left>
nnoremap <leader>e :term<Cr><C-w>w<C-w><C-r>:res +18<Cr><C-w>w
"nnoremap <C-b> :bnext<Cr>
nnoremap <C-h> :bprev<Cr>
"nnoremap <C-j> :b#<Cr>
nmap <leader>ba yy<C-w>w:e <C-r>"<Cr>
nnoremap <leader>bd :Bclose<Cr>
inoremap <C-f> :CtrlPBuffer<Cr>
nnoremap <C-f> :CtrlPBuffer<Cr>

tnoremap jk <C-\><C-n>

"copy/paste to windows buffer
noremap <leader>y "*y
noremap <leader>p "*p

noremap <leader>nt :NERDTreeFind<Cr><C-w>L:vertical resize 60<Cr>0wzz
noremap <Tab>M <C-w><Bar><C-w>_
noremap <Tab>m :resize +20<Cr>
noremap <Tab>vm :vertical resize +20<Cr>
noremap <Tab> <C-w>
noremap <Tab>j <C-w>h
noremap <Tab>k <C-w>j
noremap <Tab>l <C-w>k
noremap <Tab>; <C-w>l
noremap <leader>q :q<Cr>
noremap <leader>t :terminal<Cr><C-w>J<C-\><C-n>:setlocal nobuflisted<Cr>a
noremap <C-.> :w

"ycm jump mappings:
"nnoremap <leader>jd :YcmCompleter GoTo<Cr>

"coc mappings:
"__________________________________________
set updatetime=1000   "refresh time
"go-to mappings:
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

"tab to navigate completion list in coc:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
"select completion on <CR>
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
"show documentation
"nnoremap <silent> K :call <SID>show_documentation()<CR>
"function! s:show_documentation()
  "if (index(['vim','help'], &filetype) >= 0)
    "execute 'h '.expand('<cword>')
  "elseif (coc#rpc#ready())
    "call CocActionAsync('doHover')
  "else
    "execute '!' . &keywordprg . " " . expand('<cword>')
  "endif
"endfunction
"highlight selected reference
"autocmd CursorHold * silent call CocActionAsync('highlight')
"rename reference
nmap <leader>rn <Plug>(coc-rename)

xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" ________________________________________________________________________________
" simple configurations
set rnu
set nu
set autoindent
set hlsearch
"colo 256-grayvim
"colo Benokai
"disable python syntax checker:
""let g:syntastic_mode_map = { 'passive_filetypes': ['python'] }
colo molokai
set guifont=Inconsolata_NF:h10:W500:cANSI:qDRAFT

" ________________________________________________________________________________



"powerline
"set  rtp+=/usr/local/lib/python3.6/dist-packages/powerline/bindings/vim/
"set laststatus=2
"set t_Co=256


"this is for pathogen to fire up
"call pathogen#infect()
syntax on
filetype plugin indent on

"for emmet:
let g:user_emmet_leader_key = '<C-y>'

"this is syntastic recommended configs from github
let g:syntastic_quiet_messages = {'level': 'warnings'}
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_List = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"java class paths
let g:syntastic_java_javac_classpath = "/home/maaddy/Desktop/TPs/Java/TP2_java/"



" Enable slim
"autocmd FileType slim setlocal foldmethod=indent
"autocmd BufNewFile,BufRead *.slim set filetype=slim

"function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 "exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 "exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
"endfunction

" NERDTress File highlighting
"call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
"call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
"call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
"call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
"call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
"call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
"call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
"call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
"call NERDTreeHighlightFile('styl', 'green', 'none', 'green', '#151515')
"call NERDTreeHighlightFile('css', 'green', 'none', 'green', '#151515')
"call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
"call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')
"call NERDTreeHighlightFile('js', 'cyan', 'none', 'cyan', '#151515')
"call NERDTreeHighlightFile('ts', 'cyan', 'none', 'cyan', '#151515')
"call NERDTreeHighlightFile('py', 'cyan', 'none', 'cyan', '#151515')
"call NERDTreeHighlightFile('cpp', 'cyan', 'none', 'cyan', '#151515')
"call NERDTreeHighlightFile('.c', 'cyan', 'none', 'cyan', '#151515')
"call NERDTreeHighlightFile('java', 'cyan', 'none', 'cyan', '#151515')

"to fix brackets issue for file icons
"autocmd FileType nerdtree syntax match hideBracketsInNerdTree "\]" contained conceal containedin=ALL
"autocmd FileType nerdtree syntax match hideBracketsInNerdTree "\[" contained conceal containedin=ALL

"airline
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 2
" don't show tabs to always view all buffers
let g:airline#extensions#tabline#show_tabs = 0
" Show just the filename
"let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_powerline_fonts = 1

"ctrl-p
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn))$'

"vim-rest
let g:vrc_curl_opts = {
  \ '-sS': '',
  \ '--connect-timeout': 10,
  \ '-i': '',
  \ '--max-time': 60,
  \ '-k': '',
\}

" set filetypes as typescriptreact
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact

