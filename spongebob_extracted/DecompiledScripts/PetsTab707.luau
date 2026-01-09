local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.Knit);
local v2 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v3 = require(l_ReplicatedStorage_0.Packages.TableUtil);
local v4 = require(l_ReplicatedStorage_0.Packages.Signal);
local v5 = require(script.Parent.SharedLogic);
local v6 = require(l_ReplicatedStorage_0.Shared.Data.PetShared);
local v7 = require(l_ReplicatedStorage_0.Shared.Data.Variables);
local v8 = require(l_ReplicatedStorage_0.Shared.Data.PetImages);
local v9 = nil;
local v10 = nil;
local v11 = nil;
local v12 = nil;
local v13 = nil;
local v14 = {
    DataUpdated = v4.new(), 
    _petsArray = {}, 
    _buttons = {}
};
local function v21(v15, v16) --[[ Line: 27 ]] --[[ Name: fillOutButton ]]
    -- upvalues: v7 (copy), v8 (copy)
    local l_Content_0 = v15.Content;
    local l_Info_0 = l_Content_0.Info;
    l_Info_0.Cost.Visible = false;
    l_Info_0.Traits.Visible = false;
    l_Info_0.Relic.Visible = false;
    l_Info_0.Stars.Visible = true;
    l_Content_0.Equipped.Visible = v16.Equipped or false;
    l_Info_0.Shiny.Visible = v16.Data.Shiny or false;
    l_Info_0.Wumbo.Visible = v16.Data.Mega or false;
    l_Info_0.Level.RichText = true;
    l_Info_0.Level.Text = ("LVL <font color=\"#FFFF00\">%*</font>"):format(v16.Data.Level or 1);
    local v19 = v16.Data.Stars or 0;
    l_Info_0.Stars.Visible = v19 > 0;
    if v19 >= 1 then
        l_Info_0.Stars.Main.Amount.Text = v19;
        for v20 = 1, v7.FUSION.MAX_STARS do
            if v20 ~= 1 then
                l_Info_0.Stars[tostring(v20)].Visible = v20 <= v19;
            end;
        end;
    end;
    v8:SetImage(l_Info_0.Icon, v16.Name);
    l_Info_0.Icon.Visible = true;
end;
v14.Init = function(v22, v23, v24, v25) --[[ Line: 66 ]] --[[ Name: Init ]]
    -- upvalues: v9 (ref), v1 (copy), v10 (ref), v11 (ref), v12 (ref)
    v9 = v1.GetController("DataController");
    v10 = v1.GetService("PetService");
    v11 = v1.GetController("PetController");
    v12 = v1.GetController("UIController");
    v22.uiModule = v23;
    v22.ui = v24;
    v22.main = v24.Main;
    v22.content = v22.main.Content;
    v22.petTemplate = v25;
end;
v14.Start = function(v26) --[[ Line: 82 ]] --[[ Name: Start ]]
    -- upvalues: v13 (ref), v12 (ref), v9 (ref), v1 (copy), v11 (ref), v6 (copy), v3 (copy), v21 (copy), v10 (ref)
    v13 = v12:GetModuleAsync("Units"):expect();
    v26._loadout = v9:Get(v1.Player, "PetsLoadout"):expect();
    v26._pets = v9:Get(v1.Player, "Pets"):expect();
    v26._petsArray = {};
    v26._totalPets = 0;
    (function() --[[ Line: 90 ]] --[[ Name: initializePetsArray ]]
        -- upvalues: v26 (copy)
        table.clear(v26._petsArray);
        local v27 = v26._pets or {};
        for v28, v29 in v27 do
            for v30, v31 in v29 do
                v26:_addPetToArray(v28, v30, v31);
            end;
        end;
    end)();
    v11.PetsAdded:Connect(function(v32, v33) --[[ Line: 102 ]]
        -- upvalues: v26 (copy), v6 (ref)
        v26._pets = v33;
        for v34, v35 in v32 do
            local v36, v37 = v6:ParseLoadout(v34);
            if not v26._buttons[v36] or not v26._buttons[v36][v37] then
                local v38 = v26:_addPetToArray(v36, v37, v35);
                if v26.uiModule:GetTab() == "Pets" then
                    v26:GenerateButton(v38, nil, v26.petTemplate:Clone());
                end;
            end;
        end;
        v26.DataUpdated:Fire("PetInventoryModified");
    end);
    v11.PetsRemoved:Connect(function(v39, v40) --[[ Line: 123 ]]
        -- upvalues: v26 (copy)
        v26._pets = v40;
        v26:_removePetsFromArray(v39);
        task.defer(function() --[[ Line: 127 ]]
            -- upvalues: v26 (ref)
            v26.DataUpdated:Fire("PetInventoryModified");
        end);
    end);
    v11.PetDataUpdated:Connect(function(v41, v42, v43) --[[ Line: 132 ]]
        -- upvalues: v26 (copy), v11 (ref), v3 (ref), v21 (ref)
        v26._pets = v11:GetPets();
        local v46 = v3.Find(v26._petsArray, function(v44) --[[ Line: 136 ]]
            -- upvalues: v41 (copy), v42 (copy)
            local v45 = false;
            if v44.Name == v41 then
                v45 = v44.UID == v42;
            end;
            return v45;
        end);
        if v46 then
            v46.Data = v43;
        else
            v26:_addPetToArray(v41, v42, v43);
        end;
        local l_v26_Button_0 = v26:GetButton(v41, v42);
        if l_v26_Button_0 then
            v21(l_v26_Button_0, v46);
        end;
        v26.DataUpdated:Fire("PetDataUpdated");
    end);
    v10.PetEquipped:Connect(function(v48, v49, v50) --[[ Line: 155 ]]
        -- upvalues: v26 (copy), v6 (ref), v3 (ref)
        v26._loadout[v50] = v6:CreateLoadoutString(v48, v49);
        local v53 = v3.Find(v26._petsArray, function(v51) --[[ Line: 158 ]]
            -- upvalues: v48 (copy), v49 (copy)
            local v52 = false;
            if v51.Name == v48 then
                v52 = v51.UID == v49;
            end;
            return v52;
        end);
        if v53 then
            v53.Equipped = true;
        end;
        v26.DataUpdated:Fire("PetEquipped");
    end);
    v10.PetUnequipped:Connect(function(v54, v55, v56) --[[ Line: 169 ]]
        -- upvalues: v26 (copy), v3 (ref)
        v26._loadout[v56] = "";
        local v59 = v3.Find(v26._petsArray, function(v57) --[[ Line: 172 ]]
            -- upvalues: v54 (copy), v55 (copy)
            local v58 = false;
            if v57.Name == v54 then
                v58 = v57.UID == v55;
            end;
            return v58;
        end);
        if v59 then
            v59.Equipped = false;
        end;
        v26.DataUpdated:Fire("PetUnequipped");
    end);
