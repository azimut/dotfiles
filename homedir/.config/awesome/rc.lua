-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
-- Widget and layout library
local wibox = require("wibox")
-- Theme handling library
local beautiful = require("beautiful")
-- Notification library
local naughty = require("naughty")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")
-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
require("awful.hotkeys_popup.keys")

local lain = require("lain")
local markup = lain.util.markup

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
   awesome.connect_signal(
      "debug::error",
      function (err)
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
beautiful.init(gears.filesystem.get_themes_dir() .. "default/theme.lua")

-- azimut: custom theming
beautiful.border_focus = "#00AAAA"
beautiful.border_width = 1

-- This is used later as the default terminal and editor to run.
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
   -- awful.layout.suit.floating,
   -- awful.layout.suit.tile,
   awful.layout.suit.tile.left,
   -- awful.layout.suit.tile.bottom,
   awful.layout.suit.tile.top,
   -- awful.layout.suit.fair,
   -- awful.layout.suit.fair.horizontal,
   -- awful.layout.suit.spiral,
   -- awful.layout.suit.spiral.dwindle,
   -- awful.layout.suit.max,
   -- awful.layout.suit.max.fullscreen,
   -- awful.layout.suit.magnifier,
   -- awful.layout.suit.corner.nw,
   -- awful.layout.suit.corner.ne,
   -- awful.layout.suit.corner.sw,
   -- awful.layout.suit.corner.se,
}
-- }}}

-- !!!!!!!
-- { "hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },

-- Menubar configuration
menubar.utils.terminal = terminal -- Set the terminal for applications that require it
-- }}}

