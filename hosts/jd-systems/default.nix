{ config, pkgs, ... }:

{
  #services.xserver.libinput.enable = true;
  services.printing.enable = false;
  networking.hostName = "jd-systems";
}

