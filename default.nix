let
  poetry2nixOverlay = builtins.fetchGit {
    ref = "master";
    rev = "78aeb5d8e3460a0d88ddb65e8d54c34d916425ea";
    url = "https://github.com/nix-community/poetry2nix";
  };

  pkgs = import <nixpkgs> {
    overlays = [ (import "${poetry2nixOverlay}/overlay.nix") ];
  };

  inherit (pkgs.poetry2nix) mkPoetryApplication;
in
  mkPoetryApplication {
      projectDir = ./.;
      python = pkgs.python38Full;
  }
