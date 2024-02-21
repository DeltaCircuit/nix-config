{ inputs, pkgs, lib, config, ...}:

{
  imports = [
    ../../home
  ];

  config = {
    modules = {
      browsers.firefox.enable = true;
      wms.hyprland.enable = true;
      shell.zsh.enable = true;
      editors.vscode.enable = true;
      terminal.alacritty.enable = true;
      programs.fzf.enable = true;
      programs.pcmanfm.enable = true;
      programs.direnv.enable = true;
      programs.rofi.enable = true;
    };

    my.settings = {
      host = "precision";
      default = {
        shell = "${pkgs.zsh}/bin/zsh";
        browser = "firefox";
        terminal = "alacritty";
      };
    };

    colorscheme = inputs.nix-colors.colorSchemes.catppuccin-mocha;

    wayland.windowManager.hyprland.config =  {
      monitor = [
        "DP-3,1920x1080,0x0,1"
        "eDP-1,1920x1080,1920x0,1"
      ];
    };

    home = {
      username = "giri";
      homeDirectory = "/home/giri";
      stateVersion = "23.11";
    };
  };
}
