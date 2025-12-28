{ pkgs, ... } :

{ 
  programs.kitty = { 
    enable = true;
    settings = { 
      font_family = "Iosevka Nerd Font Mono";
      font_size = 15.0;
      background_opacity = 1;
      window_padding_width = 4;
    };

    extraConfig = ''
      background #1d2021
      foreground #ebdbb2
      selection_foreground #928374
      selection_background #ebdbb2
      url_color #83a598
      cursor #928374
      cursor_text_color background

      # Tabs
      active_tab_background #665c54
      active_tab_foreground #fbf1c7
      inactive_tab_background  #3c3836
      inactive_tab_foreground #a89984
      #tab_bar_background #15161E

      # normal
      color0 #665c54
      color1 #cc241d
      color2 #98971a
      color3 #d79921
      color4 #458588
      color5 #b16286
      color6 #689d6a
      color7 #a89984

      # bright
      color8  #7c6f64
      color9  #fb4934
      color10 #b8bb26
      color11 #fabd2f
      color12 #83a598
      color13 #d3869c
      color14 #8ec07c
      color15 #bdae93


      # extended colors
      #color16 #FFA066
      #color17 #FF5D62
    '';
  };
}
