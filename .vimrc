" ~/.vimrc

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" https://github.com/tpope/vim-sensible
Plugin 'tpope/vim-sensible'

" Syntastic
" Plugin 'scrooloose/syntastic'

" lsc
Plugin 'natebosch/vim-lsc'

" ALE
Plugin 'dense-analysis/ale'

" C highlight
Plugin 'octol/vim-cpp-enhanced-highlight'

" Airline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

runtime! plugin/sensible.vim

set encoding=utf-8 fileencodings=
syntax on

set number
set cc=80

set mouse=a

set expandtab
set shiftwidth=4
set shiftround
set tabstop=4
set softtabstop=4
set smarttab
set cindent
set autoindent
set smartindent
set cinoptions+=:0

set nowrap
set nolinebreak
set breakat=

set scrolloff=2
set sidescrolloff=2

set splitright
set splitbelow

set lazyredraw

set nohlsearch
set incsearch
set ignorecase
set smartcase

let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox
set background=dark

let mapleader= "\<Space>"
:nnoremap <Space> <nop>

:nnoremap <Leader>c :%s/\s\+$//e <Cr>
:nnoremap <Leader>m :split <Cr>
:nnoremap <Leader>f :Explore <Cr>
:nnoremap <Leader>w :w <Cr>
:nnoremap <Leader>s :source<Space>$MYVIMRC <CR>

:command W w
:command Wq wq
:command Q q
:command WQ wq

autocmd Filetype c inoreab #i #include
autocmd Filetype c inoreab <c <criterion/criterion.h>
autocmd Filetype c inoreab Test Test()<Cr>{<Cr>cr_assert_fail();<Cr>}
autocmd Filetype c inoreab mainv int<Space>main(void)<CR>{<CR><Tab><CR>return 0;<CR>}<ESC>2k3l5xa
autocmd Filetype c inoreab maina int<Space>main(int<Space>argc,<Space>char<Space>*argv[])<CR>{<CR><Tab><CR>return 0;<CR>}<ESC>2k3l5xa

autocmd Filetype make setlocal noexpandtab

autocmd BufRead,BufNewFile *.c,*.h setlocal comments=s:/**,mb:**,ex:*/,s:/*,mb:**,ex:*/

set list listchars=tab:»·,trail:·
" per .git vim configs
" just `git config vim.settings "expandtab sw=4 sts=4"` in a git repository
" change syntax settings for this repository
let git_settings = system("git config --get vim.settings")
if strlen(git_settings)
    exe "set" git_settings
endif

" Syntastic config
" let g:syntastic_always_populate_loc_list=1
" let g:syntastic_auto_loc_list=1
" let g:syntastic_check_on_open=1
" let g:syntastic_check_on_wq=0
"
" let g:syntastic_c_checkers=['gcc', 'make']
" let g:syntastic_c_compiler_options="-Wall -Werror -Wextra -pedantic -std=c99"
" let g:syntastic_c_check_header = 1
" let g:syntastic_shell="/bin/sh"
"
" let g:syntastic_sh_shellcheck_args=["-x"]
" ALE config

let g:ale_fix_on_save=1
let g:ale_lint_on_save=1
let g:ale_lint_on_text_changed=0
let g:ale_parse_makefile=1
let g:ale_completion_enabled=0
let g:ale_c_cc_options="-Wall -Werror -Wextra -pedantic -std=c99"
let g:ale_fixers={
            \ 'c': ['clang-format'],
            \ '*': ['remove_trailing_lines', 'trim_whitespace']
            \ }
" Airline config

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#formatter = 'jsformatter'
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

set path+=,/run/current-system/sw/include,/nix/store/5qjycalzb9sqzvqg65kf5zimqwjabm9g-gcc-10.3.0/lib/gcc/x86_64-unknown-linux-gnu/10.3.0/include,/nix/store/5qjycalzb9sqzvqg65kf5zimqwjabm9g-gcc-10.3.0/include,/nix/store/5qjycalzb9sqzvqg65kf5zimqwjabm9g-gcc-10.3.0/lib/gcc/x86_64-unknown-linux-gnu/10.3.0/include-fixed,/nix/store/9r0a3dipi8saq2zasp668zsk6qhqp5jb-glibc-2.32-48-dev/include

let g:lsc_server_commands = {'c': { 'command': 'clangd', 'suppress_stderr': v:true }, }
let g:lsc_enable_autocomplete = v:true
let g:lsc_auto_map = v:true
