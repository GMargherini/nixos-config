{
  programs.nushell = {
    enable = true;
    configFile.text = ''
      $env.config.show_banner = false
      '';
    extraConfig = ''
      starship preset nerd-font-symbols -o ~/.config/starship.toml
      mkdir ($nu.data-dir | path join "vendor/autoload")
      starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")
    '';
  };
}
