{ config, pkgs, ... }:
{
  imports = [
	#Neovim
	./config/neovim.nix
	#Git
	./config/git.nix
	#ZSH
	./config/zshrc.nix
	#Alacritty
	./config/kitty.nix
  ];
  
  home.packages = with pkgs; [
	#Browser
	firefox
	chromium
	telegram-desktop	
	spotify
	dbeaver

	acpi 
	pulsemixer 
	imv # cli image viewer
  	nerdfonts #Font
	haruna #Video viewer
  	libreoffice #Office suite
  	xfce.thunar #File browser
  	nix-prefetch-github #get hash and head from github repo
	
	

	
  ];

  home.username = "kativen";
  home.homeDirectory = "/home/kativen";
  home.stateVersion = "23.11";
  programs.home-manager.enable = true;
}
