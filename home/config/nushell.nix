{
  programs.nushell = {
    enable = true;
<<<<<<< HEAD
    configFile.text = ''
      $env.config.show_banner = false
      '';
=======
>>>>>>> vivobook
    extraConfig = ''
      starship preset nerd-font-symbols -o ~/.config/starship.toml
      mkdir ($nu.data-dir | path join "vendor/autoload")
      starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")
    '';
  };
}
