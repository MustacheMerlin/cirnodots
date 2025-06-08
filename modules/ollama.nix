{ config, pkgs, ... }:

{
  environment.systemPackages = [
   (pkgs.ollama.override {
      acceleration = "rocm";
    })
  ];

  services.open-webui = {
    enable = true;
    port = 1111;
    openFirewall = true;
  };


}
