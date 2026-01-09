local l_Players_0 = game:GetService("Players");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v2 = require(l_ReplicatedStorage_0.Packages.Knit);
local _ = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v4 = require(l_ReplicatedStorage_0.Packages.Promise);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v6 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local v7 = require(l_ReplicatedStorage_0.Shared.Data.UnitShared);
local v8 = require(l_ReplicatedStorage_0.Shared.Data.PetShared);
local l_MINTING_0 = require(l_ReplicatedStorage_0.Shared.Data.Variables).MINTING;
local v10 = nil;
local v11 = nil;
local v12 = nil;
local v13 = {};
local v14 = {};
local v15 = v2.CreateController({
    Name = script.Name, 
    Client = {}
});
v15.KnitInit = function(_) --[[ Line: 46 ]] --[[ Name: KnitInit ]]
    -- upvalues: v10 (ref), v2 (copy), v11 (ref), v12 (ref)
    v10 = v2.GetController("DataController");
    v11 = v2.GetService("UnitService");
    v12 = v2.GetController("UnitController");
end;
v15.KnitStart = function(v17) --[[ Line: 53 ]] --[[ Name: KnitStart ]]
    -- upvalues: v11 (ref), v7 (copy), v14 (copy)
    v11.UnitDataUpdated:Connect(function(v18, v19) --[[ Line: 54 ]]
        -- upvalues: v7 (ref), v17 (copy)
        local v20, v21 = v7:ParseLoadout(v18);
        if not v20 or not v21 then
            return;
        else
            v17:_updateLabel(v18, v19);
            return;
        end;
    end);
    task.spawn(function() --[[ Line: 63 ]]
        -- upvalues: v14 (ref)
        while true do
            local l_workspace_ServerTimeNow_0 = workspace:GetServerTimeNow();
            for v23, v24 in v14 do
                if l_workspace_ServerTimeNow_0 - v24.lastUsed > 120 then
                    v14[v23] = nil;
                end;
            end;
            task.wait(60);
        end;
    end);
end;
v15.ApplyMintToLabel = function(v25, v26, v27, v28, v29, v30, v31, v32) --[[ Line: 80 ]] --[[ Name: ApplyMintToLabel ]]
    -- upvalues: v7 (copy), v8 (copy), l_MINTING_0 (copy), v4 (copy), v13 (copy)
    local v33 = if (v30 or "Units") == "Units" then select(2, v7:GetRarity(v26)) else select(2, v8:GetRarity(v26));
    if not v28.Mint and not l_MINTING_0.UNITS[v26] and not l_MINTING_0.PETS[v26] and not l_MINTING_0.RARITIES[v33] then
        if v32 then
            v29.Visible = false;
        end;
        return v4.resolve(false);
    else
        local l_v7_LoadoutString_0 = v7:CreateLoadoutString(v26, v27);
        v13[l_v7_LoadoutString_0] = {
            label = v29, 
            format = v31
        };
        v29:RemoveTag("VisualizeRarity");
        v25:_updateLabel(l_v7_LoadoutString_0, v28);
        return v4.resolve(true, function() --[[ Line: 112 ]]
            -- upvalues: v13 (ref), v27 (copy)
            v13[v27] = nil;
        end);
    end;
end;
v15.ApplyMintedByToLabel = function(_, v36, v37) --[[ Line: 117 ]] --[[ Name: ApplyMintedByToLabel ]]
    -- upvalues: v14 (copy), v4 (copy), l_Players_0 (copy)
    if v14[tostring(v36.MintedBy)] then
        v37.Text = ("@%*"):format(v14[tostring(v36.MintedBy)].username);
        v14[tostring(v36.MintedBy)].lastUsed = workspace:GetServerTimeNow();
        return v4.resolve(true);
    else
        return v4.retryWithDelay(function() --[[ Line: 127 ]]
            -- upvalues: v4 (ref), l_Players_0 (ref), v36 (copy)
            return v4.try(function() --[[ Line: 128 ]]
                -- upvalues: l_Players_0 (ref), v36 (ref)
                return l_Players_0:GetNameFromUserIdAsync(v36.MintedBy);
            end);
        end, 4, 4):andThen(function(v38) --[[ Line: 131 ]]
            -- upvalues: v14 (ref), v36 (copy), v37 (copy)
            if not v38 then
                return;
            else
                v14[tostring(v36.MintedBy)] = {
                    username = v38, 
                    lastUsed = workspace:GetServerTimeNow()
                };
                v37.Text = ("@%*"):format(v38);
                return;
            end;
        end);
    end;
end;
v15._updateLabel = function(_, v40, v41) --[[ Line: 147 ]] --[[ Name: _updateLabel ]]
    -- upvalues: v13 (copy), v6 (copy)
    local v42 = v13[v40];
    if not v42 then
        return;
    else
        local v43 = v41.Mint or 0;
        if v43 < 1 then
            v42.label.Text = "Loading...";
            v42.label:AddTag("VisualizeRarity");
            v42.label:SetAttribute("Rarity", "Common");
            return;
        else
            local v44 = v6:CommaNumber(v43);
            if v42.format then
                v44 = string.format(v42.format, v44);
            end;
            v42.label.Text = v44;
            if not tonumber(v43) then
                return;
            else
                v42.label:AddTag("VisualizeRarity");
                local v45 = v43 < 101 and "Mythic" or v43 < 1001 and "Legendary" or "Common";
                v42.label:SetAttribute("Rarity", v45);
                return;
            end;
        end;
    end;
end;
return v15;