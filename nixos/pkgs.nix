{ pkgs, ... }:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget

  environment.systemPackages = with pkgs; [
     neovim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
     vim
     emacs

     wget
     curl
     rsync

     diff-so-fancy
     git
     alacritty
     tmux
     starship
     fzf
     fd
     btop
     stow
     ripgrep

     rustup
     opam
     python3

     powertop
     tlp

     fprintd
     intel-media-driver
     intel-gpu-tools

     perf-tools
     valgrind
     qcachegrind
     hyperfine
     
     dmenu
     # brightnessctl
     acpilight
  ];
}
