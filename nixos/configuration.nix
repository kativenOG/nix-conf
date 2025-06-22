{ config, pkgs, ... }:
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
  };

  # Enable flakes and the CLI tool 
  nix.settings.experimental-features = ["nix-command" "flakes" ];
  environment.systemPackages = [
    pkgs.vim
    pkgs.neovim
    pkgs.firefox
    pkgs.curl
    pkgs.openvpn
    pkgs.wget
    pkgs.openssh_hpn
    pkgs.zsh
    pkgs.git
    pkgs.tmux
    pkgs.file
    pkgs.docker
	pkgs.usbutils
    pkgs.bluez 
    pkgs.bluez-tools
	pkgs.blueman
    pkgs.lshw # Hardware information
    pkgs.v4l-utils
    pkgs.libimobiledevice # enables iOS device pairing 
	pkgs.brightnessctl
    pkgs.ifuse 
    pkgs.usbmuxd
    pkgs.usbmuxd2
	pkgs.libavif
    pkgs.zip
    pkgs.unzip
    pkgs.gnumake
    pkgs.gnugrep
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
