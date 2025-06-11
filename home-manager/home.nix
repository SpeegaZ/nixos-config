{ inputs, lib, config, pkgs, ... } :

{
  home.username = "vaayuu";
  home.homeDirectory = "/home/vaayuu";
  home.stateVersion = "24.11";
  
  programs.home-manager.enable = true;
  
  home.packages = with pkgs; [
    bat 
    protonvpn-gui
    floorp
    feh
    bibata-cursors
    brave
    heroic
    librewolf
    libwebp
    popsicle
    vscodium
    godot
    blender
    obsidian
    vlc
    papirus-icon-theme
    gruvbox-gtk-theme
    tmux

  # --- Dev-tools --- 
    gcc
    lua
    python314
    gnumake
    cmake
  ];

    home.pointerCursor = {
	gtk.enable = true;
	name = "Bibata-Modern-Classic";
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
	name = "Bibata-Modern-Classic";
	package = pkgs.bibata-cursors;
    };

  };

    home.sessionVariables = {
	XDG_CURRENT_DESKTOP = "Hyprland";
	XDG_SESSION_DESKTOP = "Hyprland";
	GDK_BACKEND = "wayland,x11";
    };
  
  imports = [
   
    (import ./kitty/kitty.nix { inherit pkgs; })
    (import ./zsh/zsh.nix { inherit pkgs; })
    (import ./starship/starship.nix { inherit pkgs; })
  ];
}
