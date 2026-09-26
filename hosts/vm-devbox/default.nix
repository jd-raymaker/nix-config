{ config, pkgs, ... }:

{
  networking.hostName = "vm-devbox";

  environment.systemPackages = with pkgs; [
    spice-vdagent
  ];

  services.qemuGuest.enable = true;
  services.spice-vdagentd.enable = true;
}
