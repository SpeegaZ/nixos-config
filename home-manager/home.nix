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
    lutris
    bottles
    librewolf
    libwebp
    tokyonight-gtk-theme
    popsicle
    vscodium
    godot
    blender
    obsidian
    vlc

  # --- Dev-tools --- 
    gcc
    lua
    python314
    gnumake
    cmake
  ];


  gtk = {
    enable = true;
    iconTheme = {
      name = "Gruvbox-GTK-theme";
      package = pkgs.gruvbox-gtk-theme;
    };

    cursorTheme = {
	name = "Bibata-Modern-Classic";
	package = pkgs.bibata-cursors;
    };

  };
  
  imports = [
   
    (import ./kitty/kitty.nix { inherit pkgs; })
    (import ./zsh/zsh.nix { inherit pkgs; })
    (import ./starship/starship.nix { inherit pkgs; })
  ];
}
