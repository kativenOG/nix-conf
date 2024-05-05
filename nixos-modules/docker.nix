{ config, pkgs, lib, ... }:
with lib;                      
let
  cfg = config.services.dockerootless;
in {

  options.services.dockerootless= {
    enable = mkEnableOption "enable rootless docker on the machine";
  };

  config = mkIf cfg.enable {
		# Add the package 
		environment.systemPackages = pkgs.docker;
    virtualisation.docker.enable = true;

    # Enable it for rootless use:
    virtualisation.docker.rootless = { 
      enable = true;
      setSocketVariable = true;
    };
	};
}
