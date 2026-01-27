{pkgs, ...}:{
  programs = {
    niri.enable = true;
    hyprland = {
      enable = true;
      withUWSM = false;
      xwayland.enable = true;
    };
    steam = {
      enable = true;
      remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
      dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
      localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
    };
    nix-ld.enable = true;
    nix-ld.libraries = with pkgs; [
      icu
      harfbuzzFull
      SDL2
      skia
      glfw
      libsoundio
    ];
    partition-manager.enable = true;
    dconf.enable = true;
    kdeconnect.enable = true;   
  };
}
