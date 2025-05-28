{ pkgs, ... } :

{
    programs.waybar = {
	enable = true;
	
	settings = {
	    mainBar = {
		layer = "top";
		position = "top";
		spacing = 4;
		margin-top = 8;
		margin-right = 8;
		margin-left = 8;
		
		modules-left = [ "custom/distrologo" "hyprland/workspaces" ];
		modules-center = [ "hyprland/window" ];
		modules-right = [ "hyprland/language" "pulseaudio" "tray" "custom/wifi" "cpu" "memory" "temperature" "backlight" "battery" "clock" "custom/power" ];


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
	    

