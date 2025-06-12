{ pkgs, ... } : 

{
    programs.waybar = {
	enable = true;

	style = ''
		/* Tokyonight palette */
	    /*@define-color background #1a1b26;
	    @define-color foreground #c0caf5;
	    @define-color alt_background #1f1f2d;
	    @define-color accent #7aa2f7;

	    @define-color black #32344a;
	    @define-color red #f7768e;
	    @define-color green #9ece6a;
	    @define-color yellow #e0af68;
	    @define-color blue #7aa2f7;
	    @define-color magenta #bb9af7;
	    @define-color cyan #7dcfff;
	    @define-color white #a9b1d6;

	    @define-color alt_black #414868;
	    @define-color alt_red #f7768e;
	    @define-color alt_green #18ffb1;
	    @define-color alt_yellow #e0af68;
	    @define-color alt_blue #7aa5f7;
	    @define-color alt_magenta #bb9af7;
	    @define-color alt_cyan #7bdaf1;
	    @define-color alt_white #c0caf5; */

		/* Kanagawa Palette */ 
	    /* @define-color foreground #dcd7ba;
	    @define-color background #1f1f28;
	    @define-color alt_background #25252f;
	    @define-color accent #7aa89f;

	    @define-color black #090618;
	    @define-color red #c34043;
	    @define-color green #76946a;
	    @define-color yellow #c0a36e;
	    @define-color blue #7e9cd8; 
	    @define-color magenta #958fb8;
	    @define-color cyan #6a9589;
	    @define-color white #c8c093;

	    @define-color alt_black #727169;
	    @define-color alt_red #e82424;
	    @define-color alt_green #98bb6c;
	    @define-color alt_yellow #e6c384;
	    @define-color alt_blue #7fb4ca;
	    @define-color alt_magenta #938aa9;
	    @define-color alt_cyan #7aa89f;
	    @define-color alt_white #dcd7ba; */

		/* Gruvbox Palette */ 
	    @define-color foreground #ebdbb2;
	    @define-color background #1d2021;
	    @define-color alt_background #282828;
	    @define-color accent #689d6a;

	    @define-color black #282828;
	    @define-color red #cc241d;
	    @define-color green #98971a;
	    @define-color yellow #d79921;
	    @define-color blue #7daea3;
	    @define-color magenta #b16286;
	    @define-color cyan #689d6a;
	    @define-color white #a89984;

	    @define-color alt_black #3c3836;
	    @define-color alt_red #fb4934;
	    @define-color alt_green #b8bb26;
	    @define-color alt_yellow #fabd2f;
	    @define-color alt_blue #7daea3;
	    @define-color alt_magenta #d3869b;
	    @define-color alt_cyan #8ec07c;
	    @define-color alt_white #ebdbb2;

	    * {
		
		border : none;
		font-family : IosevkaTerm Nerd Font Mono, sans-serif;
		font-size : 14px;
	    }

	    window#waybar {
		background-color : @background;
		border-radius : 6px;
		color : @foreground;
		opacity : 1;
		transition-property : background-color;
		transition-duration : .5s;
		margin-bottom : -7px;
	    }

	    window#waybar.hidden {
		opacity : 0.2;
	    }

	    window#hyprland-window {
		background-color : @background;
	    }

	    
	    #workspaces,
	    #mode,
	    #window,
	    #cpu,
	    #memory,
	    #temperature,
	    #custom-media,
	    #custom-powermenu,
	    #custom-fans,
	    #custom-distro,
	    #clock,
	    #idle_inhibitor,
	    #language,
	    #pulseaudio,
	    #backlight,
	    #battery,
	    #network,
	    #tray {
		background-color : @alt-background;
		padding : 0 10px;
		margin : 5px 2px 5px 2px;
		border : 1px solid rgba(0, 0, 0, 0);
		border-radius : 6px;
		background-clip : padding-box;
	    }

	    #workspaces button { 
		background-color : @alt-background;
		padding : 0 5px;
		min-width : 20px;
		color : @foreground;
	    }

	    #workspaces button:hover {
		background-color : rgba(0, 0, 0, 0);	    


	    
	'';	

	settings = {
	    mainBar = {
		layer = "top";
		position = "top";
		margin = "8px 10px -2px 10px";	

		modules-left = [ "custom/distro" "hyprland/workspaces" "hyprland/window" ];
		modules-center = [ "clock" ];
		modules-right = [ "temperature" "memory" "cpu" "pulseaudio" "backlight" "battery" "custom/power" "tray" ];


		"hyprland-workspaces" = {
		    disable-scroll = true;
		    all-outputs = true;
		    warp-on-scroll = true;
		    format = "{name}";
		    format-icons = {
		    
		    };

		    persistant-workspaces = {
			"*" : 4;
		    };
		};



		"custom/power" = {
		    format = " ";
		    tooltip = false;
		    on-click = "wlogout";
		};

		"custom/distrologo" = {
		    format = "{icon}";
		    format-icons = { 
			"default" = ;
		    };
		};
	    };
	};
    };
};
	    

