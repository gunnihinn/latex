{ stdenv, tex }:

stdenv.mkDerivation rec {
  pname = "degenerate";
  version = "0.1";

  srcs = [ ./degenerate/main.tex ];

  buildInputs = [ tex ];

  unpackPhase = "true";

  buildPhase = ''
    cd $(mktemp -d) && cp $src main.tex
    latexmk --pdf main.tex
  '';

  installPhase = ''
    mkdir -p $out
    cp main.pdf $out/${pname}.pdf
  '';
}
