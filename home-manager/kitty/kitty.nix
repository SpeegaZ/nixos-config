{ pkgs, ... } :

{ 
  programs.kitty = { 
    enable = true;
    settings = { 
      font_family = "Iosevka Nerd Font Mono";
      font_size = 13.0;
      background_opacity = 1;
      window_padding_width = 4;
    };

    extraConfig = ''
      foreground #ebdbb2
      background #1d2021
    '';
  };
}
