{ pkgs, ... }: 

{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    profiles.default.extensions = with pkgs.vscode-extensions; [
	jdinhlife.gruvbox
	vscodevim.vim
	emmanuelbeziat.vscode-great-icons
	ritwickdey.liveserver
    ];
  };
}


	
