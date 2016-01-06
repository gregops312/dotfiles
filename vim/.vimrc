" Turns on line numbers
    set number
" Status bar
    set laststatus=2                " keep bar on
    set statusline+=%F              " full path -> file
    set statusline=%t               " show file
    "set statusline+=\ %P            " show percent in file
    set statusline+=%8*\ %=\ row:%l/%L\ (%03p%%)\   " Rownumber/total (%)
    "set statusline +=%1*%=%5l%*     " current line
    "set statusline +=%2*/%L%*       " total lines
    set statusline +=%1*%4v\ %*     " virtual column number
    "set statusline +=%2*0x%04B\ %*  " character under cursor
" Colors
    colorscheme darkblue
    hi User8 guifg=#ffffff  guibg=#5b7fbb
" Spacing
    " Tab width 4 spaces
        filetype plugin indent on
        set tabstop=4
        set shiftwidth=4
        set expandtab
        set softtabstop=4
" Clean up
"       " Show Whitespace
            set list
            set listchars=trail:.

" Syntax
"   Highlighting
    syntax on



" Testing

"set showcmd
"set ai
"set mouse=a
"set background=dark


if has("terminfo")
    let &t_Co=16
    let &t_AB="\<Esc>[%?%p1%{8}%<%t%p1%{40}%+%e%p1%{92}%+%;%dm"
    let &t_AF="\<Esc>[%?%p1%{8}%<%t%p1%{30}%+%e%p1%{82}%+%;%dm"
else
    let &t_Co=16
    let &t_Sf="\<Esc>[3%dm"
    let &t_Sb="\<Esc>[4%dm"
endif

