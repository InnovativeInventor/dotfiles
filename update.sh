stow -t $HOME home
mkdir -p $HOME/scripts
stow -t $HOME/scripts scripts
rm -r nixos
cp -r /etc/nixos nixos
