{ inputs, lib, config, pkgs, ... } :

{
  home.username = "vaayuu";
  home.homeDirectory = "/home/vaayuu";
  home.stateVersion = "24.11";
  
  programs.home-manager.enable = true;

  programs.zsh = {
    enable = true;
    shellAliases = {
      btw = "echo i use nixos btw"; 
      nrsf = "sudo nixos-rebuild switch --flake ~/nixos-config#tsuki";
      ff = "fastfetch";
      cat = "bat";
    };
  };
  
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
    libavif
    libwebp
    tokyonight-gtk-theme
    popsicle
    vscodium
    godot
    blender

  # --- Dev-tools --- 
    gcc
    zig
    lua
    python314
    gnumake
    cmake
  ];

  home.pointerCursor = {
    name = "Bibata-Modern-Classic";
    package = pkgs.bibata-cursors;
    size = 24;
  };

  gtk = {
    enable = true;
    iconTheme = {
      name = "Tokyonight-GTK-theme";
      package = pkgs.tokyonight-gtk-theme;
    };
  };

  imports = [
   
    (import ./kitty/kitty.nix { inherit pkgs; })

  ];
}
