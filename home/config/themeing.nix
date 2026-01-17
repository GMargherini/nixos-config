{pkgs}:{
  home.pointerCursor = {
    enable = true;
    gtk.enable = true;
    x11.enable = true;
    hyprcursor.enable = true;
    package = pkgs.phinger-cursors;
    name = "phinger-cursors-light";
    size = 32;
  };

  gtk = {
    enable = true;

    theme = {
      package = pkgs.dracula-theme;
      name = "Dracula";
    };

    cursorTheme = {
      package = pkgs.phinger-cursors;
      name = "phinger-cursors-light";
      size = 32;
    };

    iconTheme = {
      package = pkgs.dracula-icon-theme;
      name = "Dracula";
    };

    font = {
      name = "Sans";
      size = 11;
    };
  };
  qt = {
    enable = true;
    platformTheme.name = "adwaita";
    style = {
      name = "Adwaita";
      package = pkgs.adwaita-qt;
    };
  };
}
