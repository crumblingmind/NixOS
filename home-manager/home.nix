{ config, pkgs, ... }: {

    home = {
      username = "crumblingmind";
      homeDirectory = "/home/crumblingmind";
      stateVersion = "25.11";
    };

    imports = [
      ./modules/git.nix
      ./modules/aliases.nix
    ];       

    home.file.".config/hypr".source = ./config/hypr;

}
