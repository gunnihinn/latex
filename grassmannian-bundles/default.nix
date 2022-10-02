{ stdenv, tex }:

stdenv.mkDerivation rec {
  pname = "grassmannian-bundles";
  version = "0.1";

  srcs = [ ./grassmannian-bundles/main.tex ./grassmannian-bundles/main.bib ];

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