-- {{{ Wibar
-- Create a textclock widget
-- mytextclock = wibox.widget.textclock(
--    '<span font="' ..
--    'termsyn 10' ..
--    '">%a %d %b, %H:%M </span>')

local theme = {}
--theme.font = 'Terminus 10.5'
theme.font = 'Monospace 16'

theme.bg_normal     = "#222222"
theme.bg_focus      = "#535d6c"
theme.bg_urgent     = "#ff0000"
theme.bg_minimize   = "#444444"
theme.bg_systray    = theme.bg_normal
theme.fg_normal = "#6A8FA3"
theme.fg_focus = "#B5D8DC"
theme.fg_urgent     = "#ffffff"
theme.fg_minimize = "#212F4C"
theme.border_normal = "#212F4C"
theme.border_focus = "#B5D8DC"
theme.border_marked = "#91231c"

local mytextclock = wibox.widget.textclock(
   markup.font(theme.font, markup(theme.fg_normal,'%a %d %b, %H:%M')))

local function year_progress()
   return math.floor(os.date("%j") / 365 * 100)
end
local myprogress = wibox.widget.textbox(year_progress())
gears.timer.start_new(60*60, function() myprogress:set_text(year_progress()) return true end)

local function stat_since(file)
   local now = os.time()
   local f = io.popen("stat -c %Y " .. os.getenv("HOME") .. file)
   local before = f:read()
   local diff = before and (now-before)/60/60 or 0
   return math.floor( diff )
end
local function awakeness()
   return stat_since("/.cache/awaketime") .. "|" .. stat_since("/.cache/sleeptime") .. "|" .. stat_since("/.cache/foodtime")
end
local myawakeness = wibox.widget.textbox(awakeness())
gears.timer.start_new(60*30, function() myawakeness:set_text(awakeness()) return true end)

local mycal = lain.widget.cal({
      attach_to = { mytextclock },
      notification_preset = {
         font = "Monospace 10",
         fg   = theme.fg_normal,
         bg   = theme.bg_normal
      }
})

local myweather = lain.widget.weather({
      city_id = 3435910,
      APPID = "c308ddb927e7e82126996fa9b3524237",
      notification_preset = { font = "Monospace 10" },
      settings = function()
         local descr = weather_now["weather"][1]["description"]:lower()
         local units = math.floor(weather_now["main"]["temp"])
         local msg = descr .. "@" .. units .. "° "
         widget:set_markup(
            markup.font(theme.font,
                        markup(theme.fg_normal, msg)))
      end
})

local myfs = lain.widget.fs({
      notification_preset = { fg = theme.fg_normal, bg = theme.bg_normal, font = theme.font },
      showpopup = "off",
      settings = function()
         local fsp = string.format(" %3.2f%s ", fs_now["/home"].free, fs_now["/home"].units)
         widget:set_markup(
            markup.font(theme.font,
                        markup(theme.fg_normal, fsp)))
      end
})

local mycpu = lain.widget.cpu({
   settings = function()
         widget:set_markup(
            markup.font(theme.font,
                        markup(theme.fg_normal, cpu_now.usage .. "(cpu) ")))
   end
})

local mymem = lain.widget.mem({
      timeout = 5,
      settings = function ()
         widget:set_markup(
            markup.font(theme.font,
                        markup(theme.fg_normal, mem_now.perc .. "(mem)")))
      end
})

local myvolume = lain.widget.alsa({
      settings = function()
         widget:set_markup(
            markup.font(theme.font,
                        markup(theme.fg_normal, " "  .. volume_now.level .. "%")))
      end
})

local mytemp = lain.widget.temp({
      timeout = 15,
      settings = function()
         local msg = math.floor(coretemp_now) .. "° "
         widget:set_markup(
            markup.font(theme.font, markup(theme.fg_normal,msg)))
      end
})

local mybattery = lain.widget.bat({
      battery = "BAT0",
      settings = function()
         if bat_now.perc < 10 then
            color = "#e33a6e"
         else
            color = theme.fg_normal
         end
         if bat_now.ac_status == 0 then -- 0:unplugged 1:plugged
            plug = "⚡ "
         else
            plug = " "
         end
         if bat_now.status == "Full" then
            state = "Full"
         else
            state = bat_now.perc
         end
         widget:set_markup(
            markup.font(theme.font, markup(color, state .. plug)))
      end
})

local mynet = lain.widget.net {
   settings = function()
      local rcv = string.format("%5d", math.ceil(net_now.received))
      local snt = string.format("%-2g", math.ceil(net_now.sent))
      local msg = rcv .. " ⇵ " .. snt .. "  "
      widget:set_markup(
         markup.font(
            theme.font,
            markup(theme.fg_normal,msg)))
end}

local myquake = lain.util.quake({
      app = "alacritty",
      argname = "--class %s",
      height = 0.25,
      width = 1,
      vert = "bottom",
      settings = function(c) c.sticky = true end
})

-- Create a wibox for each screen and add it
local taglist_buttons = gears.table.join(
   awful.button({ }, 1, function(t) t:view_only() end),
   awful.button({ modkey }, 1, function(t)
         if client.focus then
            client.focus:move_to_tag(t)
         end
   end),
   awful.button({ }, 3, awful.tag.viewtoggle),
   awful.button({ modkey }, 3, function(t)
         if client.focus then
            client.focus:toggle_tag(t)
         end
   end),
   awful.button({ }, 4, function(t) awful.tag.viewnext(t.screen) end),
   awful.button({ }, 5, function(t) awful.tag.viewprev(t.screen) end)
)

local tasklist_buttons = gears.table.join(
   awful.button({ }, 1, function (c)
         if c == client.focus then
            c.minimized = true
         else
            c:emit_signal(
               "request::activate",
               "tasklist",
               {raise = true}
            )
         end
   end),
   awful.button({ }, 3, function()
         awful.menu.client_list({ theme = { width = 250 } })
   end),
   awful.button({ }, 4, function ()
         awful.client.focus.byidx(1)
   end),
   awful.button({ }, 5, function ()
         awful.client.focus.byidx(-1)
end))

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

      -- Each screen has its own tag table.
      awful.tag({ "一", "二", "三", "四", "五", "六", "七", "八", "九" }, s, awful.layout.layouts[1])

      -- Create a promptbox for each screen
      s.mypromptbox = awful.widget.prompt()
      -- Create a taglist widget
      s.mytaglist = awful.widget.taglist {
         screen  = s,
         filter  = awful.widget.taglist.filter.all,
         buttons = taglist_buttons
      }

      -- Create a tasklist widget
      s.mytasklist = awful.widget.tasklist {
         screen  = s,
         filter  = awful.widget.tasklist.filter.currenttags,
         buttons = tasklist_buttons
      }

      -- Create the wibox
      s.mywibox = awful.wibar({ position = "top", screen = s })
      s.mywiboy = awful.wibar({ position = "bottom", screen = s })

      -- Add widgets to the wibox
      s.mywiboy:setup {
         layout = wibox.layout.align.horizontal,
         {
            layout = wibox.layout.fixed.horizontal,
            myfs.widget,
            mycpu,
            mymem,
            mynet
         },
         nil,
         {
            layout = wibox.layout.fixed.horizontal,
            myweather,
            mytemp,
            mybattery,
            myvolume
         }
      }
      s.mywibox:setup {
         layout = wibox.layout.align.horizontal,
         { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            s.mytaglist,
            s.mypromptbox,
         },
         s.mytasklist, -- Middle widget
         { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            wibox.widget.systray(),
            myawakeness,
            mytextclock,
            myprogress
         }
      }
end)
-- }}}

