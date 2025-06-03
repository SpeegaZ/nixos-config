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
    rustup
    zig
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
  
  home.sessionPath = [
    "$HOME/.cargo/bin"
  ];

  imports = [
   
    (import ./kitty/kitty.nix { inherit pkgs; })
    (import ./zsh/zsh.nix { inherit pkgs; })
    (import ./starship/starship.nix { inherit pkgs; })
  ];
}
