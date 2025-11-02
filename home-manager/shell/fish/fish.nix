{ pkgs, ... } :

{
	programs.fish = {
		enable = true;
		shellAliases = {
			nrsf = "sudo nixos-rebuild switch --flake ~/nixos-config#tsuki";
			nfup = "sudo nix flake update --flake ~/nixos-config/";
			ncgd = "sudo nix-collect-garbage -d";
			ff = "fastfetch";
			cat = "bat";
			vi = "nvim";
			feh = "feh -. -Z --image-bg black";
		};
	};
}

