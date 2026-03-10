{ config, lib, pkgs, ... };

{
  imports =
    [
      ./hardware.configuration.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "wulf";
  networking.networkmanager.enable = true;

  time.timezone = "Asia/Jakarta";

  services.getty.autologinUser = "ylfe";

  programs.hyprland = {
      enable = true;
      xwayland.enable = true;
      withUWSM = true;
  }

  users.users.ylfe = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    packages = with pkgs; [
      tree
    ];
  };

  programs.firefox.enable = true;

  environment.systemPackages = with pkgs; [
    vim
    wget
    kitty
    waybar
    git
    hyprpaper
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "25.05";

}
