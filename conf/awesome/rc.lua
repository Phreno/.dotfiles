-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")
package.loaded["awful.hotkeys_popup.keys.tmux"] = {}
-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
-- Widget and layout library
local wibox = require("wibox")

--- {{{
-------------------------
-- Chargement du theme --
-------------------------
-- Theme handling library
local beautiful = require("beautiful")
beautiful.border_width = 1 -- Pour éviter une npe
--- }}}


-- Notification library
local naughty = require("naughty")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")

-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
require("awful.hotkeys_popup.keys")

-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
  naughty.notify({ preset = naughty.config.presets.critical,
    title = "Oops, there were errors during startup!",
    text = awesome.startup_errors })
end

-- Handle runtime errors after startup
do
  local in_error = false
  awesome.connect_signal("debug::error", function(err)
    -- Make sure we don't go into an endless error loop
    if in_error then return end
    in_error = true

    naughty.notify({ preset = naughty.config.presets.critical,
      title = "Oops, an error happened!",
      text = tostring(err) })
    in_error = false
  end)
end
-- }}}

-- {{{ Variable definitions
-- Themes define colours, icons, font and wallpapers.
beautiful.init()

-- This is used later as the default terminal and editor to run.
-- terminal = "xterm"
-- terminal = "xfce4-terminal"
-- terminal = "alacritty"
terminal = "alacritty"
editor = os.getenv("EDITOR") or "nano"
editor_cmd = terminal .. " -e " .. editor

-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.
modkey = "Mod4"

-- Table of layouts to cover with awful.layout.inc, order matters.
awful.layout.layouts = {
  awful.layout.suit.tile,
}
-- }}}

-- {{{
----------------
-- Revelation --
----------------
-- IMPORTANT: After `beautiful.init()`
local revelation = require("revelation")
revelation.init()
-- }}}

-- {{{
---------------
-- Wallpaper --
---------------
local function set_wallpaper(s)
  -- Wallpaper
  if beautiful.wallpaper then
    local wallpaper = beautiful.wallpaper
    -- If wallpaper is a function, call it with the screen
    if type(wallpaper) == "function" then
      wallpaper = wallpaper(s)
    end
    gears.wallpaper.maximized(wallpaper, s, true)
  end
end

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", set_wallpaper)


awful.screen.connect_for_each_screen(function(s)
  -- Wallpaper
  set_wallpaper(s)
end)
-- }}}

