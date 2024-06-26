{
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.modules.shells.zsh;
in {
  options.modules.shells.zsh = {
    enable = mkEnableOption "enable zsh configuration";
    initExtra = mkOption {
      type = types.str;
      description = "Extra zshrc entries";
      default = "";
    };
  };

  config = mkIf cfg.enable {
    programs.zsh = mkIf cfg.enable {
      enable = true;
      autosuggestion = {
        enable = true;
      };
      syntaxHighlighting = {
        enable = true;
        #pattern = {"rm -rf *" = "fg=black,bg=red";};
        styles = {"alias" = "fg=magenta";};
        highlighters = ["main" "brackets" "pattern"];
      };

      shellAliases = {
        reload = "(cd $HOME/.config/nixos;home-manager switch --flake .)";
        rebuild = "(cd $HOME/.config/nixos;sudo nixos-rebuild switch --flake .)";
      };

      initExtra = ''
        ${cfg.initExtra}
      '';

      dirHashes = {
        nixconfig = "$HOME/.config/nix-config";
      };
    };
  };
}
