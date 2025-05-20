{ inputs, outputs, config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Enable Nix Flakes 
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Use the GRUB-boot EFI boot loader.
  boot.loader.grub = {
    enable = true;
    efiSupport = true;
    device = "nodev";
    efiInstallAsRemovable = false;
    useOSProber = true;
  };
  boot.loader.efi = {
    efiSysMountPoint = "/boot/efi";
    canTouchEfiVariables = true;
  };

  # Networking and hostname
  networking.hostName = "tsuki";
  networking = {
    networkmanager.enable = true;
    firewall.enable = true;
  };

  # Set your time zone.
  time.timeZone = "Asia/Kolkata";

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkb.options in tty.
  # };

  # Enable the X11 windowing system.
  services = {
    xserver = {
      enable = true;
      videoDrivers = [ "modesetting" ];
    };
    libinput = {
      enable = true;
      touchpad = {
        tapping = true;
	      middleEmulation = true;
	      naturalScrolling = true;
      };
    };
    gvfs.enable = true;
    udisks2.enable = true;
  };

  hardware.graphics = {
    enable = true;
  };

  hardware.graphics.extraPackages = with pkgs; [
    intel-media-driver
    vaapiVdpau
    libvdpau-va-gl
  ];

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

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };

  # Configure keymap in X11
  services.xserver.xkb.layout = "us";

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  # Overlays

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.vaayuu = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "audio" ]; # Enable ‘sudo’ for the user.
    shell = pkgs.zsh;
    packages = with pkgs; [
      tree
    ];
  };

  # Unfree pkgs 
  nixpkgs.config.allowUnfree = true;
   
  # Programs 
  programs.zsh.enable = true;
  programs.firefox.enable = true;
  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
  };
  programs.gamemode.enable = true;

  # EnvironmentSession Variables
  # Steam
  environment.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "/home/vaayuu/.steam/root/compatibilitytools.d";
  };

  #System Packages
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
    zip 
    unzip
    gvfs
    udiskie
    udisks2
    zsh
    swww
    mesa
    vulkan-loader
    vulkan-tools
    vulkan-validation-layers
    libva
  ];
  
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    font-awesome
  ];

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "24.11"; # Did you read the comment?

}

