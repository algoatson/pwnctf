{ pkgs ? import <nixpkgs> { system = builtins.currentSystem; }
, lib ? pkgs.lib
, fetchgit ? pkgs.fetchgit
, stdenv ? pkgs.stdenv
}:

stdenv.mkDerivation rec {
  pname = "pwnctf";
  version = "1.0";

  src = fetchgit {
    url = "https://github.com/sajjadium/ctf-archives";
    sha256 = "1qjzqrpf7yrlv8jybkq64j1x2lp30aiqsb1mh77jv4qjd05mylix";
  };

  buildPhase = ''
    mkdir -p $out
    cd $src
    find . -type d -name "pwn" -exec cp -r {}/* $out/ \;
  '';

}
