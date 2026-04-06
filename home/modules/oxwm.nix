{ pkgs, ... }:
{

  xdg.configFile."oxwm/config.lua".text = ''
    -- Color palette (TokyoNight)
    local colors = {
      fg       = "#c0caf5",
      bg       = "#24283b",
      subtle   = "#787c99",
      border   = "#414868",
      focused  = "#999999",
      urgent   = "#f7768e",
    }

    -- Basic settings
    oxwm.set_modkey("Mod4")
    oxwm.set_terminal("kitty")  
    oxwm.set_tags({ "1", "2", "3", "4", "5", "6", "7", "8", "9", "10" })

    -- Borders
    oxwm.border.set_width(2)
    oxwm.border.set_focused_color(colors.focused)
    oxwm.border.set_unfocused_color(colors.border)

    -- Gaps
    oxwm.gaps.set_enabled(true)
    oxwm.gaps.set_inner(5, 5)
    oxwm.gaps.set_outer(10, 10)
    oxwm.gaps.set_smart(false)

    -- Layout symbols
    oxwm.set_layout_symbol("tiling",  "[T]")
    oxwm.set_layout_symbol("normie",  "[F]")
    oxwm.set_layout_symbol("monocle", "[M]")

    -- Window rules
    -- NOTE: use `xprop` to confirm class/instance for each app
    oxwm.rule.add({ class = "jome",         floating = true })
    oxwm.rule.add({ class = "wiremix",      floating = true })
    oxwm.rule.add({ class = "yazi",         floating = true })
    oxwm.rule.add({ class = "qBittorrent",  floating = true })
    oxwm.rule.add({ class = "ncdu",         floating = true })
    oxwm.rule.add({ class = "btop",         floating = true })
    oxwm.rule.add({ class = "Swayimg",      floating = true })
    oxwm.rule.add({ class = "nmtui",        floating = true })
    oxwm.rule.add({ class = "notes",        floating = true })
    oxwm.rule.add({ class = "impala",       floating = true })
    oxwm.rule.add({ class = "bluetui",      floating = true })

    -- Keybindings
    local mod = "Mod4"

    -- Volume (X11: use pactl or wpctl — wpctl works on X11 too with pipewire)
    oxwm.key.bind({}, "XF86AudioRaiseVolume", oxwm.spawn("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"))
    oxwm.key.bind({}, "XF86AudioLowerVolume", oxwm.spawn("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"))
    oxwm.key.bind({}, "XF86AudioMute",        oxwm.spawn("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"))
    oxwm.key.bind({ mod }, "equal",            oxwm.spawn("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"))
    oxwm.key.bind({ mod }, "minus",            oxwm.spawn("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"))

    -- Apps
    oxwm.key.bind({ mod }, "Return", oxwm.spawn("kitty"))
    oxwm.key.bind({ mod }, "b",      oxwm.spawn("qutebrowser"))
    oxwm.key.bind({ mod }, "e",      oxwm.spawn("kitty --app-id yazi -e yazi"))
    oxwm.key.bind({ mod }, "a",      oxwm.spawn("rofi -show drun -theme-str 'window {width: 25%;}'"))
    oxwm.key.bind({ mod }, "period", oxwm.spawn("sh -c 'jome -dCLRkw16 -d | xclip -selection clipboard'"))

    -- Scripts
    oxwm.key.bind({ mod }, "Escape", oxwm.spawn("bash ~/.config/rofi/scripts/power-menu"))
    oxwm.key.bind({ mod }, "n",      oxwm.spawn("bash ~/.config/rofi/scripts/note"))
    oxwm.key.bind({ mod }, "p",      oxwm.spawn("bash ~/.config/rofi/scripts/project-picker"))
    oxwm.key.bind({ mod }, "m",      oxwm.spawn("bash ~/.config/rofi/scripts/system"))
    oxwm.key.bind({ mod }, "r",      oxwm.spawn("bash ~/.config/oxwm/cycle-resize.sh"))

    -- Screenshot (X11: maim + xclip instead of grim + wl-copy)
    oxwm.key.bind({ mod, "Shift" }, "s",
      oxwm.spawn("sh -c 'maim -s | tee ~/Pictures/Screenshots/screenshot_$(date +%Y%m%d_%H%M%S).png | xclip -selection clipboard -t image/png'"))

    -- WM control
    oxwm.key.bind({ mod }, "q",           oxwm.client.kill())
    oxwm.key.bind({ mod }, "v",           oxwm.client.toggle_floating())
    oxwm.key.bind({ mod, "Shift" }, "r",  oxwm.reload())
    oxwm.key.bind({ mod, "Shift" }, "q",  oxwm.quit())

    -- Focus (hjkl)
    oxwm.key.bind({ mod }, "h", oxwm.client.focus_left())
    oxwm.key.bind({ mod }, "j", oxwm.client.focus_down())
    oxwm.key.bind({ mod }, "k", oxwm.client.focus_up())
    oxwm.key.bind({ mod }, "l", oxwm.client.focus_right())

    -- Move (Ctrl+hjkl)
    oxwm.key.bind({ mod, "Control" }, "h", oxwm.client.move_left())
    oxwm.key.bind({ mod, "Control" }, "j", oxwm.client.move_down())
    oxwm.key.bind({ mod, "Control" }, "k", oxwm.client.move_up())
    oxwm.key.bind({ mod, "Control" }, "l", oxwm.client.move_right())

    -- Tags (workspaces)
    for i = 1, 9 do
      oxwm.key.bind({ mod },            tostring(i), oxwm.tag.view(i))
      oxwm.key.bind({ mod, "Control" }, tostring(i), oxwm.client.move_to_tag(i))
    end
    oxwm.key.bind({ mod },            "0", oxwm.tag.view(10))
    oxwm.key.bind({ mod, "Control" }, "0", oxwm.client.move_to_tag(10))

    -- Autostart
    oxwm.autostart({
      "dunst",
      "feh --randomize --bg-fill ~/Pictures/wallpapers-Base16BMG/*",  -- swww replaced with feh for X11
      "qbittorrent --no-splash",
      "/usr/lib/polkit-kde-authentication-agent-1",
      -- clipboard: xclip is stateless on X11, no daemon needed
    })
  '';

  xdg.configFile."oxwm/cycle-resize.sh" = {
    executable = true;
    text = ''
      #!/bin/bash
      # X11 equivalent: resize focused window in thirds using xdotool
      SCREEN_W=$(xdpyinfo | awk '/dimensions/{print $2}' | cut -dx -f1)
      WIN_ID=$(xdotool getactivewindow)
      WIN_W=$(xdotool getwindowgeometry "$WIN_ID" | awk '/Geometry/{print $2}' | cut -dx -f1)
      PCT=$((WIN_W * 100 / SCREEN_W))

      if [ "$PCT" -lt 40 ]; then
        xdotool windowsize "$WIN_ID" $((SCREEN_W * 50 / 100)) 0
      elif [ "$PCT" -lt 60 ]; then
        xdotool windowsize "$WIN_ID" $((SCREEN_W * 66 / 100)) 0
      else
        xdotool windowsize "$WIN_ID" $((SCREEN_W * 33 / 100)) 0
      fi
    '';
  };
}
