{ config, pkgs, ... }:

{
  services.monado = {
    enable = true;
    defaultRuntime = true; # Register as default OpenXR runtime
  };

  systemd.user.services.monado.environment = {
    STEAMVR_LH_ENABLE = "1";
    XRT_COMPOSITOR_COMPUTE = "1";
  };

  programs.envision = {
    enable = true;
    openFirewall = true; # This is set true by default
  };
}
