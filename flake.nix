{
  description = "Flake for CirNo. 1";

  inputs = {
    nixpkgs = {
      url = "github:NixOs/nixpkgs/nixos-unstable";
    };
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{
    self,
    nixpkgs,
    home-manager,
    nix,
    ...
  }: {
    nixosConfigurations = {
      cirno = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.lynn = { pkgs, ... }: {
              home.username = "lynn";
              home.homeDirectory = "/home/lynn";
              programs.home-manager.enable = true;
              home.packages = with pkgs; [
                firefox
                librewolf
                prismlauncher
                
              ];

              programs.git = {
                enable = true;
                userName = "Scotland Dobson";
                userEmail = "scotlanddobson@gmail.com";
                lfs.enable = true;
              };

              programs.zoxide = {
                enable = true;
                enableBashIntegration = true;
              };

              programs.atuin = {
                enable = true;
                enableBashIntegration = true;
              };

       #  programs.direnv = {
       #   enable = true;
       #   enableBashIntegration = true;
       #   nix-direnv.enable = true;
       # };

#        home.file.".emacs.d" = {
#          source = ./emacs/.emacs.d;
#          recursive = true;
#        };

              programs.bash.enable = true;

              home.stateVersion = "23.11";
            };
          }
        ];
      };
    };
  };
}
