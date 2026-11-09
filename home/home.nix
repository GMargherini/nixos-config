{
  pkgs,
  pkgs-stable,
  lib,
  nixvim,
  stylix,
  ...
}:

{
  home = {

    # Home Manager needs a bit of information about you and the paths it should
    # manage.
    username = "dolphin";
    homeDirectory = "/home/dolphin";

    # This value determines the Home Manager release that your configuration is
    # compatible with. This helps avoid breakage when a new Home Manager release
    # introduces backwards incompatible changes.
    #
    # You should not change this value, even if you update Home Manager. If you do
    # want to update the value, then make sure to first check the Home Manager
    # release notes.
    stateVersion = "25.05"; # Please read the comment before changing.

    # The home.packages option allows you to install Nix packages into your
    # environment.
    packages =
      let
        unstable = with pkgs; [
          adwaita-icon-theme
          alacritty
          asunder
          audacity
          bat
          calc
          cbonsai
          cdrkit
          clamav
          cowsay
          discord
          dolphin-emu
          fastfetch
          ffmpeg
          fzf
          ghostty
          grim
          heimdall
          heroic
          htop
          inkscape
          kdePackages.isoimagewriter
          kdePackages.kdeconnect-kde
          kdePackages.ktorrent
          kdePackages.partitionmanager
          kdePackages.polkit-kde-agent-1
          kitty
          lact
          lame
          libreoffice
          libxml2
          lua-language-server
          mpv
          newsboat
          nil
          nixd
          nixpkgs-fmt
          nvtopPackages.amd
          ollama-vulkan
          # pdftk
          perf
          qutebrowser
          remmina
          (retroarch.withCores (
            cores: with cores; [
              pkgs.libretro.citra
              dolphin
              mgba
              snes9x
              mupen64plus
            ]
          ))
          ripgrep
          ripgrep-all
          ryubing
          scrcpy
          shipwright
          slurp
          starship
          stylua
          swayfx
          tdf
          unrar
          uutils-coreutils-noprefix
          vlc
          webcamoid
          wineWow64Packages.staging
          yazi
          zed-editor
        ];
        stable = with pkgs-stable; [
          lutris
          pika-backup

          fira
          fira-code
          fira-code-symbols
          font-awesome
          liberation_ttf
          mplus-outline-fonts.githubRelease
          proggyfonts
        ];
      in
      stable ++ unstable;
      # Home Manager can also manage your environment variables through
      # 'home.sessionVariables'. These will be explicitly sourced when using a
      # shell provided by Home Manager. If you don't want to manage your shell
      # through Home Manager then you have to manually source 'hm-session-vars.sh'
      # located at either
      #
      # ~/.nix-profile/etc/profile.d/hm-session-vars.sh
      #
      # or
      #
      #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
      #
      # or
      #
      #  /etc/profiles/per-user/dolphin/etc/profile.d/hm-session-vars.sh
      #
      sessionVariables = {
        EDITOR = "vim";
      };
  };

  fonts.fontconfig.enable = true;
  programs.git = {
    enable = true;
    settings.user = {
      name = "GMargherini";
      email = "giorgio.margherini@gmail.com";
    };
  };

  imports = [
    ./config/yt-dlp.nix
    ./config/starship.nix
    ./kitty/default.nix
    (import ./nixvim/default.nix {
      lib = lib;
      pkgs = pkgs;
    })
    (import ./config/lutris.nix { pkgs = pkgs-stable; })
    (import ./sway/default.nix {
      lib = lib;
      pkgs = pkgs;
    })
    (import ./helix/default.nix { pkgs = pkgs; })
    # ./config/themeing.nix
    nixvim
    ./stylix/default.nix
    stylix
  ];
  programs = {
    yazi = {
      enable = true;
      shellWrapperName = "y";
    };
    zellij.enable = true;
    ripgrep.enable = true;
    mpv.enable = true;
    home-manager.enable = true;
  };

  services = {
    kdeconnect.enable = true;
  };
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "text/html" = "firefox";
      "x-scheme-handler/http" = "firefox";
      "x-scheme-handler/https" = "firefox";
      "inode/directory" = "cosmic-files";
      "application/pdf" = "cosmic-viewer";
    };
  };
}
