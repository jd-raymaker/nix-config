{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "ehci_pci" "ahci" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/mapper/luks-9b676f35-f3f4-4d11-9831-f96dd1532cce";
      fsType = "btrfs";
    };

  boot.initrd.luks.devices."luks-9b676f35-f3f4-4d11-9831-f96dd1532cce".device = "/dev/disk/by-uuid/9b676f35-f3f4-4d11-9831-f96dd1532cce";

  fileSystems."/home" =
    { device = "/dev/mapper/luks-9b676f35-f3f4-4d11-9831-f96dd1532cce";
      fsType = "btrfs";
      options = [ "subvol=home" ];
    };

  fileSystems."/nix" =
    { device = "/dev/mapper/luks-9b676f35-f3f4-4d11-9831-f96dd1532cce";
      fsType = "btrfs";
      options = [ "subvol=nix" ];
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/4684-FA42";
      fsType = "vfat";
      options = [ "fmask=0077" "dmask=0077" ];
    };

  swapDevices =
    [ { device = "/dev/mapper/luks-be7202ef-8e64-4280-b86d-77a6bb3b2c05"; }
    ];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
