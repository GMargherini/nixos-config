{ pkgs, inputs, ... }: {
  home-manager.users.dolphin = {
    imports = [ inputs.nixvim.homeModules.nixvim ];
    programs.nixvim = {
      enable = true;
      colorschemes.gruvbox.enable = true;
      opts = {
        number = true;
        relativenumber = true;
      };
      plugins = {
        lightline.enable = true;
        bacon.enable = true;
        mini-completion.enble = true;
        conform-nvim = {
          enable = true;
          settings = {
            formatters_by_ft.rust = [ "rustfmt" ];
            formatters_by_ft.nix = [ "nixpkgs-fmt" ];
          };
        };
        lsp = {
          inlayHints.enable = true;
          servers = {
            nil_ls = {
              enable = true;
              config = {
                cmd = [
                  "nil"
                ];
                filetypes = [ "nix" ];
              };
            };
            nixd.enable = true;
            ruff.enable = true;
          };
          rust_analyzer = {
            enable = true;
            installCargo = true;
            installRustc = true;
            installRustfmt = true;
            settings = {
              inlayHints = {
                chainingHints.enable = true;
                closureReturnTypeHints.enable = "always";
                parameterHints.enable = true;
                typeHints.enable = true;
              };
            };
          };
        };
        lspconfig.enable = true;
        nix.enable = true;
        rustaceanvim = {
          enable = true;
          tools.enable_clippy = true;
          server = {
            default_settings = {
              inlayHints = { lifetimeElisionHints = { enable = "always"; }; };
              rust-analyzer = {
                cargo = { allFeatures = true; };
                check = { command = "clippy"; };
                files = { excludeDirs = [ "target" ".git" ".cargo" ".github" ".direnv" ]; };
              };
            };
          };
        };
      };
      extraPlugins = with pkgs.vimPlugins; [
        vim-autoformat
      ];
    };
  };
}
