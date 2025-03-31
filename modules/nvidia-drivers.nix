{ config, pkgs, ... }: 

{
  hardware.opengl = {
    enable = true;
    driSupport32Bit = true; # necessary for old games and the steam client, so important!
  };

  hardware.amdgpu.opencl.enable = true;

  services.xserver.videoDrivers = ["amdgpu" "nvidia"];
  hardware.nvidia = {

    # Modesetting is required.
    modesetting.enable = true;

    # Nvidia power management. Experimental, and can cause sleep/suspend to fail.
    # Enable this if you have graphical corruption issues or application crashes after waking
    # up from sleep. This fixes it by saving the entire VRAM memory to /tmp/ instead 
    # of just the bare essentials.
    powerManagement.enable = true; # aurora 1070ti does get graphics corruption on wake

    # Fine-grained power management. Turns off GPU when not in use.
    # Experimental and only works on modern Nvidia GPUs (Turing or newer - RTX 2000 series+).
    powerManagement.finegrained = false; # 1070Ti isn't Turing 

    # Use the NVidia open source kernel module (not to be confused with the
    # independent third-party "nouveau" open source driver).
    # Support is limited to the Turing and later architectures. Full list of 
    # supported GPUs is at: 
    # https://github.com/NVIDIA/open-gpu-kernel-modules#compatible-gpus 
    # Only available from driver 515.43.04+
    # Currently alpha-quality/buggy, so false is currently the recommended setting.
    open = false;

    # Enable the Nvidia settings menu,
	# accessible via `nvidia-settings`.
    nvidiaSettings = true;

    # Optionally, you may need to select the appropriate driver version for your specific GPU.
    # package = config.boot.kernelPackages.nvidiaPackages.stable; # correct driver for 1070ti as of 2024, will change in future.
    package = config.boot.kernelPackages.nvidiaPackages.latest; # correct driver for 4060  as of 2024, will change in future.
   # package = config.boot.kernelPackages.nvidiaPackages.legacy_470; # correct drvier for meliodas gtx860m
  };

#  Prime power management for Laptops that have integrated and discreet gpus (like meliodas)
#  hardware.nvidia.prime = {
#     # Make sure to use the correct Bus ID values for your system!
#   intelBusId = "PCI:0:2:0";
#   nvidiaBusId = "PCI:1:0:0";
# 
#       sync.enable = true;
#  };
}
