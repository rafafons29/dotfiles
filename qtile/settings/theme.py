from os import path

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
        colors["blue1"],  # 4
        colors["blue2"],  # 5
        colors["green1"],  # 6
        colors["green2"],  # 7
        colors["red1"],  # 8
        colors["red2"],  # 9
        colors["yellow"],  # 10
        colors["orange"],  # 11
        colors["purple"],  # 12
    ]


if __name__ == "settings.theme":
    colors = init_colors(load_theme())
