--[[

Set up automatic config reloading.
Triggered when any file in the ~/.hammerspoon" directory changes.

--]]

local config_dir = os.getenv("HOME") .. "/.hammerspoon/"

function reloadConfig(files)
    doReload = false
    for _,file in pairs(files) do
        if file:sub(-4) == ".lua" then
            doReload = true
        end
    end
    if doReload then
        hs.alert.show("Reloading Configuration", {
            strokeWidth=1.2,
            radius=12,
            textSize=18
        },  hs.screen.mainScreen(), .9)
        hs.reload()
   end
end

local config_reloader = hs.pathwatcher.new(config_dir, reloadConfig):start()

return config_reloader
