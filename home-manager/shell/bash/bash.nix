{ pkgs, ... } :

{
	programs.bash = {
		enable = true;
		shellAliases = {
			ff = "fastfetch";
			cat = "bat";
			vi = "nvim";
			feh = "feh -. -Z --image-bg black";
		};
		initExtra = ''
			export PS1='\[\e[92m\]\u\[\e[0m\] in \[\e[34;1m\]\w\[\e[0m\] \$ '
		'';
	};
}

