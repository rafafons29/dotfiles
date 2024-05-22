from libqtile import bar
from libqtile.config import Screen

from .widgets.style_qtl import MARGIN, OPACITY, SIZE, widgets_list, widgets_list_m2
# from .widgets.powerconf import MARGIN, OPACITY, SIZE, widgets_list, widgets_list_m2


def all_screen(size=SIZE, margin=MARGIN, opacity=OPACITY):
    return [
        Screen(
            top=bar.Bar(
                widgets=widgets_list,
                size=size,
                margin=margin,
                opacity=opacity
            )
        ),
        Screen(
            top=bar.Bar(
                widgets=widgets_list_m2,
                size=size,
                margin=margin,
                opacity=opacity
            ),
        )
    ]
