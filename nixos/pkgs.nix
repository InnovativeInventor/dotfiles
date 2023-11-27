{ pkgs, ... }:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget

  environment.systemPackages = with pkgs; [
     # zulip-term
     # dmenu
     # xmobar
     # shutter
     # brightnessctl

     neovim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
     vim
     emacs

     wget
     curl
     rsync

     gh
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
     llvmPackages_16.clang-unwrapped

     gnumake
     cmake
     ninja
     mold
     ccache
     sccache

     hyperfine

     borgmatic

     coq
     hugo

     haskell-language-server
     haskellPackages.hoogle

     nixfmt
     black
     isort
     dockfmt
     clj-kondo

     nerdfonts
  ];
}
