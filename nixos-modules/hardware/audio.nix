{lib, config, pkgs, ...}:
with lib;
let 
  cfg = config.services.audio;
in {
	 
  options.services.audio= {
    enable = mkEnableOption "enable audio on device";
  };

	config = mkIf cfg {
		security.rtkit.enable = true;
  	services.pipewire = {
  	  enable = true;
  	  alsa.enable = true;
  	  alsa.support32Bit = true;
  	  pulse.enable = true;
  	  jack.enable = true;
  	};
  };	 
}
