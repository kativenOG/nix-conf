{ config, pkgs, ... }:
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
	  firefox
	  chromium
    teams-for-linux
	  telegram-desktop	
	  spotify
    vscode
	  dbeaver
	  bloomrpc
    libreoffice 
		zotero
				
    # Stuff that shouldn't be here 
	  # nodePackages.pyright
    rustc
    ripgrep
    nodejs
		yarn
    go
    gopls
		postgresql_16

    # Utils
	  glow # Markdown renderer
    haruna # Video viewer
    gnome.nautilus # File manager 
    fastfetch 
    btop
    pulsemixer 
    fd   			# find alternative 
    imv  			# CLI image viewer
    eza  			# ls alternative
    ncdu 			# storage cli utility 
    acpi 			# battery utility
    nerdfonts # Font

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
