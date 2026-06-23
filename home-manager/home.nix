{ config, pkgs, ... }: {

        imports = [
         ./modules/git.nix
         ./modules/aliases.nix
        ];       

        home = {
               username = "crumblingmind";
               homeDirectory = "/home/crumblingmind";
               stateVersion = "25.11";
        };

}
