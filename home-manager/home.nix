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
	firefox
	chromium
        vscode
	telegram-desktop	
        teams-for-linux
	spotify
	dbeaver
        libreoffice #Office suite

        # Stuff that shouldn't be here 
        clang
        rustc
        ripgrep
        nodejs
        python3
        python311Packages.pip
        python311Packages.pynvim
        tree-sitter # the one, the only 

        # My beloved 
        go
        gopls

        # Utils
        haruna # Video viewer
        gnome.nautilus # File manager 
        libsForQt5.kdialog# For cool CLI scripts
        neofetch
        btop
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
