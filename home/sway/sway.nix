{ lib, pkgs, ... }:
{
  xdg.configFile = {
    "sway/config".source = lib.mkForce ./config;
    "sway/config.d/containers.conf".source = ./config.d/containers.conf;
    "sway/config.d/inputs.conf".source = ./config.d/inputs.conf;
    "sway/config.d/layout.conf".source = ./config.d/layout.conf;
    "sway/config.d/outputs.conf".source = ./config.d/outputs.conf;
  };

  wayland.windowManager.sway = {
    enable = true;
    package = pkgs.swayfx;
    wrapperFeatures.gtk = true;
    config = rec {
      startup = [
        { command = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1"; }
      ];
    };
  };
}
