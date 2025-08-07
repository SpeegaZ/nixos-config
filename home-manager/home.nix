{ inputs, lib, config, pkgs, ... } :

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
    librewolf
    libwebp
    popsicle
    godot
    vscodium
    blender
    obsidian
    mpv
    zathura
    papirus-icon-theme
    kanagawa-gtk-theme
    gearlever
    grim
    slurp
    gimp3
    # music players
    kdePackages.kdenlive
    rhythmbox
    yt-dlp
    mako
    
  


  # --- Dev-tools --- 
    gcc15
    python314
    gnumake
    cmake
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
      name = "Kanagawa-B-LB";
      package = pkgs.kanagawa-gtk-theme;
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
   
    (import ./kitty/kitty.nix { inherit pkgs; })
    (import ./zsh/zsh.nix { inherit pkgs; })
    (import ./starship/starship.nix { inherit pkgs; })
    (import ./vscodium/vscodium.nix { inherit pkgs; })
    (import ./waybar/waybar.nix { inherit pkgs; })
  ];
}
