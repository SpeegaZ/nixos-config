{ pkgs, ... } :

{
	programs.bash = {
		enable = true;
		shellAliases = {
			nfup = "sudo nix flake update --flake ~/nixos-config/.";
			nrsf = "sudo nixos-rebuild switch --flake ~/nixos-config#tsuki";
			ncgd = "sudo nix-collect-garbage -d";
			ff = "fastfetch -c examples/13.jsonc";
			cat = "bat";
			vi = "nvim";
		};
		initExtra = ''
			export PS1='\[\e[96m\]\W\[\e[0m\] \[\e[92m\]󰁔\[\e[0m\] '
		'';
	};
}

