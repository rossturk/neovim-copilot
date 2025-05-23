/*
 { neovim, vimPlugins }:

neovim.override {
  configure.packages.myVimPackage = with vimPlugins; {
    start = [ copilot-vim ];
  };
}
*/


{ ... }:
let
  pkgs = import (builtins.fetchTree "github:NixOS/nixpkgs/nixpkgs-unstable") {
    config.allowUnfree = true;
    system = builtins.currentSystem;
  };
in with pkgs;
 neovim.override {
   configure.packages.myVimPackage.start = [ vimPlugins.copilot-vim ];
 }

