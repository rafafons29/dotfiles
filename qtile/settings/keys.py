import os
from libqtile.config import Key
from libqtile.lazy import lazy

from .widgets.general import browser
from .groups import groups
from .windows import window_to_next_screen, window_to_previous_screen

mod = "mod4"
alt = "mod1"
ctrl = "control"
home = os.path.expanduser('~')

keys = [
    # SUPER + FUNCTION KEYS
    Key([mod], "f", lazy.hide_show_bar()),
    Key([mod], "q", lazy.window.kill()),
    Key([mod, "shift"], "f", lazy.window.toggle_fullscreen()),

    # SUPER + SHIFT KEYS
    Key([mod, "shift"], "r", lazy.restart()),

    # QTILE LAYOUT KEYS
    Key([mod], "space", lazy.next_layout()),

    # Toggle floating
    Key([mod], "v", lazy.window.toggle_floating()),

    # CHANGE FOCUS
    Key([mod], "k", lazy.layout.up()),
    Key([mod], "j", lazy.layout.down()),
    Key([mod], "h", lazy.layout.left()),
    Key([mod], "l", lazy.layout.right()),


    # RESIZE UP, DOWN, LEFT, RIGHT
    Key([mod, "control"], "l",
        lazy.layout.grow_right(),
        lazy.layout.grow(),
        lazy.layout.increase_ratio(),
        lazy.layout.delete(),
        ),
    Key([mod, "control"], "h",
        lazy.layout.grow_left(),
        lazy.layout.shrink(),
        lazy.layout.decrease_ratio(),
        lazy.layout.add(),
        ),
    Key([mod, "control"], "k",
        lazy.layout.grow_up(),
        lazy.layout.grow(),
        lazy.layout.decrease_nmaster(),
        ),
    Key([mod, "control"], "j",
        lazy.layout.grow_down(),
        lazy.layout.shrink(),
        lazy.layout.increase_nmaster(),
        ),

    # MOVE WINDOWS UP OR DOWN BSP LAYOUT
    Key([mod, "shift"], "k", lazy.layout.shuffle_up()),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down()),
    Key([mod, "shift"], "h", lazy.layout.shuffle_left()),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right()),

    # Move window whit focus to the other workspace.
    Key(["control", "shift"], "1", lazy.window.togroup("1")),
    Key(["control", "shift"], "2", lazy.window.togroup("2")),
    Key(["control", "shift"], "3", lazy.window.togroup("3")),
    Key(["control", "shift"], "4", lazy.window.togroup("4")),
    Key(["control", "shift"], "5", lazy.window.togroup("5")),
    Key(["control", "shift"], "6", lazy.window.togroup("6")),
    Key(["control", "shift"], "7", lazy.window.togroup("7")),

    Key([mod, "control"], "q", lazy.spawncmd()),

    # ---------------Using rofi for all---------------#
    Key([mod], "m", lazy.spawn(
        "rofi -show drun -config ~/.config/qtile/setup_complements/rofi/config.rasi")),
    Key([mod, "shift"], "m", lazy.spawn(
        "rofi -config ~/.config/qtile/setup_complements/rofi/config.rasi -show")),
    Key([mod], "d", lazy.spawn(
        "rofi -config ~/.config/qtile/setup_complements/rofi/full_menu.rasi -show")),

    # ---------------Commands for apps---------------#
    # Browser
    Key([mod], "b", lazy.spawn(browser)),

    # File manager
    Key([mod], "e", lazy.spawn("kitty yazi")),
    Key([mod, "shift"], "e", lazy.spawn("thunar")),

    # Logout
    Key([mod], "x", lazy.spawn("archlinux-logout")),

    # Default terminal emulator
    Key([mod], "Return", lazy.spawn("kitty")),

    # Using Flameshot
    Key([mod], "g", lazy.spawn("flameshot gui")),

    # ---------------Commands control hardware---------------#
    # Screenshot
    Key([], "Print", lazy.spawn(
        "scrot 'ArcoLinux-%Y-%m-%d-%s_screenshot_$wx$h.jpg' -e 'mv $f $$(xdg-user-dir PICTURES)'")),

    # Raises volumen
    # Key([], "XF86AudioRaiseVolume", lazy.spawn("amixer set Master 10%+")),
    #
    # # Lowers volumen
    # Key([], "XF86AudioLowerVolume", lazy.spawn("amixer set Master 10%-")),
    #
    # # Mute
    # Key([], "XF86AudioMute", lazy.spawn("amixer -D pulse set Master 1+ toggle")),

    # # Play
    # Key([], "XF86AudioPlay", lazy.spawn("playerctl play-pause")),
    #
    # # Next
    # Key([], "XF86AudioNext", lazy.spawn("playerctl next")),
    #
    # # Previous
    # Key([], "XF86AudioPrev", lazy.spawn("playerctl previous")),
    #
    # # Stop
    # Key([], "XF86AudioStop", lazy.spawn("playerctl stop")),
    #
    # # Bightness up
    # Key([], "XF86MonBrightnessUp", lazy.spawn("xbacklight -inc 10")),
    #
    # # Bightness down
    # Key([], "XF86MonBrightnessDown", lazy.spawn("xbacklight -dec 10")),
]

keys.extend([
    # MOVE WINDOW TO NEXT SCREEN
    Key([mod, "shift"], "Right", lazy.function(
        window_to_next_screen, switch_screen=True)),
    Key([mod, "shift"], "Left", lazy.function(
        window_to_previous_screen, switch_screen=True)),
])


for i in groups:
    keys.extend([
        Key([mod], i.name, lazy.group[i.name].toscreen()),
        Key([mod], "Tab", lazy.screen.next_group()),
        Key([mod, "shift"], "Tab", lazy.screen.prev_group()),
        Key([alt], "Tab", lazy.screen.next_group()),
        Key([alt, "shift"], "Tab", lazy.screen.prev_group()),

        Key([mod, "shift"], i.name, lazy.window.togroup(
            i.name), lazy.group[i.name].toscreen()),
    ])
