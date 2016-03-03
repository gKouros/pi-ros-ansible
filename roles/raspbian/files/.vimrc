" My vimrc configuration
set nocompatible                 " explicitely declare no-compatibillity with vi
" Vundle  {{{
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-scripts/a.vim'
Plugin 'universal-ctags/ctags'
Plugin 'vim-scripts/Gundo'
Plugin 'vim-scripts/indentLine.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'ervandew/supertab'
Plugin 'godlygeek/tabular'
Plugin 'vim-scripts/taglist.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'vim-scripts/fugitive.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'taketwo/vim-ros'
Plugin 'tpope/vim-surround'
Plugin 'flazz/vim-colorschemes'
Plugin 'mhinz/vim-startify'
call vundle#end()
" }}}
" Colors and Themes {{{
set t_Co=256
colorscheme wombat256mod                                  " set vim color scheme
syntax enable                                         " enable syntax processing
" - highlight line number column
highlight Comment ctermfg=66
let &colorcolumn=81                                            " color column 81
highlight colorcolumn ctermfg=red ctermbg=black
" }}}
" rainbow parenthesis {{{
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
" execute :RainbowParenthesesActivate to display the rainbow
" }}}
" Spaces and Tabs {{{
set tabstop=2                                   " number of visual spaces per TAB
set softtabstop=2                         " number of spaces in tab when editing
set expandtab                                                   " tabs are spaces
set shiftwidth=2           " use two spaces indentation with reindent (<< or >>)
set cino=(2                   " begaviour of indentation in unclosed parenthesis
" }}}
" Taglist {{{
let Tlist_Use_Right_Window=1
let Tlist_WinWidth=40
let Tlist_GainFocus_On_ToggleOpen=1
" }}}
" UI Config {{{
set shell=/bin/bash
set encoding=utf-8
set number                                                   " show line numbers
set showcmd                                         " show command in bottom bar
set cursorline                                          " highlight current line
filetype indent on                         " load filetype-specific indent files
filetype plugin on                                     " enable filetype plugins
set wildmenu                              " visual autocomplete for command menu
set lazyredraw                                     " redraw only when we need to
set showmatch                                        " highlight matching [{()}]
set ignorecase                                          " ignore case by default
set smartcase                 " ignore case at search, unless camel case is used
set clipboard=unnamed         " use the system clipboard for for yank/put/delete
set laststatus=2                                      " always show status lines
set ruler                                                   " show column number
set mouse=v                                           " enable mouse in terminal
" set textwidth=80
set listchars=eol:¬,tab:\|\ ,trail:~,extends:>,precedes:<       " set list chars
autocmd BufWritePre * :%s/\s\+$//e                " - remove whitespaces on save
autocmd ColorScheme * highlight WhiteSpaces gui=undercurl guifg=LightGray | match WhiteSpaces / \+/

" - indent lines and leading spaces
let g:indentLine_color_term=239
let g:indentLine_enabled=1
let g:indentLine_leadingSpaceEnabled=1
" }}}
" Filetypes {{{
autocmd BufNewFile,BufReadPost *.ino,*.pde set filetype=cpp
autocmd BufNewFile,BufReadPost *.launch,*.urdf,*.xacro,*.sdf set filetype=xml
" }}}
" Searching {{{
set incsearch                                 " search as characters are entered
set hlsearch                                                 " highlight matches
" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>
" Center window under cursor when searching
nmap N Nzz
nmap n nzz
nmap * *zz
" }}}
" Folding {{{
set foldenable                                                  " enable folding
set foldlevelstart=10                               " open most folds by default
set foldnestmax=10                                          " 10 nested fold max
" - space open/close folds
nnoremap <space> za
set foldmethod=syntax                                     " fold based on syntax
" }}}
" Backups {{{
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup
" }}}
" Custom Functions {{{
" - toggle between number and relativenumber
function! ToggleNumber()
    if(&relativenumber == 1)
        set norelativenumber
        set number
    else
        set relativenumber
    endif
endfunc
" -  strips trailing whitespace at the end of files. this
"    is called on buffer write in the autogroup above.
function! <SID>StripTrailingWhitespaces()
    " save last search & cursor position
    let _s=@/
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    let @/=_s
    call cursor(l, c)
endfunction
" }}}
" Directories {{{
let g:UltiSnipsSnippetsDirectories=["UltiSnipps", "my_snippets"]
"}}}
" Statusline {{{
let g:airline_powerline_fonts=1
let g:airline_theme='wombat'
" }}}
" Git {{{
" - Show number of non-zero  modifications next to branch name in git repos
let g:airline#extensions#hunks#enabled = 1
let g:airline#extensions#hunks#non_zero_only = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
" }}}
" NERDTree {{{
let NERDTreeDirArrows=0                          " Use + - chars for directories
let NERDTreeMinimalUI=1                         " Remove excess information bars
let NERDTreeShowBookmarks=1                                     " Show Bookmarks
"}}}
" YouCompleteMe {{{
" let g:ycm_seed_identifiers_with_syntax = 1
" let g:ycm_autoclose_preview_window_after_insertion = 1
" let g:ycm_key_list_select_completion=['<tab>', '<Down>']
" let g:ycm_key_list_previous_completion=['<s-tab>', '<Up>']
" let g:ycm_auto_trigger = 1
" let g:ycm_confirm_extra_conf = 0 "Don't ask for confirmation every time
" let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'
" }}}
" Syntastic {{{
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" let g:syntastic_always_populate_loc_list = 0
" let g:syntastic_auto_loc_list = 0
" let g:syntastic_check_on_open = 0
" let g:syntastic_check_on_wq = 0
" highlight SyntasticErrorSign guifg=white guibg=red
" }}}
" Comments {{{
let g:NERDSpaceDelims=1                              " leave space after comment
let g:NERDCompactSexyComs=0                             " enable sexy commenting
map - <leader>ci
" }}}
" Startify {{{
let g:startify_bookmarks = [ '~/.vim/.vimrc', '~/.bashrc' ]
let g:startify_session_detection=1     " Show current folder session file at top
let g:startify_relative_path =1                            " Show relative paths
let g:startify_change_to_dir=0         " Change to file's directory when opening
let g:startify_files_number=10                         " Number of files to show
" Order of info display
let g:startify_list_order = [
      \ ['   Bookmarks:'],
      \ 'bookmarks',
      \ ['   Recent Files:'],
      \ 'files',
      \ ]
" }}}
" Custom bindings {{{
" - gui undo binding
nnoremap <leader>u :GundoToggle<CR>
" - edit vimrc binding
nnoremap <leader>ev :vsp $MYVIMRC<CR>
" - source vimrc binding
nnoremap <leader>sv :source $MYVIMRC<CR>
" - remove whitespaces
nnoremap <leader>W :%s/\s\+$//<CR>:let @/=''<CR>
" - toggle rainbow parentheses
nnoremap <leader>r :RainbowParenthesesToggle<CR>
" - toggle nerdtree
nnoremap <leader>n :NERDTreeToggle<CR>
" - toggle line wrapping
nnoremap <leader>w :set wrap!<CR>
" - copy and paste from system clipboard
nnoremap <leader>y "*y
nnoremap <leader>p "*p
" - toggle taglist
nnoremap <leader>t <ESC>:TlistToggle<CR>
" }}}
" Custom Movements {{{
" - move to beginning/end of line
nmap <C-j> <C-W>j
nmap <C-h> <C-W>h
nmap <C-k> <C-W>k
nmap <C-l> <C-W>l
" - don't jump wrapped lines
nnoremap j gj
nnoremap k gk
noremap <Up> g<Up>
noremap <Down> g<Down>
imap <Up> <C-o>gk
imap <Down> <C-o>gj
" }}}
" Organization {{{
set modeline
set modelines=1
" }}}
" vim:foldmethod=marker:foldlevel=0
