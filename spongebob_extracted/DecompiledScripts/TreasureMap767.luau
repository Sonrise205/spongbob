local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.Knit);
local _ = require(l_ReplicatedStorage_0.Packages.Dumpster);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v4 = nil;
local v5 = nil;
local v6 = nil;
return {
    primaryMenu = true, 
    blur = true, 
    ToggleAll = {}, 
    Init = function(v7, v8) --[[ Line: 34 ]] --[[ Name: Init ]]
        -- upvalues: v4 (ref), v1 (copy), v5 (ref), v6 (ref)
        v4 = v1.GetController("DataController");
        v5 = v1.GetController("UIController");
        v6 = v1.GetController("AudioController");
        v7.ui = v8;
        v7.main = v8.Main;
        v7.exitBtn = v7.main.Exit;
    end, 
    Start = function(v9, _) --[[ Line: 45 ]] --[[ Name: Start ]]
        -- upvalues: v5 (ref)
        v5:HandleButton(v9.exitBtn, function() --[[ Line: 46 ]]
            -- upvalues: v5 (ref)
            v5:Toggle(script.Name, false);
        end);
    end, 
    Opened = function(_) --[[ Line: 51 ]] --[[ Name: Opened ]]
        -- upvalues: v6 (ref)
        v6:PlaySound({
            name = "Hunt.TreasureMap"
        });
    end
};