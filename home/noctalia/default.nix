{ inputs, ... }:
{
  home-manager.users.dolphin = {
    # import the home manager module
    imports = [
      inputs.noctalia.homeModules.default
    ];

#     home.file.".cache/noctalia/wallpapers.json" = {
#       text = builtins.toJSON {
#         defaultWallpaper = "/home/dolphin/Pictures/Wallpapers/4K/gruvbox-rainbow-nix.png";
#       };
#     };
    # configure options
    programs.noctalia = {
      enable = true;
      systemd.enable = true;
      settings = {
        # configure noctalia here; defaults will
        # be deep merged with these attributes.
        bar = {
          thickness = 24;
          background_opacity = 0.0;
          density = "compact";
          position = "top";
          useSeparateOpacity = true;
          # backgroundOpacity = 0;
          showCapsule = true;
          floating = false;
          widgets = {
            start = [
              "launcher"
              "workspaces"
            ];
            center = [
              {
                formatHorizontal = "ddd, dd MMM HH:mm";
                formatVertical = "HH mm";
                id = "clock";
                useMonospacedFont = true;
                usePrimaryColor = true;
              }
            ];
            end = [
              "media"
              "network"
              "volume"
              "tray"
              "battery"
              "notifications"
              "session"
            ];
          };
        };
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
