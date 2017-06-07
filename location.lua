local wifi_watcher = hs.wifi.watcher.new(function(event)
    local ssid = hs.wifi.currentNetwork()
    if ssid == "cause" then
        if hs.audiodevice.defaultOutputDevice():jackConnected() then
            return
        end
        hs.alert("No headphones and connected to cause network. Muting.")
        hs.audiodevice.defaultOutputDevice():setMuted(true)
    end
end):start()

local power_watcher = hs.caffeinate.watcher.new(function(event)
    if event == hs.caffeinate.watcher.systemDidWake then
        local ssid = hs.wifi.currentNetwork()
        if ssid == "cause" then
            hs.alert("Computer just woke and is connected to cause. Muting.")
            hs.audiodevice.defaultOutputDevice():setMuted(true)
        end
    end
end):start()

local audio_watcher = hs.audiodevice.defaultOutputDevice():watcherCallback(function(device, ev, scope, element)
    local ssid = hs.wifi.currentNetwork()
    if hs.audiodevice.defaultOutputDevice():jackConnected() then
        return
    end
    hs.alert(device)
    if ssid == "cause" and ev == "jack" then
        hs.alert("Headphones were unplugged and computer is connected to cause. Muting.")
        hs.audiodevice.defaultOutputDevice():setMuted(true)
    end
end):watcherStart()

return {
    power_watcher = power_watcher,
    wifi_watcher = wifi_watcher
}
