{
  home.file.".config/rofi/config.rasi".text = ''
    // Write your configuration

    @theme "~/.config/rofi/themes/my_theme.rasi"
    listview {
      columns:       1;
      lines:         5;
      cycle:         true;
      dynamic:       true;
      layout:        vertical;
      flow:          vertical;
      reverse:       false;
      fixed-height:  true;
      fixed-columns: true;
    }

  '';
  home.file.".config/rofi/themes/my_theme.rasi".text = ''
   /*
 * ROFI color theme
 *
 * Based on Base16 Material Color Scheme (https://github.com/ntpeters/base16-materialtheme-scheme)
 *
 * Modified by: Dave Davenport
 * User: Tomaszal
 * Copyright: Tomas Zaluckij
 */

* {
        base00: #263238;
        base01: #2E3C43;
        base02: #314549;
        base03: #546E7A;
        base04: #B2CCD6;
        base05: #EEFFFF;
        base06: #EEFFFF;
        base07: #FFFFFF;
        base08: #F07178;
        base09: #F78C6C;
        base0A: #FFCB6B;
        base0B: #C3E88D;
        base0C: #89DDFF;
        base0D: #2E8B57;
        base0E: #C792EA;
        base0F: #FF5370;

        /*base0D: #00BCD4;*/

        spacing: 0;
        background-color: transparent;
        font: "FiraCode Nerd Font 16";

}

window {
        transparency: "real";
        background-color: #80808010; /*base00 + CC (80% opacity)*/
        border-radius: 10px;
        width: 30%;
}

mainbox {
        children: [inputbar, message, listview];
        spacing: 30px;
        padding: 30px 0;
        border: 1px;
        border-color: @base0D;
        border-radius: 10px;
}

inputbar {
        padding: 0 30px;
        children: [prompt, textbox-prompt-colon, entry, case-indicator];
}

prompt {
        text-color: @base0D;
}

textbox-prompt-colon {
        expand: false;
        str: ":";
        margin: 0 1ch 0 0;
        text-color: @base0D;
}

entry {
        text-color: @base07;
}

case-indicator {
        text-color: @base0F;
}

mode-switcher, message {
        border: 1px 0;
        border-color: @base0D;
}

button, textbox {
        background-color: @base03;
        text-color: @base07;
        padding: 5px;
}

button selected {
        background-color: @base0D;
}

listview {
        scrollbar: true;
        margin: 0 10px 0 30px;
}

scrollbar {
        background-color: @base03;
        handle-color: @base0D;
        handle-width: 10px;
        border: 0 1px;
        border-radius: 10px;
        border-color: @base0D;
        margin: 0 0 0 20px;
}

element {
        padding: 5px;
        spacing: 5px;
        border-radius: 10px;
        orientation: horizontal;
        highlight: bold underline;
        children: [element-icon, element-text];
}
element-text, element-icon {
        background-color : inherit;
        text-color           : inherit;
        foreground-color : inherit;
        vertical-align:   0.5;
        horizontal-align: 0.5;
}

element-icon {
        size: 2em;
}

element normal {
        background-color: transparent;
}

element selected {
        background-color: @base0D;
}

element alternate {
        /*background-color: @base03;*/
}

element normal normal, element selected normal, element alternate normal {
        text-color: @base07;
}

element normal urgent, element selected urgent, element alternate urgent {
        text-color: @base0F;
}

element normal active, element selected active, element alternate active {
        text-color: @base0B;
}
  '';
}
