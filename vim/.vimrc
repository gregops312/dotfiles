set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" Auto completion engine
  Plugin 'Shougo/deoplete.nvim'
  Plugin 'roxma/nvim-yarp'
  Plugin 'roxma/vim-hug-neovim-rpc'
" Git
  Plugin 'git://github.com/tpope/vim-fugitive.git'
" Color Schemes
  Plugin 'flazz/vim-colorschemes'
" Provides easy code commenting
  Plugin 'git://github.com/tomtom/tcomment_vim'
" Fuzzy finder
  Plugin 'kien/ctrlp.vim'
" Status Bar
  Plugin 'git://github.com/bling/vim-airline.git'
let g:airline#extensions#syntatic#enabled=1
" Tree file browsing
  Plugin 'git://github.com/scrooloose/nerdtree.git'
" Automatic closing of quotes, parenthesis, brackets, etc.
  Plugin 'git://github.com/vim-scripts/delimitMate.vim.git'
" Go
  Plugin 'fatih/vim-go'
  Plugin 'zchee/deoplete-go'
" JavaScript
  Plugin 'git://github.com/pangloss/vim-javascript.git'
  Plugin 'jelera/vim-javascript-syntax'
  Plugin 'git://github.com/maksimr/vim-jsbeautify.git'
  Plugin 'git://github.com/posva/vim-vue'
" Ruby
  " Wisely add "end" in ruby, endfunction/endif/more
  Plugin 'git://github.com/tpope/vim-endwise.git'
" Terraform
  Plugin 'hashivim/vim-terraform'

call vundle#end()


""
"" Old config setup
""

set backspace=indent,eol,start " backspace over eol, indents, and start of insets

" Interface
  syntax enable
  set background=dark
  colorscheme molokai

"
"
  filetype indent on  " load filetype-specific indent files
  set cursorline      " highlight current line
  set wildmenu            " visual autocomplete for command menu
  set lazyredraw          " redraw only when we need to
  set foldenable          " enable folding
  hi CursorLine   cterm=NONE ctermbg=240 ctermfg=NONE
  set cmdheight=2
"
"

  set history=1000  " store command history
  set number        " show line numbers
  set showmatch     " show matching brackets

  " AutoReload .vimrc See http://vimcasts.org/episodes/updating-your-vimrc-file-on-the-fly/
  if has("autocmd")
    autocmd! bufwritepost .vimrc source $MYVIMRC
  endif

  " Indentation
    set autoindent    " use previous indent on new line
    set smartindent   " use on new line
    set shiftwidth=2  " spaces for each auto-indent
    set expandtab     " spaces over tabs
    set tabstop=2     " number of spaces in a tab

  " Show Whitespace
    set listchars=trail:. " show trailing whitespace with . character
    set list
    set lcs=tab:-<,trail:.,extends:>,precedes:<

" Search
  set ignorecase " ignore case in seaches
  set smartcase " override 'ignorecase' if seach contains uppercase characters

""
"" Begin New Config
""

filetype plugin indent on

""
"" AutoCompletion Config
""
  let g:deoplete#enable_at_startup = 1
  let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
  let g:deoplete#enable_smart_case = 1
  let g:deoplete#sources#syntax#min_keyword_length = 3
  " Plugin key-mappings.
  inoremap <expr><C-g> deoplete#undo_completion()
  inoremap <expr><C-l> deoplete#complete_common_string()
  " Recommended key-mappings.
  " <CR>: close popup and save indent.
  inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
  function! s:my_cr_function()
    if pumvisible()
      return deoplete#close_popup()
    else
      return "\<CR>"
    endif
  endfunction
  " <TAB>: completion.
  inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
  " <C-h>, <BS>: close popup and delete backword char.
  inoremap <expr><C-h> deoplete#smart_close_popup()."\<C-h>"
  inoremap <expr><BS> deoplete#smart_close_popup()."\<C-h>"
  inoremap <expr><C-y> deoplete#close_popup()
  inoremap <expr><C-e> deoplete#cancel_popup()
  set completeopt-=preview

""
"" File Tree Config
""
  noremap <silent> <C-e> :NERDTreeToggle<CR>:silent NERDTreeMirror<CR>
  map <silent> <C-d> :1<CR>X
  " let NERDTreeShowBookmarks=1
  let NERDTreeChDirMode=2
  let NERDTreeQuitOnOpen=1
  let NERDTreeShowHidden=1
  let NERDTreeKeepTreeInNewTab=0
  " Disable display of the 'Bookmarks' label and 'Press ? for help' text
  let NERDTreeMinimalUI=1
  " Use arrows instead of + ~ chars when displaying directories
  let NERDTreeDirArrows=1
  " let NERDTreeBookmarksFile= $HOME . '/.vim/.NERDTreeBookmarks'
