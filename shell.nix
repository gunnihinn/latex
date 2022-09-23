{ pkgs ? import <nixpkgs> { } }:

pkgs.mkShell {
  buildInputs = with pkgs; [ zathura mupdf texlive.combined.scheme-full ];
}
