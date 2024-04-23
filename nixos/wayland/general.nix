{ config, pkgs, ...}:
{
  environment.extraInit = ''
      #Turn off gui for ssh auth
      unset -v SSH_ASKPASS
    '';
  users.users.kativen.extraGroups = [ "video" ];
  programs.light.enable = true;
}
