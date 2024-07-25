from libqtile import widget, bar
from libqtile.config import Screen

from .general import base, icon, font, GroupBox, padding
from settings.theme import colors

SIZE = 35
MARGIN = [0, 0, 0, 0]
OPACITY = 0.85

group_names = ["1", "2", "3", "4"]
group_labels = [" ", " ", " ", " "]
group_layouts = ["monadtall", "monadtall", "monadtall",
                 "monadtall"]

hig_color = colors[2][0][1:]
widgets_list = [

    # Memory used
    icon(fg=8, bg=0, fontsize=15, padding=padding, icon=' 󰍛'),
    widget.Memory(
        **base(fg=8, bg=0),
        format=' {MemUsed: .0f} {mm}    ',
        padding=0,
        fontsize=12
    ),

    widget.ThermalSensor(
        **base(fg=12),
        font=font,
        fontsize=13,
        foreground_alert=colors[9],
    ),

    widget.Spacer(
        background=colors[0],
    ),

    # Work space
    GroupBox(),

    widget.Spacer(
        background=colors[0],
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
        format="%d/%m/%Y \n %I:%M %p "
    ),
]

widgets_list_m2 = [
    icon(fg=8, fontsize=16, padding=0, icon='  '),
    widget.Backlight(
        **base(fg=8),
        backlight_name='intel_backlight',
        brightness_file='brightness',
        fontsize=12
    ),
    widget.Spacer(
        background=colors[0],
    ),

    GroupBox(
        block_highlight_text_color=colors[3]),

    widget.Spacer(
        background=colors[0],
    ),

    # The layout in this workspace
    widget.CurrentLayoutIcon(**base(bg=0), font=font,
                             padding=padding, scale=0.50),
]

screen = [
    Screen(
        bottom=bar.Bar(
            widgets=widgets_list,
            size=SIZE,
            margin=MARGIN,
            opacity=OPACITY
        )
    ),
    Screen(
        bottom=bar.Bar(
            widgets=widgets_list_m2,
            size=SIZE,
            margin=MARGIN,
            opacity=OPACITY
        ),
    )
]
