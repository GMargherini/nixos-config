{pkgs, ...}: {
  programs.lutris = {
    enable = false;
    winePackages = [pkgs.wine];
    runners = {
    };
  };
}
