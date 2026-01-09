local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.Knit);
local v2 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v3 = require(l_ReplicatedStorage_0.Shared.Modules.RarityVisuals);
local v4 = require(v1.Player.PlayerScripts.Knit.Modules.UIClasses.GenericTooltip);
local v5 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local v6 = require(l_ReplicatedStorage_0.Shared.Data.Variables);
local v7 = require(l_ReplicatedStorage_0.Shared.Data.InventoryAtlas);
local v8 = require(l_ReplicatedStorage_0.Shared.Data.EventVariables);
local v9 = require(l_ReplicatedStorage_0.Shared.Data.UnitShared);
local v10 = require(l_ReplicatedStorage_0.Shared.Data.PetShared);
local v11 = require(l_ReplicatedStorage_0.Shared.Data.UnitImages);
local v12 = require(l_ReplicatedStorage_0.Shared.Data.PetImages);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v14 = nil;
local v15 = nil;
local function v29(v16, v17, _) --[[ Line: 28 ]] --[[ Name: defaultRenderCallback ]]
    -- upvalues: v5 (copy), v11 (copy), v9 (copy), v12 (copy), v10 (copy), v7 (copy)
    local l_Content_0 = v16.Content;
    local l_Inner_0 = l_Content_0.Inner;
    local l_Icon_0 = l_Inner_0.Icon;
    local v22 = v17.extraData or v17.ExtraData;
    l_Inner_0.Shiny.Visible = v22 and v22.Shiny or false;
    l_Inner_0.Wumbo.Visible = v22 and (v22.Mega or v22.Wumbo) or false;
    local l_FiveStars_0 = l_Inner_0:FindFirstChild("FiveStars");
    if l_FiveStars_0 then
        l_FiveStars_0.Visible = if v22 and v22.Stars then v22.Stars == 5 else false;
    end;
    local l_NeptunesCrown_0 = l_Inner_0:FindFirstChild("NeptunesCrown");
    if l_NeptunesCrown_0 then
        l_NeptunesCrown_0.Visible = v22 and v22.Trait and v22.Trait2 and true or false;
    end;
    local v25 = ("x%*"):format((v5:SuffixNumber(v17.amount or 1, true)));
    if v17.amountRange then
        local v26 = v5:SuffixNumber(v17.amountRange.Min or 1);
        local v27 = v5:SuffixNumber(v17.amountRange.Max or 1);
        v25 = ("x%* ~ %*"):format(v26, v27);
        v25 = if v17.amountRange.Min ~= v17.amountRange.Max then ("x%* ~ %*"):format(v26, v27) else ("x%*"):format(v26);
    end;
    if l_Inner_0:FindFirstChild("Amount") then
        l_Inner_0.Amount.Text = v25;
        if v17.showAmount then
            l_Inner_0.Amount.Visible = true;
        end;
    end;
    if v17.weight and l_Inner_0:FindFirstChild("Chance") then
        l_Inner_0.Chance.Text = ("%*%%"):format(v17.weight);
    end;
    if v17.type == "Unit" then
        v11:SetImage(l_Icon_0, v17.name);
        if (v17.rarity or v9:GetRarity(v17.name)) == "Secret" then
            l_Icon_0.ImageColor3 = Color3.new();
        end;
    elseif v17.type == "Pet" then
        v12:SetImage(l_Icon_0, v17.name);
        if (v17.rarity or v10:GetRarity(v17.name)) == "Secret" then
            l_Icon_0.ImageColor3 = Color3.new();
        end;
    elseif v17.type == "TBD" then
        l_Icon_0.Image = "";
        l_Inner_0.Mystery.Visible = true;
    else
        v5:SetRewardIcon(v17, l_Icon_0);
        if v7:IsGiftItem(v17.name) then
            local l_UICorner_0 = Instance.new("UICorner");
            l_UICorner_0.CornerRadius = UDim.new(1, 0);
            l_UICorner_0.Parent = l_Icon_0;
        end;
    end;
    return {
        l_Content_0.Backdrop, 
        l_Content_0.Glow
    };
