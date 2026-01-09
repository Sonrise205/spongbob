local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("RunService");
local v2 = require(l_ReplicatedStorage_0.Packages.Knit);
local v3 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v4 = require(l_ReplicatedStorage_0.Packages.TableUtil);
local v5 = require(l_ReplicatedStorage_0.Shared.Modules.RarityVisuals);
local v6 = require(v2.Player.PlayerScripts.Knit.Controllers.UIController.Util.HighlandUIUtil);
local v7 = require(l_ReplicatedStorage_0.Shared.Data.UnitShared);
local v8 = require(l_ReplicatedStorage_0.Shared.Data.PetShared);
local v9 = require(l_ReplicatedStorage_0.Shared.Data.Variables);
return {
    SortItems = function(_, v11, v12, v13, _, _) --[[ Line: 23 ]] --[[ Name: SortItems ]]
        -- upvalues: v8 (copy), v7 (copy), v9 (copy)
        table.sort(v11, function(v16, v17) --[[ Line: 24 ]]
            -- upvalues: v13 (copy), v12 (copy), v8 (ref), v7 (ref), v9 (ref)
            local l_Name_0 = v16.Name;
            local l_Name_1 = v17.Name;
            local l_UID_0 = v16.UID;
            local l_UID_1 = v17.UID;
            local v22 = v13 and v13[v16.UID] or false;
            local v23 = v13 and v13[v17.UID] or false;
            local l_Equipped_0 = v16.Equipped;
            local l_Equipped_1 = v17.Equipped;
            local v26 = nil;
            local v27 = nil;
            if v12 then
                v26 = v8:GetRarity(v16.Name);
                v27 = v8:GetRarity(v17.Name);
            else
                v26 = v7:GetRarity(v16.Name);
                v27 = v7:GetRarity(v17.Name);
            end;
            local v28 = not v12 and v7:GetUnitValue(v16.Name, "Type");
            local v29 = not v12 and v7:GetUnitValue(v17.Name, "Type");
            local v30 = v28 and v9.TOWERS.ATTACK_TYPE_INDICES[v28] or 0;
            local v31 = v29 and v9.TOWERS.ATTACK_TYPE_INDICES[v29] or 0;
            local v32 = v16.Data.Trait ~= nil;
            local v33 = v17.Data.Trait ~= nil;
            local v34 = v16.Data.Stars or 0;
            local v35 = v17.Data.Stars or 0;
            local v36 = nil;
            local v37 = nil;
            if v12 then
                v36 = v8:GetDamageBuff(v16.Data) or 0;
                v37 = v8:GetDamageBuff(v17.Data) or 0;
            else
                v36 = v7:GetTotalDamage(v16.Data) or 0;
                v37 = v7:GetTotalDamage(v17.Data) or 0;
            end;
            local v38 = v16.Data.Level or 1;
            local v39 = v17.Data.Level or 1;
            local v40 = v16.Data.Mint or 0;
            local v41 = v17.Data.Mint or 0;
            local v42 = 0;
            if v16.Data.Relic then
                v42 = tonumber(string.match(v16.Data.Relic, "_(%d+)$")) or 4;
            end;
            local v43 = 0;
            if v17.Data.Relic then
                v43 = tonumber(string.match(v17.Data.Relic, "_(%d+)$")) or 4;
            end;
            if v22 ~= v23 then
                return v22;
            elseif l_Equipped_0 ~= l_Equipped_1 then
                return l_Equipped_0;
            elseif v26 ~= v27 then
                return v27 < v26;
            elseif l_Name_0 ~= l_Name_1 then
                return l_Name_0 < l_Name_1;
            elseif v34 ~= v35 then
                return v35 < v34;
            elseif v32 ~= v33 then
                return v32;
            elseif v30 ~= v31 then
                return v30 < v31;
            elseif v36 ~= v37 then
                return v37 < v36;
            elseif v42 ~= v43 then
                return v43 < v42;
            elseif v38 ~= v39 then
                return v39 < v38;
            elseif v40 ~= v41 then
                return v40 < v41;
            else
                return l_UID_0 < l_UID_1;
            end;
        end);
    end, 
    FilterItems = function(_, v45, v46, v47) --[[ Line: 161 ]] --[[ Name: FilterItems ]]
        -- upvalues: v4 (copy)
        return v4.Filter(v45, function(v48) --[[ Line: 162 ]]
            -- upvalues: v46 (copy), v47 (copy)
            if v46.Name and not string.find(string.lower(v48.Name), string.lower(v46.Name)) then
                return false;
            elseif v46.Rarity and next(v46.Rarity) ~= nil and not v46.Rarity[v48.Rarity] then
                return false;
            elseif v46.ExcludeFavorites and v48.Data.Favorite then
                return false;
            else
                if v47 then
                    for _, v50 in v47 do
                        if not v50(v48, v46) then
                            return false;
                        end;
                    end;
                end;
                return true;
            end;
        end);
    end, 
    LoadButtons = function(_, v52, v53, v54, v55, v56) --[[ Line: 194 ]] --[[ Name: LoadButtons ]]
        -- upvalues: v6 (copy)
        v56:Add(function() --[[ Line: 197 ]]
            -- upvalues: v6 (ref), v53 (copy)
            v6.deferClearBrowser(v53);
        end);
        v6.loadOnDemand(v52, v53, v56, function(v57, v58) --[[ Line: 201 ]]
            -- upvalues: v55 (copy), v54 (copy)
            v55(v57, v58, v54:Clone());
        end, nil, {
            populateBy = 25
        });
    end, 
    AlignTooltip = function(_, v60, v61) --[[ Line: 209 ]] --[[ Name: AlignTooltip ]]
        local l_AbsolutePosition_0 = v61.Parent.AbsolutePosition;
        local l_AbsolutePosition_1 = v60.AbsolutePosition;
        local l_AbsoluteSize_0 = v60.AbsoluteSize;
        local l_Offset_0 = v60.Parent.UIPadding.PaddingLeft.Offset;
        local v66 = l_AbsolutePosition_1.X - l_AbsolutePosition_0.X - l_Offset_0 + l_AbsoluteSize_0.X;
        local v67 = l_AbsolutePosition_1.Y - l_AbsolutePosition_0.Y - l_AbsoluteSize_0.Y * 0.25;
        v61.Position = UDim2.new(0, v66, 0, v67);
    end, 
    SetupHoverTooltip = function(_, v69, v70, v71, v72) --[[ Line: 222 ]] --[[ Name: SetupHoverTooltip ]]
        -- upvalues: v3 (copy), v5 (copy)
        local l_Rarity_0 = v70.Rarity;
        local v74 = v71 and v71:Extend() or v3.new();
        v74:Add(v5.new(v69, l_Rarity_0));
        v74:Add(v5.new(v69.Content.UIStroke, l_Rarity_0));
        if v72 then
            v72(l_Rarity_0, v69, v74);
        end;
        return v74;
    end, 
    UpdateButtonOrders = function(v75, v76, v77, v78) --[[ Line: 237 ]] --[[ Name: UpdateButtonOrders ]]
        for v79, v80 in v76 do
            local l_Name_2 = v80.Name;
            local l_UID_2 = v80.UID;
            local v83 = v77[l_Name_2] and v77[l_Name_2][l_UID_2];
            if v83 then
                local v84 = v80.Equipped or false;
                v83.Content.Equipped.Visible = v84;
                v83.LayoutOrder = v75:_getLayoutOrder(v80.Data, l_UID_2, v78, v79);
            end;
        end;
    end, 
    _getLayoutOrder = function(v85, v86, v87, v88, v89) --[[ Line: 257 ]] --[[ Name: _getLayoutOrder ]]
        local l_v89_0 = v89;
        local v91, v92 = v85:_isEquipped(v86.Name, v87, v88);
        if v91 then
            l_v89_0 = -10000 + v92;
        end;
        return l_v89_0;
    end, 
    _isEquipped = function(_, v94, v95, v96) --[[ Line: 273 ]] --[[ Name: _isEquipped ]]
        -- upvalues: v7 (copy)
        if not v94 or not v95 then
            return false;
        else
            local l_v7_LoadoutString_0 = v7:CreateLoadoutString(v94, v95);
            for v98 = 1, #v96 do
                if v96[v98] == l_v7_LoadoutString_0 then
                    return true, v98;
                end;
            end;
            return false;
        end;
    end
};