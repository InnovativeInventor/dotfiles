"autocmd FileType python nnoremap <F12>: ! python3 %:p
set tabstop=4
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
let g:kite_tab_complete=1 " perhaps add this to .vimrc
set encoding=utf-8

setlocal spell

"let python_highlight_all=1
"let b:ale_command_wrapper = 'source ~/.bash_profile &&'
"let b:ale_fixers = ['isort', 'yapf', 'trim_whitespace']
"let g:ale_open_list = 1
"let b:ale_linters = ['flake8','mypy','pylint'] " pyls pylint
"let g:ale_completion_enabled = 0
""setlocal textwidth=79
"let g:ale_fix_on_save = 1
"set fileformat=unix

"" As per https://stackoverflow.com/questions/19320747/prevent-vim-from-indenting-line-when-typing-a-colon-in-python#answer-37889460
"autocmd FileType python setlocal indentkeys-=<:>
"" command Python ! clear; python %
"set completeopt-=preview
