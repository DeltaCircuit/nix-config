{
  config,
  pkgs,
  ...
}: let
  ifGroupsExists = groups: builtins.filter (group: builtins.hasAttr group config.users.groups) groups;
in {
  home-manager.users.giri = import ./home.nix;

  users.users.giri = {
    isNormalUser = true;
    initialPassword = "nixos";
    description = "giri";
    shell = pkgs.zsh;
    extraGroups =
      [
        "wheel"
        "audio"
        "video"
        "input"
      ]
      ++ ifGroupsExists [
        "networkmanager"
        "docker"
        "git"
      ];
    home = "/home/giri";
    createHome = true;

    packages = [
      pkgs.home-manager
    ];
  };

  programs.zsh.enable = true;
}
