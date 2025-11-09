{ pkgs, ... } :

{
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        type = "auto";
        source = "~/Pictures/Miyabi/miyabi-formal.jpg";
	width = 65;
	height = 65;
      };



