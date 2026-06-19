{ config, lib, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.kernelParams = [ "1920x1080" ];
  boot.loader = {
   efi = {
    canTouchEfiVariables = true;
   };
   grub = { 
    enable = true;
    device = "nodev";
    efiSupport = true;
    gfxmodeBios = "1920x1080";
    gfxmodeEfi = "1920x1080";
   };
  };
  # networking.hostName = "nixos"; # Define your hostname.
  programs.hyprland = {
    enable = true;
    xwayland.enable = true; 
 };  

  # Configure network connections interactively with nmcli or nmtui.
  networking.networkmanager.enable = true;

  nixpkgs.config.allowUnfree = true;

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
  
    

  # Enable the X11 windowing system.
  # services.xserver.enable = true;


  # Configure keymap in X11
    services.xserver.xkb.layout = "us";
  # services.xserver.xkb.options = "grp:win_space_toggle";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

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
    users.users.test = {
      isNormalUser = true;
      extraGroups = [ "wheel" "networkmanager" ];
    };


  # List packages installed in system profile.
    environment.systemPackages = with pkgs; [
      vim
      htop
      firefox
      home-manager
      git
      kitty
      alacritty
      foot
    ];


  system.stateVersion = "25.11";

}

