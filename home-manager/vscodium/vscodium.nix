{ pkgs, ... }: 

{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    profiles.default.extensions = with pkgs.vscode-extensions; [
	llvm-vs-code-extensions.vscode-clangd
	vadimcn.vscode-lldb
	jdinhlife.gruvbox
	ms-python.python
	ms-python.debugpy
	vscodevim.vim
	emmanuelbeziat.vscode-great-icons
	ritwickdey.liveserver

    ];
  };
}


	
