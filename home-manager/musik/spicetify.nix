{ pkgs, inputs, ... }:

let 
	spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
in 
{
	programs.spicetify = {
		enable = true;
		enableExtensions = with spicePkgs.extensions; [
			adblockify
			hidePodcasts
			shuffle
		];
		theme = spicePkgs.themes.comfy;
		colorScheme = "rose-pine-moon";
	};
}