-- {{{ Key bindings
globalkeys = gears.table.join(
  awful.key({ modkey, }, "s", hotkeys_popup.show_help,
    { description = "show help", group = "awesome" }),

  awful.key({ modkey, }, "Left", awful.tag.viewprev,
    { description = "view previous", group = "tag-switch" }),

  awful.key({ modkey, }, "Right", awful.tag.viewnext,
    { description = "view next", group = "tag-switch" }),

  awful.key({ modkey, }, "r",
    function()
      awful.client.focus.byidx(1)
    end,
    { description = "focus next client by index", group = "focus-client" }
  ),

  awful.key({ modkey, }, "c",
    function()
      awful.client.focus.byidx(-1)
    end,
    { description = "focus previous client by index", group = "focus-client" }
  ),

  -- Layout manipulation
  awful.key({ modkey, "Shift" }, "t", function() awful.client.swap.byidx(1) end,
    { description = "swap with next client by index", group = "swap-client" }),

  awful.key({ modkey, "Shift" }, "s", function() awful.client.swap.byidx(-1) end,
    { description = "swap with previous client by index", group = "swap-client" }),

  -- Standard program
  awful.key({ modkey, }, "Return", function() awful.spawn(terminal) end,
    { description = "open a terminal", group = "launcher" }),

  awful.key({ modkey, "Control" }, "r", awesome.restart,
    { description = "reload awesome", group = "awesome" }),

  awful.key({ modkey, "Shift" }, "q", awesome.quit,
    { description = "quit awesome", group = "awesome" }),

  awful.key({ modkey, }, "Up", function() awful.tag.incmwfact(0.05) end,
    { description = "increase master width factor", group = "client-size" }
  ),
  awful.key({ modkey, }, "Down", function() awful.tag.incmwfact(-0.05) end,
    { description = "decrease master width factor", group = "client-size" }
  ),

  -----------
  -- Dmenu --
  -----------
  -- Prompt
  awful.key({ modkey }, "space", function()
    --  awful.screen.focused().mypromptbox:run()
    awful.util.spawn("dmenu_run")
  end,
    { description = "run prompt", group = "launcher" }),
  -- }}}

  -- {{{
  ----------------
  -- Revelation --
  ----------------
  awful.key({ modkey, }, "e", revelation, { description = "display all clients", group = "revelation" }),
  -- }}}

  -- {{{
  ----------
  -- code --
  ----------
  awful.key({ modkey, }, "v", function()
    awful.util.spawn("code")
  end, { description = "lance vscode", group = "launcher" }),
  -- }}}

  -- {{{
  ----------------
  -- Navigateur --
  ----------------

  awful.key({ modkey }, "y", function()
    awful.util.spawn("firefox -new-tab www.youtube.com")
  end,
    { description = "ouvre youtube", group = "browser" }),

  awful.key({ modkey }, "m", function()
    awful.util.spawn("firefox -new-tab mail.google.com")
  end,
    { description = "ouvre youtube", group = "browser" }),

  awful.key({ modkey }, "x", function()
    awful.util.spawn("firefox -new-tab https://app.dashlane.com/#/login")
  end,
    { description = "ouvre dashlane", group = "browser" }),

  awful.key({ modkey }, "g", function()
    awful.util.spawn("firefox -new-tab www.google.com")
  end,
    { description = "ouvre google", group = "browser" }),

  awful.key({ modkey }, "d", function()
    awful.util.spawn("firefox -new-tab www.discord.com")
  end,
    { description = "ouvre discord", group = "browser" }),

  awful.key({ modkey }, "h", function()
    awful.util.spawn("firefox -new-tab https://github.com/Phreno")
  end,
    { description = "ouvre github", group = "browser" }),

  awful.key({ modkey }, ".", function()
    awful.util.spawn("firefox -new-tab https://github.com/Phreno/.dotfiles")
  end,
    { description = "ouvre le repo dotfiles", group = "browser" }),

  awful.key({ modkey }, "w", function()
    awful.util.spawn("firefox -new-tab file:///home/phreno/.dotfiles/neuron/.neuron/output/impulse.html")

  end,
    { description = "ouvre le wiki", group = "browser" })
-- }}}
)

clientkeys = gears.table.join(
  awful.key({ modkey, }, "f",
    function(c)
      c.fullscreen = not c.fullscreen
      c:raise()
    end,
    { description = "toggle fullscreen", group = "client-max" }),

  awful.key({ modkey, "Shift" }, "c", function(c) c:kill() end,
    { description = "close", group = "client" }),

  awful.key({ modkey, }, "o", function(c) c:move_to_screen() end,
    { description = "move to screen", group = "client" })

-- awful.key({ modkey, }, "m",
--   function(c)
--     c.maximized = not c.maximized
--     c:raise()
--   end,
--   { description = "(un)maximize", group = "client-max" })
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it work on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
local np_map = { "b", "é", "p", "o", "è" }
for i = 1, 5 do
  globalkeys = gears.table.join(globalkeys,

    -- View tag only.
    awful.key({ modkey }, np_map[i],
      function()
        local screen = awful.screen.focused()
        local tag = screen.tags[i]
        if tag then
          tag:view_only()
        end
      end,
      { description = "view tag #" .. i, group = "view-tag" }),

    -- Move client to tag.
    awful.key({ modkey, "Shift" }, np_map[i],
      function()
        if client.focus then
          local tag = client.focus.screen.tags[i]
          if tag then
            client.focus:move_to_tag(tag)
          end
        end
      end,
      { description = "move focused client to tag #" .. i, group = "move-to-tag" }),

    -- -- Toggle tag display.
    awful.key({ modkey, "Control" }, np_map[i],
      function()
        local screen = awful.screen.focused()
        local tag = screen.tags[i]
        if tag then
          awful.tag.viewtoggle(tag)
        end
      end,
      { description = "toggle tag #" .. i, group = "toggle-tag" })
  )
end

clientbuttons = gears.table.join(
  awful.button({}, 1, function(c)
    c:emit_signal("request::activate", "mouse_click", { raise = true })
  end),
  awful.button({ modkey }, 1, function(c)
    c:emit_signal("request::activate", "mouse_click", { raise = true })
    awful.mouse.client.move(c)
  end),
  awful.button({ modkey }, 3, function(c)
    c:emit_signal("request::activate", "mouse_click", { raise = true })
    awful.mouse.client.resize(c)
  end)
)

-- Set keys
root.keys(globalkeys)
-- }}}

