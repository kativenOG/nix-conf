{config, pkgs, ...}:
{
# No display manager, directly boot into wm 
services.greetd = { 
  enable = true;
  settings = rec {
    initial_session = {
      command = "${pkgs.sway}/bin/sway";
      user = "kativen";
    };
    default_session = initial_session;
  };
};
}
