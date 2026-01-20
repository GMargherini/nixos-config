{ inputs, ... }:
{
  home-manager.users.dolphin = {
    # import the home manager module
    imports = [
      inputs.noctalia.homeModules.default
    ];

    home.file.".cache/noctalia/wallpapers.json" = {
      text = builtins.toJSON {
        defaultWallpaper = "/home/dolphin/Pictures/green-sky-mountains-and-trees.jpg";
      };
    };
    # configure options
    programs.noctalia-shell = {
      enable = true;
      settings = {
        # configure noctalia here; defaults will
        # be deep merged with these attributes.
        bar = {
          density = "compact";
          position = "top";
          showCapsule = false;
          floating = false;
          widgets = {
            left = [
              {
                id = "Launcher";
              }
              {
                hideUnoccupied = false;
                id = "Workspace";
                labelMode = "index";
              }
            ];
            center = [
              {
                formatHorizontal = "ddd, dd MMM HH:mm";
                formatVertical = "HH mm";
                id = "Clock";
                useMonospacedFont = true;
                usePrimaryColor = true;
              }
            ];
            right = [
              {
                id = "MediaMini";
              }
              {
                id = "WiFi";
              }
              {
                id = "SystemMonitor";
              }
              {
                id = "Bluetooth";
              }
              {
                id = "Volume";
              }
              {
                id = "Brightness";
              }
              {
                alwaysShowPercentage = false;
                id = "Battery";
                warningThreshold = 30;
              }
              {
                id = "Tray";
              }
              {
                id = "SidePanelToggle";
                useDistroLogo = true;
              }
            ];
          };
        };
        colorSchemes.predefinedScheme = "Eldritch";
        general = {
          avatarImage = "/home/dolphin/.face";
          radiusRatio = 0.0;
          enableShadows = false;
        };
        location = {
          monthBeforeDay = false;
          name = "Milan, Italy";
        };
        dock = {
          enabled = false;
        };
        wallpaper = {
          enabled = true;
        };
      };
      # this may also be a string or a path to a JSON file,
      # but in this case must include *all* settings.
    };
  };
}
