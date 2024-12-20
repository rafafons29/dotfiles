import os
from libqtile.config import Key
from libqtile.lazy import lazy

from .widgets.general import browser
from .screen import groups
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
    Key([mod, "shift"], "z", lazy.layout.maximize()),

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
        "rofi -show drun -config ~/.config/rofi/menu.rasi")),
    Key([mod], "n", lazy.spawn(
        "/home/rafa/.config/rofi/launchers/type-2/launcher.sh")),
    Key([mod], "d", lazy.spawn(
        "/home/rafa/.config/rofi/launchers/type-4/launcher.sh")),

    # ---------------Commands for apps---------------#
    # Browser
    Key([mod], "b", lazy.spawn(browser)),

    # File manager
    Key([mod], "e", lazy.spawn("kitty yazi")),
    Key([mod, "shift"], "e", lazy.spawn("thunar")),

    # Logout
    Key([mod], "x", lazy.spawn("archlinux-logout")),
    Key([mod], "z", lazy.spawn(
        "/home/rafa/.config/rofi/powermenu/type-4/powermenu.sh")),

    # Default terminal emulator
    Key([mod], "Return", lazy.spawn("kitty")),

    # Using Flameshot to take screenshots
    Key([], "Print", lazy.spawn("flameshot screen")),
    Key([mod], "Print", lazy.spawn("flameshot gui")),

    # Using hpick to pick a color
    Key([mod], "p", lazy.spawn("gpick -p")),
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
