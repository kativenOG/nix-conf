# /etc/nixos/hardware-configuration.nix
{ config, lib, pkgs, modulesPath, ... }:

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
in
{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "thunderbolt" "nvme" "usb_storage" "usbhid" "sd_mod" "i915" ];
  boot.initrd.kernelModules = [];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [];

  # https://discourse.nixos.org/t/i915-driver-has-bug-for-iris-xe-graphics/25006/10
  # resolved: i915 0000:00:02.0: [drm] Selective fetch area calculation failed in pipe A
  boot.kernelParams = [
    "i915.enable_psr=0"
  ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/5cfd71ea-6978-427b-9b10-75249bcc63ff";
      fsType = "ext4";
    };

  boot.initrd.luks.devices."luks-5f6a700d-cfdb-492c-b52d-d875e818631c".device = "/dev/disk/by-uuid/5f6a700d-cfdb-492c-b52d-d875e818631c";

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/F642-A1B7";
      fsType = "vfat";
    };

  swapDevices = [ ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp0s13f0u1u4.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp0s20f3.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
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


  # environment.etc.camera.source = "${ipu6-camera-hal}/share/defaults/etc/camera";
}
