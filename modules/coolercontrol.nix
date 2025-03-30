{ config, pkgs, ... }:

{

  programs.coolercontrol.enable = true;
  programs.coolercontrol.nvidiaSupport = true;
}
