 #!/usr/bin/env bash
set -e 

# Setup NixOs
rm ~/nix-conf/nixos/hardware/hardware-configuration.nix
cp /etc/nixos/hardware-configuration.nix ~/nix-conf/nixos/hardware/
cd /etc && sudo rm -rf nixos && sudo ln -s ~/nixos-config/nixos/ .

# Setup Sway 
cd ~/.config && ln -s ~/nixos-config/nixos/wayland/sway/ .
sudo nixos-rebuild switch

# Add home-manager and Unstable channels
sudo nix-channel --add https://nixos.org/channels/nixpkgs-unstable unstable
nix-channel --add https://github.com/nix-community/home-manager/archive/release-23.11.tar.gz home-manager
nix-channel --update
# eg: nix-env -iA unstable.your-package-name # Install Unstable package  

# Setup Home-Manager
nix-shell '<home-manager>' -A install
cd ~/.config && ln -s ~/nix-conf/home-manager . 
home-manager switch 
