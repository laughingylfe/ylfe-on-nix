{ config, pkgs, ... }:

{
    home.username = "ylfe";
    home.homeDirectory = "/home/ylfe";
    home.stateVersion = "25.05";
    programs.bash = {
        enable = true;
        shellAliases = {
            btw = "echo i use arch btw";
        };
        profileExtra = ''
            if  [ -z "$WAYLAND_DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
                 exec uwsm start -s hyprland-uwsm.dekstop
            fi
        '';
    };
}
