{
  description = "emacs shell (with doom)";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };

  outputs = { self, nixpkgs, ... }:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };
    emacs = pkgs.emacs29;
    emacsdir = "$(pwd)";
    doomdir = "$(pwd)/doom";
    doomlocaldir = "$EMACSDIR/.local";
  in
  {
    devShells.${system}.default = pkgs.mkShell {
      buildInputs = with pkgs; [ 
        git 
	emacs29 
	(ripgrep.override {withPCRE2 = true;})
      ];
      srcs = [ 
        ./doom
	(pkgs.fetchFromGitHub {
	  owner = "doomemacs";
	  repo = "doomemacs";
	  rev = "95e3491c3b65a753fab4612c01a1fc68acf0402d";
	  sha256 = "sha256-6qZ3oTv8m7qDfPRLGRWJw2N8O01uzipwuRvs8WsonKY=";
	})
      ];
      sourceRoot = ".";
      installPhase = ''
        # cp -r ./doom /doom
        # git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.config/emacs
	# ~/.config/emacs/bin/doom install
	# doom sync
      '';
      shellHook = ''
      '';
    };
  };
}
