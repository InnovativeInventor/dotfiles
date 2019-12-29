set nocompatible              " be iMproved, required
set shell=/bin/bash

filetype on                  " required

set path+=**
set wildmenu

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Trying to install Coquille
Plugin 'the-lambda-church/coquille'

"Plugin 'wakatime/vim-wakatime'
Plugin 'junegunn/fzf'
"Plugin 'zxqfl/tabnine-vim'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-surround'
Plugin 'airblade/vim-gitgutter'
Plugin 'itchyny/lightline.vim'
Plugin 'scrooloose/nerdtree'
"Plugin 'floobits/floobits-neovim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'bitc/vim-hdevtools'
Plugin 'w0rp/ale'
Plugin 'vimwiki/vimwiki'
Plugin 'guns/vim-clojure-static'
Plugin 'tpope/vim-fireplace'
Plugin 'tpope/vim-classpath'
Plugin 'mattn/emmet-vim'
Plugin 'scrooloose/nerdcommenter'
" Plugin 'FredKSchott/CoVim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
" Bundle 'Valloric/YouCompleteMe'
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'tpope/vim-fugitive'
Plugin 'fatih/vim-go'

Plugin 'guns/vim-sexp'
Plugin 'tpope/vim-sexp-mappings-for-regular-people'
Plugin 'luochen1990/rainbow'
Plugin 'tpope/vim-salve'
Plugin 'leanprover/lean.vim'

" Track the engine.
Plugin 'sirver/ultisnips'
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
let g:UltiSnipsSnippetsDir="/Users/max/.vim/snips"
let g:UltiSnipsSnippetDirectories=["/Users/max/.vim/snips", "/Users/max/.vim/UltiSnips", "snips", "UltiSnips"]
"let g:UltiSnipsSnippetDirectories=["UltiSnips"]
"let g:UltiSnipsSnippetsDir="~/.vim/UltiSnips"
"let g:UltiSnipsSnippetDirectories=[g:UltiSnipsSnippetsDir]
set runtimepath+=/Users/max/.vim/ultisnips_rep
set runtimepath+=$GOROOT/misc/vim


Plugin 'lervag/vimtex'
Plugin 'KeitaNakamura/tex-conceal.vim'
"let g:tex_flavor='latex'
let g:vimtex_view_method='skim'
"let g:vimtex_quickfix_mode=0
set conceallevel=2
let g:tex_conceal='abdmg'

" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
let g:ale_command_wrapper = "source ~/.bash_profile"
let g:ale_list_window_size = 3
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1
autocmd QuitPre * if empty(&bt) | lclose | endif


set guifont=Inconsolata\ for\ Powerline:h15
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set term=xterm-256color
set termencoding=utf-8
set laststatus=2

if has("gui_running")
   let s:uname = system("uname")
   if s:uname == "Darwin\n"
      set guifont=Inconsolata\ for\ Powerline:h15
   endif
endif

map - :NERDTreeToggle<CR>

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable folding
"set foldmethod=indent
"set foldlevel=99
"" Enable folding with the spacebar
"nnoremap <leader>h za
nnoremap <expr> <C-F> &foldlevel ? 'zM' :'zR'
nnoremap <c-j> <c-e>
nnoremap <c-k> <c-y>

" Settings for LaTeX

" Settings for Typescript

" let g:ycm_autoclose_preview_window_after_completion=1
"map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

"au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
"autocmd BufNewFile,BufRead *.go set ft=golang
map <F12> : ! python3 %:p <CR>
map <F11> : ! cd '%:p:h' && pytest --cov-report term --cov-report term --cov-report term-missing --cov=./ --cov-config=.coveragerc <CR>

let mapleader=" "


" Formatting settings
set nu
syntax on
set tabstop=4
set shiftwidth=4
set expandtab
set nospell
set spelllang=en
set spellfile=~/git/dict4schools/spell/uncensored/en.utf-8.add
hi SpellBad ctermfg=000 guifg=#222222
exec 'silent mkspell! ' &spellfile
let g:vimwiki_list = [{'path': '~/vimwiki/',
                       \ 'syntax': 'markdown', 'ext': '.md'}]

" ==================== Vim-go ====================
let g:go_fmt_fail_silently = 0
let g:go_fmt_command = "goimports"
let g:go_autodetect_gopath = 1
let g:go_term_enabled = 1
let g:go_snippet_engine = "neosnippet"
let g:go_highlight_space_tab_error = 0
let g:go_highlight_array_whitespace_error = 0
let g:go_highlight_trailing_whitespace_error = 0
let g:go_highlight_extra_types = 0
let g:go_highlight_operators = 0
let g:go_highlight_build_constraints = 1
let g:go_fmt_autosave = 1
