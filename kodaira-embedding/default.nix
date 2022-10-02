{ self, stdenv, tex }:

stdenv.mkDerivation rec {
  pname = "kodaira-embedding";
  version = "0.1";
  src = self;

  srcs = [ ./main.tex ];

  buildInputs = [ tex ];

  unpackPhase = "true";

  buildPhase = ''
    cd $(mktemp -d) && cp $src/kodaira-embedding .
    ${tex}/bin/latexmk -pdf -f main.tex
  '';

  installPhase = ''
    mkdir -p $out
    cp main.pdf $out/${pname}.pdf
  '';
}
