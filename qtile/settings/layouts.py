from libqtile import layout
from libqtile.config import Match

from .theme import colors

layout_theme = {"margin": 5,
                "border_width": 0,
                "border_focus": colors[9][0],
                "border_normal": colors[1][0]
                }

layouts = [
    layout.MonadTall(**layout_theme),
    layout.MonadWide(**layout_theme),
    layout.Matrix(**layout_theme),
    layout.Bsp(**layout_theme),
    layout.Max(**layout_theme)
]

floating_layout = layout.Floating(
    float_rules=[
        *layout.Floating.default_float_rules,
        Match(wm_class='confirmreset'),
        Match(wm_class='makebranch'),
        Match(wm_class='maketag'),
        Match(wm_class='ssh-askpass'),
        Match(title='branchdialog'),
        Match(title='pinentry'),
    ],
    border_width=0,
    border_focus=colors[9][0],
    border_normal=colors[1][0]
)
