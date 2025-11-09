{ pkgs, ... }:

{
	programs.alacritty = {
		enable = true;
		settings = {
			font.size = 15;
			font.normal = {
				family = "Iosevka Nerd Font Mono";
				style = "Regular";
			};
		};
	};
}

