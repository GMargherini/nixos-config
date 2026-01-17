{ pkgs, ... }: {

  programs.ghostty = {
      enable = true;
      settings = {
          theme = "Material Darker";
          command = "nu";
          font-family = "FiraCode Nerd Font Mono";
	  background-opacity = 1;
        };
    };
}
