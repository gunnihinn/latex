{ pkgs ? import <nixpkgs> { } }:

let
  tex = pkgs.texlive.combine {
    inherit (pkgs.texlive) scheme-medium capt-of wrapfig tikz-cd ntheorem;
  };

in pkgs.mkShell {

  buildInputs = [
    tex
    pkgs.zathura # djvu viewer
    pkgs.mupdf
  ];
}
