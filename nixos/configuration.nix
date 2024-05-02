{ config, pkgs, ... }:
{
  #silent boot

  imports =
    [
	#hardware optimization
	./hardware/hardware-configuration.nix	
        #./hardware/xps_13_plus.nix

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
    docker


    curl
    openvpn
    wget
    openssh_hpn

		gcc
    zsh
    git
    tmux
    file


    lshw #Hardware information
    v4l-utils
    libimobiledevice # ios support 
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
  # nix-ld 
  hardware.opengl.enable = true;
  programs.nix-ld.enable = true;
	# Sets up all the libraries to load
  programs.nix-ld.libraries = with pkgs; [
    alsa-lib
    at-spi2-atk
    at-spi2-core
    atk
    cairo
    cups
    curl
    dbus
    expat
    fontconfig
    freetype
    fuse3
    gdk-pixbuf
    glib
    gtk3
    icu
    libGL
    libappindicator-gtk3
    libdrm
    libglvnd
    libnotify
    libpulseaudio
    libunwind
    libusb1
    libuuid
    libxkbcommon
    libxml2
    mesa
    nspr
    nss
    openssl
    pango
    pipewire
    stdenv.cc.cc
    systemd
    vulkan-loader
    vulkan-tools
    xorg.libX11
    xorg.libXScrnSaver
    xorg.libXcomposite
    xorg.libXcursor
    xorg.libXdamage
    xorg.libXext
    xorg.libXfixes
    xorg.libXi
    xorg.libXrandr
    xorg.libXrender
    xorg.libXtst
    xorg.libxcb
    xorg.libxkbfile
		xorg.libXinerama
    xorg.libxshmfence
    zlib
  ];

  services.usbmuxd.enable = true;
  programs.zsh.enable=true;
  services.openssh.enable = true;
  services.printing.enable = true;    
  system.stateVersion = "23.11";
}
