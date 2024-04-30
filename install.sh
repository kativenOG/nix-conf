 #!/usr/bin/env bash
# Create base directories 
mkdir Downloads Pictures Music Documents Lavoro Universita 

# Setup NixOs
cp /etc/nixos/hardware-configuration.nix ~/nix-conf/nixos/hardware/
sudo rm -rf /etc/nixos && sudo ln -s ~/nixos-config/nixos/ /etc/nixos

# Setup Sway 
ln -s ~/nixos-config/nixos/wayland/sway/ ~/.config
sudo nixos-rebuild switch

# Add home-manager and unstable channels
sudo nix-channel --add https://nixos.org/channels/nixpkgs-unstable unstable
nix-channel --add https://github.com/nix-community/home-manager/archive/release-23.11.tar.gz home-manager
nix-channel --update

# Setup Home-Manager
nix-shell '<home-manager>' -A install
ln -s ~/nix-conf/home-manager ~/.config
home-manager switch 
