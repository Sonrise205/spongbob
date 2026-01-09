local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.Knit);
local v2 = require(l_ReplicatedStorage_0.Packages.Component);
local v3 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v5 = require(l_ReplicatedStorage_0.Shared.Util.DateTimeUtil);
local v9 = v2.new({
    Tag = script.Name, 
    Ancestors = {
        v1.PlayerGui
    }, 
    Extensions = {
        {
            ShouldConstruct = function(v6) --[[ Line: 28 ]] --[[ Name: ShouldConstruct ]]
                if not v6.Instance then
                    return false;
                else
                    local v7 = v6.Instance:IsA("GuiObject") or false;
                    local l_Attribute_0 = v6.Instance:GetAttribute("RemoveTime");
                    return v7 and l_Attribute_0 ~= nil and typeof(l_Attribute_0) == "string";
                end;
            end
        }
    }
});
v9.Construct = function(v10) --[[ Line: 44 ]] --[[ Name: Construct ]]
    -- upvalues: v3 (copy)
    v10.dump = v3.new();
    v10.dump:Add(function() --[[ Line: 48 ]]
        -- upvalues: v10 (copy)
        v10.dump = nil;
    end);
end;
v9.Start = function(v11) --[[ Line: 53 ]] --[[ Name: Start ]]
    -- upvalues: v5 (copy)
    local l_workspace_ServerTimeNow_0 = workspace:GetServerTimeNow();
    local l_Attribute_1 = v11.Instance:GetAttribute("RemoveTime");
    local v14 = string.split(l_Attribute_1, ",");
    if #v14 < 1 then
        return;
    else
        for v15, v16 in v14 do
            v14[v15] = tonumber(v16);
        end;
        local l_v5_ForCTUnix_0 = v5:GetForCTUnix({
            Year = v14[1] or 2025, 
            Month = v14[2] or 1, 
            Day = v14[3] or 1, 
            Hour = v14[4] or 0, 
            Minute = v14[5] or 0, 
            Second = v14[6] or 0
        });
        if l_v5_ForCTUnix_0 <= l_workspace_ServerTimeNow_0 then
            v11.Instance:Destroy();
            return;
        else
            task.delay(l_v5_ForCTUnix_0 - l_workspace_ServerTimeNow_0, function() --[[ Line: 82 ]]
                -- upvalues: v11 (copy)
                v11.Instance:Destroy();
            end);
            return;
        end;
    end;
end;
v9.Stop = function(v18) --[[ Line: 87 ]] --[[ Name: Stop ]]
    if v18.dump then
        v18.dump:Destroy();
    end;
end;
return v9;