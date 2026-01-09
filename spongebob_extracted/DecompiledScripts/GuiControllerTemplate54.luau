local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.Knit);
local _ = require(l_ReplicatedStorage_0.Packages.Dumpster);
local _ = require(l_ReplicatedStorage_0.Packages.TableUtil);
local v4 = nil;
return {
    primaryMenu = false, 
    Init = function(v5, v6, v7) --[[ Line: 25 ]] --[[ Name: Init ]]
        -- upvalues: v4 (ref), v1 (copy)
        v4 = v1.GetController("UIController");
        v5.currentMode = v7;
        v5.ui = v6;
        v5.main = v6.Main;
    end, 
    Start = function(_) --[[ Line: 34 ]] --[[ Name: Start ]]

    end, 
    Closed = function(_) --[[ Line: 38 ]] --[[ Name: Closed ]]

    end
};