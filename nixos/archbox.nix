{ config, pkgs, ... }:

let
    archbox = pkgs.stdenv.mkDerivation rec {
        name = "archbox";
        src = pkgs.fetchFromGitHub {
            owner = "InnovativeInventor";
            repo = "archbox";
            rev = "6ee4c670effe894d0afc5d99ab98a97f55abdb67";
            sha256 = "17ljjvkp2v2x36wc4fq2n057vdx7jc6r68df616ws87cd99l9hiy";
        };
        sourceRoot = ".";
        installPhase = ''
            mkdir -p $out
            cd source
            export FORCE_INSTALL_CONFIG=1
            export ETC_DIR=$out/etc
            export PREFIX=$out
            export ARCHBOX_USER=max
            export MOUNT_RUN=no
            export ENV_VAR="PATH=/usr/bin:/usr/local/bin"
            export SHARED_FOLDER="/home"
            ${pkgs.bash}/bin/bash install.sh
        '';
    };
in
{
    environment.systemPackages = [ archbox ];
    environment.etc = { 
        "archbox.conf" = { 
            source = "${archbox}/etc/archbox.conf";
        };
    };
}
