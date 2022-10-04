{ self, mkDerivation, tex, name, version ? "0.1" }:

mkDerivation {
  pname = "${name}";
  version = "${version}";
  src = self;

  buildInputs = [ tex ];

  unpackPhase = "true";

  buildPhase = ''
    cd $(mktemp -d) && cp $src/${name}/* .
    ${tex}/bin/latexmk -pdf -f main.tex
  '';

  installPhase = ''
    mkdir -p $out
    cp main.pdf $out/${name}.pdf
    chmod 664 $out/${name}.pdf
  '';
}
