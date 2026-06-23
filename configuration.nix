{ config, lib, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

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
 
  nix.settings.substituters = [
  #  "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
    "https://cache.nixos.org/"
  ];  
 
  networking.hostName = "huawei"; # Define your hostname.  

  # Configure network connections interactively with nmcli or nmtui.
  networking.networkmanager.enable = true;

  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ]; 

  #services.cloudflare-warp.enable = true; 
 
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
      
  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;
    xkb.layout = "us,ru";
    xkbVariant = "";
    xkbOptions = "grp:win_space_toggle";
    desktopManager = {
      xfce.enable = true;
    };
    displayManager.defaultSession = "xfce";
  };  

  # Configure keymap in X11
  #  services.xserver.xkb.layout = "us";
  # services.xserver.xkb.options = "grp:win_space_toggle";

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

    nixpkgs.config.permittedInsecurePackages = [
      "electron-39.8.10"
    ];

  # List packages installed in system profile.
    environment.systemPackages = with pkgs; [
      vim
      htop
      firefox
      home-manager
      git
      cloudflare-warp
      bitwarden-desktop
    ];


    system.stateVersion = "25.11";

}

