{
  description = "Neovim with copilot.vim extension included";

  inputs = { nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable"; };

  outputs = { self, nixpkgs }: {
    packages = builtins.mapAttrs (system: pkgs:
      let
        pkgs = import nixpkgs {
          config.allowUnfree = true;
          system = system;
        };
      in rec {
        default = neovim-copilot;
        neovim-copilot = pkgs.neovim.override {
          configure.packages.myVimPackage = with pkgs.vimPlugins; {
            start = [ copilot-vim ];
          };
        };
      }) nixpkgs.legacyPackages;
  };
}
