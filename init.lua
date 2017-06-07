--[[

Hammerspoon Config
Joshua Bird

This configuration relies on a few settings that are not under the purview of hammerspoon. The
physical caps lock key should mapped to send "control", and the physical control key should send
'f18'. This can be acheived with a program such as Karabiner (Karabiner Elements on macOS Sierra).

--]]


local live_reloader = require("live_reload")
local keyboard = require("keyboard")
local window_manager = require("window_management")
local locations = require("location")
local wifi_watcher = require("wifi")
local displays = require("display")
