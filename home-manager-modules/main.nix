{ config, pkgs, lib, ... }:
with lib;                      
{
	# Group the modules for a single import 
  imports = [
 		 	./git.nix
 		 	./kitty.nix
 		 	./neovim.nix
 		 	./rofi.nix
 		 	./waybar.nix
 		 	./zshrc.nix
 	];
}
