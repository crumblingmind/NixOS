{ config, lib, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      inputs.home-manager.nixosModules.home-manager
    ];
  
  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      crumblingmind = import ./home-manager/home.nix;
    };
  };  
  
  # Use the systemd-boot EFI boot loader.
  boot.loader = {
   efi = {
    canTouchEfiVariables = true;
   };
   grub = { 
     enable = true;
     device = "nodev";
     efiSupport = true;
     useOSProber = true;
   };
  };

  services.cloudflare-warp.enable = true; 

  # Enable Hyprland
  programs.hyprland = {
       enable = true;
       xwayland = {
          enable = true;
       };  
  };
 
  # Network.
  networking.hostName = "huawei";
  networking.networkmanager.enable = true;  

  
  nixpkgs.config.allowUnfree = true;

  # Enable Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];  
 
  # Set your time zone.
  time.timeZone = "Europe/Moscow";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
    i18n.defaultLocale = "en_US.UTF-8";
    console = {
      font = "Lat2-Terminus16";
      keyMap = "us";
    # useXkbConfig = true;
    };
      
  # Enable Plasma.
  services = {
    desktopManager.plasma6.enable = true;
    displayManager.plasma-login-manager.enable = true;
  };  

  # Configure keymap in X11
  services.xserver = {
    enable = true;
    xkb.layout = "us,ru";
    xkb.variant = "";
    xkb.options = "grp:win_space_toggle";
  };

  # Enable sound.
  # services.pulseaudio.enable = true;
  # OR
  # services.pipewire = {
  #   enable = true;
  #   pulse.enable = true;
  # };

  # Enable touchpad support.
    services.libinput.enable = true;

  # Define a user account.
    users.users.crumblingmind = {
      isNormalUser = true;
      extraGroups = [ "wheel" "networkmanager" ];
    };

  # List packages installed in system profile.
    environment.systemPackages = with pkgs; [
      vim
      btop
      home-manager
      git
      cloudflare-warp
      fastfetch
      kitty
      rofi
      tree
      waybar
    ];

    system.stateVersion = "25.11";

}

