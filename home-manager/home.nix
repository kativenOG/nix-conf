{ config, pkgs, ... }:
{
  imports = [
	#Waybar
	./config/waybar.nix
	#Rofi
	./config/rofi.nix
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

  rustc
  ripgrep
  fd # Find alternative 

  nodejs
  tree-sitter # the one, the only 

  python3
  python311Packages.pip
  python311Packages.pynvim

  go
  gopls

  neofetch
  btop

  eza
  ncdu
	acpi 
	pulsemixer 
	imv # cli image viewer
  nerdfonts #Font
	haruna #Video viewer
 	libreoffice #Office suite
  xfce.thunar #File browser
  nix-prefetch-github #get hash and head from github repo
  ];

  # STD stuff:
  nixpkgs.config.allowUnfree =true;
  home.username = "kativen";
  home.homeDirectory = "/home/kativen";
  home.stateVersion = "23.11";
  programs.home-manager.enable = true;
}