-- {{{ Mouse bindings
root.buttons(gears.table.join(
                awful.button({ }, 3, function () mymainmenu:toggle() end),
                awful.button({ }, 4, awful.tag.viewnext),
                awful.button({ }, 5, awful.tag.viewprev)
))
-- }}}

-- {{{ Key bindings
globalkeys = gears.table.join(
   awful.key({ modkey,           }, "s",      hotkeys_popup.show_help,
      {description="show help", group="awesome"}),
   awful.key({ modkey,           }, "Left",   awful.tag.viewprev,
      {description = "view previous", group = "tag"}),
   awful.key({ modkey,           }, "Right",  awful.tag.viewnext,
      {description = "view next", group = "tag"}),
   awful.key({ modkey,           }, "Escape", awful.tag.history.restore,
      {description = "go back", group = "tag"}),

   awful.key({ modkey,           }, "j",
      function () awful.client.focus.byidx( 1) end,
      {description = "focus next by index", group = "client"}),
   awful.key({ modkey,           }, "k",
      function () awful.client.focus.byidx(-1) end,
      {description = "focus previous by index", group = "client"}),

   -- Layout manipulation
   awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.byidx(  1)    end,
      {description = "swap with next client by index", group = "client"}),
   awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.byidx( -1)    end,
      {description = "swap with previous client by index", group = "client"}),
   awful.key({ modkey, "Control" }, "j", function () awful.screen.focus_relative( 1) end,
      {description = "focus the next screen", group = "screen"}),
   awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end,
      {description = "focus the previous screen", group = "screen"}),
   awful.key({ modkey,           }, "u", awful.client.urgent.jumpto,
      {description = "jump to urgent client", group = "client"}),
   awful.key({ modkey,           }, "Tab",
      function ()
         awful.client.focus.history.previous()
         if client.focus then
            client.focus:raise()
         end
      end,
      {description = "go back", group = "client"}),

   -- Standard program
   awful.key({ modkey,           }, "w", function () awful.spawn(terminal) end,
      {description = "open a terminal", group = "launcher"}),
   awful.key({ modkey, "Control" }, "r", awesome.restart,
      {description = "reload awesome", group = "awesome"}),
   awful.key({ modkey, "Shift"   }, "q", awesome.quit,
      {description = "quit awesome", group = "awesome"}),

   -- See: autocutsel
   awful.key({ modkey, }, "c",
      function () awful.spawn.with_shell(
            "xclip -selection primary -o | xclip -selection clipboard") end,
      {description = "copy secondary clipboard to primary"}),
   awful.key({ modkey, }, "v",
      function () awful.spawn.with_shell(
            "xclip -selection clipboard -o | xclip -selection primary") end,
      {description = "copy primary clipboard to secondary"}),
   --
   awful.key({ modkey }, ".",
      function () awesome.spawn("pactl set-sink-mute @DEFAULT_SINK@ toggle", false) end,
      {description = "mute volume"}),
   awful.key({ modkey }, "+",
      function () awesome.spawn("pactl set-sink-volume @DEFAULT_SINK@ +1%", false) end,
      {description = "increase volume"}),
   awful.key({ modkey }, "{",
      function () awesome.spawn("pactl set-sink-port @DEFAULT_SINK@ analog-output-headphones", false) end,
      {description = "audio output to speakers"}),
   awful.key({ modkey }, "}",
      function () awesome.spawn("pactl set-sink-port @DEFAULT_SINK@ analog-output-speaker", false) end,
      {description = "audio output to headphones"}),
   awful.key({ modkey }, "-",
      function () awesome.spawn("pactl set-sink-volume @DEFAULT_SINK@ -1%", false) end,
      {description = "decrease "}),
   --
   -- BOTH             xrandr --output eDP1 --mode 1366x768 --right-of HDMI1  --output HDMI1 --mode 1600x900 --rotation normal --primary
   -- MONITOR ONLY     xrandr --output eDP1 --off --output HDMI1 --mode 1600x900 --rotation normal
   -- MONITOR ONLY ROT xrandr --output eDP1 --off --output HDMI1 --mode 1600x900 --rotation left
   -- NOTEBOOK ONLY    xrandr --output eDP1 --mode 1366x768 --output HDMI1 --off
   awful.key({ modkey }, "F1",
      function () awesome.spawn("xrandr --output eDP1 --off --output HDMI1 --mode 1600x900 --rotation normal", false) end,
      {description = "xrandr HDMI ONLY"}),
   awful.key({ modkey }, "F2",
      function () awesome.spawn("xrandr --output eDP1 --mode 1366x768 --right-of HDMI1  --output HDMI1 --mode 1600x900 --rotation normal --primary", false) end,
      {description = "xrandr BOTH"}),
   awful.key({ modkey }, "F3",
      function () awesome.spawn("xrandr --output eDP1 --off --output HDMI1 --mode 1600x900 --rotation left", false) end,
      {description = "xrandr HDMI ROTATED"}),
   awful.key({ modkey }, "F4",
      function () awesome.spawn("xrandr --output eDP1 --mode 1366x768 --output HDMI1 --off", false) end,
      {description = "xrandr NOTEBOOK ONLY"}),
   --
   awful.key({ modkey }, "F5",
      function ()
         awesome.spawn(os.getenv("HOME") .. "/bin/pdflink.sh", false)
      end,
      {description = "save pdf location"}),
   awful.key({ modkey }, "F6",
      function ()
         awesome.spawn("touch " .. os.getenv("HOME") .. "/.cache/foodtime", false)
         myawakeness:set_text(awakeness())
      end,
      {description = "touch FOODTIME"}),
 --
   awful.key({ modkey }, "ñ",
      function () myquake:toggle() end,
      {description = "quake toggle"}),
   -- https://wiki.archlinux.org/index.php/awesome#Hide_/_show_wibox
   awful.key({ modkey }, "b",
      function ()
         myscreen = awful.screen.focused()
         myscreen.mywibox.visible = not myscreen.mywibox.visible
         myscreen.mywiboy.visible = not myscreen.mywiboy.visible
      end,
      {description = "toggle statusbar"}
   ),

   awful.key({ modkey,           }, "l",     function () awful.tag.incmwfact( 0.05)          end,
      {description = "increase master width factor", group = "layout"}),
   awful.key({ modkey,           }, "h",     function () awful.tag.incmwfact(-0.05)          end,
      {description = "decrease master width factor", group = "layout"}),
   awful.key({ modkey, "Shift"   }, "h",     function () awful.tag.incnmaster( 1, nil, true) end,
      {description = "increase the number of master clients", group = "layout"}),
   awful.key({ modkey, "Shift"   }, "l",     function () awful.tag.incnmaster(-1, nil, true) end,
      {description = "decrease the number of master clients", group = "layout"}),
   awful.key({ modkey, "Control" }, "h",     function () awful.tag.incncol( 1, nil, true)    end,
      {description = "increase the number of columns", group = "layout"}),
   awful.key({ modkey, "Control" }, "l",     function () awful.tag.incncol(-1, nil, true)    end,
      {description = "decrease the number of columns", group = "layout"}),
   awful.key({ modkey,           }, "space", function () awful.layout.inc( 1)                end,
      {description = "select next", group = "layout"}),
   awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(-1)                end,
      {description = "select previous", group = "layout"}),

   awful.key({ modkey, "Control" }, "n",
      function ()
         local c = awful.client.restore()
         -- Focus restored client
         if c then
            c:emit_signal(
               "request::activate", "key.unminimize", {raise = true}
            )
         end
      end,
      {description = "restore minimized", group = "client"}),

   -- Prompt
   awful.key({ modkey },            "r",
      function () awful.screen.focused().mypromptbox:run() end,
      {description = "run prompt", group = "launcher"}),

   awful.key({ modkey }, "x",
      function ()
         awful.prompt.run {
            prompt       = "Run Lua code: ",
            textbox      = awful.screen.focused().mypromptbox.widget,
            exe_callback = awful.util.eval,
            history_path = awful.util.get_cache_dir() .. "/history_eval"
         }
      end,
      {description = "lua execute prompt", group = "awesome"}),
   -- Menubar
   awful.key({ modkey }, "p", function() menubar.show() end,
      {description = "show the menubar", group = "launcher"})
)

