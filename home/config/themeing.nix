{ pkgs }: {
  home.pointerCursor = {
    enable = true;
    gtk.enable = true;
    x11.enable = true;
    hyprcursor.enable = true;
    package = pkgs.phinger-cursors;
    name = "phinger-cursors-light";
    size = 32;
    sway.enable = true;
  };

  gtk = {
    enable = true;

    theme = {
<<<<<<< HEAD
      name = "Adwaita-dark";
      package = pkgs.gnome-themes-extra;
=======
      package = pkgs.dracula-theme;
      name = "Dracula";
>>>>>>> vivobook
    };
    colorScheme = "dark";

    cursorTheme = {
      package = pkgs.phinger-cursors;
      name = "phinger-cursors-light";
      size = 32;
    };

    iconTheme = {
<<<<<<< HEAD
      package = pkgs.tela-icon-theme;
      name = "Tela-green";
=======
      package = pkgs.dracula-icon-theme;
      name = "Dracula";
>>>>>>> vivobook
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
      name = "Adwaita-dark";
      package = pkgs.adwaita-qt;
    };
  };
}
