local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.TableUtil);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local _ = require(l_ReplicatedStorage_0.Shared.Modules.WWSDebug);
local v4 = require(l_ReplicatedStorage_0.Shared.Modules.Timer);
local v5 = require(l_ReplicatedStorage_0.SummoningPools);
local v6 = require(l_ReplicatedStorage_0.Shared.Data.UnitImages);
return function(v7, v8, v9, v10, v11) --[[ Line: 14 ]]
    -- upvalues: v5 (copy), v1 (copy), v6 (copy), v4 (copy)
    if not v7 or not v8 or not v9 then
        return;
    else
        local v12 = {};
        local l_v5_UnitsPool_0 = v5:GetUnitsPool(v8);
        if typeof(v9) == "string" and l_v5_UnitsPool_0[v9] then
            v12 = table.clone(l_v5_UnitsPool_0[v9]);
            for _, v15 in v12 do
                v15.Rarity = v9;
            end;
        elseif typeof(v9) == "table" then
            local v16 = {};
            for v17, v18 in v9 do
                table.insert(v16, {
                    rarity = v17, 
                    weight = v18.weight
                });
            end;
            table.sort(v16, function(v19, v20) --[[ Line: 37 ]]
                return v19.weight < v20.weight;
            end);
            for _, v22 in v16 do
                local v23 = l_v5_UnitsPool_0 and l_v5_UnitsPool_0[v22.rarity];
                if v23 then
                    v23 = table.clone(v23);
                    for _, v25 in v23 do
                        v25.Rarity = v22.rarity;
                    end;
                    v12 = v1.Extend(v12, v23);
                end;
            end;
            table.clear(v16);
            v16 = nil;
        end;
        local v26 = 1;
        local function v30() --[[ Line: 63 ]] --[[ Name: renderUnitFromIndex ]]
            -- upvalues: v12 (ref), v26 (ref), v6 (ref), v7 (copy), v11 (copy)
            local v27 = v12[v26];
            v6:SetImage(v7, v27.name or v27.Name);
            if v27.Rarity and v27.Rarity == "Secret" then
                v7.ImageColor3 = Color3.new(0, 0, 0);
            else
                v7.ImageColor3 = Color3.new(1, 1, 1);
            end;
            if v27.Rarity and v11 and typeof(v11) == "function" then
                task.spawn(v11, v27.Rarity);
            end;
            local v28 = v7.Parent:FindFirstChild("Backdrop") or v7.Parent.Parent:FindFirstChild("Backdrop");
            local v29 = v7.Parent:FindFirstChild("Glow") or v7.Parent.Parent:FindFirstChild("Glow");
            if v28 then
                v28:SetAttribute("Rarity", v27.Rarity);
            end;
            if v29 then
                v29:SetAttribute("Rarity", v27.Rarity);
            end;
            v28 = nil;
            v29 = nil;
        end;
        return v4.Simple(v10 or 1, function() --[[ Line: 97 ]]
            -- upvalues: v26 (ref), v12 (ref), v30 (copy)
            if v26 > #v12 then
                v26 = 1;
            end;
            v30();
            v26 = v26 + 1;
        end, true);
    end;
end;