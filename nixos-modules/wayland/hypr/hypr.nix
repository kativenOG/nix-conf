{ config, pkgs, lib, ... }:
with lib;                      
let
  cfg = config.services.hyperland;
in {

  options.services.hyprland= {
    enable = mkEnableOption "hyprland wm";
  };

	config = mkIf cfg.enable {

		environment.systemPackages = with pkgs; [
				hyprland
		];

		programs.hyprland.enable = true;

		services.greetd = {
		  enable = true;
		  settings = rec {
        initial_session = {
          command = "${pkgs.sway}/bin/hyprland";
          user = "kativen";
			  };
        default_session = initial_session;
      };
    };
  };
}	
