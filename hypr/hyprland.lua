hl.on("hyprland.start", function()
        hl.exec_cmd("emacs --daemon")
end)

hl.env("QT_QPA_PLATFORMTHEME", "qt5ct")
hl.env("GTK_THEME", "Adwaita-dark")

hl.config({
    general = {
      border_size = 2,
      gaps_in = 4,
      gaps_out = 8,
      float_gaps = 8,
      layout = "master",
      col = {
        inactive_border = "#b294bb",
        active_border = "#b5bd68",
        nogroup_border = "#cc6666",
        nogroup_border_active = "#f0c674",
      },
      resize_on_border = true,
    },
    animations = {
      enabled = false,
    },
    binds = {
      drag_threshold = 2,
    },
    input = {
      kb_layout = "us",
      kb_options = "compose:ralt",
      repeat_rate = 30,
      sensitivity = 0.3,
      follow_mouse = 2,
    },
    misc = {
      disable_hyprland_logo = true,
      disable_splash_rendering = true,
      enable_swallow = true,
      background_color = "#1d1f21"
    },
    cursor = {
      hide_on_key_press = true,
    },
    master = {
      new_status = "master",
    },
})

hl.bind("SUPER + e", hl.dsp.exec_cmd("emacsclient -c -a emacs"))
hl.bind("SUPER + b", hl.dsp.exec_cmd("chromium"))
hl.bind("SUPER + s", hl.dsp.exec_cmd("prime-run steam"))
hl.bind("SUPER + a", hl.dsp.exec_cmd("hyprlauncher"))
hl.bind("SUPER + RETURN", hl.dsp.exec_cmd("ghostty"))

hl.bind("SUPER + Tab", hl.dsp.layout("rollnext"))
hl.bind("SUPER + SHIFT + Tab", hl.dsp.layout("rollprev"))
hl.bind("SUPER + Up", hl.dsp.focus({ direction = "up" }))
hl.bind("SUPER + Down", hl.dsp.focus({ direction = "down" }))
hl.bind("SUPER + Left", hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER + Right", hl.dsp.focus({ direction = "right" }))

hl.bind("SUPER + SHIFT + 1", hl.dsp.window.move({ workspace = 1 }))
hl.bind("SUPER + SHIFT + 2", hl.dsp.window.move({ workspace = 2 }))
hl.bind("SUPER + 1", hl.dsp.focus({ workspace = 1 }))
hl.bind("SUPER + 2", hl.dsp.focus({ workspace = 2 }))

hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })
hl.bind("SUPER + f", hl.dsp.window.float())

hl.bind("Print", hl.dsp.exec_cmd("grim"))
hl.bind("SUPER + l", hl.dsp.exec_cmd("hyprlock"))

-- Binds for my programmable keyboard.
hl.bind(
  "SUPER + CONTROL + ALT + 0",
  hl.dsp.exec_cmd("wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 1%+"),
  { repeating = true }
)
hl.bind(
  "SUPER + CONTROL + ALT + 1",
  hl.dsp.exec_cmd("wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 1%-"),
  { repeating = true }
)
hl.bind(
  "SUPER + CONTROL + ALT + 3",
  hl.dsp.exec_cmd("mpc toggle"),
  { repeating = true }
)
hl.bind(
  "SUPER + CONTROL + ALT + 5",
  hl.dsp.exec_cmd("mpc prev"),
  { repeating = true }
)
hl.bind(
  "SUPER + CONTROL + ALT + 6",
  hl.dsp.exec_cmd("mpc next"),
  { repeating = true }
)