-- {{{ Rules
-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = {
  -- All clients will match this rule.
  { rule = {},
    properties = { border_width = beautiful.border_width,
      border_color = beautiful.border_normal,
      focus = awful.client.focus.filter,
      raise = true,
      keys = clientkeys,
      buttons = clientbuttons,
      screen = awful.screen.preferred,
      placement = awful.placement.no_overlap + awful.placement.no_offscreen
    }
  },

  -- Floating clients.
  { rule_any = {
    instance = {
      "DTA", -- Firefox addon DownThemAll.
      "copyq", -- Includes session name in class.
      "pinentry",
    },
    class = {
      "Arandr",
      "Blueman-manager",
      "Gpick",
      "Kruler",
      "MessageWin", -- kalarm.
      "Sxiv",
      "Tor Browser", -- Needs a fixed window size to avoid fingerprinting by screen size.
      "Wpa_gui",
      "veromix",
      "xtightvncviewer"
    },

    -- Note that the name property shown in xprop might be set slightly after creation of the client
    -- and the name shown there might not match defined rules here.
    name = {
      "Event Tester", -- xev.
    },
    role = {
      "AlarmWindow", -- Thunderbird's calendar.
      "ConfigManager", -- Thunderbird's about:config.
      "pop-up", -- e.g. Google Chrome's (detached) Developer Tools.
    }
  }, properties = { floating = true } },

  -- Add titlebars to normal clients and dialogs
  { rule_any = { type = { "normal", "dialog" }
  }, properties = { titlebars_enabled = false }
  },

}
-- }}}

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.connect_signal("manage", function(c)
  -- Set the windows at the slave,
  -- i.e. put it at the end of others instead of setting it master.
  -- if not awesome.startup then awful.client.setslave(c) end

  if awesome.startup
      and not c.size_hints.user_position
      and not c.size_hints.program_position then
    -- Prevent clients from being unreachable after screen count changes.
    awful.placement.no_offscreen(c)
  end
end)

-- {{{
----------------
-- TYRANNICAL --
----------------
local tyrannical = require("tyrannical")
tyrannical.tags = {
  {
    name      = "1.  Term", -- Call the tag "Term"
    init      = true, -- Load the tag on startup
    exclusive = true, -- Refuse any other type of clients (by classes)
    layout    = awful.layout.suit.tile, -- Use the tile layout
    class     = { --Accept the following classes, refuse everything else (because of "exclusive=true")
      "alacritty", "coreshot"
    }
  },
  {
    name      = "2.  Develop",
    init      = true,
    exclusive = true,
    layout    = awful.layout.suit.tile, -- Use the tile layout
    class     = {
      "code", "coreshot"
    }
  },
  {
    name      = "3. 爵Internet",
    init      = true,
    exclusive = true,
    layout    = awful.layout.suit.tile, -- Use the tile layout
    class     = {
      "Firefox", "brave", "coreshot"
    }
  },
}

-- Ignore the tag "exclusive" property for the following clients (matched by classes)
tyrannical.properties.intrusive = {
  "ksnapshot", "pinentry", "gtksu", "kcalc", "xcalc",
  "feh", "Gradient editor", "About KDE", "Paste Special", "Background color",
  "kcolorchooser", "plasmoidviewer", "Xephyr", "kruler", "plasmaengineexplorer",
}

-- Ignore the tiled layout for the matching clients
tyrannical.properties.floating = {
  "MPlayer", "pinentry", "ksnapshot", "pinentry", "gtksu",
  "xine", "feh", "kmix", "kcalc", "xcalc",
  "yakuake", "Select Color$", "kruler", "kcolorchooser", "Paste Special",
  "New Form", "Insert Picture", "kcharselect", "mythfrontend", "plasmoidviewer"
}

-- Make the matching clients (by classes) on top of the default layout
tyrannical.properties.ontop = {
  "Xephyr", "ksnapshot", "kruler"
}

-- Force the matching clients (by classes) to be centered on the screen on init
tyrannical.properties.placement = {
  kcalc = awful.placement.centered
}

tyrannical.settings.block_children_focus_stealing = true --Block popups ()
tyrannical.settings.group_children = true --Force popups/dialogs to have the same tags as the parent client

-- }}}

-- {{{
---------------
-- Autostart --
---------------
beautiful.useless_gap = 10
awful.spawn.with_shell("picom")
awful.spawn.with_shell("nitrogen --restore")
-- }}}
