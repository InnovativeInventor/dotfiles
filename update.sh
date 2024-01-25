stow -t $HOME home
mkdir -p $HOME/scripts
stow -t $HOME/scripts scripts
cp -r /etc/nixos/* nixos/
