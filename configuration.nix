# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, pkgs-stable, ... }:
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./configs/programs.nix
      # (import ./configs/amdgpu.nix {config=config; pkgs=pkgs;})
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.extraModprobeConfig = "options hid_apple fnmode=2";
  boot.kernelParams = [
    "video=DP-1:3840x2160@60"
    "video=DP-2:2560x1440@60"
    "video=HDMI-A-1:3840x2160@60"
  ];
  boot.initrd.kernelModules = ["amdgpu"];

  security.polkit.enable = true;
  networking.hostName = "mainframe"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Rome";
  time.hardwareClockInLocalTime = false;

  # Select internationalisation properties.
  i18n.defaultLocale = "en_GB.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "it_IT.UTF-8";
    LC_IDENTIFICATION = "it_IT.UTF-8";
    LC_MEASUREMENT = "it_IT.UTF-8";
    LC_MONETARY = "it_IT.UTF-8";
    LC_NAME = "it_IT.UTF-8";
    LC_NUMERIC = "it_IT.UTF-8";
    LC_PAPER = "it_IT.UTF-8";
    LC_TELEPHONE = "it_IT.UTF-8";
    LC_TIME = "it_IT.UTF-8";
  };

  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  services.xserver.enable = false;

  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm.enable = false;
  services.desktopManager.gnome.enable = false;
  services.gnome.games.enable = false;
  services.desktopManager.cosmic.enable = true;
  
  services.displayManager.ly = {
    enable = true;
    settings = {
      animation = "matrix";
      bigclock = "en";
    };
  };
  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };
  

  systemd.services.lact = {
    description = "AMDGPU Control Daemon";
    after = ["multi-user.target"];
    wantedBy = ["multi-user.target"];
    serviceConfig = {
      ExecStart = "${pkgs.lact}/bin/lact daemon";
    };
    enable = true;
  };
  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.dolphin = {
    isNormalUser = true;
    description = "Dolphin";
    extraGroups = [ "networkmanager" "wheel" "input" "adbusers" ];
  };

  # Install firefox.
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages =
    let 
      unstable = with pkgs; [
      file
      gcc
      git
      hyprpolkitagent
      ly
      neovim
      pmbootstrap
      pwvucontrol
      rustup
      tree
      unzip
      uutils-coreutils-noprefix
      vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
      wget
      zig
      zip
    ];
    stable = with pkgs-stable; [
      cmake
    ];
    in unstable ++ stable;


  fonts.packages = with pkgs; [ 
    fira-code-symbols
    nerd-fonts.fira-code
  ];
  
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [ xdg-desktop-portal-hyprland ];
  };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  networking.firewall = rec {
    allowedTCPPortRanges = [ { from = 1714; to = 1764; } ];
    allowedUDPPortRanges = allowedTCPPortRanges;
  };
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  virtualisation.docker = {
    enable = true;
    rootless.enable = true;
    rootless.setSocketVariable = true;
  };
  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?

}
