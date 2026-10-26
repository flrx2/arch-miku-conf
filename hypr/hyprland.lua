
-- Hyprland Lua config
-- Converted from the supplied hyprland.conf.
-- Syntax follows the provided Hyprland Lua example.

------------------
---- MONITORS ----
------------------

hl.monitor({
    output   = "DP-1",
    mode     = "2560x1440@165",
    position = "0x0",
    scale    = 1,
})


---------------------
---- MY PROGRAMS ----
---------------------

local terminal    = "kitty"
local fileManager = "thunar"
local menu        = "wofi"
local cursor      = "hyprctl setcursor miku-cursor-linux 24"


-------------------
---- AUTOSTART ----
-------------------

-- Original:
-- exec-once = $cursor & awww-daemon & udiskie & spotify

hl.on("hyprland.start", function()
    hl.exec_cmd(cursor .. " & awww-daemon & udiskie --automount")
    hl.exec_cmd("/usr/lib/hyprpolkitagent/hyprpolkitagent &")
    hl.exec_cmd("env GTK_THEME=Adwaita:dark waybar &")
end)


-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")


-----------------------
----- PERMISSIONS -----
-----------------------

-- No permissions were enabled in the original config.


-----------------------
---- LOOK AND FEEL ----
-----------------------

hl.config({
    general = {
        gaps_in = 2,
        gaps_out = 4,

        col = {
            active_border   = "rgba(111111ff)",
            inactive_border = "rgba(11111100)",
        },

        border_size = 1,

        resize_on_border = false,
        allow_tearing = false,

        layout = "dwindle",
    },

    decoration = {
        rounding = 0,

        active_opacity = 1.0,
        inactive_opacity = 0.85,

        shadow = {
            enabled = true,
            range = 4,
            render_power = 3,
            color = 0xee1a1a1a,
        },

        blur = {
            enabled = true,
            size = 3,
            passes = 1,
            vibrancy = 0.1696,
        },
    },

    animations = {
        enabled = true,
    },
})


--------------------
---- ANIMATIONS ----
--------------------

-- Original curve:
-- bezier = easeOutExpo, 0.16, 1, 0.3, 1

hl.curve("easeOutExpo", {
    type = "bezier",
    points = {
        { 0.16, 1 },
        { 0.3, 1 },
    },
})


-- Original animations:
-- windows       1 4 easeOutExpo popin 90%
-- windowsIn     1 4 easeOutExpo popin 90%
-- windowsOut    1 3 easeOutExpo popin 95%
-- fade          1 3 default
-- workspaces    1 4 easeOutExpo slide
-- specialWorkspace 1 4 easeOutExpo slidevert
-- border        1 5 default
-- borderangle   1 30 default loop

hl.animation({
    leaf = "global",
    enabled = true,
    speed = 10,
    bezier = "default",
})

hl.animation({
    leaf = "windows",
    enabled = true,
    speed = 4,
    bezier = "easeOutExpo",
    style = "popin 90%",
})

hl.animation({
    leaf = "windowsIn",
    enabled = true,
    speed = 4,
    bezier = "easeOutExpo",
    style = "popin 90%",
})

hl.animation({
    leaf = "windowsOut",
    enabled = true,
    speed = 3,
    bezier = "easeOutExpo",
    style = "popin 95%",
})

hl.animation({
    leaf = "fade",
    enabled = true,
    speed = 3,
    bezier = "default",
})

hl.animation({
    leaf = "workspaces",
    enabled = true,
    speed = 4,
    bezier = "easeOutExpo",
    style = "slide",
})

hl.animation({
    leaf = "specialWorkspace",
    enabled = true,
    speed = 4,
    bezier = "easeOutExpo",
    style = "slidevert",
})

hl.animation({
    leaf = "border",
    enabled = true,
    speed = 5,
    bezier = "default",
})

hl.animation({
    leaf = "borderangle",
    enabled = true,
    speed = 30,
    bezier = "default",
    style = "loop",
})


--------------------------
---- DWINDLE / MASTER ----
--------------------------

hl.config({
    dwindle = {
        preserve_split = true,
    },
})

hl.config({
    master = {
        new_status = "master",
    },
})


----------------
----  MISC  ----
----------------

hl.config({
    misc = {
        force_default_wallpaper = -1,
        disable_hyprland_logo = false,
    },
})


---------------
---- INPUT ----
---------------

hl.config({
    input = {
        kb_layout  = "us,ru",
        kb_variant = "",
        kb_model   = "",
        kb_options = "grp:win_space_toggle",
        kb_rules   = "",

        follow_mouse = 1,

        sensitivity = 0,

        touchpad = {
            natural_scroll = false,
        },
    },
})


----------------
---- GESTURES ----
----------------

hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace",
})


----------------
---- DEVICES ----
----------------

hl.device({
    name = "epic-mouse-v1",
    sensitivity = -0.5,
})


---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "SUPER"


