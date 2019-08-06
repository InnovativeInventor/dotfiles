set -lx laststatus 2
function fish_user_key_bindings
  fzf_key_bindings
end

set PATH /usr/local/opt/mozjpeg/bin $PATH
set PATH (go env GOPATH)/bin $PATH
set PATH $HOME/exec/bin $PATH
set -gx GOPATH /Users/max/go $GOPATH
set -x GPG_TTY (tty)
set -x SSH_AUTH_SOCK $HOME/.sekey/ssh-agent.ssh
# set -gx PATH /anaconda3/bin $PATH
eval (pipenv --completion)
thefuck --alias fuck | source
thefuck --alias shit | source
thefuck --alias whoops | source

alias vimupdate="env SHELL=(which sh) vim +BundleInstall! +BundleClean +qall"
funcsave vimupdate

# function fish_prompt
#     set prev_PYENV_VERSION $PYENV_VERSION
#     set -x PYENV_VERSION anaconda3-2018.12   
#     /Users/max/.pyenv/shims/powerline-shell --shell bare $status
#     set -x PYENV_VERSION prev_PYENV_VERSION   
# end

function vim
    mvim --servername vim -v $argv
end
funcsave vim

function ls 
    exa --git $argv
end
funcsave ls 

function nano
    mvim -v $argv
end
funcsave nano

function cit
    if count $argv > /dev/null
        cd ~/git; cd $argv
    else
        cd ~/git
    end
end

funcsave cit

function mit
    if count $argv > /dev/null
        cd ~/git; mkdir $argv
    else
        cd ~/git
    end
end

funcsave mit

function fishconfig
    vim ~/.config/fish/Config.fish
end
funcsave fishconfig

status --is-interactive; and source (pyenv init - | psub); and source (pyenv virtualenv-init - | psub)
source ~/.iterm2_shell_integration.fish
