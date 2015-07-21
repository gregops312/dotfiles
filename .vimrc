" Testing



"set showcmd
"set shiftwidth=3
"set softtabstop=3
"set expandtab
set ai
"set mouse=a
"set background=dark
syntax on

"Testing

colorscheme darkblue

" Turns on line numbers
set number

if has("terminfo")
	let &t_Co=16
	let &t_AB="\<Esc>[%?%p1%{8}%<%t%p1%{40}%+%e%p1%{92}%+%;%dm"
	let &t_AF="\<Esc>[%?%p1%{8}%<%t%p1%{30}%+%e%p1%{82}%+%;%dm"
else
	let &t_Co=16
	let &t_Sf="\<Esc>[3%dm"
	let &t_Sb="\<Esc>[4%dm"
endif

