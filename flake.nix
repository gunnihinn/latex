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
        mkDerivation = pkgs.stdenv.mkDerivation;
        tex = pkgs.texlive.combined.scheme-full;

        degenerate = pkgs.callPackage ./project.nix {
          inherit self tex mkDerivation;
          name = "degenerate";
        };
        grassmannian-bundles = pkgs.callPackage ./project.nix {
          inherit self tex mkDerivation;
          name = "grassmannian-bundles";
        };
        journal = pkgs.callPackage ./project.nix {
          inherit self tex mkDerivation;
          name = "journal";
        };
        kodaira-embedding = pkgs.callPackage ./project.nix {
          inherit self tex mkDerivation;
          name = "kodaira-embedding";
        };
        nakano-positive = pkgs.callPackage ./project.nix {
          inherit self tex mkDerivation;
          name = "nakano-positive";
        };
        sgct = pkgs.callPackage ./project.nix {
          inherit self tex mkDerivation;
          name = "sgct";
        };
      in {
        packages.default = journal;

        packages.degenerate = degenerate;
        packages.grassmannian-bundles = grassmannian-bundles;
        packages.journal = journal;
        packages.kodaira-embedding = kodaira-embedding;
        packages.nakano-positive = nakano-positive;
        packages.sgct = sgct;

        devShell = pkgs.mkShell { buildInputs = [ tex pkgs.zathura ]; };
      });
}
