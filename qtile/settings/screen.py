from libqtile.config import Group

# from .widgets.style_qtl import screen, group_names, group_layouts, group_labels
from .widgets.powerconf import screen, group_names, group_layouts, group_labels

groups = []


for i in range(len(group_names)):
    groups.append(
        Group(
            name=group_names[i],
            layout=group_layouts[i].lower(),
            label=group_labels[i],
        ))


def all_screen():
    return screen
