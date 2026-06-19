{ pkgs, ... }:

{
 wayland.windowManager.hyprland = {
     enable = true;
  
  settings = {
    "$terminal" = "foot";
    "$fileManager" = "dolphin";
    "$menu" = "hyprlauncher";
    "$mod" = "SUPER";
  
  monitor = [
    ",preffered,auto,1"
  ]; 
  
  "xwayland.force_zero_scaling" = true;
  "render.explicit_sync" = 0;

  bind = [
    "$mod,Q,exec,$terminal"
    "$mod,C,killactive"
    "$mod,M,exit"
    "$mod,E,exec,$fileManager"
    "$mod,V,togglefloating"
    "$mod,R,exec,$menu"
        ];
  };
 };
 home.packages = [ pkgs.foot ];
}
