let b:ale_command_wrapper = 'source ~/.bash_profile &&'
let b:ale_fixers = ['isort', 'yapf', 'trim_whitespace']
let g:ale_open_list = 1
let b:ale_linters = ['flake8','mypy','pylint'] " pyls pylint
let g:ale_completion_enabled = 0
set tabstop=4
set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=79
set expandtab
let g:ale_fix_on_save = 1
set autoindent
set fileformat=unix
set encoding=utf-8

let g:kite_tab_complete=1
let g:kite_documentation_continual=0


" As per https://stackoverflow.com/questions/19320747/prevent-vim-from-indenting-line-when-typing-a-colon-in-python#answer-37889460
autocmd FileType python setlocal indentkeys-=<:> 
command Python ! clear; python %
