{ pkgs, ... }: {
  programs.nixvim = {
    enable = true;
    colorschemes.gruvbox.enable = true;
    lsp = {
      inlayHints = {
        enable = true;
      };
      codelens = {
        enable = true;
      };

      servers = {
        ruff = {
          enable = true;
          config = {
            filetypes = [ "python" ];
          };
        };
        ty = {
          enable = true;
          config = {
            filetypes = [ "python" ];
          };
        };
        hls = {
          enable = false;
          config = {
            filetypes = [ "haskell" ];
          };
        };
      };
    };
    opts = {
      number = true;
      relativenumber = true;
      termguicolors = true;
      shiftwidth = 2;
      softtabstop = 2;
      tabstop = 2;
      expandtab = true;
      wrap = false;
    };
    plugins = {
      autoclose.enable = true;
      tiny-inline-diagnostic.enable = true;
      lspconfig.enable = true;
      barbar = {
        enable = true;
        package = pkgs.vimPlugins.barbar-nvim;
      };
      web-devicons = {
        enable = true;
        package = pkgs.vimPlugins.nvim-web-devicons;
      };
      conform-nvim = {
        enable = true;
        settings = {
          format_on_save = {
            lsp_fallback = "fallback";
            timeout_ms = 500;
          };
          formatters_by_ft = {
            python = [ "ruff" ];
            nix = [ "nixpkgs-fmt" ];
          };
        };
      };
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
      telescope.enable = true;
      haskell-tools.enable = true;
      dap = {
        enable = true;
      };
    };
    imports = [ ];
  };
}
