{
  description = "LaTeX setup";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
        tex = pkgs.texlive.combined.scheme-full;

        sgct = pkgs.callPackage ./sgct/default.nix { inherit tex; };
      in {
        packages.default = sgct;

        packages.sgct = sgct;

        devShell = pkgs.mkShell { buildInputs = [ tex pkgs.zathura ]; };
      });
}
