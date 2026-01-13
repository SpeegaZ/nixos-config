{  pkgs, ... }:

{
  wayland.windowManager.hyprland = {
  	enable = true;
	xwayland.enable = true;
	
	extraConfig = ''

################
### MONITORS ###
################

monitor= eDP-1, 1920x1080@60, 0x0, 1

###################
### MY PROGRAMS ###
###################

# Set programs that you use
$terminal = foot
$fileManager = thunar
$menu = fuzzel
$screenshot = ~/nixos-config/home-manager/scripts/snap.sh

#################
### AUTOSTART ###
#################

exec-once = waybar &
exec-once = wlsunset -t 4500K -T 5000K &
exec-once = udiskie & 
exec-once = swww-daemon &
exec-once = swww img ~/Pictures/walls/normal-day-girl.jpg --transition-fps 60 --transition-step 255 --transition-type any &
exec-once = lxqt-policykit-agent &
exec-once = mako &

#############################
### ENVIRONMENT VARIABLES ###
#############################

env = XCURSOR_THEME,"Bibata-Modern-Ice"
env = XCURSOR_SIZE,24
env = GRIM_DEFAULT_DIR, $HOME/Pictures/Screenshots

#####################
### LOOK AND FEEL ###
#####################

general {
    gaps_in = 3
    gaps_out = 10

    border_size = 2

    col.active_border = rgba(ebdbb2ee) 45deg
    col.inactive_border = rgba(25252faa)

    resize_on_border = false

    allow_tearing = false

	layout = master
}

decoration {
    rounding = 0

    active_opacity = 0.9
    inactive_opacity = 0.9

    shadow {
        enabled = true
        range = 4
        render_power = 3
        color = rgba(1a1a1aee)
    }

    blur {
        enabled = true
        size = 4
        passes = 3

        vibrancy = 0.5000
    }
}

animations {
    enabled = yes, please :)


    bezier = easeOutQuint,0.23,1,0.32,1
    bezier = easeInOutCubic,0.65,0.05,0.36,1
    bezier = linear,0,0,1,1
    bezier = almostLinear,0.5,0.5,0.75,1.0
    bezier = quick,0.15,0,0.1,1

    animation = global, 1, 10, default
    animation = border, 1, 5.39, easeOutQuint
    animation = windows, 1, 4.79, easeOutQuint
    animation = windowsIn, 1, 4.1, easeOutQuint, popin 87%
    animation = windowsOut, 1, 1.49, linear, popin 87%
    animation = fadeIn, 1, 1.73, almostLinear
    animation = fadeOut, 1, 1.46, almostLinear
    animation = fade, 1, 3.03, quick
    animation = layers, 1, 3.81, easeOutQuint
    animation = layersIn, 1, 4, easeOutQuint, fade
    animation = layersOut, 1, 1.5, linear, fade
    animation = fadeLayersIn, 1, 1.79, almostLinear
    animation = fadeLayersOut, 1, 1.39, almostLinear
    animation = workspaces, 1, 1.94, almostLinear, fade
    animation = workspacesIn, 1, 1.94, almostLinear, fade
    animation = workspacesOut, 1, 1.94, almostLinear, fade
}

dwindle {
    pseudotile = true # Master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
    preserve_split = true # You probably want this
}

master {
    new_status = master
}

misc {
    force_default_wallpaper = -1 # Set to 0 or 1 to disable the anime mascot wallpapers
    disable_hyprland_logo = false # If true disables the random hyprland logo / anime girl background. :(
}


#############
### INPUT ###
#############

input {
    kb_layout = us
    kb_variant =
    kb_model =
    kb_options =
    kb_rules =

    follow_mouse = 1

    sensitivity = 0 # -1.0 - 1.0, 0 means no modification.

    touchpad {
        natural_scroll = true
    }
}

gestures {
}

device {
    name = epic-mouse-v1
    sensitivity = 0
}


###################
### KEYBINDINGS ###
###################

$mainMod = SUPER # Sets "Windows" key as main modifier

bind = $mainMod, Return, exec, $terminal
bind = $mainMod, Q, killactive,
bind = $mainMod, M, exit,
bind = $mainMod, E, exec, $fileManager
bind = $mainMod, V, togglefloating,
bind = $mainMod, R, exec, $menu
bind = $mainMod, U, pseudo, # dwindle
bind = $mainMod, T, togglesplit, # dwindle
bind = $mainMod, F, fullscreen,
bind = $mainMod, Space, exec, hyprlock


bind = $mainMod, H, movefocus, l
bind = $mainMod, L, movefocus, r
bind = $mainMod, K, movefocus, u
bind = $mainMod, J, movefocus, d

bind = $mainMod, 1, workspace, 1
bind = $mainMod, 2, workspace, 2
bind = $mainMod, 3, workspace, 3
bind = $mainMod, 4, workspace, 4
bind = $mainMod, 5, workspace, 5
bind = $mainMod, 6, workspace, 6
bind = $mainMod, 7, workspace, 7
bind = $mainMod, 8, workspace, 8
bind = $mainMod, 9, workspace, 9
bind = $mainMod, 0, workspace, 10

bind = $mainMod SHIFT, 1, movetoworkspace, 1
bind = $mainMod SHIFT, 2, movetoworkspace, 2
bind = $mainMod SHIFT, 3, movetoworkspace, 3
bind = $mainMod SHIFT, 4, movetoworkspace, 4
bind = $mainMod SHIFT, 5, movetoworkspace, 5
bind = $mainMod SHIFT, 6, movetoworkspace, 6
bind = $mainMod SHIFT, 7, movetoworkspace, 7
bind = $mainMod SHIFT, 8, movetoworkspace, 8
bind = $mainMod SHIFT, 9, movetoworkspace, 9
bind = $mainMod SHIFT, 0, movetoworkspace, 10

bind = $mainMod, S, exec, $screenshot 

bind = $mainMod, P, togglespecialworkspace, magic
bind = $mainMod SHIFT, P, movetoworkspace, special:magic

bind = $mainMod, mouse_down, workspace, e+1
bind = $mainMod, mouse_up, workspace, e-1

bindm = $mainMod, mouse:272, movewindow
bindm = $mainMod, mouse:273, resizewindow

bindel = ,XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+
bindel = ,XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
bindel = ,XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
bindel = ,XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle
bindel = ,XF86MonBrightnessUp, exec, brightnessctl s 10%+
bindel = ,XF86MonBrightnessDown, exec, brightnessctl s 10%-

bindl = , XF86AudioNext, exec, playerctl next
bindl = , XF86AudioPause, exec, playerctl play-pause
bindl = , XF86AudioPlay, exec, playerctl play-pause
bindl = , XF86AudioPrev, exec, playerctl previous

##############################
### WINDOWS AND WORKSPACES ###
##############################

windowrulev2 = suppressevent maximize, class:.*

windowrulev2 = nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0
	  '';
	};
}

