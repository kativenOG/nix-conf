{ config, pkgs, ... }:
{
  #silent boot

  imports =
    [
	#hardware optimization
	./hardware/hardware-configuration.nix	

	#audio
	./audio/audio.nix
        
	#wayland
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
    
  users.users.kativen= {
     isNormalUser = true;
     shell= pkgs.zsh;
     extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
   };
  
  environment.systemPackages = with pkgs; [
    vim
    neovim

    curl
    wget
    openssh_hpn

    zsh
    git
    tmux

    libimobiledevice
    ifuse # optional, to mount using 'ifuse'
    usbmuxd
    usbmuxd2

    gnumake
    gnugrep
   ];
  

  services.usbmuxd.enable = true;
  programs.zsh.enable=true;
  services.openssh.enable = true;
  services.printing.enable = true;    
  system.stateVersion = "23.11";
}
