# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./display.nix
      ./pkgs.nix
      ./pkgs-linux.nix
    ];

  # Bootloader.
  boot.kernelPackages = pkgs.linuxPackages_6_6;
  boot.kernelParams = [
    "mitigations=off"
    "nvme.noacpi=1" 
  ];
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";

  networking.hostName = "nixos"; # Define your hostname.
  networking.nameservers = [ "1.1.1.1" "9.9.9.9" ];
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  # networking.networkmanager.enable = true;

  networking.wireless.environmentFile = "/home/max/.secrets/wireless.env";
  networking.wireless.enable = true;
  networking.wireless.networks = {
    "Network 5G".auth = "@Network_5G_AUTH@";
    IllinoisNet.auth = "@IllinoisNet_AUTH@";
    IllinoisNet.priority = 10;
    Eduroam.auth = "@Eduroam_AUTH@";
    "Big Goose".auth = "@Big_Goose_AUTH@";

    # Olaliving.auth = "@Olaliving_AUTH@";
    "Home Sweet Home".auth = "@Home_Sweet_Home_AUTH@";
    "BREWLAB".auth = "@BREWLAB_AUTH@";
    "Avionics-Page 5".auth = "@Avionics_AUTH@";
    "coach 235".auth = "@Coach_235_AUTH@";
  };

  # Set your time zone.
  time.timeZone = "America/Chicago";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  environment.variables = {
    EDITOR = "nvim";
    BROWSER = "firefox";
    TERMINAL = "alacritty";
    TZ = "/etc/localtime";
  };

  # Enable CUPS to print documents.
  services.printing.enable = false;  # who needs printing, anyways

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  users.groups.video = {
    members = [ "max" ];
  };

  users.groups.wheel = {
    members = [ "max" ];
  };

  users.groups.docker = {
    members = [ "max" ];
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.max = {
    isNormalUser = true;
    description = "max";
    extraGroups = [ "networkmanager" "wheel" "video" "docker" "lxd" "vboxusers"];
    packages = with pkgs; [
      firefox-bin
      discord
      zotero
      kate
      zoom-us
      element-desktop
      slack
      zulip
      chromium
      google-chrome
    #  gmpxx
    #  thunderbird
    ];
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;
  services.borgmatic = {
    enable = true;
    settings = {
      location = {
        source_directories = [
          "/home"
          "/etc"
        ];
        repositories = [
          "ssh://de1007@de1007.rsync.net/./backups/nix-laptop.borg"
        ];
      };
      retention = {
        keep_within = "1 w";     # one week
        keep_hourly = 750;     # ~one month
        keep_daily = 365;      # ~one year
        keep_weekly = 365000;  # a very long time 
        keep_monthly = 365000; # a very very long time
      };
      storage = {
        encryption_passphrase = import /home/max/.secrets/borg.nix;
        ssh_command = "ssh -i /home/max/.ssh/id_rsa";
      };
      hooks.healthchecks.ping_url = import /home/max/.secrets/healthchecks.nix;
    };
  };
  services.fprintd.enable = true;
  services.tlp = {
    enable = false; # disabled for plasma ugh
    settings = {
      CPU_SCALING_GOVERNOR_ON_BAT="powersave";
      CPU_SCALING_GOVERNOR_ON_AC="performance";
      CPU_ENERGY_PERF_POLICY_ON_AC="performance";
      CPU_ENERGY_PERF_POLICY_ON_BAT="balance_power";

      # The following prevents the battery from charging fully to
      # preserve lifetime. Run `tlp fullcharge` to temporarily force
      # full charge.
      # https://linrunner.de/tlp/faq/battery.html#how-to-choose-good-battery-charge-thresholds
      START_CHARGE_THRESH_BAT0=50;
      STOP_CHARGE_THRESH_BAT0=80;

      # 100 being the maximum, limit the speed of my CPU to reduce
      # heat and increase battery usage:
      CPU_MAX_PERF_ON_AC=100;
      CPU_MAX_PERF_ON_BAT=80;
      CPU_BOOST_ON_AC=1;
      CPU_BOOST_ON_BAT=0;

      PLATFORM_PROFILE_ON_AC="performance";
      PLATFORM_PROFILE_ON_BAT="low-power";
    };
  };
  # services.auto-cpufreq.enable = true;
  # services.auto-cpufreq = {
  #   enable = true;
  #   settings = {
  #     battery = {
  #        governor = "powersave";
  #        turbo = "never";
  #     };
  #     charger = {
  #        governor = "performance";
  #        turbo = "auto";
  #     };
  #   };
  # };

  services.tailscale = {
    enable = false;
    extraUpFlags = [ "--ssh" "--advertise-connector" "--advertise-tags=tag:illinois" "--advertise-exit-node" "--exit-node=100.94.214.33" ];
    useRoutingFeatures = "both";
  };
  services.blueman.enable = true;
  services.udev = {
    enable = true;
    extraRules = with pkgs; "
      SUBSYSTEM==\"backlight\",
      ACTION==\"add\", RUN+=\"${coreutils}/bin/chgrp video /sys/class/backlight/%k/brightness\",
      RUN+=\"${coreutils}/bin/chmod g+w /sys/class/backlight/%k/brightness\"";
  };
  # services.gnome3.at-spi2-core.enable = true;

  virtualisation.docker.enable = true;
  virtualisation.virtualbox.host.enable = true;
  virtualisation.lxd.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.checkReversePath = "loose";
  networking.firewall.enable = false;

  nix.settings.experimental-features = "nix-command flakes";
  # nix.settings.substituers = [
  #   https://cache.nixos.org/
  #   https://cache.iog.io
  # ];

  # systemd.services.xmobar = {
  #   enable = true;
  #   description = "xmobar start on login";
  #   serviceConfig.PassEnviroment = "DISPLAY";
  #   script = "${pkgs.xmobar}/bin/xmobar";
  #   wantedBy = [ "display-manager.sserver" , "multi-user.target" ];
  # };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.11"; # Did you read the comment?

}
