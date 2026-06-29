{ config, pkgs, ... }: {

    home = {
      username = "crumblingmind";
      homeDirectory = "/home/crumblingmind";
      stateVersion = "25.11";
    };

    nixpkgs = {
        config = {
          allowUnfree = true;
          permittedInsecurePackages = [
                "electron-39.8.10"
          ];
        };
    };

    home.packages = with pkgs;  [
      firefox
      vivaldi
      discord
      bitwarden-desktop
    ];    

    imports = [
      ./modules/git.nix
      ./modules/aliases.nix
    ];       

    home.file.".config/hypr".source = ./config/hypr;
    home.file.".config/waybar".source = ./config/waybar;
}
