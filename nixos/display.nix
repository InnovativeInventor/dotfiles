{ pkgs, ... }:

{
  environment.pathsToLink = [ "/libexec" ]; # from i3 nixos docs

  # Enable the X11 windowing system.
  # services.xserver.enable = true;
  services.xserver = {
    enable = true;

    desktopManager = {
      xfce = {
        enable = true;
        noDesktop = true;
        enableXfwm = false;
      };
      plasma5.enable = false;
      xterm.enable = false;
    };
   
    displayManager = {
        defaultSession = "xfce+dwm";
	# sddm.enable = true; 
        # defaultSession = "xfce+xmonad";
        # sessionCommands = "${pkgs.xmobar}/bin/xmobar";
    };

    windowManager = {
      dwm = {
        enable = true;
        package = pkgs.dwm.overrideAttrs {
	  src = pkgs.fetchFromGitHub {
	    owner = "InnovativeInventor";
	    repo = "dwm";
	    rev = "master";
	    hash = "sha256-Mu19AnnOIBy7lqoUcNA25TjpUtVxH1zlY491xb9PgG0=";
	  };
	};
      };
      xmonad = {
        enable = false;
        enableContribAndExtras = true;
        extraPackages = haskellPackages: [ 
          # pkgs.polybar
          pkgs.xmobar
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

  # Enable the KDE Plasma Desktop Environment.
  # services.xserver.desktopManager.plasma5.enable = true;
  # services.xserver.displayManager.sddm.enable = true;

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
    xkbOptions = "caps:escape";
  };
  
  # Enable touchpad support (enabled default in most desktopManager).
  services.xserver.libinput.enable = true;
  services.xserver.libinput.mouse.naturalScrolling = true;
  services.xserver.libinput.touchpad.naturalScrolling = true;
  services.xserver.libinput.touchpad.disableWhileTyping = true;
  services.xserver.libinput.touchpad.clickMethod = "clickfinger";
}
