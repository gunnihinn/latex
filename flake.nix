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

        degenerate =
          pkgs.callPackage ./degenerate/default.nix { inherit self tex; };
        grassmannian-bundles =
          pkgs.callPackage ./grassmannian-bundles/default.nix {
            inherit self tex;
          };
        journal = pkgs.callPackage ./journal/default.nix { inherit self tex; };
        kodaira-embedding = pkgs.callPackage ./kodaira-embedding/default.nix {
          inherit self tex;
        };
        nakano-positive =
          pkgs.callPackage ./nakano-positive/default.nix { inherit self tex; };
        sgct = pkgs.callPackage ./sgct/default.nix { inherit self tex; };
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
