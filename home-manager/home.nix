{ config, pkgs, nixpkgs-unstable,... }:
{
  imports = [
	./config/waybar.nix
	./config/rofi.nix
	./config/git.nix
	./config/zshrc.nix
	./config/kitty.nix
	./config/neovim.nix
  ];
  

  home.packages = with pkgs; [
    kitty 
    vscode
	dbeaver-bin
	anki
	chromium
	gitkraken
	thunderbird
    teams-for-linux
	discord
	telegram-desktop	

	insomnia
	bloomrpc
	drawio

	spotify
	
	zsh
	direnv

	latexrun 
	texliveTeTeX
    ripgrep
    libreoffice 
	zotero # zotero_7 

    # Utils
    btop
    fastfetch 
    pulsemixer 		# TUI for audio
    gnome.nautilus  # File manager 
    glow 			# Markdown renderer
    haruna 			# Video viewer
    zathura 		# Document viewer with vim keybindings
    fd   			# find alternative 
    imv  			# CLI image viewer
    eza  			# ls alternative
    ncdu 			# storage cli utility 
    acpi 			# battery utility
    nerdfonts 		# Fonts

	# Fun
  	cowsay
	pipes-rs
  	cbonsai
  ];

  # ENV VARIABLES 
  home.sessionVariables = {
    EDITOR="nvim";
		PATH="/home/kativen/.local/bin/:/home/kativen/go/bin:$PATH";
		CGO_ENABLED=1;
  };

  nixpkgs.config={
  	allowUnfree =true;
	permittedInsecurePackages = ["nix-2.15.3"]; 
  };	


  # STD stuff:
  home.username = "kativen";
  home.homeDirectory = "/home/kativen";
  home.stateVersion = "23.11";
  programs.home-manager.enable = true;
}
