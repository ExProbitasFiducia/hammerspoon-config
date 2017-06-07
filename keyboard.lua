

-- Binds "^[" to "escape"

hs.hotkey.bind({"ctrl"}, "[", function()
    hs.eventtap.keyStroke({}, "escape", 0)
end)


-- Binds "^H", "^J, "^K", and "^L" to "left", "down", "up", and "right" respectively.

hs.hotkey.bind({"ctrl"}, "h", function()
    hs.eventtap.keyStroke({}, "left", 0)
end, function()
    return
end, function()
    hs.eventtap.keyStroke({}, "left", 0)
end)

hs.hotkey.bind({"ctrl"}, "j", function()
    hs.eventtap.keyStroke({}, "down", 0)
end, function()
    return
end, function()
    hs.eventtap.keyStroke({}, "down", 0)
end)

hs.hotkey.bind({"ctrl"}, "k", function()
    hs.eventtap.keyStroke({}, "up", 0)
end, function()
    return
end, function()
    hs.eventtap.keyStroke({}, "up", 0)
end)

hs.hotkey.bind({"ctrl"}, "l", function()
    hs.eventtap.keyStroke({}, "right", 1)
end, function()
    return
end, function()
    hs.eventtap.keyStroke({}, "right", 0)
end)


-- Sends "escape" if "caps lock" is held for less than .2 seconds, and no other keys are pressed.

local send_escape = false
local last_mods = {}
local control_key_timer = hs.timer.delayed.new(0.2, function()
    send_escape = false
end)

hs.eventtap.new({hs.eventtap.event.types.flagsChanged}, function(evt)
    local new_mods = evt:getFlags()
    if last_mods["ctrl"] == new_mods["ctrl"] then
        return false
    end
    if not last_mods["ctrl"] then
        last_mods = new_mods
        send_escape = true
        control_key_timer:start()
    else
        if send_escape then
            hs.eventtap.keyStroke({}, "escape")
        end
        last_mods = new_mods
        control_key_timer:stop()
    end
    return false
end):start()


hs.eventtap.new({hs.eventtap.event.types.keyDown}, function(evt)
    send_escape = false
    return false
end):start()

