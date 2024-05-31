from libqtile import qtile, widget

from settings.theme import colors

font = "JetBrains Mono NL"
browser = "firefox"
terminal = "alacritty"
padding = 6


def base(fg=1, bg=0):
    return {
        "foreground": colors[fg],
        "background": colors[bg]
    }


def icon(fg=1, bg=0, font=font, fontsize=35, padding=padding, icon=""):
    return widget.TextBox(
        **base(fg=fg, bg=bg,),
        font=font,
        fontsize=fontsize,
        padding=padding,
        text=icon,
    )


def separator(fg=10, bg=0, fontsize=25, padding=padding, text=""):
    return widget.TextBox(
        **base(fg=fg, bg=bg,), fontsize=fontsize, padding=padding,
        text=text,
    )


def powerline(fg=0, bg=0):
    return widget.TextBox(
        **base(fg, bg),
        text="",  # Icon: nf-oct-triangle_left
        fontsize=35,
        padding=0
    )

# Shutdown


def shutdown_now():
    qtile.cmd_spawn('shutdown now')
# Reboot


def reboot_now():
    qtile.cmd_spawn('reboot')
# Open_htop


def open_htop():
    qtile.cmd_spawn(terminal + ' -e htop')
# Speedtest.net


def speedtest():
    qtile.cmd_spawn(browser + 'www.speedtest.net')
# Brightness Up


def brightup():
    qtile.cmd_spawn('brightnessctl set +5%')
# Brightness Down


def brightdown():
    qtile.cmd_spawn('brightnessctl set 5%-')


def GroupBox(
        fontsize=15, margin_y=4, margin_x=1,
        padding_y=0, padding_x=1, active=colors[1],
        inactive=colors[2], urgent_text=colors[1],
        urgent_border=colors[1],
        other_current_screen_border=colors[3],
        other_screen_border=colors[1],
        this_current_screen_border=colors[3],
        this_screen_border=colors[2],
        borderwidth=2.5, highlight_method="text",
        block_highlight_text_color=None,
        fontshadow=None, hide_unused=False,
        highlight_color=['000000', '282828'],
        invert_mouse_wheel=False, margin=3,
        markup=True, rounded=True):
    return widget.GroupBox(
        font=font,
        fontsize=fontsize,
        fontshadow=fontshadow,
        margin=margin,
        margin_y=margin_y,
        margin_x=margin_x,
        padding_y=padding_y,
        padding_x=padding_x,
        borderwidth=borderwidth,
        active=active,
        inactive=inactive,
        highlight_method=highlight_method,
        urgent_alert_method=highlight_method,
        urgent_text=urgent_text,
        urgent_border=urgent_border,
        highlight_color=highlight_color,
        hide_unused=hide_unused,
        other_current_screen_border=other_current_screen_border,
        other_screen_border=other_screen_border,
        this_current_screen_border=this_current_screen_border,
        rounded=rounded,
        this_screen_border=this_screen_border,
        center_aligned=True,
        disable_drag=rounded,
        block_highlight_text_color=block_highlight_text_color,
        invert_mouse_wheel=invert_mouse_wheel,
        markup=markup,
        ** base(fg=3, bg=0),
    )
