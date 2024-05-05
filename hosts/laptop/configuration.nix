{ config, pkgs, ... }:
{ 
  imports =[
    ./hardware-configuration.nix
		../../modules/main.nix
		../../users/kativen.nix
  ];
  nix.trustedUsers = [ "root" "kativen" ];

	# Modules:
  # When ttys are not enough 
 	services.wl.enable = true;
	# Window manager: 
 	services.sway.enable = true;
  # nix-ld (turn it on to run alien executables on nixos) 
  services.nixld.enable = false;
	# Self explanatory
 	services.dockerootless.enable = true;

	# Device specific configs 
  time.timeZone = "Europe/Rome";
  networking.hostName="latop";
	nixpkgs.config.allowUnfree = true;
  services.printing.enable = true;    

  system.stateVersion = "23.11";

}
