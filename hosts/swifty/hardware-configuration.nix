{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "thunderbolt" "vmd" "nvme" "usb_storage" "sd_mod" "rtsx_usb_sdmmc" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/mapper/luks-cd91858f-8545-4906-8866-d19abc1a59a9";
      fsType = "btrfs";
    };

  boot.initrd.luks.devices."luks-cd91858f-8545-4906-8866-d19abc1a59a9".device = "/dev/disk/by-uuid/cd91858f-8545-4906-8866-d19abc1a59a9";

  fileSystems."/home" =
    { device = "/dev/mapper/luks-cd91858f-8545-4906-8866-d19abc1a59a9";
      fsType = "btrfs";
      options = [ "subvol=home" ];
    };

  fileSystems."/nix" =
    { device = "/dev/mapper/luks-cd91858f-8545-4906-8866-d19abc1a59a9";
      fsType = "btrfs";
      options = [ "subvol=nix" ];
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/7AA0-83FA";
      fsType = "vfat";
      options = [ "fmask=0077" "dmask=0077" ];
    };

  swapDevices =
    [ { device = "/dev/mapper/luks-b2d91efc-cf5e-4b07-bcc8-984ac5ffd790"; }
    ];

  boot.initrd.luks.devices."luks-b2d91efc-cf5e-4b07-bcc8-984ac5ffd790".device = "/dev/disk/by-uuid/b2d91efc-cf5e-4b07-bcc8-984ac5ffd790";

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

  hardware = {
    cpu.intel.npu.enable = true;
    cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
    bluetooth.enable = true;
    graphics = {
      enable = true;
      extraPackages = with pkgs; [
        vpl-gpu-rt
      ];
    };
  };
}

