{ pkgs, ... }: {

  programs.ghostty = {
    enable = true;
    settings = {
      theme = "Nord"; #"Material Darker";
      command = "nu";
      font-family = "FiraCode Nerd Font Mono";
      background-opacity = 1;
      window-decoration = "none";
    };
  };
}
