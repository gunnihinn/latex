# LaTeX projects

These are my various LaTeX projects, in various states of disarray.

## Build

To build the PDF of a project, either:

* `cd` to its directory and run `latexmk -pdf *.tex`

* Install `nix`, enable flakes, run `nix build .#<project-name>`, and see the result in `result`

## Collaborate

I'd be very happy if anyone wanted to collaborate on any of these hair-brained schemes.

## TODO

* Write a Github Action to build each project and write the PDF to an S3 bucket

* Explain what each of these projects is