end;
v14.GetLoadout = function(v60) --[[ Line: 189 ]] --[[ Name: GetLoadout ]]
    return v60._loadout or {};
end;
v14.GetButton = function(v61, v62, v63) --[[ Line: 194 ]] --[[ Name: GetButton ]]
    return v61._buttons[v62] and v61._buttons[v62][v63];
end;
v14.IsEquipped = function(v64, v65, v66) --[[ Line: 198 ]] --[[ Name: IsEquipped ]]
    -- upvalues: v5 (copy)
    return v5:_isEquipped(v65, v66, v64._loadout) or false;
end;
v14.GetButtons = function(v67) --[[ Line: 203 ]] --[[ Name: GetButtons ]]
    return v67._buttons;
end;
v14.GetArray = function(v68) --[[ Line: 208 ]] --[[ Name: GetArray ]]
    return v68._petsArray;
end;
v14.Clear = function(v69) --[[ Line: 213 ]] --[[ Name: Clear ]]
    v69.uiModule:ClearBin(function() --[[ Line: 214 ]]
        -- upvalues: v69 (copy)
        table.clear(v69._buttons);
    end);
end;
v14.GenerateButton = function(v70, v71, v72, v73) --[[ Line: 219 ]] --[[ Name: GenerateButton ]]
    -- upvalues: v21 (copy), v13 (ref), v6 (copy), v3 (copy), v12 (ref)
    v73.Name = ("%*_%*"):format(v71.Name, v71.UID);
    v21(v73, v71);
    local function _(v74) --[[ Line: 223 ]] --[[ Name: addRarityVisuals ]]
        -- upvalues: v71 (copy)
        v74:SetAttribute("Rarity", v71.Rarity);
        v74:AddTag("VisualizeRarity");
    end;
    local l_Content_1 = v73.Content;
    local l_Info_1 = l_Content_1.Info;
    local l_Glow_0 = l_Content_1.Glow;
    l_Glow_0:SetAttribute("Rarity", v71.Rarity);
    l_Glow_0:AddTag("VisualizeRarity");
    l_Glow_0 = l_Info_1.Backdrop;
    l_Glow_0:SetAttribute("Rarity", v71.Rarity);
    l_Glow_0:AddTag("VisualizeRarity");
    v73.Content.ForSale.Visible = v13._uidsForSale[v6:CreateLoadoutString(v71.Name, v71.UID)] ~= nil;
    v73.LayoutOrder = v72 or 9999999;
    v73.Parent = v70.uiModule.unitsBin;
    l_Glow_0 = v71.Name;
    local l_UID_0 = v71.UID;
    local function _() --[[ Line: 241 ]] --[[ Name: getUnitInfo ]]
        -- upvalues: l_Glow_0 (copy), l_UID_0 (copy), v3 (ref), v70 (copy)
        return {
            Name = l_Glow_0, 
            UID = l_UID_0, 
            Data = v3.Copy(v70._pets[l_Glow_0][l_UID_0]), 
            IsPet = true
        };
    end;
    local v81 = v12:HandleButton(v73, function() --[[ Line: 251 ]]
        -- upvalues: v70 (copy), v73 (copy), l_Glow_0 (copy), l_UID_0 (copy), v3 (ref)
        v70.uiModule:ProcessUnitClicked(v73, {
            Name = l_Glow_0, 
            UID = l_UID_0, 
            Data = v3.Copy(v70._pets[l_Glow_0][l_UID_0]), 
            IsPet = true
        }, true);
    end, {
        MouseEnter = function() --[[ Line: 254 ]] --[[ Name: MouseEnter ]]
            -- upvalues: v70 (copy), v73 (copy), l_Glow_0 (copy), l_UID_0 (copy), v3 (ref)
            v70.uiModule:ShowHoverTooltip(v73, {
                Name = l_Glow_0, 
                UID = l_UID_0, 
                Data = v3.Copy(v70._pets[l_Glow_0][l_UID_0]), 
                IsPet = true
            }, true);
        end, 
        MouseLeave = function() --[[ Line: 258 ]] --[[ Name: MouseLeave ]]
            -- upvalues: v70 (copy), v73 (copy), l_Glow_0 (copy), l_UID_0 (copy), v3 (ref)
            v70.uiModule:HideHoverTooltip(v73, {
                Name = l_Glow_0, 
                UID = l_UID_0, 
                Data = v3.Copy(v70._pets[l_Glow_0][l_UID_0]), 
                IsPet = true
            }, true);
        end
    });
    if not v70._buttons[v71.Name] then
        v70._buttons[v71.Name] = {};
    end;
    v70._buttons[v71.Name][v71.UID] = v73;
    v81:Add(function() --[[ Line: 269 ]]
        -- upvalues: v70 (copy), v71 (copy)
        if v70._buttons and v70._buttons[v71.Name] then
            v70._buttons[v71.Name][v71.UID] = nil;
        end;
    end);
    if v73 and v70.dumpster then
        v70.dumpster:Add(v73);
    end;
