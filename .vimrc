set nocompatible              " be iMproved
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/Vundle.vim'

" My bundles here:
"
" original repos on GitHub
"Bundle 'SirVer/ultisnips'
"Bundle 'altercation/vim-colors-solarized'
"Bundle 'garbas/vim-snipmate'
"Bundle 'matthewsimo/angular-vim-snippets'
"Bundle 'mattn/emmet-vim'
"Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
"Bundle 'tomasr/molokai'
Bundle 'airblade/vim-rooter'
Bundle 'alvan/vim-closetag'
Bundle 'bling/vim-airline'
Bundle 'burnettk/vim-angular'
Bundle 'claco/jasmine.vim'
Bundle 'editorconfig/editorconfig-vim'
Bundle 'fisadev/vim-ctrlp-cmdpalette'
Bundle 'hallison/vim-markdown'
Bundle 'heavenshell/vim-jsdoc'
Bundle 'honza/vim-snippets'
Bundle 'ivalkeen/nerdtree-execute'
Bundle 'jiangmiao/auto-pairs'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'kien/ctrlp.vim'
Bundle 'leafgarland/typescript-vim'
Bundle 'lokaltog/vim-easymotion'
Bundle 'marcWeber/vim-addon-mw-utils'
Bundle 'mhinz/vim-signify'
Bundle 'othree/javascript-libraries-syntax.vim'
Bundle 'pangloss/vim-javascript'
Bundle 'reedes/vim-colors-pencil'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'sgur/ctrlp-extensions.vim'
Bundle 'simnalamburt/vim-mundo'
Bundle 'tomtom/tlib_vim'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-rails.git'
Bundle 'tpope/vim-rsi'
Bundle 'tpope/vim-surround'
Bundle 'valloric/YouCompleteMe'
Bundle 'wavded/vim-stylus'
Bundle 'whatyouhide/vim-gotham'

call vundle#end()
filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install (update) bundles
" :BundleSearch(!) foo - search (or refresh cache first) for foo
" :BundleClean(!)      - confirm (or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle commands are not allowed.
"
"
" Bundled Plugins config
"
" Airline Config
let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#buffer_min_count = 1
"let g:airline#extensions#tabline#tab_min_count = 1

let g:airline_theme='pencil'
" airline font setup
let g:airline_powerline_fonts = 1
" airline tab line
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'
"let g:airline#extensions#tabline#right_sep = ' '
"let g:airline#extensions#tabline#right_alt_sep = '|'

" powerline symbols
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" custom symbols
"let g:airline_left_sep = ''
"let g:airline_left_alt_sep = '|'
"let g:airline_right_sep = ''
"let g:airline_right_alt_sep = '|'
"let g:airline_symbols.branch = ''
"let g:airline_symbols.readonly = ''
"let g:airline_symbols.linenr = ''

"let g:airline_section_a       (mode, crypt, paste, iminsert)
"let g:airline_section_b       (hunks, branch)
let g:airline_section_b = airline#section#create(['branch']) "(hunks, branch)
"let g:airline_section_c       (bufferline or filename)
"let g:airline_section_gutter  (readonly, csv)
"let g:airline_section_x       (tagbar, filetype, virtualenv)
"let g:airline_section_y       (fileencoding, fileformat)
let g:airline_section_z = airline#section#create(['linenr', ':%3v '])
"(percentage, line number, column number)
"let g:airline_section_warning (syntastic, whitespace)

let g:airline#extensions#default#layout = [
    \ [ 'a', 'b', 'c' ],
    \ [ 'z', 'warning' ]
    \ ]

" Syntax checkers
let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'active_filetypes': ['ruby'],
                           \ 'passive_filetypes': [] }

" Prioritize hg for gutter diffs
let g:signify_vcs_list = [ 'hg', 'git' ]

" Set completion keys
let g:ycm_key_list_select_completion = ['<Tab>', '<Down>']
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1

" use camelcase for vim-angular file jumping
let g:angular_filename_convention = 'camelcased'

" CtrlP
"let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_cmdpalette_execute = 1
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(sw[m-p]|ico|git|svn))$'
let g:ctrlp_prompt_mappings = {
      \ 'ToggleType(1)':        ['<c-f>', '<c-up>', '<space>'],
      \ 'ToggleType(-1)':       ['<c-b>', '<c-down>'],
      \ }

" Easymotion
let g:EasyMotion_do_mapping = 1 " Disable default mappings

" vim-closetag
let g:closetag_filenames = "*.html,*.xhtml,*.jsx,*.react.js"

" Bi-directional find motion
" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
"nmap s <Plug>(easymotion-s)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-jumptoanywhere)
nmap <Leader>s <Plug>(easymotion-bd-jk)<Plug>(easymotion-lineanywhere)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" Directional jumps
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)

" Replace default search
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

" These `n` & `N` mappings are options. You do not have to map `n` & `N` to EasyMotion.
" Without these mappings, `n` & `N` works fine. (These mappings just provide
" different highlight method and have some other features )
" THESE BREAK #, *, etc.
"map  n <Plug>(easymotion-next)
"map  N <Plug>(easymotion-prev)

let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion

" gundo
let g:gundo_right = 1

" Use old regex engine
"set re=1

" Use relative lines
"set relativenumber

" Remove window seperator char
set fillchars=vert:\ 

" Auto Reload .vimrc on change
augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

" Vim macros
runtime macros/matchit.vim

" OmniComplete
set omnifunc=syntaxcomplete#Complete

"Remove gui
set guioptions=

"Syntax highlight
syntax on

"highlight current line
set cursorline

"set search highlight
set hlsearch

"set partial search highlight
set incsearch

