{ config, pkgs, ... }:

{
  # vmware-vmx will cause kcompactd0 due to Transparent Hugepages feature in kernel. Disable it
  boot.kernelParams = [ "transparent_hugepage=never" ];

  virtualisation.vmware.host.enable = true;
  virtualisation.vmware.host.extraConfig = ''
    # Allow unsupported device's OpenGL and Vulkan acceleration for guest vGPU
    mks.gl.allowUnsupportedDrivers = "TRUE"
    mks.vk.allowUnsupportedDevices = "TRUE"
  '';
}
