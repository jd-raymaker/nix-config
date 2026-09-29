{ config, pkgs, ... }:

{
  users.users."jaydee" = {
    isNormalUser = true;
    description = "JayDee";
    extraGroups = [ "networkmanager" "wheel" "docker" "libvirtd" ];
  };
}
