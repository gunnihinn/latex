{ self, stdenv, tex }:

stdenv.mkDerivation rec {
  pname = "journal";
  version = "0.1";
  src = self;

  buildInputs = [ tex ];

  unpackPhase = "true";

  buildPhase = ''
    echo $src
    cd $(mktemp -d) && cp $src/journal/* .
    ls
    ${tex}/bin/latexmk -pdf -f main.tex
  '';

  installPhase = ''
    mkdir -p $out
    cp main.pdf $out/${pname}.pdf
  '';
}
