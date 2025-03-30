{ config, pkgs, ... }:

{
 #Corectrl
  programs.corectrl = {
    enable = true;
    gpuOverclock = {
      enable = true;
      ppfeaturemask = "0xffffffff";
    };
  };
  boot.kernelParams = [ "amdgpu.ppfeaturemask=0xffffffff" ];
}
