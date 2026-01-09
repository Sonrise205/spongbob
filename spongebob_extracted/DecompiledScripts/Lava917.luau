local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_RunService_0 = game:GetService("RunService");
local _ = require(l_ReplicatedStorage_0.Packages.Knit);
local v3 = require(l_ReplicatedStorage_0.Packages.Component);
local v4 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v6 = v3.new({
    Tag = script.Name, 
    Ancestors = {
        workspace
    }
});
v6.Construct = function(v7) --[[ Line: 34 ]] --[[ Name: Construct ]]
    -- upvalues: v4 (copy)
    v7.dump = v4.new();
    v7.texture = v7.Instance:FindFirstChildOfClass("Texture");
    if not v7.texture then
        v7.Instance:RemoveTag(v7.Tag);
        return;
    else
        v7.dump:Add(function() --[[ Line: 44 ]]
            -- upvalues: v7 (copy)
            v7.dump = nil;
        end);
        return;
    end;
end;
v6.Start = function(v8) --[[ Line: 49 ]] --[[ Name: Start ]]
    -- upvalues: l_RunService_0 (copy)
    local v9 = v8.Instance:GetAttribute("Speed") or 8;
    local v10 = v8.Instance:GetAttribute("Direction") or -1;
    if typeof(v10) ~= "number" or v10 ~= -1 and v10 ~= 1 then
        v10 = -1;
    end;
    local v11 = v8.Instance:GetAttribute("Axis") or "U";
    if v11 ~= "U" and v11 ~= "V" and v11 ~= "UV" then
        v11 = "U";
    end;
    v8.dump:Add(l_RunService_0.RenderStepped:Connect(function(v12) --[[ Line: 62 ]]
        -- upvalues: v9 (copy), v10 (ref), v11 (ref), v8 (copy)
        local v13 = v12 * v9 * v10;
        if v11 == "UV" then
            local l_texture_0 = v8.texture;
            l_texture_0.OffsetStudsU = l_texture_0.OffsetStudsU + v13;
            l_texture_0 = v8.texture;
            l_texture_0.OffsetStudsV = l_texture_0.OffsetStudsV + v13;
            return;
        else
            local l_texture_1 = v8.texture;
            local v16 = ("OffsetStuds%*"):format(v11);
            l_texture_1[v16] = l_texture_1[v16] + v13;
            return;
        end;
    end));
end;
v6.Stop = function(v17) --[[ Line: 76 ]] --[[ Name: Stop ]]
    if v17.dump then
        v17.dump:Destroy();
    end;
end;
return v6;