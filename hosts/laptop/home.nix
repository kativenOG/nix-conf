{ config, pkgs, ... }:
{
  imports = [
	#Waybar
	./config/waybar.nix
	#Rofi
	./config/rofi.nix
	#Git
	./config/git.nix
	#ZSH
	./config/zshrc.nix
	#Alacritty
	./config/kitty.nix
	#Neovim
	./config/neovim.nix
  ];
  

  home.packages = with pkgs; [
	  # Apps
    kitty 
				
	  firefox
	  chromium

    teams-for-linux
	  telegram-desktop	
	  spotify

    vscode
	  dbeaver
	  bloomrpc

    libreoffice #Office suite
		zotero

    # Stuff that shouldn't be here 
		libgcc
    rustc
    nodejs
		yarn
	  nodePackages.pyright
    python3
    python311Packages.pip

    # My beloved 
    go
    gopls
		postgresql_16

    # Utils
	  glow # Markdown renderer
    haruna # Video viewer
    gnome.nautilus # File manager 
    libsForQt5.kdialog# For cool CLI scripts
    neofetch
    btop
    ripgrep
    pulsemixer 
    fd  # find alternative 
    imv # cli image viewer
    eza # ls alternative
    ncdu # storage cli utility 
    acpi # battery utility
    nerdfonts #Font

    # I want to start using this  
    nix-prefetch-github #get hash and head from github repo
  ];

  # ENV VARIABLES 
  home.sessionVariables = {
    EDITOR="nvim";
  };


  nixpkgs.config={
  	allowUnfree =true;
	permittedInsecurePackages = ["nix-2.15.3"]; # I should rebuild a package but im not good enough 
  };	


  # STD stuff:
  home.username = "kativen";
  home.homeDirectory = "/home/kativen";
  home.stateVersion = "23.11";
  programs.home-manager.enable = true;
}