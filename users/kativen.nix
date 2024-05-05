# Standard user Configuration
{ config, pkgs, lib, ... }:
with lib;                      
{
	users.users.kativen = {
    isNormalUser = true;
    extraGroups = [ "wheel" "docker" "networkmanager" "video"]; 
  };

	# Shell 
	environment.systemPackages = pkgs.zsh;
  programs.zsh.enable=true;
  users.users.kativen.shell= pkgs.zsh;

  # Enable flakes and the CLI tool 
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}