clientkeys = gears.table.join(
   awful.key({ modkey,           }, "f",
      function (c)
         c.fullscreen = not c.fullscreen
         c:raise()
      end,
      {description = "toggle fullscreen", group = "client"}),
   awful.key({ modkey, "Shift"   }, "c",      function (c) c:kill()                         end,
      {description = "close", group = "client"}),
   awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                     ,
      {description = "toggle floating", group = "client"}),
   awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end,
      {description = "move to master", group = "client"}),
   awful.key({ modkey, "Control" }, "s",      function (c) c.sticky = not c.sticky          end,
      {description="toggle sticky", group="client"}),
   awful.key({ modkey,           }, "o",      function (c) c:move_to_screen()               end,
      {description = "move to screen", group = "client"}),
    awful.key({ modkey,           }, "t",      function (c) c.ontop = not c.ontop            end,
       {description = "toggle keep on top", group = "client"}),
    awful.key({ modkey,           }, "n",
       function (c)
          -- The client currently has the input focus, so it cannot be
          -- minimized, since minimized clients can't have the focus.
          c.minimized = true
       end ,
       {description = "minimize", group = "client"}),
    awful.key({ modkey,           }, "m",
       function (c)
          c.maximized = not c.maximized
          if c.maximized then
             c.border_width = 0
          else
             c.border_width = beautiful.border_width
          end
          c:raise()
       end ,
       {description = "(un)maximize", group = "client"}),
    awful.key({ modkey, "Control" }, "m",
       function (c)
          c.maximized_vertical = not c.maximized_vertical
          c:raise()
       end ,
       {description = "(un)maximize vertically", group = "client"}),
    awful.key({ modkey, "Shift"   }, "m",
       function (c)
          c.maximized_horizontal = not c.maximized_horizontal
          c:raise()
       end ,
       {description = "(un)maximize horizontally", group = "client"})
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it work on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
   globalkeys = gears.table.join(
      globalkeys,
      -- View tag only.
      awful.key({ modkey }, "#" .. i + 9,
         function ()
            local screen = awful.screen.focused()
            local tag = screen.tags[i]
            if tag then
               tag:view_only()
            end
         end,
         {description = "view tag #"..i, group = "tag"}),
      -- Toggle tag display.
      awful.key({ modkey, "Control" }, "#" .. i + 9,
         function ()
            local screen = awful.screen.focused()
            local tag = screen.tags[i]
            if tag then
               awful.tag.viewtoggle(tag)
            end
         end,
         {description = "toggle tag #" .. i, group = "tag"}),
      -- Move client to tag.
      awful.key({ modkey, "Shift" }, "#" .. i + 9,
         function ()
            if client.focus then
               local tag = client.focus.screen.tags[i]
               if tag then
                  client.focus:move_to_tag(tag)
               end
            end
         end,
         {description = "move focused client to tag #"..i, group = "tag"}),
      -- Toggle tag on focused client.
      awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
         function ()
            if client.focus then
               local tag = client.focus.screen.tags[i]
               if tag then
                  client.focus:toggle_tag(tag)
               end
            end
         end,
         {description = "toggle focused client on tag #" .. i, group = "tag"})
   )
