{ pkgs, ... } :

{
    programs.zsh = {
	enable = true;
	shellAliases = {
	    nrsf = "sudo nixos-rebuild switch --flake ~/nixos-config#tsuki";
	    ff = "fastfetch";
	    cat = "bat";
	    vim = "nvim";
	};
    };
}
