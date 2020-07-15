{ pkgs ? import <nixpkgs> {} }:

let
  virtualEnvName = ".venv";
in
pkgs.mkShell {
  name = "py-friends-and-strangers-shell";

  buildInputs = with pkgs; [
    bash
    busybox
    python38Full
  ];

  shellHook = ''
    unset SOURCE_DATE_EPOCH
    export PYTHONPATH="$(pwd)/:$PYTHONPATH"

    if [ ! -d "${virtualEnvName}}" ]; then
      python3 -m venv .venv
    fi

    source ${virtualEnvName}/bin/activate
  '';
}
