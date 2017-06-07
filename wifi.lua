
local obj = {}
obj.__index = obj

obj.watcher = nil

function obj:start()
    callback = function(self, flags)
         if (flags & hs.network.reachability.flags.reachable) > 0 then
             -- Internet is reachable
         else
             -- Interner is not reachable
             hs.alert("Internet Disconnected")
         end
    end
    self.watcher = hs.network.reachability.forAddress("8.8.8.8"):setCallback(callback):start()
    callback(self.watcher, self.watcher:status())
end

obj:start()

return obj
