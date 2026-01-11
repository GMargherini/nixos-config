{pkgs, ...}:{
  programs.hyprland = {
    enable = true;
    withUWSM = false;
    xwayland.enable = true;
  };
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
  };
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    icu
    harfbuzzFull
    SDL2
    skia
    glfw
    libsoundio
  ];
  programs.partition-manager.enable = true;
  programs.dconf.enable = true;
  programs.kdeconnect.enable = true;
}
