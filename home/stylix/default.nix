{ pkgs, ... }: {
  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/moonlight.yaml";
    image = ../../wallpaper.png;
    opacity = {
      terminal = 0.7;
      applications = 0.7;
      desktop = 0.7;
      popups = 0.7;
    };
    fonts = {
      serif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Serif";
      };

      sansSerif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Sans";
      };

      monospace = {
        package = pkgs.nerd-fonts.fira-code;
        name = "FiraCode Mono";
      };

      emoji = {
        package = pkgs.noto-fonts-color-emoji;
        name = "Noto Color Emoji";
      };
    };
    cursor = {
      package = pkgs.phinger-cursors;
      name = "phinger-cursors-light";
      size = 32;
    };
    targets = {
      sway = {
        enable = true;
        useWallpaper = true;
      };
      kitty = {
        enable = true;
        opacity.enable = true;
      };
      noctalia-shell.enable = true;
      noctalia.enable = true;
      zed.colors.enable = true;
    };
  };
}
