{ inputs, outputs, config, lib, pkgs, ... }:

{
  imports =
  [ # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];


  /* --- EXPERIMENTAL_FEATURES --- */
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
    

  /* --- BOOTLOADER --- */
  boot.loader = {
    grub = {
      enable = true;
      efiSupport = true;
      device = "nodev";
      useOSProber = false;
    };
    efi = {
      efiSysMountPoint = "/boot/efi";
      canTouchEfiVariables = true;
    };
  };


  /* --- NETWORKING_AND_HOSTNAME --- */
  networking = {
    hostName = "tsuki";
    networkmanager.enable = true;
    firewall.enable = true;
  };


  /* --- USERS --- */
  users.users.vaayuu = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "audio" ]; # Enable ‘sudo’ for the user.
    shell = pkgs.zsh;
    packages = with pkgs; [
      tree
    ];
  };


  /* --- UNFREE_PACKAGES --- */
  nixpkgs.config.allowUnfree = true;


  /* --- TIMEZONE --- */ 
  time.timeZone = "Asia/Kolkata";


  /* --- X11_settings --- */
  services = {
    xserver = {
      enable = true;
      videoDrivers = [ "modesetting" ];
      xkb.layout = "us";
      excludePackages = [ pkgs.xterm ];
    };
  };


  /* --- POLKIT --- */ 
  security.polkit.enable = true;


  /* --- INPUT_SERVICES --- */
  services = {
    libinput = {
      enable = true;
      touchpad = {
	tapping = true;
	middleEmulation = true;
	naturalScrolling = true;
      };
    };
  };

    
  /* --- AUDIO_SERVICES_AND_PROCESS_HANDLER --- */
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };


  /* --- OPENSSH_DAEMON --- */
  services.openssh.enable = true;


  /* --- MOUNT_DEVICE_DETECTION --- */
  services = {
    gvfs.enable = true;
    udisks2.enable = true;
  };


  /* --- GRAPHICS_DRIVERS --- */
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver
      vaapiVdpau
      libvdpau-va-gl
    ];
  };
  

  virtualisation = {
    containers.enable = true;
    podman.enable = true;
  };


  /* --- SYSTEM_PROGRAMS --- */
  # HYPRLAND
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
    ];
  };



    /*
    # SDDM
    services.displayManager.sddm = {
	enable = true;
	wayland.enable = true;
    };
    */
  services.displayManager.ly.enable = true;

  # ZSH
  programs.zsh.enable = true;

  # FIREFOX
  programs.firefox.enable = true;

  # STEAM_AND_GAMEMODE
  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
  };
  programs.gamemode.enable = true;


  /* --- SESSION_VARIABLES --- */
  # Steam
  environment.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "/home/vaayuu/.steam/root/compatibilitytools.d";
  };


  /* --- SYSTEM_PACKAGES --- */
  environment.systemPackages = with pkgs; [
    brightnessctl
    hyprland
    neovim                    
    wget
    git
    fastfetch
    wl-clipboard
    wlogout
    wlsunset
    kitty
    btop
    rofi-wayland
    waybar
    mangohud
    protonup
    nautilus
    file-roller
    pavucontrol
    unrar
    gnutar
    p7zip
    zsh
    zip 
    unzip
    gvfs
    udiskie
    udisks2
    starship
    swww
    mesa
    vulkan-loader
    vulkan-tools
    vulkan-validation-layers
    libva
    lxqt.lxqt-policykit
    ffmpegthumbnailer
    distrobox
    podman-tui
  ];
  
  
  /* --- FONT_PACKAGES --- */
  fonts.packages = with pkgs; [
    nerd-fonts.iosevka
    noto-fonts
    noto-fonts-emoji
    fontconfig
    liberation_ttf
    font-awesome
  ];


  /* --- STATE_VERSION --- */
  system.stateVersion = "24.11"; 
}

