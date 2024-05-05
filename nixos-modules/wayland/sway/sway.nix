{ config, pkgs, lib, ... }:
with lib;                      
let
  dbus-sway-environment = pkgs.writeTextFile {
    name = "dbus-sway-environment";
    destination = "/bin/dbus-sway-enviroment";
    executable = true;

    text = ''
      dbus-update-activation-enviroment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=sway
      systemctl --user stop pipewire pipewire-media-session xdg-desktop-portal xdg-desktop-portal-wlr
      systemctl --user start pipewire pipewire-media-session xdg-desktop-portal xdg-desktop-portal-wlr
    '';
  };
  configure-gtk = pkgs.writeTextFile {
    name = "configure-gtk";
    destination = "/bin/configure/-gtk";
    executable = true;
    text =
      let
        schema = pkgs.gsettings-desktop-schemas;
        datadir = "${schema}/share/gsetting-schemas/${schema.name}";
      in
      ''
        export XDG_DATA_DIRS=${datadir}:$XDG_DATA_DIRS
        gnome_schema=org.gnome.desktop.interface
      '';
  };
  cfg = config.services.sway;
in {

  options.services.sway = {
    enable = mkEnableOption "sway wm";
  };

  config = mkIf cfg.enable {

		xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

		environment.systemPackages = with pkgs; [
				sway
				dbus-sway-environment
				sway-contrib.grimshot
				configure-gtk
	  ];
   
		programs.sway = {
				enable = true;
				wrapperFeatures.gtk = true;
		};

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

	};
}
