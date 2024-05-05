{ config, pkgs, lib, ... }:
with lib;                      
let
  cfg = config.services.wl;
in {
  imports = [
 		 	./sway/sway.nix
 		 	./hypr/hypr.nix
 	];

  options.services.wl = {
    enable = mkEnableOption "enable wayland compositor";
  };

  config = mkIf cfg.enable {

 		 environment.systemPackages = with pkgs; [
 		   wayland
 		   xdg-utils

 		   waybar
 		   rofi

 		   grim
 		   slurp
 		   clipman
 		   wl-clipboard

 		 ];

 		 services.dbus.enable = true;

 		 xdg.portal = {
 		   enable = true;
 		   wlr.enable = true;
 		 };

     environment.extraInit = ''
         #Turn off gui for ssh auth
         unset -v SSH_ASKPASS
       '';
     programs.light.enable = true;

		 # Window Managers: 
 		 services.sway.enable = mkDefault false;
 		 services.hyprland.enable = mkDefault false;
	};
}
