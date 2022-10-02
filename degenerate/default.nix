{ self, stdenv, tex }:

stdenv.mkDerivation rec {
  pname = "degenerate";
  version = "0.1";
  src = self;

  buildInputs = [ tex ];

  unpackPhase = "true";

  buildPhase = ''
    cd $(mktemp -d) && cp $src/degenerate .
    ${tex}/bin/latexmk -pdf -f main.tex
  '';

  installPhase = ''
    mkdir -p $out
    cp main.pdf $out/${pname}.pdf
  '';
}
