{
 programs.bash = {
         enable = true;
         shellAliases = {
                ls = "ls -alh --color=always --group-directories-first";
                rebuild = "sudo nixos-rebuild switch --flake ~/.dotfiles#huawei";
         };
 };
}
