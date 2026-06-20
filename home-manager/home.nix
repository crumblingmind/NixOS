{ config, pkgs, ... }: {

        imports = [
         ./modules/git.nix
         ./modules/aliases.nix
         ./modules/hypr/hyprland.nix
        ];       

        home = {
               username = "test";
               homeDirectory = "/home/test";
               stateVersion = "25.11";
        };

}
