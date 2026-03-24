{ pkgs, ... }:

{
	programs.vscodium = {
		enable = true;
		packages = pkgs.vscodium;
	  	profiles.default = {
			userSettings = {
				"dotnetAcquisitionExtension.sharedExistingDotnetPath" = "${pkgs.dotnet-sdk_9}/bin";
				"godotTools.lsp.serverPort" = 6008;
			};
			extensions = with pkgs.vscode-extensions; [
				geequlim.godot-tools # For Godot GDScript support
			];
		};
	};
}

