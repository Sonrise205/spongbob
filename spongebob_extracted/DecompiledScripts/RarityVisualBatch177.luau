local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_RunService_0 = game:GetService("RunService");
local v2 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v3 = require(l_ReplicatedStorage_0.Packages.TableUtil);
local v4 = {};
v4.__index = v4;
local function _(v5) --[[ Line: 20 ]] --[[ Name: fixRarity ]]
    -- upvalues: v3 (copy)
    if #v5 >= 1 then
        return v5[1].rarity or v5[1].Rarity;
    else
        local v6 = v3.Keys(v5);
        if #v6 < 1 then
            return;
        else
            return v3.Shuffle(v6)[1];
        end;
    end;
end;
v4.new = function(v8) --[[ Line: 35 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), v4 (copy)
    local v9 = setmetatable({
        dumpster = v2.new(), 
        _itemsToAnimate = {}, 
        enabled = false, 
        batchSize = v8 or 20
    }, v4);
    v9.dumpster:Add(function() --[[ Line: 43 ]]
        -- upvalues: v9 (copy)
        table.clear(v9._itemsToAnimate);
    end);
    return v9;
end;
v4.AddObject = function(v10, v11, v12) --[[ Line: 51 ]] --[[ Name: AddObject ]]
    -- upvalues: v3 (copy)
    if typeof(v12) == "table" then
        local l_v12_0 = v12;
        if #l_v12_0 >= 1 then
            v12 = l_v12_0[1].rarity or l_v12_0[1].Rarity;
        else
            local v14 = v3.Keys(l_v12_0);
            v12 = if #v14 < 1 then nil else v3.Shuffle(v14)[1];
        end;
    end;
    if not v12 then
        return;
    else
        v11:SetAttribute("Rarity", v12);
        table.insert(v10._itemsToAnimate, v11);
        if v10.enabled then
            v11:AddTag("VisualizeRarity");
        end;
        return;
    end;
end;
v4.RemoveObject = function(v15, v16) --[[ Line: 68 ]] --[[ Name: RemoveObject ]]
    local v17 = table.find(v15._itemsToAnimate, v16);
    if v17 then
        table.remove(v15._itemsToAnimate, v17);
    end;
    v16:RemoveTag("VisualizeRarity");
    v16:SetAttribute("Rarity");
end;
v4.ChangeRarity = function(v18, v19, v20) --[[ Line: 79 ]] --[[ Name: ChangeRarity ]]
    -- upvalues: v3 (copy)
    if typeof(v20) == "table" then
        local l_v20_0 = v20;
        if #l_v20_0 >= 1 then
            v20 = l_v20_0[1].rarity or l_v20_0[1].Rarity;
        else
            local v22 = v3.Keys(l_v20_0);
            v20 = if #v22 < 1 then nil else v3.Shuffle(v22)[1];
        end;
    end;
    if not v20 then
        return;
    elseif not table.find(v18._itemsToAnimate, v19) then
        v18:AddObject(v19, v20);
        return;
    else
        v19:RemoveTag("VisualizeRarity");
        v19:SetAttribute("Rarity", v20);
        if v18.enabled then
            v19:AddTag("VisualizeRarity");
        end;
        return;
    end;
end;
v4.Enable = function(v23) --[[ Line: 101 ]] --[[ Name: Enable ]]
    -- upvalues: l_RunService_0 (copy)
    if v23.enabled then
        return;
    else
        v23.enabled = true;
        for v24, v25 in v23._itemsToAnimate do
            if v23.enabled then
                v25:AddTag("VisualizeRarity");
                if v24 % v23.batchSize == 0 then
                    l_RunService_0.RenderStepped:Wait();
                end;
            else
                break;
            end;
        end;
        return;
    end;
end;
v4.Disable = function(v26, v27) --[[ Line: 125 ]] --[[ Name: Disable ]]
    -- upvalues: l_RunService_0 (copy)
    v26.enabled = false;
    for v28, v29 in v26._itemsToAnimate do
        if not v26.enabled then
            v29:RemoveTag("VisualizeRarity");
            if v27 then
                v29:SetAttribute("Rarity");
            end;
            if v28 % v26.batchSize == 0 then
                l_RunService_0.RenderStepped:Wait();
            end;
        else
            break;
        end;
    end;
end;
v4.Destroy = function(v30) --[[ Line: 150 ]] --[[ Name: Destroy ]]
    v30:Disable(true);
    v30.dumpster:Destroy();
    table.clear(v30);
    setmetatable(v30);
end;
return v4;