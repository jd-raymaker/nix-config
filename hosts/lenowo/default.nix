{ config, pkgs, ... }:

{
  services.libinput.enable = true;
  services.printing.enable = false;
  networking.hostName = "lenowo";
}
