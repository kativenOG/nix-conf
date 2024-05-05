{ config, pkgs, ... }:
{
  imports =
    [
				./hardware/main.nix	

				./audio/audio.nix
  			      
				./wayland/general.nix
				./wayland/window-manager.nix
				./wayland/login-manager.nix
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
    packages = with pkgs; [
      firefox
    ];
  };

  # Enable flakes and the CLI tool 
  nix.settings.experimental-features = ["nix-command" "flakes" ];
  environment.systemPackages = with pkgs; [
    vim
    neovim

    curl
    openvpn
    wget
    openssh_hpn

		gcc
    zsh
    git
    tmux
    file

    docker
				
    lshw # Hardware information
    v4l-utils
    libimobiledevice # enables iOS device pairing 
		brightnessctl
    ifuse 
    usbmuxd
    usbmuxd2

    zip
    unzip
    gnumake
    gnugrep
   ];
  
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
  services.nixld.enable = false;
  # Turn on if using xps13 plus!
  services.xps13.enable = true;

}
