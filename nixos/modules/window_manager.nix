{ config, pkgs, lib, ...}:
{
	environment.systemPackages = with pkgs; [
 	  sway
 	  # swayfx # I wish 
	  mako # Notification daemon 
 	  workstyle # Sway workspaces with style 
 	  rofi # Menu 
 	  waybar # top/bottom Menu Bar 
 	  wayland # duh 
 	  xdg-utils
 	  brightnessctl
 	  sway-contrib.grimshot
 	  glib

 	  # Screenshots 
 	  grim
 	  slurp

 	  # Single shared clipboard between all apps
 	  clipman
 	  wl-clipboard
 	];

 	services.dbus.enable = true;
 	xdg.portal = {
 	  enable = true;
 	  wlr.enable = true;
 	  extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
 	};

 	programs.sway = {
 	  enable = true;
 	  wrapperFeatures.gtk = true;
 	};

 	environment.extraInit = ''
 	    #Turn off gui for ssh auth
 	    unset -v SSH_ASKPASS
 	  '';

 	users.users.kativen.extraGroups = [ "video" "plugdev" ];
 	programs.light.enable = true;

	# systemd service to automatically rotate wallpaper every 10s 
	systemd.services.wallpaper-rotation= {
		enable=false; # I don't like my rotation nearly enough
		description="automatically rotate sway wallpapers";
		serviceConfig={
			Type="simple";
			Restart="always";
		  	RestartSec="10s";
			ExecStart = "/bin/sh ~/nix-conf/nixos/modules/bg_script.sh";
		};
	};

	# No display manager, directly boot into wm 
	services.greetd = { 
	  enable = true;
	  settings = rec {
	    initial_session = {
	      command = "${pkgs.sway}/bin/sway";
	      user = "kativen";
	    };
	    default_session = initial_session;
	  };
	};
}
