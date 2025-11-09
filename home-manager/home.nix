{ inputs, pkgs, ... } :

{
  home.username = "vaayuu";
  home.homeDirectory = "/home/vaayuu";
  home.stateVersion = "25.05";
  
  programs.home-manager.enable = true;
  
  home.packages = with pkgs; [
    bat 
    protonvpn-gui
    vivaldi
    firefox-devedition
    feh
    bibata-cursors
    brave
    heroic
    libwebp
    popsicle
    godot
    vscodium
    obsidian
    mpv
    zathura
    papirus-icon-theme
    gruvbox-gtk-theme
    gearlever
    grim
    slurp
    gimp3
    kdePackages.kdenlive
    mako
	era
	openutau	
	ani-cli
	librewolf

	alacritty
	contour
	dbeaver-bin
	
  # --- Dev-tools --- 
    gcc15
    python314
    gnumake
	cmake
    lua
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
   
    (import ./term/kitty/kitty.nix { inherit pkgs; })
    (import ./term/alacritty/alacritty.nix { inherit pkgs; })
    (import ./shell/zsh/zsh.nix { inherit pkgs; })
    (import ./shell/bash/bash.nix { inherit pkgs; })
    #(import ./shell/starship/starship.nix { inherit pkgs; })
    (import ./editor/vscodium/vscodium.nix { inherit pkgs; })
    (import ./ui/waybar/waybar.nix { inherit pkgs; })
    (import ./wm/hyprland/hyprland.nix { inherit pkgs; })
  ];
}
