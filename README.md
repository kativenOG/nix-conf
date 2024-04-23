# NixOS Config

### Nixos
Go to ``nixos/networking/networks.nix`` and setup wifi (in the cloned repository) <br/>
Copy ``/etc/nixos/hardware-configuration.nix`` to ``nixos/hardware-optimization``
```
cp /etc/nixos/hardware-configuration.nix ~/nixos-config/nixos/hardware-optimization/
```
Symlink this repository to ``/etc`` <br/>
```
cd /etc
```
```
sudo rm -rf nixos
```
```
sudo ln -s ~/nixos-config/nixos/ .
```
Rebuild your system
```
sudo nixos-rebuild switch
```
### Home manager
Download home-manager standalone:
```
sudo nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
sudo nix-channel --update
```
Symlink ``home-manager`` directory to ``~/.config`` <br/>
```
cd ~/.config
```
```
rm -rf nixpkgs
```
```
ln -s ~/nixos-config/home-manager/ nixpkgs
home-manager switch
```
### Sway
Symlink sway config <br/>
```
cd ~/.config
```
```
ln -s ~/nixos-config/nixos/wayland/sway/ .
```
