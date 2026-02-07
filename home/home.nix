{ pkgs, pkgs-stable, lib, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "dolphin";
  home.homeDirectory = "/home/dolphin";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "25.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages =
    let
      unstable = with pkgs; [
        adwaita-icon-theme
        alacritty
        audacity
        bat
        calc
        cbonsai
        cowsay
        devtoolbox
        discord
        dolphin-emu
        fastfetch
        fzf
        ghostty
        godot
        grim
        heroic
        htop
        hyprcursor
        hyprland
        inkscape
        kdePackages.isoimagewriter
        kdePackages.kdeconnect-kde
        kdePackages.ktorrent
        kdePackages.partitionmanager
        kdePackages.polkit-kde-agent-1
        lact
        libreoffice
        lua-language-server
        mpv
        nautilus
        newsboat
        nil
        nixpkgs-fmt
        nushell
        nvtopPackages.amd
        obsidian
        onlyoffice-desktopeditors
        perf
        qutebrowser
        remmina
        (retroarch.withCores (cores: with cores; [
          dolphin
          mgba
          snes9x
          mupen64plus
        ]))
        ripgrep
        ripgrep-all
        ryubing
        scrcpy
        slurp
        starship
        stylua
        swayfx
        tdf
        texlive.combined.scheme-full
        vimPlugins.LazyVim
        vlc
        webcamoid
        wineWowPackages.staging
        yazi
        zed-editor
        zellij

        fira
        fira-code
        fira-code-symbols
        font-awesome
        liberation_ttf
        mplus-outline-fonts.githubRelease
        noto-fonts
        noto-fonts-color-emoji
        proggyfonts
      ];
      stable = with pkgs-stable; [
        pika-backup
      ];
    in
    stable ++ unstable;

  fonts.fontconfig.enable = true;
  programs.git = {
    enable = true;
    settings.user.name = "GMargherini";
    settings.user.email = "giorgio.margherini@gmail.com";
  };

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
  home.sessionVariables = {
    # EDITOR = "emacs";
  };
  imports = [
    ./config/yt-dlp.nix
    ./hypr/hyprland.nix
    ./config/ghostty.nix
    ./config/lutris.nix
    ./config/starship.nix
    ./config/nushell.nix
    ./rofi/default.nix
    (import ./sway/default.nix { lib = lib; pkgs = pkgs; })
    (import ./helix/default.nix { pkgs = pkgs; })
    (import ./config/themeing.nix { pkgs = pkgs; })
  ];
  programs = {
    yazi.enable = true;
    zellij.enable = true;
    ripgrep.enable = true;
    mpv.enable = true;
    home-manager.enable = true;
  };

  services = {
    polkit-gnome.enable = true;
    kdeconnect.enable = true;
  };
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "text/html" = "firefox";
      "x-scheme-handler/http" = "firefox";
      "x-scheme-handler/https" = "firefox";
      "inode/directory" = "nautilus";
      "application/pdf" = "cosmic-reader";
    };
  };
  systemd.user.services.polkit-gnome-authentication-agent-1 = {
    Unit = {
      Description = "polkit-gnome-authentication-agent-1";
      Wants = [ "graphical-session.target" ];
      After = [ "graphical-session.target" ];
    };
    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
    Service = {
      Type = "simple";
      ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
      Restart = "on-failure";
      RestartSec = 1;
      TimeoutStopSec = 10;
    };
  };
}