-- Applications

hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + Z", hl.dsp.exec_cmd("firefox"))
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd("Telegram"))
hl.bind(mainMod .. " + X", hl.dsp.exec_cmd("steam"))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd("discord"))
hl.bind("ALT + S", hl.dsp.exec_cmd("spotify"))
hl.bind(mainMod .. " + O", hl.dsp.exec_cmd("obs"))
hl.bind(mainMod .. " + U", hl.dsp.exec_cmd("unityhub"))
hl.bind("ALT + R", hl.dsp.exec_cmd("/opt/renpy/renpy.sh"))

-- Window actions

hl.bind(mainMod .. " + C", hl.dsp.window.close())
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())


-- Screenshots

hl.bind("PRINT", hl.dsp.exec_cmd("hyprshot -m region --output-folder \"$HOME/Скриншот\""))


-- Power

hl.bind("SHIFT + F1", hl.dsp.exec_cmd("poweroff"))
hl.bind("SHIFT + F2", hl.dsp.exec_cmd("reboot"))


-- Move focus

hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))


-- Switch workspaces

for i = 1, 10 do
    local key = i % 10

    hl.bind(
        mainMod .. " + " .. key,
        hl.dsp.focus({ workspace = i })
    )

    hl.bind(
        mainMod .. " + SHIFT + " .. key,
        hl.dsp.window.move({ workspace = i })
    )
end


-- Special workspace / scratchpad
hl.window_rule({
    name = "spotify-special",
    match = {
        class = "spotify",
    },
    workspace = "special:spotify",
})

-- Super + S: открыть/закрыть special workspace
hl.bind(
    mainMod .. " + S",
    hl.dsp.workspace.toggle_special("spotify")
)

hl.bind(
    mainMod .. " + SHIFT + S",
    hl.dsp.window.move({ workspace = "special:spotify" })
)

-- WORKSPACES WORK 
hl.bind(
    mainMod .. " + W",
    hl.dsp.workspace.toggle_special("work")
)

hl.workspace_rule({
    workspace = "special:work",
    on_created_empty = "~/.config/hypr/scripts/work.sh",
})



hl.window_rule({
    name = "gemini-work",
    match = {
        initial_class = "^firefox$",
    },
    tile = true,
    fullscreen_state = "0 0",
})
-- Scroll through existing workspaces
hl.bind(
    mainMod .. " + mouse_down",
    hl.dsp.focus({ workspace = "e+1" })
)

hl.bind(
    mainMod .. " + mouse_up",
    hl.dsp.focus({ workspace = "e-1" })
)
-- Scroll through existing workspaces
hl.bind(
    mainMod .. " + mouse_down",
    hl.dsp.focus({ workspace = "e+1" })
)

hl.bind(
    mainMod .. " + mouse_up",
    hl.dsp.focus({ workspace = "e-1" })
)

-- Move / resize windows with mouse

hl.bind(
    mainMod .. " + mouse:272",
    hl.dsp.window.drag(),
    { mouse = true }
)

hl.bind(
    mainMod .. " + mouse:273",
    hl.dsp.window.resize(),
    { mouse = true }
)


-----------------------------
---- MULTIMEDIA / BRIGHTNESS
-----------------------------

hl.bind(
    "XF86AudioRaiseVolume",
    hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
    { locked = true, repeating = true }
)

hl.bind(
    "XF86AudioLowerVolume",
    hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
    { locked = true, repeating = true }
)

hl.bind(
    "XF86AudioMute",
    hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
    { locked = true, repeating = true }
)

hl.bind(
    "XF86AudioMicMute",
    hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
    { locked = true, repeating = true }
)

hl.bind(
    "XF86MonBrightnessUp",
    hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),
    { locked = true, repeating = true }
)

hl.bind(
    "XF86MonBrightnessDown",
    hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),
    { locked = true, repeating = true }
)


-- Playerctl

hl.bind(
    "XF86AudioNext",
    hl.dsp.exec_cmd("playerctl next"),
    { locked = true }
)

hl.bind(
    "XF86AudioPause",
    hl.dsp.exec_cmd("playerctl play-pause"),
    { locked = true }
)

hl.bind(
    "XF86AudioPlay",
    hl.dsp.exec_cmd("playerctl play-pause"),
    { locked = true }
)

hl.bind(
    "XF86AudioPrev",
    hl.dsp.exec_cmd("playerctl previous"),
    { locked = true }
)


--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- Ignore maximize requests from all apps.

hl.window_rule({
    name = "suppress-maximize-events",

    match = {
        class = ".*",
    },

    suppress_event = "maximize",
})


-- Fix XWayland dragging issues.

hl.window_rule({
    name = "fix-xwayland-drags",

    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})


-- Hyprland-run window rule.

hl.window_rule({
    name = "move-hyprland-run",

    match = {
        class = "hyprland-run",
    },

    move = "20 monitor_h-120",
    float = true,
})


