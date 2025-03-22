{ config, pkgs, ... }:

{
  services.xserver.enable = true;

  services.xserver.windowManager.awesome = {
      enable = true;
      luaModules = with pkgs.luaPackages; [
          luarocks # is the package manager for Lua modules
          luadbi-mysql # Database abstraction layer
      ];

  };

  services.xserver.displayManager = {
      sddm.enable = true;
      defaultSession = "none+awesome";
  };
}