end

clientbuttons = gears.table.join(
   awful.button({ }, 1, function (c)
         c:emit_signal("request::activate", "mouse_click", {raise = true})
   end),
   awful.button({ modkey }, 1, function (c)
         c:emit_signal("request::activate", "mouse_click", {raise = true})
         awful.mouse.client.move(c)
   end),
   awful.button({ modkey }, 3, function (c)
         c:emit_signal("request::activate", "mouse_click", {raise = true})
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
   { rule = { },
     properties = { border_width = beautiful.border_width,
                    border_color = beautiful.border_normal,
                    focus = awful.client.focus.filter,
                    raise = true,
                    keys = clientkeys,
                    buttons = clientbuttons,
                    screen = awful.screen.preferred,
                    placement = awful.placement.no_overlap+awful.placement.no_offscreen
     }
   },

   -- Floating clients.
   { rule_any = {
        instance = {
           "DTA",  -- Firefox addon DownThemAll.
           "copyq",  -- Includes session name in class.
           "pinentry",
        },
        class = {
           "Arandr",
           "Blueman-manager",
           "Gpick",
           "Kruler",
           "MessageWin",  -- kalarm.
           --"Sxiv",
           "Tor Browser", -- Needs a fixed window size to avoid fingerprinting by screen size.
           "Wpa_gui",
           "veromix",
           "xtightvncviewer"},

        -- Note that the name property shown in xprop might be set slightly after creation of the client
        -- and the name shown there might not match defined rules here.
        name = {
           "ipickme",
           "Event Tester",  -- xev.
        },
        role = {
           "AlarmWindow",  -- Thunderbird's calendar.
           "ConfigManager",  -- Thunderbird's about:config.
           "pop-up",       -- e.g. Google Chrome's (detached) Developer Tools.
        }
   }, properties = { floating = true }},

   { rule_any = {
        name = {
           "Picture-in-Picture",
        },
   }, properties = { sticky = true, ontop = true }},

   -- Add titlebars to normal clients and dialogs
   -- { rule_any = {type = { "normal", "dialog" }
   --              }, properties = { titlebars_enabled = true }
   -- },

   -- Set Firefox to always map on the tag named "2" on screen 1.
   -- { rule = { class = "Firefox" },
   --   properties = { screen = 1, tag = "2" } },
}
-- }}}

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.connect_signal(
   "manage",
   function (c)
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

-- Add a titlebar if titlebars_enabled is set to true in the rules.
client.connect_signal(
   "request::titlebars", function(c)
      -- buttons for the titlebar
      local buttons = gears.table.join(
         awful.button({ }, 1, function()
               c:emit_signal("request::activate", "titlebar", {raise = true})
               awful.mouse.client.move(c)
         end),
         awful.button({ }, 3, function()
               c:emit_signal("request::activate", "titlebar", {raise = true})
               awful.mouse.client.resize(c)
         end)
      )

      awful.titlebar(c) : setup {
         { -- Left
            awful.titlebar.widget.iconwidget(c),
            buttons = buttons,
            layout  = wibox.layout.fixed.horizontal
         },
         { -- Middle
            { -- Title
               align  = "center",
               widget = awful.titlebar.widget.titlewidget(c)
            },
            buttons = buttons,
            layout  = wibox.layout.flex.horizontal
         },
         { -- Right
            awful.titlebar.widget.floatingbutton (c),
            awful.titlebar.widget.maximizedbutton(c),
            awful.titlebar.widget.stickybutton   (c),
            awful.titlebar.widget.ontopbutton    (c),
            awful.titlebar.widget.closebutton    (c),
            layout = wibox.layout.fixed.horizontal()
         },
         layout = wibox.layout.align.horizontal
                                }
end)

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal(
   "mouse::enter",
   function(c) c:emit_signal("request::activate", "mouse_enter", {raise = false})
end)

client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
-- }}}

