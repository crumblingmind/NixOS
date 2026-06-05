{ config, pkgs, ... }: {

        imports = [
          ./modules/aliases.nix
          ./modules/git.nix
        ];       

        home = {
               username = "test";
               homeDirectory = "/home/test";
               stateVersion = "25.11";
        };

}
