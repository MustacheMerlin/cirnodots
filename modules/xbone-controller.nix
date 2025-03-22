{ config, pkgs, ...}:

{
  boot.extraModulePackages = with config.boot.kernelPackages; [ xone ];
  boot.blacklistedKernelModules = [ "xpad" ];
}