end;
local v30 = {};
v30.__index = v30;
v30.new = function(v31, v32) --[[ Line: 111 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), v30 (copy)
    if not v32 then
        return;
    else
        local v33 = setmetatable({
            dumpster = v2.new(), 
            rewards = v31, 
            template = v32.template or v32.Template, 
            props = v32, 
            _buttons = {}, 
            _cleanupTasks = {}
        }, v30);
        v33.originalTemplateParent = v33.template.Parent;
        v33.template.Parent = nil;
        if v33.props.RenderNow == nil then
            v33.props.RenderNow = true;
        end;
        if v33.props.RenderNow then
            v33:Render();
        end;
        return v33;
    end;
end;
v30.Render = function(v34) --[[ Line: 142 ]] --[[ Name: Render ]]
    -- upvalues: v6 (copy), v8 (copy), v15 (ref), v29 (copy), v9 (copy), v10 (copy), v5 (copy), v3 (copy), v4 (copy), v14 (ref)
    v34:ClearAll();
    if not v34.rewards then
        return;
    else
        local l_workspace_ServerTimeNow_0 = workspace:GetServerTimeNow();
        for v36, v37 in v34.rewards do
            local v38 = v37.type or v37.Type;
            local v39 = v37.name or v37.Name;
            if not table.find(v6.REWARD_TYPE_EXCLUSIONS, v38) and (v38 ~= "Currency" or v39 ~= v8.Currency or v15:IsActive()) then
                local v40 = nil;
                do
                    local l_v40_0 = v40;
                    if v37.unavailableAfter then
                        if v37.unavailableAfter <= l_workspace_ServerTimeNow_0 then
                            --[[ close >= 9 ]]
                            continue;
                        else
                            v34.dumpster:Add(task.delay(l_workspace_ServerTimeNow_0 - v37.unavailableAfter, function() --[[ Line: 176 ]]
                                -- upvalues: l_v40_0 (ref)
                                if l_v40_0 then
                                    l_v40_0:Destroy();
                                end;
                            end));
                        end;
                    end;
                    l_v40_0 = v34.template:Clone();
                    l_v40_0.Name = v39 or v38 or "";
                    l_v40_0.Visible = true;
                    if not v34.props.retainLayoutOrder and not v34.props.RetainLayoutOrder then
                        l_v40_0.LayoutOrder = v36;
                    end;
                    if v34.props.Size then
                        l_v40_0.Size = v34.props.Size;
                    end;
                    if v34.props.Position then
                        l_v40_0.Position = v34.props.Position;
                    end;
                    l_v40_0.Parent = v34.props.Parent or v34.props.parent;
                    table.insert(v34._buttons, l_v40_0);
                    local v42 = nil;
                    local v43 = false;
                    local v44 = (v34.props.renderMethod or v29)(l_v40_0, v37, v34.props);
                    if v38 == "Unit" then
                        v42 = v37.rarity or select(2, v9:GetRarity(v39));
                        if v37.rarity then
                            v43 = true;
                        end;
                    elseif v38 == "Pet" then
                        v42 = v37.rarity or select(2, v10:GetRarity(v39));
                        if v37.rarity then
                            v43 = true;
                        end;
                    else
                        v42 = if v38 == "TBD" then v37.rarity or v5:GetRewardRarity(v37) else v5:GetRewardRarity(v37);
                    end;
                    if v37.overwriteRarity then
                        v42 = v37.overwriteRarity;
                    end;
                    if v42 and v44 then
                        for _, v46 in v44 do
                            if v46.Name == "Glow" then
                                v46.ZIndex = v46.ZIndex - 1;
                            end;
                            v34.dumpster:Add(v3.new(v46, v42));
                        end;
                    end;
                    local v47 = nil;
                    if v34.props.tooltipPredicate then
                        v47 = function() --[[ Line: 240 ]]
                            -- upvalues: v34 (copy), l_v40_0 (ref)
                            return v34.props.tooltipPredicate(l_v40_0);
                        end;
                    end;
                    if not v43 and (v39 or v38 ~= "TBD") then
                        local l_new_0 = v4.new;
                        local l_l_v40_0_0 = l_v40_0;
                        local v50 = {
                            Name = v39 or v38, 
                            ExtraData = v37.extraData or v37.ExtraData
                        };
                        local v51 = true;
                        if v38 ~= "Unit" then
                            v51 = false;
                        end;
                        v50.IsUnit = v51;
                        v51 = true;
                        if v38 ~= "Pet" then
                            v51 = false;
                        end;
                        v50.IsPet = v51;
                        v50.HideExistCount = v34.props.hideExistCount;
                        v50.IsSecretUnit = function() --[[ Line: 252 ]] --[[ Name: IsSecretUnit ]]
                            -- upvalues: v34 (copy), v42 (ref)
                            return not v34.props.showSecrets and (v42 or "") == "Secret";
                        end;
                        l_new_0(l_l_v40_0_0, v50, v47);
                    end;
                    v14:HandleButton(l_v40_0, function() --[[ Line: 258 ]]
                        -- upvalues: v34 (copy), l_v40_0 (ref), v37 (copy)
                        if v34.props.clickCallback then
                            v34.props.clickCallback(l_v40_0, v37);
                        end;
                    end);
                    v34.dumpster:Add(l_v40_0);
                end;
            end;
        end;
        return;
    end;
end;
v30.GetButton = function(v52, v53) --[[ Line: 275 ]] --[[ Name: GetButton ]]
    if v53 < 1 or #v52._buttons < v53 then
        return;
    else
        return v52._buttons[v53];
    end;
end;
v30.GetButtons = function(v54) --[[ Line: 283 ]] --[[ Name: GetButtons ]]
    return v54._buttons;
end;
v30.GetButtonFromName = function(v55, v56) --[[ Line: 287 ]] --[[ Name: GetButtonFromName ]]
    for _, v58 in v55._buttons do
        if v58.Name == v56 then
            return v58;
        end;
    end;
end;
v30.Reparent = function(v59, v60, v61) --[[ Line: 295 ]] --[[ Name: Reparent ]]
    if not v60 then
        return;
    else
        v59.props.parent = v60;
        if v61 then
            v59:ClearAll();
            return;
        else
            for _, v63 in v59._buttons do
                v63.Parent = v60;
            end;
            return;
        end;
    end;
end;
v30.ChangeRewards = function(v64, v65, v66, v67) --[[ Line: 322 ]] --[[ Name: ChangeRewards ]]
    v64.rewards = v65;
    if v66 ~= nil then
        v64:Reparent(v66, true);
    else
        v64:ClearAll();
    end;
    if v67 then
        return;
    else
        task.defer(function() --[[ Line: 335 ]]
            -- upvalues: v64 (copy)
            if v64 and v64.Render then
                v64:Render();
            end;
        end);
        return;
    end;
end;
v30.AddCleanupTask = function(v68, v69) --[[ Line: 346 ]] --[[ Name: AddCleanupTask ]]
    table.insert(v68._cleanupTasks, v69);
end;
v30.ClearAll = function(v70) --[[ Line: 352 ]] --[[ Name: ClearAll ]]
    for _, v72 in v70._cleanupTasks do
        v70.dumpster:Add(v72);
    end;
    if v70.dumpster then
        v70.dumpster:Clean();
        table.clear(v70._cleanupTasks);
    end;
    if v70._buttons then
        table.clear(v70._buttons);
    end;
end;
v30.Destroy = function(v73) --[[ Line: 367 ]] --[[ Name: Destroy ]]
    if v73.originalTemplateParent and v73.template then
        v73.template.Parent = v73.originalTemplateParent;
        v73.originalTemplateParent = nil;
    end;
    v73.dumpster:Destroy();
    setmetatable(v73, nil);
end;
v1.OnStart():andThen(function() --[[ Line: 377 ]]
    -- upvalues: v14 (ref), v1 (copy), v15 (ref)
    v14 = v1.GetController("UIController");
    v15 = v1.GetController("EventController");
end);
return v30;