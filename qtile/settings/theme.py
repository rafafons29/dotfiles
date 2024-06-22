from os import path

# from themes.themes import color_theme
from .path import qtile_path

import json


def load_theme():
    theme = "tokyonight"
    theme_file = path.join(qtile_path, "themes", f"{theme}.json")

    if not path.isfile(theme_file):
        raise Exception

    with open(path.join(theme_file)) as f:
        return json.load(f)


def init_colors(colors):
    return [
        colors["bg"],  # 0
        colors["active"],  # 1
        colors["inactive"],  # 2
        colors["focus"],  # 3
        colors["color1"],  # 4
        colors["color2"],  # 5
        colors["color3"],  # 6
        colors["color4"],  # 7
        colors["color5"],  # 8
        colors["color6"],  # 9
        colors["color7"],  # 10
        colors["color8"],  # 11
        colors["color9"],  # 12
    ]


if __name__ == "settings.theme":
    # try:
    colors = init_colors(load_theme())
    # except Exception:
    #     colors = color_theme["toyonight"]()
