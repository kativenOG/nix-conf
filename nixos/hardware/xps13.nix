{ lib, pkgs, config, ... }:
with lib;                      
let
  ivsc-firmware = with pkgs;
    stdenv.mkDerivation rec {
      pname = "ivsc-firmware";
      version = "main";

      src = pkgs.fetchFromGitHub {
        owner = "intel";
        repo = "ivsc-firmware";
        rev = "10c214fea5560060d387fbd2fb8a1af329cb6232";
        sha256 = "sha256-kEoA0yeGXuuB+jlMIhNm+SBljH+Ru7zt3PzGb+EPBPw=";
      };

      installPhase = ''
        mkdir -p $out/lib/firmware/vsc/soc_a1_prod

        cp firmware/ivsc_pkg_ovti01a0_0.bin $out/lib/firmware/vsc/soc_a1_prod/ivsc_pkg_ovti01a0_0_a1_prod.bin
        cp firmware/ivsc_skucfg_ovti01a0_0_1.bin $out/lib/firmware/vsc/soc_a1_prod/ivsc_skucfg_ovti01a0_0_1_a1_prod.bin
        cp firmware/ivsc_fw.bin $out/lib/firmware/vsc/soc_a1_prod/ivsc_fw_a1_prod.bin
      '';
    };
  cfg = config.services.xps13;
in
{
  options.services.xps13 = {
    enable = mkEnableOption "camera support for xps13";
  };

  config = mkIf cfg.enable {
		boot.initrd.availableKernelModules = [ "xhci_pci" "thunderbolt" "nvme" "usb_storage" "usbhid" "sd_mod" "i915" ];

  	# https://discourse.nixos.org/t/i915-driver-has-bug-for-iris-xe-graphics/25006/10
  	# resolved: i915 0000:00:02.0: [drm] Selective fetch area calculation failed in pipe A
  	boot.kernelParams = [
  	  "i915.enable_psr=0"
  	];

  	powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";

  	# Tracking Issue: Intel MIPI/IPU6 webcam-support
  	# https://github.com/NixOS/nixpkgs/issues/225743#issuecomment-1849613797
  	# Infrastructure Processing Unit
  	hardware.ipu6 = {
  	  enable = true;
  	  platform = "ipu6ep";
  	};
  	hardware.enableRedistributableFirmware = true;
  	hardware.firmware = [
  	  ivsc-firmware
  	];
	};
}
