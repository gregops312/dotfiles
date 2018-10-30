" Brief help:
  " :PluginList          - list configured bundles
  " :PluginInstall(!)    - install(update) bundles
  " :PluginSearch(!) foo - search(or refresh cache first) for foo
  " :PluginClean(!)      - confirm(or auto-ap prove) removal of unused bundles
  " for more details see :h vundle  or https://github.com/gmarik/vundle

set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

"
" Plugins
"
  " General

  " Color Schemes
    Plugin 'flazz/vim-colorschemes'
    colorscheme railscasts

    " Provides easy code commenting
    Plugin 'git://github.com/tomtom/tcomment_vim'

    " Fuzzy finder
    Plugin 'kien/ctrlp.vim'

    " Status Bar
    Plugin 'git://github.com/bling/vim-airline.git'

    " NERDTree
      " Tree file browsing
      Plugin 'git://github.com/scrooloose/nerdtree.git'
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

    " Automatic closing of quotes, parenthesis, brackets, etc.
    Plugin 'git://github.com/vim-scripts/delimitMate.vim.git'

  "
  " Language Specific
  "

    " G
      Plugin 'fatih/vim-go'
    " JavaScript
      Plugin 'git://github.com/pangloss/vim-javascript.git'
      Plugin 'jelera/vim-javascript-syntax'
      Plugin 'git://github.com/maksimr/vim-jsbeautify.git'
      Plugin 'git://github.com/posva/vim-vue'
    " Ruby
      " Wisely add "end" in ruby, endfunction/endif/more
      Plugin 'git://github.com/tpope/vim-endwise.git'

set background=dark
set backspace=indent,eol,start " backspace over eol, indents, and start of insets

" Interface

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

" Syntax
  syntax enable

call vundle#end()
filetype plugin indent on

