{ config, pkgs, lib, ... }:

{
  environment.systemPackages = with pkgs; [
    sway
		# swayfx
		workstyle # Sway workspaces with style 
    rofi
    waybar
    wayland
    xdg-utils
		brightnessctl
		sway-contrib.grimshot
    glib
    grim
    clipman
    wl-clipboard
    slurp
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

}
