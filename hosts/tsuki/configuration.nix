{ inputs, outputs, config, lib, pkgs, ... }:

{
  imports =
  [ # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];


  /* --- EXPERIMENTAL_FEATURES --- */
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  nix = {
  	settings = {
	  auto-optimise-store = true;
	  warn-dirty = false;
	};
	optimise.automatic = true;
  };


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
	  file
    ];
  };



  /* --- UNFREE_PACKAGES --- */
  nixpkgs.config.allowUnfree = true;


  /* --- TIMEZONE --- */ 
  time.timeZone = "Asia/Kolkata";


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
      libva-vdpau-driver
      libvdpau-va-gl
    ];
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


  /* --- SQL --- */
  services.mysql = {
  	enable = true;
		package = pkgs.mariadb;
  };

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
	hyprlock
    brightnessctl
    playerctl
    neovim    
    wget
    git
    fastfetch
    wl-clipboard
    wlsunset
    btop
    rofi
	fuzzel
    waybar
    gnome-clocks
    mangohud
    protonup-ng
	
    #file-manager
    thunar
    thunar-archive-plugin
    thunar-media-tags-plugin
    tumbler

    libnotify
    file-roller
    pavucontrol
    unrar
    gnutar
    p7zip
    zip 
    unzip
    gvfs
    udiskie
    udisks2
    swww
    mesa
    mesa-demos
    vulkan-loader
    vulkan-tools
    vulkan-validation-layers
    libva
    lxqt.lxqt-policykit

    (discord.override {
	withVencord = true;
    })

    # UI
    eww

    # Man pages
    man
    man-pages
    man-pages-posix
  ];
  
  
  /* --- FONT_PACKAGES --- */
  fonts.packages = with pkgs; [
    nerd-fonts.iosevka
    nerd-fonts.symbols-only
    noto-fonts
    noto-fonts-color-emoji
    fontconfig
    liberation_ttf
    noto-fonts-cjk-serif
    noto-fonts-cjk-sans
    font-awesome
  ];


  /* --- STATE_VERSION --- */
  system.stateVersion = "24.11"; 
}

