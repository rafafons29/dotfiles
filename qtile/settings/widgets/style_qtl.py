from libqtile import widget

from .general import base, icon, font, GroupBox, padding, separator
from settings.theme import colors

SIZE = 25
MARGIN = [3, 3, 0, 3]
OPACITY = 1

hig_color = colors[0][0][1:]
widgets_list = [
    # Work space
    GroupBox(highlight_method="line",
             highlight_color=[hig_color, hig_color],
             block_highlight_text_color=colors[3]),

    widget.Spacer(
        background=colors[0],
    ),

    widget.Systray(
        background=colors[0],
        icon_size=15,
        padding=5
    ),

    widget.CurrentLayoutIcon(
        **base(fg=9), font=font,
        padding=padding, scale=0.70),

    widget.Spacer(
        background=colors[0],
    ),

    widget.ThermalSensor(
        **base(fg=12),
        font=font,
        fontsize=13,
        foreground_alert=colors[9],
    ),

    icon(fg=9, fontsize=13, icon=''),
    widget.Backlight(
        **base(fg=9),
        backlight_name='intel_backlight',
        brightness_file='brightness',
        fontsize=13,
        padding=0
    ),

    # Sound
    # icon(fg=8, font='Iosevka Nerd Font', fontsize=14, icon='  '),
    # widget.PulseVolume(
    #     **base(fg=8),
    #     limit_max_volume=True,
    #     padding_y=1,
    #     fontsize=11,
    #     padding=0
    # ),

    # Memory used
    icon(fg=7, fontsize=15, padding=3, icon='  󰍛'),
    widget.Memory(
        **base(fg=7),
        format='{MemUsed: .0f} {mm}',
        padding=padding,
        fontsize=12,
    ),

    # Connectivity
    icon(fg=6, fontsize=12, padding=0, icon=' ↓↑'),
    widget.Net(
        **base(fg=6),
        format='{down} {up}',
        fontsize=12
    ),

    icon(fg=5, fontsize=12, padding=0, icon='   '),
    widget.Battery(
        **base(fg=5),
        format='{percent:2.0%}',
        full_char="100%",
        update_interval=1,
        fontsize=12,
    ),

    # Clock and date
    icon(fg=3, fontsize=16, padding=0, icon=" 󰃰 "),
    widget.Clock(
        **base(fg=3),
        fontsize=12,
        format="%d-%m-%Y %a %I:%M:%S %p"
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

    # separator(),
    icon(fg=7, fontsize=22, font="Iosevka Nerd Font", padding=0, icon=''),
    widget.PulseVolume(
        **base(fg=7),
        limit_max_volume=True,
        padding_y=1,
        fontsize=11
    ),
]
