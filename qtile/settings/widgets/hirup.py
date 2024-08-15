from libqtile import widget, bar
from libqtile.config import Screen

from .general import base, icon, font, GroupBox, padding, separator, font
from settings.theme import colors

SIZE = 26
MARGIN = [0, 0, 0, 0]
OPACITY = 1

group_names = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
group_labels = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
group_layouts = ["monadtall", "monadtall",
                 "monadtall", "monadtall",
                 "monadtall", "monadtall",
                 "monadtall", "monadtall",
                 "monadtall"]

hig_color = colors[0][0][1:]

widgets_list = [
    GroupBox(highlight_color=[hig_color, hig_color],
             block_highlight_text_color=colors[0],
             highlight_method='block', margin_x=3,
             active=colors[3], inactive=colors[1],
             margin=0, markup=False, rounded=False,
             padding_y=2, padding_x=5),
    separator(text="|", fg=1),
    widget.WindowName(
        fontsize=13, foreground=colors[1]),

    widget.Spacer(
        background=colors[0],
    ),

    # Memory used
    separator(text=" ", bg=7),
    icon(fg=0, bg=7, fontsize=15, padding=3, icon=' 󰍛'),
    widget.Memory(
        **base(fg=0, bg=7),
        format='{MemUsed: .0f} {mm}',
        padding=padding,
        fontsize=12,
    ),
    separator(text=" ", bg=7),

    separator(text=" ", bg=8),
    icon(fg=0, bg=8, fontsize=15, padding=3, icon=' 󰻟'),
    widget.CPU(
        **base(fg=0, bg=8),
        format='{load_percent}%',
        padding=padding,
        fontsize=12
    ),
    separator(text=" ", bg=8),

    separator(text=" ", bg=10),
    icon(fg=0, bg=10, fontsize=15, padding=0, icon='  '),
    widget.Volume(
        **base(fg=0, bg=10),
        padding=padding,
        fontsize=12
    ),
    separator(text=" ", bg=10),

    # Connectivity
    separator(text=" ", bg=4),
    icon(fg=0, bg=4, fontsize=15, padding=0, icon=' 󰤨 '),
    widget.Net(
        **base(fg=0, bg=4),
        format='{interface}',
        padding=padding,
        fontsize=12
    ),
    separator(text=" ", bg=4),

    separator(text=" ", bg=6),
    # Clock and date
    icon(fg=0, bg=6, fontsize=12, padding=0, icon="  "),
    widget.Clock(
        **base(fg=0, bg=6),
        fontsize=13,
        format="%I:%M %p"
    ),
    separator(text=" ", bg=6),

    separator(text=""),
    widget.Systray(
        background=colors[0],
        icon_size=15,
        padding=10
    ),
    separator(text=""),
]


screen = [
    Screen(
        top=bar.Bar(
            widgets=widgets_list,
            size=SIZE,
            margin=MARGIN,
            opacity=OPACITY
        )
    ),
    Screen(
        top=bar.Bar(
            widgets=widgets_list,
            size=SIZE,
            margin=MARGIN,
            opacity=OPACITY
        ),
    )
]
