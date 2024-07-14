import os
import subprocess
from libqtile import hook

from settings.layouts import layouts, floating_layout
from settings.groups import groups
from settings.keys import keys
from settings.screen import all_screen
from settings.theme import colors

keys = keys
groups = groups
layouts = layouts
colors = colors

widget_defaults = dict(background=colors[0])
extension_defaults = widget_defaults.copy()
screens = all_screen()

dgroups_key_binder = None
dgroups_app_rules = []


main = None

floating_types = ["notification", "toolbar", "splash", "dialog"]


follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = floating_layout
auto_fullscreen = True

focus_on_window_activation = "focus"  # or smart

wmname = "LG3D"


@hook.subscribe.startup_once
def start_once():
    home = os.path.expanduser('~')
    subprocess.call([home + '/.config/qtile/scripts/autostart.sh'])


@hook.subscribe.startup
def start_always():
    # Set the cursor to something sane in X
    subprocess.Popen(['xsetroot', '-cursor_name', 'left_ptr'])


@hook.subscribe.client_new
def set_floating(window):
    if (window.window.get_wm_transient_for()
            or window.window.get_wm_type() in floating_types):
        window.floating = True
