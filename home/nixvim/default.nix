{ ... }: {
  programs.nixvim = {
    enable = true;
    colorschemes.gruvbox.enable = true;
    lsp.inlayHints = {
	enable = false;
    };
    plugins = {
      rustaceanvim = {
        enable = true;
        settings = {
          server = {
            cmd = [
              "rust-analyzer"
            ];
            default_settings = {
              rust-analyzer = {
                check = {
                  command = "clippy";
                };
                inlayHints = {
                  lifetimeElisionHints = {
                    enable = "always";
                  };
                };
              };
            };
            standalone = false;
          };
        };
      };
      lightline.enable = true;
      mini-completion.enable = true;
    };
    imports = [ ];
  };
}
