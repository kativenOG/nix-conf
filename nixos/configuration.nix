{ config, pkgs, pkgs-unstable, ... }:
{
  imports =
    [
				./hardware/main.nix	
				./modules/audio.nix
				./modules/window_manager.nix
				./modules/uni_vpn.nix
    ];

  time.timeZone = "Europe/Rome";

  boot.loader.systemd-boot.enable=true;
  boot.loader.efi.canTouchEfiVariables=true;

  networking.hostName="katiclism";
  networking.networkmanager.enable=true;
  
  environment.sessionVariables = rec {
    XDG_CONFIG_HOME = "\${HOME}/.config";
    XCURSOR_SIZE = "24";
  };
    
  users.users.kativen = {
    isNormalUser = true;
    extraGroups = [ "wheel"  "docker" "networkmanager"]; 
    shell= pkgs.zsh;
    # leave browsers here for camera support 
    packages = with pkgs-unstable; [
      firefox
    ];
  };

  # Enable flakes and the CLI tool 
  nix.settings.experimental-features = ["nix-command" "flakes" ];
  environment.systemPackages = [
    nixpkgs.vim
    nixpkgs.neovim
    nixpkgs.curl
    nixpkgs.openvpn
    nixpkgs.wget
    nixpkgs.openssh_hpn
    nixpkgs.zsh
    nixpkgs.git
    nixpkgs.tmux
    nixpkgs.file
    nixpkgs.docker
	nixpkgs.usbutils
    nixpkgs.bluez 
    nixpkgs.bluez-tools
	nixpkgs.blueman
    nixpkgs.lshw # Hardware information
    nixpkgs.v4l-utils
    nixpkgs.libimobiledevice # enables iOS device pairing 
	nixpkgs.brightnessctl
    nixpkgs.ifuse 
    nixpkgs.usbmuxd
    nixpkgs.usbmuxd2
	nixpkgs.libavif
    nixpkgs.zip
    nixpkgs.unzip
    nixpkgs.gnumake
    nixpkgs.gnugrep
   ];

  
  # Bluethoth
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true; 
  services.blueman.enable = true;

  # Docker:
  virtualisation.docker.enable = true;
  virtualisation.docker.rootless = { # Make it rootless
    enable = true;
    setSocketVariable = true;
  };

	# Random stuff that you will always need 
	nixpkgs.config.allowUnfree = true;
  services.usbmuxd.enable = true;
  programs.zsh.enable=true;
  services.openssh.enable = true;
  services.printing.enable = true;    
  system.stateVersion = "23.11";

	# MODULES #############
  # nix-ld (turn it on to run Alien executables on nixos) 
  services.nixld.enable = true;
  # Turn on if using xps13 plus!
  services.xps13.enable = true;

}