"ignore case unless uppercase specified
set ignorecase
set smartcase

"unix slashes
set shellslash

"show current mode
set showmode

"show parital commands
set showcmd

"auto indent
set autoindent
set smartindent

"tab spacing
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

"filetype settings
filetype on
filetype plugin on
filetype indent on

"fancy matching
set wildmenu

"show line numbers
set number

"status line
set laststatus=2

"keep the cursor away from the ends
set scrolloff=8

"visual bell
"set vb
"

" Move cursor anywhere
set virtualedit=all

"highlight long lines
:set colorcolumn=80,100

" Allow hidding editted buffers
set hidden

" Keep undo history across sessions, by storing in file.
" Only works all the time.
if has('persistent_undo')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif

" Edit tmp files in place
set backupskip=/tmp/*,/private/tmp/*

" Gui options
if has("gui_running")
  ""font
  set guifont=Ubuntu\ Mono\ derivative\ Powerline\ 10
  ""size
  ""set lines=60 columns=120
endif

"Theme
colorscheme pencil
set background=dark

" Mouse
set mouse=a

" Set cursor by mode
if &term =~ "xterm\\|rxvt"
  " use a | cursor in insert mode
  let &t_SI .= "\<Esc>[4 q""]"

  " use a rectangle cursor otherwise
  let &t_EI .= "\<Esc>[2 q""]"

endif

"Custom Mappings

let mapleader = " "

"speed up window navigation
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" Arrows navigate windows
"map <left>  <C-w>h
"map <down>  <C-w>j
"map <up>    <C-w>k
"map <right> <C-w>l

" Tabs
map <C-n> :tabnew<CR>
map <C-j> gt
map <C-k> gT
"map <left> gt
"map <right> gT

" Move up and down displayed lines not real lines
map j gj
map k gk

" Use tab and S-tab for indentation
nnoremap <TAB> >>
nnoremap <S-TAB> <<
vnoremap <TAB> >gv
vnoremap <S-TAB> <gv

" use C-/ for commenting
map <C-_> <plug>NERDCommenterToggle

" Exit insert mode with two j's because when have you
" Every purposely typed two j's in a row?
inoremap jj <Esc>

" Command palette binding
map <leader>; :CtrlPCmdPalette<CR>
" Quick switch buffers
map <leader>b  :CtrlPBuffer<CR>
" Quick open recent files
map <leader>r  :CtrlPMRU<CR>
" Quick yankring
map <leader>p :CtrlPYankring<CR>

" Open links
map <leader><CR> <C-j>

" open nerdtree
map <leader>n <plug>NERDTreeTabsToggle<CR>
map <leader>nn <plug>NERDTreeTabsToggle<CR>
map <leader>nf <plug>NERDTreeFind<CR>

" open gundo
nmap <leader>u :GundoToggle<CR>

" Save shortcut
" map <C-s> :w<CR>

" Split at char into new line
map K i<Enter><Esc>

" Use Q to play the q macro
map Q @q

" Spell Checking
":map <F5> :setlocal spell! spelllang=en_ca<CR>

" Snippet completion
"imap <C-J> <Plug>snipMateNextOrTrigger
"smap <C-J> <Plug>snipMateNextOrTrigger

" Clear highlighting on escape in normal mode
"nnoremap <esc> :noh<return><esc>
"nnoremap <esc>^[ <esc>^[

" Insert mode mappings
imap ;; <ESC>g_a;
imap ;: <ESC>g_a:
imap ;+ <ESC>g_a +
imap ;- <ESC>g_a -
imap ;{ <ESC>g_a{
imap ;( <ESC>g_a(
imap ;[ <ESC>g_a[
imap ;< <ESC>g_a<
imap ;, <ESC>g_a,
imap ;. <ESC>g_a.
imap ;<Tab> <ESC>g_a
imap ;<Space> <ESC>g_a 

" Commands

"get rid of those annoying Ws
command! W w
command! Q q
command! E e

" Write as root
cmap w!! w !sudo tee % > /dev/null

" Strip trailing whitespace command
command! Strip %s/\s\+$//

" Auto strip white spaces
autocmd BufWritePre *.js,*.html,*.scss,*.rb,*.py :%s/\s\+$//e

" Add ranger as a file chooser in vim
" Compatible with ranger 1.4.2 through 1.6.*
"
" If you add this code to the .vimrc, ranger can be started using the command
" ":RangerChooser" or the keybinding "<leader>r".  Once you select one or more
" files, press enter and ranger will quit again and vim will open the selected
" files.

function! RangeChooser()
    let temp = tempname()
    " The option "--choosefiles" was added in ranger 1.5.1. Use the next line
    " with ranger 1.4.2 through 1.5.0 instead.
    let cmd = 'silent !ranger --choosefile=' . shellescape(temp)
    if has("gui_running") && (has("gui_gtk") || has("gui_motif"))
      let term = '! gnome-terminal -x bash -c '
      let cmd = substitute(cmd, '!', term, '')
    endif
    exec cmd
    if filereadable(temp)
      let names = readfile(temp)
      if !empty(names)
        " Edit the first item.
        exec 'edit ' . fnameescape(names[0])
        " Add any remaning items to the arg list/buffer list.
        for name in names[1:]
            exec 'argadd ' . fnameescape(name)
        endfor
      endif
    endif
    " Redraw the screen
    redraw!
endfunction
command! -bar RangerChooser call RangeChooser()
nnoremap <leader>o :<C-U>RangerChooser<CR>

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" grep word under cursor
nnoremap <leader>g :grep! "\b<C-R><C-W>\b"<CR>:cw<CR><CR>

" bind \ (backward slash) to grep shortcut
command! -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
nnoremap \ :Ag<SPACE>
