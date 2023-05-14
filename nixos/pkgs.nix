{ pkgs, ... }:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget

  environment.systemPackages = with pkgs; [
     zulip-term
     dmenu
     xmobar
     shutter
     # brightnessctl
     acpilight

     fprintd
     intel-media-driver
     intel-gpu-tools

     powertop
     tlp

     neovim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
     vim
     emacs

     wget
     curl
     rsync

     git
     git-cinnabar
     mercurialFull
     darcs
     pijul

     diff-so-fancy
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
     gcc_latest
     llvm

     gnumake
     cmake
     ninja
     mold
     ccache
     sccache
     pkg-config
     libiconv

     util-linux
     libuuid

     perf-tools
     valgrind
     qcachegrind
     hyperfine

     borgmatic

     fuse3
     coq

     gtk3

     xorg.xcbutil
  ];
}
