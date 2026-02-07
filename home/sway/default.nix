{ lib, pkgs, ... }:
{
  xdg.configFile = {
    "sway/config".source = lib.mkForce ./config;
    "sway/config.d/containers.conf".source = ./containers.conf;
    "sway/config.d/inputs.conf".source = ./inputs.conf;
    "sway/config.d/layout.conf".source = ./layout.conf;
    "sway/config.d/outputs.conf".source = ./outputs.conf;
  };

  wayland.windowManager.sway = {
    enable = true;
    package = pkgs.swayfx;
    wrapperFeatures.gtk = true;
    config = {
      startup = [
        { command = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1"; }
      ];
    };
  };
}
