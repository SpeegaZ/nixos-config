{ pkgs, ... } :

{
  programs.zsh = {
    enable = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true;
    shellAliases = {
      nrsf = "sudo nixos-rebuild switch --flake ~/nixos-config#tsuki";
      ncgd = "sudo nix-collect-garbage -d";
      nfup = "sudo nix flake update";
      ff = "fastfetch";
      cat = "bat";
      vim = "nvim";
    };
    history = {
      saveNoDups = true;
      save = 512;
    };
  };
}
