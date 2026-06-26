{
  description = "NixOS flake";

  inputs = {
          nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";          
          zapret-discord-youtube.url = "github:kartavkun/zapret-discord-youtube";          
          home-manager = {
                  url = "github:nix-community/home-manager";
                  inputs.nixpkgs.follows = "nixpkgs";
          };
  };

  outputs = { self, nixpkgs, home-manager, zapret-discord-youtube, ... } @ inputs:
          let
                  system = "x86_64-linux";
                  pkgs = nixpkgs.legacyPackages.${system};
          in {
          nixosConfigurations.huawei = nixpkgs.lib.nixosSystem {
                  inherit system;
                  specialArgs = { inherit inputs; };
                  modules = [ ./configuration.nix
                              zapret-discord-youtube.nixosModules.withTestTools
                              {
                                services.zapret-discord-youtube = {
                                enable = true;
                                configName = "general(ALT3)";
                                gameFilter = "null";
                                listGeneral = [ "youtube.com" ];
                                #listExclude = [];
                                ipsetAll = [ "191.168.1.0/24" "10.0.0.1" ];
                                #ipsetExclude = [];
                                };
                              }
                  ];
          };
          
          homeConfigurations = { 
            crumblingmind = home-manager.lib.homeManagerConfiguration {
                  inherit pkgs;
                 
                  modules = [ ./home-manager/home.nix ];
          }; 

  };
 };
}
