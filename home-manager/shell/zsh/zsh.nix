{ pkgs, ... } :

{
  programs.zsh = {
    enable = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true;
    shellAliases = {
      nrsf = "sudo nixos-rebuild switch --flake ~/nixos-config#tsuki";
      ncgd = "sudo nix-collect-garbage -d";
      nfup = "sudo nix flake update --flake ~/nixos-config/";
      ff = "fastfetch";
      cat = "bat";
      vim = "nvim";
	  feh = "feh -. -Z --image-bg black";
    };
    history = {
      saveNoDups = true;
      save = 512;
    };
  };
}
