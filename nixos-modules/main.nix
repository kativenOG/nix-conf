{ config, pkgs, lib, ... }:
with lib;                      
{
  imports = [
 		 	./hardware/main.nix
 		 	./wayland/main.nix
 		 	./docker.nix
 		 	./kativen.nix
 	];

	# Basic packages 
  environment.systemPackages = with pkgs; [
    curl
    wget
    openvpn
    openssh_hpn

    neovim
    tmux
    git

    libimobiledevice # Enables iOS device pairing 
		brightnessctl    # CLI tool to control screen brightness 
    glib
    ifuse 
    usbmuxd
    usbmuxd2
		gcc

		#Compression
    zip
    unzip
		gnutar

		# CLI utils
    gnumake
    gnugrep
    lshw 	# Hardware information
    file  # Determine type of files 
  ];


	# STD stuff
  boot.loader.systemd-boot.enable=true;
  boot.loader.efi.canTouchEfiVariables=true;
  networking.networkmanager.enable=true;

  services.usbmuxd.enable = true;
  services.openssh.enable = true;
}