end;
v14.Load = function(v82, v83) --[[ Line: 282 ]] --[[ Name: Load ]]
    -- upvalues: v2 (copy), v5 (copy), v12 (ref)
    if v82.dumpster then
        v82.dumpster:Destroy();
    end;
    v82:Clear();
    v82.dumpster = v2.new();
    v82.dumpster:Add(function() --[[ Line: 291 ]]
        -- upvalues: v82 (copy)
        v82.dumpster = nil;
        v82:Clear();
    end);
    v5:SortItems(v83 or v82._petsArray, true);
    v5:LoadButtons(v83 or v82._petsArray, v82.uiModule.unitsBin, v82.petTemplate, function(v84, v85, v86) --[[ Line: 298 ]]
        -- upvalues: v82 (copy)
        v82:GenerateButton(v84, v85, v86);
    end, v82.dumpster);
    v82.dumpster:Add(v82.DataUpdated:Connect(function(v87) --[[ Line: 302 ]]
        -- upvalues: v5 (ref), v82 (copy), v12 (ref)
        v5:SortItems(v82._petsArray, true);
        if v87 == "PetInventoryModified" then
            v82.uiModule:_updatePetsCount();
        end;
        if not v12:GetToggleState("Units") then
            return;
        else
            v5:UpdateButtonOrders(v82._petsArray, v82:GetButtons(), v82._loadout or {});
            v82.uiModule:UpdateSelectedUnit();
            return;
        end;
    end));
end;
v14.GetAllPets = function(v88) --[[ Line: 318 ]] --[[ Name: GetAllPets ]]
    return v88._petsArray;
end;
v14._addPetToArray = function(v89, v90, v91, v92) --[[ Line: 322 ]] --[[ Name: _addPetToArray ]]
    -- upvalues: v6 (copy)
    local v93 = {
        Name = v90, 
        FullName = v6:GetPetValue(v90, "FullName"), 
        UID = v91, 
        Data = v92, 
        Rarity = select(2, v6:GetRarity(v90)), 
        Equipped = table.find(v89._loadout, v6:CreateLoadoutString(v90, v91)) ~= nil, 
        IsPet = true
    };
    table.insert(v89._petsArray, v93);
    v89._totalPets = v89._totalPets + 1;
    return v93;
end;
v14._removePetsFromArray = function(v94, v95) --[[ Line: 339 ]] --[[ Name: _removePetsFromArray ]]
    -- upvalues: v6 (copy), v3 (copy)
    if not v95 or typeof(v95) ~= "table" then
        return;
    else
        v94._totalPets = math.clamp(v94._totalPets - #v95, 0, 1e999);
        local v96 = {};
        for _, v98 in v95 do
            local v99, v100 = v6:ParseLoadout(v98);
            v96[v100] = true;
            local l_v94_Button_0 = v94:GetButton(v99, v100);
            if l_v94_Button_0 then
                l_v94_Button_0:Destroy();
                l_v94_Button_0 = nil;
            end;
            if v94._buttons[v99] then
                v94._buttons[v99][v100] = nil;
            end;
            if v94._pets[v99] then
                v94._pets[v99][v100] = nil;
            end;
        end;
        v94._petsArray = v3.Filter(v94._petsArray, function(v102) --[[ Line: 368 ]]
            -- upvalues: v96 (ref)
            return not v96[v102.UID];
        end);
        table.clear(v96);
        v96 = nil;
        return;
    end;
end;
return v14;