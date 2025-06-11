{ pkgs, ... } :

{ 
  programs.kitty = { 
    enable = true;
    settings = { 
      font_family = "IosevkaTerm Nerd Font Mono";
      font_size = 13.0;
      background_opacity = 0.8;
    };
  };
}
