{
  programs.kitty = {
    enable = true;
    settings = {
      font_family = "FiraCodeNerdFontMono";
      # background_opacity = "0.7";
      shell = "fish";
    };
    # themeFile = "gruvbox-dark";
    shellIntegration.enableFishIntegration = true;
  };
}
