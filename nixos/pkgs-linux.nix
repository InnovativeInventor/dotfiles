{ pkgs, ... }:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget

  environment.systemPackages = with pkgs; [
     util-linux
     perf-tools

     fuse3

     valgrind # broken for macOS on M1/2
     qcachegrind

     # preference stuff
     xmobar
     xorg.xcbutil
     gtk3
     dmenu
     shutter

     acpilight
     fprintd

     powertop
     tlp

     intel-media-driver # hardware
     intel-gpu-tools

     # testing
     libiconv
     pkg-config
     libuuid
     x11docker
     auto-cpufreq

     pulseaudioFull
  ];
}
