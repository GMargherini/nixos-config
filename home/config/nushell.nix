{
  programs.nushell = {
    enable = true;
    extraConfig = ''
      starship preset nerd-font-symbols -o ~/.config/starship.toml
      mkdir ($nu.data-dir | path join "vendor/autoload")
      starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")
    '';
  };
}
