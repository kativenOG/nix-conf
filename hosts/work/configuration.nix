{ config, pkgs, ... }:
{
  imports =[
    # ./hardware-configuration.nix
		../../modules/main.nix
		../../users/kativen.nix
  ];

  nix.trustedUsers = [ "root" "kativen" ];


	# Device specific configs 
  time.timeZone = "Europe/Rome";
  networking.hostName="work";
	nixpkgs.config.allowUnfree = true;
  services.printing.enable   = true;    

  system.stateVersion = "23.11";

	# Modules:
 	services.wl.enable = true;
  services.nixld.enable = true;
	services.sway.enable = true;
  services.dockerootless.enable = true;
 
}
