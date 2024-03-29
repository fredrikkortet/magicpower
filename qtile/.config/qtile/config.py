# Copyright (c) 2010 Aldo Cortesi
# Copyright (c) 2010, 2014 dequis
# Copyright (c) 2012 Randall Ma
# Copyright (c) 2012-2014 Tycho Andersen
# Copyright (c) 2012 Craig Barnes
# Copyright (c) 2013 horsik
# Copyright (c) 2013 Tao Sauvage
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

## My config
from libqtile import bar, layout, widget, hook
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal
from color import colors
import os
import subprocess

mod = "mod4"
terminal = guess_terminal()

keys = [
    
    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),

    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),

    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    Key([mod], "f", lazy.window.toggle_fullscreen()),

    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key(
        [mod],
        "Return",
        lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack",
    ),

    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "q", lazy.window.kill(), desc="Kill focused window"),
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod], "r", lazy.spawncmd(), desc="Spawn a command using a prompt widget"),

    ## Application 
    Key([mod, "shift"], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    Key([mod, "shift"], "p", lazy.spawn("rofi -show run"), desc="Rofi"),
    Key([mod, "shift"], "w", lazy.spawn("firefox"), desc="Firefox"),
    Key([mod, "shift"], "t", lazy.spawn("pcmanfm"), desc="PCmanfm"),
    Key([mod, "shift"], "x", lazy.spawn("/home/tipparn/.local/bin/powermenu"), desc="Power menu"),
    Key([mod, "shift"], "b", lazy.spawn("/home/tipparn/.local/bin/rofi-bluetooth"), desc="Bluetooth menu"),
    Key([mod, "shift"], "n", lazy.spawn("/home/tipparn/.local/bin/rofi-network-manager"), desc="Network menu"),
    Key([mod, "shift"], "v", lazy.spawn("pavucontrol"), desc="Pavucontrol"),

    
    ## Special keys
    Key([], "XF86Calculator",lazy.spawn(""), desc="Calculator"),
    Key([], "XF86AudioRaiseVolume",lazy.spawn("/home/tipparn/.local/bin/changevol 3%+"), desc="Volume up"),
    Key([], "XF86AudioLowerVolume",lazy.spawn("/home/tipparn/.local/bin/changevol 3%-"), desc="Volume down"),
    Key([], "XF86AudioMute",lazy.spawn("/home/tipparn/.local/bin/changevol toggle"), desc="Volume mute"),
    Key([], "XF86AudioPlay",lazy.spawn(""), desc="Play audio"),
    Key([], "XF86AudioPrev",lazy.spawn(""), desc="Previous audio"),
    Key([], "XF86AudioNext",lazy.spawn(""), desc="Next audio"),
    Key([], "XF86MonBrightnessUp",lazy.spawn("brightnessctl s +5%"), desc="Brightness Up"),
    Key([], "XF86MonBrightnessDown",lazy.spawn("brightnessctl s 5%-"), desc="Brightness down"),
    Key([], "print",lazy.spawn("scrot -s /home/tipparn/pictures/$TIME-screenshot.png"), desc="Screenshot select"),
]

groups = [
        Group(name = "1"),
        Group(name = "2"),
        Group(name = "3"),
        Group(name = "4"),
        Group(name = "5"),
        Group(name = "6"),
        Group(name = "7"),
        Group(name = "8"),
        Group(name = "9"),
        
]


for i in groups:
    keys.extend(
        [
            # mod1 + letter of group = switch to group
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
                desc="Switch to group {}".format(i.name),
            ),
            # mod1 + shift + letter of group = switch to & move focused window to group
            Key(
                [mod, "shift"],
                i.name,
                lazy.window.togroup(i.name, switch_group=True),
                desc="Switch to & move focused window to group {}".format(i.name),
            ),
            # Or, use below if you prefer not to switch to that group.
            # # mod1 + shift + letter of group = move focused window to group
            # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
            #     desc="move focused window to group {}".format(i.name)),
        ]
    )

layouts = [
    layout.Columns(
        border_focus_stack=[colors[4], colors[1]], 
        border_focus = colors[4], 
        border_width=2,
        ),
    # Try more layouts by unleashing below layouts.
    #layout.Stack(num_stacks=1),
    #layout.MonadTall(),
    #layout.Max(),
    #layout.Bsp(),
    #layout.Matrix(),
    #layout.MonadWide(),
    #layout.RatioTile(),
    #layout.Tile(),
    #layout.TreeTab(),
    #layout.VerticalTile(),
    #layout.Zoomy(),
]

widget_defaults = dict(
    font="Input Mono, Bold",
    fontsize=12,
    padding=0,
    background=None,
    foreground=colors[7],
)

separator = widget.Sep(
        foreground=colors[2],
        linewidth= 3,
        padding= 20,
        size_percent = 60,
)

extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.GroupBox(
                    fontsize = 16,
                    highlight_method = "block",
                    block_highlight_text_color = colors[7],
                    active = colors[5],
                    inactive = colors[2],
                    this_current_screen_border = colors[4],
                    other_current_screen_border = colors[4],
                    this_screen_border = colors[6],
                    other_screen_border = colors[6],
                    urgent_alert_method = "line",
                    urgent_text = colors[1],
                    urgent_border = colors[8],
                    padding_y = 3,
                    padding_x = 2,
                    rounded = False,
                    disable_drag = True,
                    borderwidth = 5,

                    ),
                separator, 
                widget.WindowName(),
                widget.Spacer(),
                widget.DF(
                    **widget_defaults,
                    ),
                widget.DF(
                    visible_on_warn = False,
                    partition = "/home",
                    **widget_defaults,
                    ),
                separator,
                widget.TextBox(
                    text = "WIFI: ",
                    foreground = colors[4],
                    fontsize = 14,
                    ),
                widget.Wlan(
                    interface = "wlp1s0",
                    format = "{essid}",
                    **widget_defaults,
                    ),
                separator,
                widget.TextBox(
                        text = "VOL: ",
                    foreground = colors[4],
                    fontsize = 14,
                    ),
                widget.Volume(
                    **widget_defaults,
                    ),
                separator,
                widget.TextBox(
                        text = "BAT: ",
                    foreground = colors[4],
                    fontsize = 14,
                    ),
                widget.Battery(
                    format = "{char}{percent:2.0%}",
                    **widget_defaults,

                    ),
                separator,
                widget.TextBox(
                    text = "MEM: ",
                    foreground = colors[4],
                    fontsize = 14,
                    ),
                widget.Memory(
                    format = "{MemUsed:.1f}{mm}", 
                    measure_mem = "G",
                    **widget_defaults,
                    ),
                separator,
                widget.Clock(format="%Y-%m-%d-%a",
                        **widget_defaults,
                        ),
                separator,
                widget.Systray(),
                widget.Clock(
                    fontsize = 18,
                    padding = 0,
                    ),
            ],
            24,
            opacity = 1,
            # border_width=[2, 0, 2, 0],  # Draw top and bottom borders
            # border_color=["ff00ff", "000000", "ff00ff", "000000"]  # Borders are magenta
        ),
    ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="pavucontrol"),  # Pavucontrol
    ]
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None

@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser('~')
    subprocess.Popen([home + '/.config/qtile/autostart.sh'])

wmname = "LG3D"

