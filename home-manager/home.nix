{ inputs, pkgs, ... } :

{
  home.username = "vaayuu";
  home.homeDirectory = "/home/vaayuu";
  home.stateVersion = "25.11";
  
  programs.home-manager.enable = true;
  
  home.packages = with pkgs; [
    bat 
    vivaldi
	imv
    bibata-cursors
    brave
	obs-studio
	element
	element-desktop

    # Gaming
    heroic

    libwebp
    popsicle
    godot
    obsidian
    mpv
    zathura
    papirus-icon-theme
    gruvbox-gtk-theme
    gearlever
    grim
    slurp
    kdePackages.kdenlive
    mako
    era
    openutau	
    ani-cli
    protonvpn-gui
    librewolf
    foot
	
  # --- Dev-tools --- 
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
    name = "Bibata-Modern-Ice";
    package = pkgs.bibata-cursors;
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
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };

    cursorTheme = {
      name = "Bibata-Modern-Ice";
      package = pkgs.bibata-cursors;
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
