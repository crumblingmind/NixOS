{ pkgs, ...  }:

{
 wayland.windowManager.hyprland = {
  enable = true;
 
  settings = {

  monitor = [
    ",1920x1080,auto,1"
  ];

  "$terminal" = "foot";
  "$fileManager" = "dolphin";
  "$menu" = "hyprlauncher";

  "$mainMod" = "SUPER";

  bind = [	
    "$mainMod,Q,exec,$terminal"
    "$mainMod,C,killactive,"
    "$mainMod,M,exit"
    "$mainMod,E,exec,$fileManager"
    "$mainMod,V,togglefloating,"
    "$mainMod,R,exec,$menu"
       ];
   };
 };
 xdg.configFile."hypr/hyprland.conf".force = true;
}
