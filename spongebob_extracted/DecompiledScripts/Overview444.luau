local _ = game:GetService("ReplicatedFirst");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v2 = require(l_ReplicatedStorage_0.Packages.Knit);
local v3 = v2.GetController("UIController");
local v4 = v2.GetService("RobloxEventService");
return {
    Init = function(v5, v6, v7) --[[ Line: 11 ]] --[[ Name: Init ]]
        v5.frame = v6;
        v5.parentModule = v7;
    end, 
    Start = function(v8) --[[ Line: 16 ]] --[[ Name: Start ]]
        -- upvalues: v3 (copy), v4 (copy)
        v3:HandleButton(v8.frame.Play, function() --[[ Line: 17 ]]
            -- upvalues: v4 (ref)
            v4:OpenUI();
        end);
        v3:HandleButton(v8.frame.Frames.Spend.Folder.Shop, function() --[[ Line: 21 ]]
            -- upvalues: v8 (copy)
            v8.parentModule:SetPage("Shop");
        end);
    end
};