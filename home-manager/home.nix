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
    vscode
	  dbeaver
	  firefox
	  chromium
    teams-for-linux
	  telegram-desktop	
	  bloomrpc

	  spotify

    ripgrep
		latexrun 
    libreoffice 
		zotero
				
    rustc

    nodejs
		yarn

    go
    gopls

		postgresql_16

    # Utils
    btop
    fastfetch 
    pulsemixer # TUI for audio
    gnome.nautilus # File manager 
	  glow # Markdown renderer
    haruna # Video viewer
    zathura # Document viewer with vim keybindings
    fd   			# find alternative 
    imv  			# CLI image viewer
    eza  			# ls alternative
    ncdu 			# storage cli utility 
    acpi 			# battery utility
    nerdfonts # Font
  ];

  # ENV VARIABLES 
  home.sessionVariables = {
    EDITOR="nvim";
		PATH="$PATH:~/.local/bin:~/go/bin";
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
