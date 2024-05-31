from libqtile import widget

from .general import base, icon, font, GroupBox, padding, powerline, separator
from settings.theme import colors

SIZE = 35
MARGIN = [0, 0, 0, 0]
OPACITY = 0.65

hig_color = colors[2][0][1:]
widgets_list = [

    # # Sound
    # icon(fg=0, bg=8, font='Iosevka Nerd Font', fontsize=14, icon='  '),
    # widget.PulseVolume(
    #     **base(fg=0, bg=8),
    #     limit_max_volume=True,
    #     padding_y=1,
    #     fontsize=11
    # ),

    # Memory used
    icon(fg=8, bg=0, fontsize=15, padding=padding, icon=' 󰍛'),
    widget.Memory(
        **base(fg=8, bg=0),
        format=' {MemUsed: .0f} {mm}    ',
        padding=0,
        fontsize=12
    ),

    # Connectivity
    icon(fg=5, bg=0, fontsize=12, padding=0, icon='↓↑'),
    widget.Net(
        **base(fg=5, bg=0),
        format='{down} {up} ',
        fontsize=12
    ),

    icon(fg=7, bg=0, fontsize=15, padding=0, icon='   '),
    widget.Battery(
        **base(fg=7, bg=0),
        format='{percent:2.0%}',
        full_char="100%",
        update_interval=1,
        fontsize=12,
    ),

    widget.Spacer(
        background=colors[0],
    ),

    # Work space
    GroupBox(),

    widget.Spacer(
        background=colors[0],
    ),

    # Light porcent
    icon(fg=1, bg=0, fontsize=20, icon=''),
    widget.Backlight(
        **base(fg=1, bg=0),
        backlight_name='intel_backlight',
        brightness_file='brightness',
        fontsize=15
    ),

    widget.Systray(
        background=colors[0],
        icon_size=20,
        padding=5
    ),

    # The layout in this workspace
    widget.CurrentLayoutIcon(**base(bg=0), font=font,
                             padding=padding, scale=0.50),

    # Clock and date
    widget.Clock(
        **base(fg=1, bg=0),
        fontsize=12,
        format="%d-%m-%Y %a \n %I:%M:%S %p "
    ),
]

widgets_list_m2 = [
    GroupBox(highlight_method="line",
             block_highlight_text_color=colors[3]),
    widget.Spacer(
        background=colors[0],
    ),

    icon(fg=8, fontsize=16, padding=0, icon=''),
    widget.Backlight(
        **base(fg=8),
        backlight_name='intel_backlight',
        brightness_file='brightness',
        fontsize=12
    ),

    separator(),
    icon(fg=7, fontsize=22, font="Iosevka Nerd Font", padding=0, icon=''),
    widget.PulseVolume(
        **base(fg=7),
        limit_max_volume=True,
        padding_y=1,
        fontsize=11
    ),
]
