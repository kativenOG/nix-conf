{ lib, pkgs, config, ... }:
{
		imports =
		  [
		  	./hardware-configuration.nix	
  	  	./xps13.nix
		  	./nixld.nix	
		  ];
		services.nixld.enable = lib.mkDefault true;
		services.xps13.enable = lib.mkDefault false;
}
