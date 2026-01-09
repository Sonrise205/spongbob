local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("TweenService");
local _ = require(l_ReplicatedStorage_0.Packages.Knit);
local v3 = require(l_ReplicatedStorage_0.Packages.Component);
local v4 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v5 = require(l_ReplicatedStorage_0.Packages.Timer);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local _ = require(l_ReplicatedStorage_0.Shared.Modules.WWSDebug);
local v8 = require(l_ReplicatedStorage_0.Shared.Util.DateTimeUtil);
local _ = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local _ = TweenInfo.new(5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, -1, true);
local v11 = v3.new({
    Tag = script.Name, 
    Ancestors = {
        workspace
    }
});
local function _(v12) --[[ Line: 33 ]] --[[ Name: SecondsToDHMS ]]
    v12 = math.floor(v12);
    local v13 = math.floor(v12 / 86400);
    v12 = v12 % 86400;
    local v14 = math.floor(v12 / 3600);
    v12 = v12 % 3600;
    local v15 = math.floor(v12 / 60);
    local v16 = v12 % 60;
    return string.format("%02d:%02d:%02d:%02d", v13, v14, v15, v16);
end;
v11.Construct = function(v18) --[[ Line: 49 ]] --[[ Name: Construct ]]
    -- upvalues: v8 (copy)
    local l_Attribute_0 = v18.Instance:GetAttribute("Countdown");
    if not l_Attribute_0 then
        v18.Instance:Destroy();
        return;
    else
        l_Attribute_0 = string.split(l_Attribute_0, ",");
        local v20 = l_Attribute_0[1] or 0;
        local v21 = l_Attribute_0[2] or 0;
        local v22 = l_Attribute_0[3] or 0;
        local v23 = l_Attribute_0[4] or 0;
        local v24 = l_Attribute_0[5] or 0;
        v18.availableOn = v8:GetForCT({
            year = tonumber(v20), 
            month = tonumber(v21), 
            day = tonumber(v22), 
            hour = tonumber(v23), 
            minute = tonumber(v24)
        });
        return;
    end;
end;
v11.Start = function(v25) --[[ Line: 74 ]] --[[ Name: Start ]]
    -- upvalues: v4 (copy), v5 (copy)
    v25.dump = v4.new();
    local l_workspace_ServerTimeNow_0 = workspace:GetServerTimeNow();
    local v27 = math.clamp(v25.availableOn.UnixTimestamp - l_workspace_ServerTimeNow_0, 0, 1e999);
    local v28 = v25.Instance:GetAttribute("FormatString") or "SOMETHING EXOTIC IS COMING IN";
    local v29 = v25.Instance:GetAttribute("FormatStringArrived") or "SOMETHING EXOTIC IS COMING NOW!";
    v25.dump:Add(v5.Simple(1, function() --[[ Line: 83 ]]
        -- upvalues: v27 (ref), v25 (copy), v29 (copy), v28 (copy)
        v27 = v27 - 1;
        if v27 < 1 then
            v25.Instance["Ring beam"].BillboardAtt.BillboardGui.Interaction.TextLabel.Text = v29;
            v25.dump:Remove("Timer");
            return;
        else
            local l_TextLabel_0 = v25.Instance["Ring beam"].BillboardAtt.BillboardGui.Interaction.TextLabel;
            local v31 = "%* %*";
            local l_v28_0 = v28;
            local v33 = math.floor(v27);
            local v34 = math.floor(v33 / 86400);
            v33 = v33 % 86400;
            local v35 = math.floor(v33 / 3600);
            v33 = v33 % 3600;
            local v36 = math.floor(v33 / 60);
            local v37 = v33 % 60;
            l_TextLabel_0.Text = v31:format(l_v28_0, (string.format("%02d:%02d:%02d:%02d", v34, v35, v36, v37)));
            return;
        end;
    end), "Timer");
    v25.dump:AttachTo(v25.Instance);
end;
v11.Stop = function(_) --[[ Line: 98 ]] --[[ Name: Stop ]]

end;
return v11;