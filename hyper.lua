-- The "control" key is mapped to send "F18"

local hyper_mode = hs.hotkey.modal.new({}, 'F17')

hs.hotkey.bind({}, "F18", function()
    hyper_mode:enter()
end, function()
    hyper_mode:exit()
end)

return hyper_mode
