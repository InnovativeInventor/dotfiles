{ pkgs, ... }:

{
  environment.pathsToLink = [ "/libexec" ]; # from i3 nixos docs

  services.xserver = {
    enable = true;

    desktopManager = {
      xterm.enable = false;
      xfce = {
        enable = true;
        noDesktop = true;
        enableXfwm = false;
      };
    };
   
    displayManager = {
        defaultSession = "xfce+xmonad";
        # setupCommands = "${pkgs.xmobar}/bin/xmobar";
    };

    windowManager = {
      xmonad = {
        enable = true;
        enableContribAndExtras = true;
        extraPackages = haskellPackages: [ 
          # pkgs.polybar
          haskellPackages.xmobar
          # haskellPackages.dzen
        ];
      };
      i3 = {
        enable = false;
        extraPackages = with pkgs; [
          dmenu #application launcher most people use
          i3status # gives you the default i3 status bar
          i3lock #default i3 screen locker
       ];
      };
    };
  };

  # Enable the X11 windowing system.
  # services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  # services.xserver.displayManager.sddm.enable = true;
  # services.xserver.desktopManager.plasma5.enable = true;

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
    xkbOptions = "caps:swapescape";
  };
  
  # Enable touchpad support (enabled default in most desktopManager).
  services.xserver.libinput.enable = true;
  services.xserver.libinput.touchpad.naturalScrolling = true;
  services.xserver.libinput.touchpad.disableWhileTyping = true;
  services.xserver.libinput.touchpad.clickMethod = "clickfinger";
}
