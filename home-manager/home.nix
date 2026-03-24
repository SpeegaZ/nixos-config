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
    brave
	element-desktop
	assetripper
    heroic
	pixelorama
	blender
    libwebp
    obsidian
    mpv
    zathura
	gearlever
    grim
    slurp
    mako
	swaybg
    protonvpn-gui
    librewolf
	krita
    foot

	papirus-icon-theme
	gruvbox-gtk-theme
	openzone-cursors

	
  # --- Dev-tools --- 
	vscodium
	godot
    gcc15
    python315
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
    size = 20;
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
      name = "OpenZone_Black";
      package = pkgs.openzone-cursors;
    };
  };
  
  imports = [
    (import ./shell/bash/bash.nix { inherit pkgs; })
    (import ./ui/waybar/waybar.nix { inherit pkgs; })
  ];
}
