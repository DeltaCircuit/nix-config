{
  inputs,
  config,
  lib,
  pkgs,
  ...
}:
with lib;
with inputs; let
  cfg = config.modules.editors.nvim;
in {
  #imports = [
  #  nixvim.homeManagerModules.nixvim
  #  ./options.nix
  #  ./plugins
  #  ./colorschems/catppuccin_mocha.nix
  #  ./startup.nix
  #];

  options.modules.editors.nvim = with types; {
    enable = mkEnableOption "enable neovim";
  };

  config = mkIf cfg.enable {
    programs.neovim = {
      enable = true;
      # defaultEditor = true;
      #extraPlugins = with pkgs.vimPlugins; [plenary-nvim];

      # extraConfigLua = builtins.readFile ./reload.lua;
    };

    xdg.configFile.nvim = {
      source = "${inputs.hl-nvim-config}";
      recursive = true;
    };
  };
}
