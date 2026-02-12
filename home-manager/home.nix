{ inputs, pkgs, ... } :

{
  home.username = "vaayuu";
  home.homeDirectory = "/home/vaayuu";
  home.stateVersion = "25.11";
  
  programs.home-manager.enable = true;
  
  home.packages = with pkgs; [
    bat 
    vivaldi
	floorp-bin
	imv
    brave
	element
	element-desktop
	assetripper

    # Gaming
    heroic
	
	

    libwebp
    obsidian
    mpv
    zathura
    papirus-icon-theme
    gruvbox-gtk-theme
    gearlever
    grim
    slurp
		#kdePackages.kdenlive
    mako
    era
		#openutau	
    protonvpn-gui
    librewolf
    foot

	colloid-icon-theme
	openzone-cursors

	
	
  # --- Dev-tools --- 
	dotnetCorePackages.sdk_9_0_1xx
	vscodium
    godot-mono
	godot
    tmux
    gcc15
    python314
    gnumake
    cmake
    pkg-config
    lua
    dbeaver-bin
  ];

  home.pointerCursor = {
    gtk.enable = true;
    name = "OpenZone_Black";
    package = pkgs.openzone-cursors;
    size = 24;
  };

  qt.enable = true;
  qt.platformTheme.name = "gtk";

  gtk = {
    enable = true;
    theme = {
      name = "Gruvbox-Dark";
      package = pkgs.gruvbox-gtk-theme;
    };

    iconTheme = {
      name = "Colloid-Dark";
      package = pkgs.colloid-icon-theme;
    };

    cursorTheme = {
      name = "OpenZone_Black";
      package = pkgs.openzone-cursors;
    };
  };

  home.sessionVariables = {
    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_DESKTOP = "Hyprland";
    GDK_BACKEND = "wayland,x11";
  };
  
  imports = [
    (import ./shell/zsh/zsh.nix { inherit pkgs; })
    (import ./shell/bash/bash.nix { inherit pkgs; })
    (import ./ui/waybar/waybar.nix { inherit pkgs; })
    (import ./wm/hyprland/hyprland.nix { inherit pkgs; })
  ];
}