local function run_once(cmd)
   findme = cmd
   firstspace = cmd:find(" ")
   if firstspace then
      findme = cmd:sub(0, firstspace-1)
   end
   awful.spawn.with_shell(
      string.format("pgrep -u $USER -x %s > /dev/null || (%s)",
                    findme, cmd))
end

run_once("mpd")
run_once("mpdas")
run_once("wmname LG3D")
run_once("nm-applet")
--run_once("urxvtd")
run_once("keynav")
--run_once("compton -cCGfF -o 0.38 -O 200 -I 200 -t 0 -l 0 -r 3 -m 0.88 --invert-color-include 'class_g=\"Zeal\"'")
awesome.spawn("xmodmap ~/.Xmodmap", false)
awesome.spawn("bash " .. os.getenv("HOME") .. "/.fehbg", false)
awesome.spawn("xset -b", false)                  -- disable beep
awesome.spawn("amixer set Capture nocap", false) -- disable mic
awesome.spawn("amixer -c 0 sset \"Auto-Mute Mode\" Disabled", false) -- disable auto-mute
-- awful.util.spawn_with_shell("pgrep mpdas || mpdas &") -- scroll blogger

-- GC
-- https://www.reddit.com/r/awesomewm/comments/iguwcj/memory_leaks/
gears.timer.start_new(10, function() collectgarbage("step", 20000) return true end)
