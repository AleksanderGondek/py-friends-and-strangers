{ pkgs ? import <nixpkgs> {} }:

let
  virtualEnvName = ".venv";
in
pkgs.mkShell {
  name = "py-friends-and-strangers-shell";

  buildInputs = with pkgs; [
    bash
    busybox
    (
      (
        python38Full.withPackages(ps : with ps; [ 
          poetry 
        ])
      ).override(args: { ignoreCollisions = true; })
    )
  ];

  shellHook = ''
    unset SOURCE_DATE_EPOCH
  '';
}
