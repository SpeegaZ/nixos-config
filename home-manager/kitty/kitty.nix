{ pkgs, ... } :

{ 
  programs.kitty = { 
    enable = true;
    settings = { 
      font_family = "JetBrains Mono Nerd Font";
      background_opacity = 0.7;
    };
  };
}
