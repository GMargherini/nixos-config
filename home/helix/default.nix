{pkgs, ...}:{
  programs.helix = {
    enable = true;
    package = pkgs.evil-helix;
    settings = {
      theme = "material_darker";
      editor = {
        line-number = "relative";
        lsp.display-messages = true;
        lsp.display-inlay-hints = true;
        indent-guides.render = true;
        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };
      };
    };
    languages = {
      language-server.typescript-language-server = {
        command = "rust-analyzer";
      };
      language-server.ruff-lsp = {
        command = "ruff-lsp";
      };
      language = [
        {
          name = "rust";
          auto-format = true;
          formatter.command = "cargo fmt";
          language-servers = [
            "rust-analyzer"
          ];
        }
        {
           name = "python";
           language-servers = [
             "pyright"
             "ruff-lsp"
           ];
        }
      ];
    };
  };
}
