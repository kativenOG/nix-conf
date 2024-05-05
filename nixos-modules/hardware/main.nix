{ lib, pkgs, config, ... }:
{
		imports =
		  [
		  	./audio.nix	
  	  	./xps13.nix
		  	./nixld.nix	
		  ];
		services.audio.enable = lib.mkDefault true;
		services.nixld.enable = lib.mkDefault false;
		services.xps13.enable = lib.mkDefault false;
}
