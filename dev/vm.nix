{ config, pkgs, ... }:

{
  # VM
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;
}
