local l_ReplicatedFirst_0 = game:GetService("ReplicatedFirst");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_RunService_0 = game:GetService("RunService");
local l_TweenService_0 = game:GetService("TweenService");
local _ = game:GetService("UserInputService");
local l_GamepadService_0 = game:GetService("GamepadService");
local v6 = require(l_ReplicatedStorage_0.Packages.Knit);
local v7 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v8 = require(l_ReplicatedStorage_0.Packages.TableUtil);
local v9 = require(l_ReplicatedStorage_0.Packages.Signal);
local v10 = require(l_ReplicatedStorage_0.Packages.Promise);
local v11 = require(l_ReplicatedStorage_0.Packages.Input);
local l_PreferredInput_0 = v11.PreferredInput;
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v14 = require(l_ReplicatedFirst_0.PlaceIds);
local _ = require(l_ReplicatedStorage_0.Shared.Data.Variables);
local v16 = require(l_ReplicatedStorage_0.Shared.Data.CraftingData);
local v17 = require(l_ReplicatedStorage_0.Shared.Modules.Timer);
local v18 = require(l_ReplicatedStorage_0.Shared.Modules.ZonePlus);
local v19 = require(l_ReplicatedStorage_0.Shared.Util.PathUtil);
local v20 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local v21 = require(l_ReplicatedStorage_0.Shared.Modules.Tweener);
local v22 = require(l_ReplicatedStorage_0.Shared.Util.CraftingUtils);
local v23 = require(l_ReplicatedStorage_0.Shared.Data.InventoryAtlas);
local v24 = nil;
local v25 = nil;
local v26 = nil;
local v27 = nil;
local v28 = nil;
local v29 = nil;
local v30 = nil;
local v31 = Color3.fromRGB(0, 0, 0);
local v32 = Color3.fromRGB(255, 255, 255);
local v33 = Color3.fromRGB(176, 176, 176);
local v34 = {
    Ready = {
        Highlight = {
            FillTransparency = 0.85, 
            FillColor = Color3.fromRGB(8, 255, 45), 
            OutlineColor = Color3.fromRGB(166, 255, 0), 
            OutlineTransparency = 0
        }, 
        ["Part/SurfaceGui/Interaction/Item"] = {
            Visible = true
        }, 
        ["Part/SurfaceGui/Interaction/OpenSlot"] = {
            Visible = false
        }, 
        ["Part/SurfaceGui/Interaction/Timer"] = {
            Text = "READY", 
            TextColor3 = Color3.fromRGB(68, 255, 0), 
            Visible = true
        }
    }, 
    InProgress = {
        Highlight = {
            FillTransparency = 1, 
            FillColor = v31, 
            OutlineColor = v32, 
            OutlineTransparency = 0
        }, 
        ["Part/SurfaceGui/Interaction/Item"] = {
            Visible = true
        }, 
        ["Part/SurfaceGui/Interaction/OpenSlot"] = {
            Visible = false
        }, 
        ["Part/SurfaceGui/Interaction/Timer"] = {
            TextColor3 = v32, 
            Visible = true
        }
    }, 
    Empty = {
        Highlight = {
            FillTransparency = 0.35, 
            FillColor = v31, 
            OutlineColor = v32, 
            OutlineTransparency = 0.5
        }, 
        ["Part/SurfaceGui/Interaction/Item"] = {
            Visible = false
        }, 
        ["Part/SurfaceGui/Interaction/OpenSlot"] = {
            Visible = true
        }, 
        ["Part/SurfaceGui/Interaction/Timer"] = {
            Visible = false
        }
    }
};
local v35 = v11.Mouse.new();
local v36 = RaycastParams.new();
v36.FilterType = Enum.RaycastFilterType.Include;
local v37 = v6.CreateController({
    Name = script.Name, 
    DataChanged = v9.new(), 
    isCrafting = false, 
    pattyDumps = {}
});
local function _(v38) --[[ Line: 139 ]] --[[ Name: notifyCraftAttemptResponse ]]
    -- upvalues: v37 (copy)
    if not v38 then
        return;
    else
        v37.Notification:Notify({
            message = v38, 
            isPositive = false, 
            duration = 3
        });
        return;
    end;
end;
v37.KnitInit = function(_) --[[ Line: 151 ]] --[[ Name: KnitInit ]]
    -- upvalues: v24 (ref), v6 (copy), v25 (ref), v26 (ref), v27 (ref), v28 (ref), v29 (ref), v30 (ref)
    v24 = v6.GetController("DataController");
    v25 = v6.GetController("CharacterController");
    v26 = v6.GetController("UIController");
    v27 = v6.GetService("CraftingService");
    v28 = v6.GetController("PurchaseController");
    v29 = v6.GetController("AudioController");
    v30 = v6.GetController("CamShakeController");
end;
v37.KnitStart = function(v41) --[[ Line: 162 ]] --[[ Name: KnitStart ]]
    -- upvalues: v14 (copy), v26 (ref), v36 (copy), v24 (ref), v6 (copy), v22 (copy), v16 (copy), v27 (ref), v18 (copy)
    if not v14:IsLobby() then
        return;
    else
        v41.Notification = v26:GetModuleAsync("Notification"):expect();
        v41.MessagePrompt = v26:GetModuleAsync("MessagePrompt"):expect();
        v41.craftingContainer = workspace:WaitForChild("Map"):WaitForChild("Interactables"):WaitForChild("Crafting");
        v41.craftingCamera = v41.craftingContainer:WaitForChild("CraftingPov");
        v41.craftingBillboard = v41.craftingContainer:WaitForChild("Billboard"):WaitForChild("BillboardGui");
        v41.craftingQueues = v41.craftingContainer:WaitForChild("CraftingOrders");
        v41.craftingPatties = v41.craftingContainer:WaitForChild("CraftingPatties");
        v41.patties = {};
        v36.FilterDescendantsInstances = {
            v41.craftingPatties
        };
        v41.myInventory = v24:Get(v6.Player, "Inventory"):expect();
        v24:OnChanged(v6.Player, "Inventory", function(v42) --[[ Line: 182 ]]
            -- upvalues: v41 (copy)
            v41.myInventory = v42;
        end);
        v41.myCurrency = v24:Get(v6.Player, "Currency"):expect();
        for _, v44 in v22:GetAllCurrencies() do
            v24:OnChanged(v6.Player, ("Currency.%*"):format(v44), function(v45) --[[ Line: 189 ]]
                -- upvalues: v41 (copy), v44 (copy)
                v41.myCurrency[v44] = v45;
            end, true);
        end;
        for v46 = 1, v16.Config.MAX_QUEUES do
            v41.patties[v46] = {
                patty = v41.craftingPatties:WaitForChild((tostring(v46))), 
                sign = v41.craftingQueues:WaitForChild((tostring(v46)))
            };
            v41.patties[v46].patty:SetAttribute("Origin", v41.patties[v46].patty.CFrame);
            v41.patties[v46].pattyBillboard = v41.craftingContainer:WaitForChild("PattyBillboards"):WaitForChild((tostring(v46))):WaitForChild("CraftingItem");
            v41.patties[v46].pattyBillboard.Adornee = v41.patties[v46].pattyBillboard.Parent;
            v41.patties[v46].pattyBillboard.Parent = v6.PlayerGui;
            local l_PurchaseOptions_0 = v41.patties[v46].pattyBillboard.Interaction.PurchaseOptions;
            v26:HandleButton(l_PurchaseOptions_0.Claim, function() --[[ Line: 207 ]]
                -- upvalues: v41 (copy), v46 (copy)
                if not v41.isCrafting then
                    return;
                else
                    v41:RequestServer({
                        action = "Claim", 
                        slot = v46
                    });
                    return;
                end;
            end);
            v26:HandleButton(l_PurchaseOptions_0.InstantCraft, function() --[[ Line: 218 ]]
                -- upvalues: v41 (copy), v27 (ref), v46 (copy)
                if not v41:IsCrafting() then
                    return;
                else
                    v27:InstantClaimSlot(v46);
                    return;
                end;
            end);
        end;
        local l_OpenZone_0 = v41.craftingContainer:WaitForChild("OpenZone");
        local v49 = v18.new(l_OpenZone_0);
        v49:relocate();
        v49.localPlayerEntered:Connect(function() --[[ Line: 233 ]]
            -- upvalues: v41 (copy)
            v41:StartCrafting();
        end);
        v49.localPlayerExited:Connect(function() --[[ Line: 237 ]]
            -- upvalues: v41 (copy)
            v41:StopCrafting();
        end);
        v41:_connectCraftingData();
        return;
    end;
end;
v37.IsCrafting = function(v50) --[[ Line: 245 ]] --[[ Name: IsCrafting ]]
    return v50.isCrafting or false;
end;
v37.StartCrafting = function(v51) --[[ Line: 250 ]] --[[ Name: StartCrafting ]]
    -- upvalues: v7 (copy), v25 (ref), v26 (ref), l_PreferredInput_0 (copy), l_GamepadService_0 (copy)
    if v51.isCrafting then
        return;
    else
        if v51.craftDump then
            v51.craftDump:Destroy();
        end;
        v51.craftDump = v7.new();
        v51.craftDump:Add(function() --[[ Line: 261 ]]
            -- upvalues: v51 (copy)
            v51.isCrafting = false;
            v51.craftDump = nil;
        end);
        v51.isCrafting = true;
        v51.craftingBillboard.Enabled = false;
        v25:ToggleHideAll(true);
        v51._allUIToggled = v26:ToggleAll({}, false);
        workspace.CurrentCamera.CameraType = Enum.CameraType.Scriptable;
        v51._cameraCFrame = workspace.CurrentCamera.CFrame;
        v26:Toggle("Crafting", true);
        local v52, v53 = v51:_tweenCamera({
            CFrame = v51.craftingCamera.CFrame
        }, TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)):await();
        if not v52 or v53 ~= Enum.PlaybackState.Completed then
            return;
        else
            local function _() --[[ Line: 286 ]] --[[ Name: checkInputType ]]
                -- upvalues: l_PreferredInput_0 (ref), l_GamepadService_0 (ref)
                if l_PreferredInput_0.Current == "Gamepad" then
                    l_GamepadService_0:EnableGamepadCursor(nil);
                end;
            end;
            local v55 = l_PreferredInput_0.Observe(function() --[[ Line: 292 ]]
                -- upvalues: l_PreferredInput_0 (ref), l_GamepadService_0 (ref)
                if l_PreferredInput_0.Current == "Gamepad" then
                    l_GamepadService_0:EnableGamepadCursor(nil);
                end;
            end);
            v51.craftDump:Add(function() --[[ Line: 296 ]]
                -- upvalues: v55 (copy), l_GamepadService_0 (ref)
                v55();
                l_GamepadService_0:DisableGamepadCursor();
            end);
            for _, v57 in v51.patties do
                v57.pattyBillboard.AlwaysOnTop = true;
            end;
            return;
        end;
    end;
end;
v37.StopCrafting = function(v58, v59) --[[ Line: 309 ]] --[[ Name: StopCrafting ]]
    -- upvalues: v25 (ref), v26 (ref)
    if not v58.isCrafting then
        return;
    else
        if v58.craftDump then
            v58.craftDump:Destroy();
        end;
        for _, v61 in v58.patties do
            v61.pattyBillboard.AlwaysOnTop = false;
        end;
        v25:ToggleHideAll(false);
        v26:Toggle("Crafting", false);
        if not v59 and v58._cameraCFrame then
            v58:_tweenCamera({
                CFrame = v58._cameraCFrame
            }, TweenInfo.new(0.35, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)):await();
            v58._cameraCFrame = nil;
        end;
        if v58._allUIToggled then
            v26:RevertFromToggleAll(v58._allUIToggled);
            table.clear(v58._allUIToggled);
            v58._allUIToggled = nil;
        end;
        workspace.CurrentCamera.CameraType = Enum.CameraType.Custom;
        v58.craftingBillboard.Enabled = true;
        return;
    end;
end;
v37.RequestServer = function(v62, v63) --[[ Line: 346 ]] --[[ Name: RequestServer ]]
    -- upvalues: v16 (copy), v27 (ref), v23 (copy)
    if not v63 or not v63.action then
        return;
    elseif v62._requestProcessing then
        return;
    elseif v63.action == "Craft" and not v63.recipe then
        return;
    elseif v63.action == "Claim" and (not v63.slot or typeof(v63.slot) ~= "number") then
        return;
    elseif v63.action == "Craft" and not v62:CanCraft(v63.recipe, true) then
        return;
    else
        v62._requestProcessing = true;
        if v63.action == "Craft" then
            local l_v16_RecipeData_0 = v16:GetRecipeData(v63.recipe);
            local v65 = l_v16_RecipeData_0 and l_v16_RecipeData_0.displayName or v63.recipe;
            return v62.MessagePrompt:Prompt({
                message = ("Are you sure you want to craft a %*?"):format(v65), 
                options = {
                    {
                        text = "Yes", 
                        callback = function() --[[ Line: 376 ]] --[[ Name: callback ]]
                            -- upvalues: v27 (ref), v63 (copy), v62 (copy), v65 (copy)
                            v27:Craft(v63.recipe):andThen(function(v66) --[[ Line: 377 ]]
                                -- upvalues: v62 (ref), v65 (ref)
                                if not v66 then
                                    return;
                                else
                                    v62.Notification:Notify({
                                        message = ("Successfully crafted %*"):format(v65), 
                                        isPositive = true, 
                                        duration = 3
                                    });
                                    return;
                                end;
                            end):finally(function() --[[ Line: 387 ]]
                                -- upvalues: v62 (ref)
                                task.delay(0.25, function() --[[ Line: 388 ]]
                                    -- upvalues: v62 (ref)
                                    v62._requestProcessing = false;
                                end);
                            end);
                        end
                    }, 
                    {
                        text = "No", 
                        callback = function() --[[ Line: 396 ]] --[[ Name: callback ]]
                            -- upvalues: v62 (copy)
                            v62._requestProcessing = false;
                        end
                    }
                }
            });
        else
            v27:Claim(v63.slot):andThen(function(v67, v68, v69) --[[ Line: 404 ]]
                -- upvalues: v23 (ref), v63 (copy), v62 (copy)
                if not v67 or v69 then
                    return;
                else
                    local v70 = v68 and v23:GetByItemName(v68);
                    local v71 = v70 and (v70.displayName or v70.DisplayName) or v63.recipe;
                    v62.Notification:Notify({
                        message = ("Successfully claimed %*"):format(v71), 
                        isPositive = true
                    });
                    return;
                end;
            end):finally(function() --[[ Line: 416 ]]
                -- upvalues: v62 (copy)
                task.delay(0.25, function() --[[ Line: 417 ]]
                    -- upvalues: v62 (ref)
                    v62._requestProcessing = false;
                end);
            end);
            return;
        end;
    end;
end;
v37.ObserveData = function(v72, v73) --[[ Line: 423 ]] --[[ Name: ObserveData ]]
    -- upvalues: v8 (copy)
    if v72.craftingData then
        v73(v8.Copy(v72.craftingData, true));
    end;
    return v72.DataChanged:Connect(function(v74) --[[ Line: 428 ]]
        -- upvalues: v73 (copy)
        v73(v74);
    end);
end;
v37.CanCraft = function(v75, v76, v77) --[[ Line: 433 ]] --[[ Name: CanCraft ]]
    -- upvalues: v37 (copy), v16 (copy), v6 (copy)
    if not v76 or not v75.craftingData or not v75.myInventory then
        return false;
    else
        local v78 = false;
        for _, v80 in v75.craftingData.slots do
            if not v80.recipe then
                v78 = true;
                break;
            end;
        end;
        if not v78 then
            if v77 then
                v37.Notification:Notify({
                    message = "All crafting slots full.", 
                    isPositive = false, 
                    duration = 3
                });
            end;
            return false;
        else
            local l_v16_RecipeData_1 = v16:GetRecipeData(v76);
            if not l_v16_RecipeData_1 or not l_v16_RecipeData_1.materials then
                return false;
            else
                for v82, v83 in l_v16_RecipeData_1.materials do
                    if (v75.myInventory[v82] or v75.myCurrency[v82] or 0) < v83 then
                        if v77 then
                            v37.Notification:Notify({
                                message = "Not enough materials.", 
                                isPositive = false, 
                                duration = 3
                            });
                        end;
                        return false;
                    end;
                end;
                if l_v16_RecipeData_1.canCraft and not l_v16_RecipeData_1.canCraft(v6.Player) then
                    if v77 then
                        local v84 = ("You can't craft %* right now."):format(l_v16_RecipeData_1.displayName);
                        if v84 then
                            v37.Notification:Notify({
                                message = v84, 
                                isPositive = false, 
                                duration = 3
                            });
                        end;
                    end;
                    return false;
                else
                    return true;
                end;
            end;
        end;
    end;
end;
v37._tweenCamera = function(_, v86, v87) --[[ Line: 482 ]] --[[ Name: _tweenCamera ]]
    -- upvalues: l_TweenService_0 (copy), v10 (copy)
    assert(typeof(v86) == "table", "Props must be a table");
    local v88 = l_TweenService_0:Create(workspace.CurrentCamera, v87 or TweenInfo.new(0.6, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), v86);
    v88:Play();
    return v10.fromEvent(v88.Completed):andThen(function(v89) --[[ Line: 493 ]]
        -- upvalues: v88 (ref), v10 (ref)
        v88:Destroy();
        v88 = nil;
        return v10.resolve(v89);
    end);
end;
v37._resetPattySlots = function(v90, v91) --[[ Line: 501 ]] --[[ Name: _resetPattySlots ]]
    -- upvalues: v20 (copy), v34 (copy), v19 (copy)
    for _, v93 in v91 do
        local v94 = v90.patties[v93];
        if v94 then
            if v90.pattyDumps[tostring(v93)] then
                v90.pattyDumps[tostring(v93)]:Destroy();
            end;
            local l_patty_0 = v94.patty;
            l_patty_0.Highlight.Enabled = true;
            v20:IterateClass(l_patty_0, "ParticleEmitter", function(v96) --[[ Line: 517 ]]
                v96.Enabled = false;
                v96:Clear();
            end);
            for _, v98 in v94.pattyBillboard.Interaction:GetChildren() do
                v98.Visible = v98.Name == "OpenSlot";
            end;
            local function _(v99) --[[ Line: 526 ]] --[[ Name: removeRarityVisual ]]
                v99:RemoveTag("VisualizeRarity");
                v99:SetAttribute("Rarity");
            end;
            local l_Backdrop_0 = v94.pattyBillboard.Interaction.Item.Backdrop;
            l_Backdrop_0:RemoveTag("VisualizeRarity");
            l_Backdrop_0:SetAttribute("Rarity");
            l_Backdrop_0 = v94.pattyBillboard.Interaction.Item.Glow;
            l_Backdrop_0:RemoveTag("VisualizeRarity");
            l_Backdrop_0:SetAttribute("Rarity");
            l_Backdrop_0 = v94.sign.Part.SurfaceGui.Interaction.Item.Backdrop;
            l_Backdrop_0:RemoveTag("VisualizeRarity");
            l_Backdrop_0:SetAttribute("Rarity");
            l_Backdrop_0 = v94.sign.Part.SurfaceGui.Interaction.Item.Glow;
            l_Backdrop_0:RemoveTag("VisualizeRarity");
            l_Backdrop_0:SetAttribute("Rarity");
            l_Backdrop_0 = v94.sign;
            for v102, v103 in v34.Empty do
                local v104 = v19(l_Backdrop_0, v102, nil, "/");
                if v104 then
                    for v105, v106 in v103 do
                        v104[v105] = v106;
                    end;
                end;
            end;
        end;
    end;
end;
v37._setPattyVisuals = function(v107, v108, v109) --[[ Line: 552 ]] --[[ Name: _setPattyVisuals ]]
    -- upvalues: v20 (copy), v33 (copy), v32 (copy), v34 (copy), v19 (copy)
    if not v108 or not v109 then
        return;
    else
        for _, v111 in v108 do
            local v112 = v107.patties[v111];
            if v112 then
                local l_patty_1 = v112.patty;
                l_patty_1.Highlight.Enabled = false;
                if v109 ~= "InProgress" then
                    v20:IterateClass(l_patty_1, "ParticleEmitter", function(v114) --[[ Line: 568 ]]
                        v114.Enabled = false;
                        v114:Clear();
                    end);
                end;
                local l_pattyBillboard_0 = v112.pattyBillboard;
                if v109 == "Ready" then
                    l_patty_1.SurfaceAppearance.Color = v33;
                    l_pattyBillboard_0.Interaction.PurchaseOptions.Claim.Unsorted.ProgressBar.UIGradient.Offset = Vector2.zero;
                    l_pattyBillboard_0.Interaction.PurchaseOptions.Claim.Timer.Text = "CLAIM";
                elseif v109 == "InProgress" then
                    l_patty_1.SurfaceAppearance.Color = v32;
                end;
                for _, v117 in l_pattyBillboard_0.Interaction:GetChildren() do
                    if v117:IsA("GuiObject") then
                        v117.Visible = v117.Name ~= "OpenSlot";
                    end;
                end;
                for _, v119 in l_pattyBillboard_0.Interaction.PurchaseOptions:GetChildren() do
                    if v119:IsA("GuiObject") then
                        v119.Visible = v109 ~= "Ready" or v119.Name == "Claim";
                    end;
                end;
                local l_sign_0 = v112.sign;
                for v121, v122 in v34[v109] do
                    local v123 = v19(l_sign_0, v121, nil, "/");
                    if v123 then
                        for v124, v125 in v122 do
                            v123[v124] = v125;
                        end;
                    end;
                end;
            end;
        end;
        return;
    end;
end;
v37._togglePattyHover = function(_, v127, v128) --[[ Line: 614 ]] --[[ Name: _togglePattyHover ]]
    -- upvalues: l_TweenService_0 (copy)
    if not v127 then
        return;
    else
        local l_Attachment_0 = v127.Attachment;
        local l_l_Attachment_0_Attribute_0 = l_Attachment_0:GetAttribute("Origin");
        if not l_l_Attachment_0_Attribute_0 then
            l_l_Attachment_0_Attribute_0 = l_Attachment_0.CFrame;
            l_Attachment_0:SetAttribute("Origin", l_l_Attachment_0_Attribute_0);
        end;
        local v131 = if v128 then l_l_Attachment_0_Attribute_0 + Vector3.new(0, 1, 0, 0) else l_l_Attachment_0_Attribute_0;
        local v132 = l_TweenService_0:Create(l_Attachment_0, TweenInfo.new(0.4), {
            CFrame = v131
        });
        v132.Completed:Once(function() --[[ Line: 631 ]]
            -- upvalues: v132 (ref)
            v132:Destroy();
            v132 = nil;
        end);
        v132:Play();
        return;
    end;
end;
v37._startPattyHoverAnimation = function(v133) --[[ Line: 639 ]] --[[ Name: _startPattyHoverAnimation ]]
    -- upvalues: v17 (copy), v35 (copy), v36 (copy)
    if not v133.craftDump then
        return;
    else
        local v134 = nil;
        v133.craftDump:Add(function() --[[ Line: 646 ]]
            -- upvalues: v133 (copy), v134 (ref)
            v133:_togglePattyHover(v134, false);
            v134 = nil;
        end);
        v133.craftDump:Add(v17.Simple(0.1, function() --[[ Line: 651 ]]
            -- upvalues: v35 (ref), v36 (ref), v133 (copy), v134 (ref)
            local v135 = v35:Raycast(v36, 100);
            if not v135 or not v135.Instance then
                v133:_togglePattyHover(v134, false);
                v134 = nil;
                return;
            elseif v134 == v135.Instance then
                return;
            else
                if v134 then
                    v133:_togglePattyHover(v134, false);
                end;
                v134 = v135.Instance;
                v133:_togglePattyHover(v134, true);
                return;
            end;
        end));
        return;
    end;
end;
v37._connectCraftingData = function(v136) --[[ Line: 673 ]] --[[ Name: _connectCraftingData ]]
    -- upvalues: v24 (ref), v6 (copy), v16 (copy), v8 (copy)
    v136.DataChanged:Connect(function(_, v138) --[[ Line: 674 ]]
        -- upvalues: v136 (copy)
        local v139 = {};
        local v140 = {};
        for v141, v142 in v136.craftingData.slots do
            if not v142.recipe then
                table.insert(v139, v141);
            else
                table.insert(v140, v141);
            end;
        end;
        v136:_resetPattySlots(v139);
        v136:_updatePattyState(v140, v138);
    end);
    v136.craftingData = v24:Get(v6.Player, v16.Config.DATA_KEY):expect();
    v136.DataChanged:Fire(v8.Copy(v136.craftingData, true), nil);
    v24:OnChanged(v6.Player, v16.Config.DATA_KEY, function(v143, v144) --[[ Line: 694 ]]
        -- upvalues: v136 (copy), v8 (ref)
        v136.craftingData = v143;
        v136.DataChanged:Fire(v8.Copy(v136.craftingData, true), v8.Copy(v144, true));
    end);
end;
v37._areThereDifferences = function(_, v146, v147) --[[ Line: 701 ]] --[[ Name: _areThereDifferences ]]
    if not v146 or not v147 then
        return true;
    else
        for v148, v149 in v146 do
            if v147[v148] ~= v149 then
                return true;
            end;
        end;
        return false;
    end;
end;
v37._updatePattyState = function(v150, v151, v152) --[[ Line: 715 ]] --[[ Name: _updatePattyState ]]
    -- upvalues: v7 (copy), v16 (copy), v22 (copy), v20 (copy), v17 (copy), v29 (ref), v21 (copy), l_RunService_0 (copy), v30 (ref), v32 (copy), v33 (copy)
    for _, v154 in v151 do
        local v155 = v150.craftingData.slots[v154];
        if v150:_areThereDifferences(v155, v152 and v152.slots[v154]) then
            if v150.pattyDumps[tostring(v154)] then
                v150.pattyDumps[tostring(v154)]:Destroy();
            end;
            local v156 = v7.new();
            v150.pattyDumps[tostring(v154)] = v156;
            v156:Add(function() --[[ Line: 733 ]]
                -- upvalues: v156 (ref), v150 (copy), v154 (copy)
                v156 = nil;
                v150.pattyDumps[tostring(v154)] = nil;
            end);
            local l_v16_RecipeData_2 = v16:GetRecipeData(v155.recipe);
            local v158 = math.floor((math.clamp(workspace:GetServerTimeNow() - v155.start, 0, 1e999)));
            local v159 = math.floor((math.clamp(l_v16_RecipeData_2.timeToCraft - v158, 0, 1e999)));
            local l_v22_RecipeRarity_0 = v22:GetRecipeRarity(l_v16_RecipeData_2);
            local v161 = v150.patties[v154];
            local l_pattyBillboard_1 = v161.pattyBillboard;
            local function _(v163, v164) --[[ Line: 748 ]] --[[ Name: setImage ]]
                -- upvalues: v20 (ref), v155 (copy), l_v16_RecipeData_2 (copy)
                v20:SetIcon(v163, v155.recipe, {
                    type = l_v16_RecipeData_2 and l_v16_RecipeData_2.item and l_v16_RecipeData_2.item.type or "Inventory", 
                    isRecipe = true, 
                    rngIndex = v164
                });
            end;
            local function v174(v166) --[[ Line: 760 ]] --[[ Name: showCraftingItem ]]
                -- upvalues: v22 (ref), l_v16_RecipeData_2 (copy), l_v22_RecipeRarity_0 (copy), l_pattyBillboard_1 (copy), v161 (copy), v20 (ref), v155 (copy)
                local function v169(v167) --[[ Line: 761 ]] --[[ Name: showRarityVisual ]]
                    -- upvalues: v22 (ref), l_v16_RecipeData_2 (ref), v166 (copy), l_v22_RecipeRarity_0 (ref)
                    local v168 = v22:GetRecipeRarity(l_v16_RecipeData_2, v166) or "Common";
                    if v167:HasTag("VisualizeRarity") then
                        v167:RemoveTag("VisualizeRarity");
                    end;
                    v167:SetAttribute("Rarity", v168 or l_v22_RecipeRarity_0);
                    v167:AddTag("VisualizeRarity");
                end;
                local function v172(v170) --[[ Line: 772 ]] --[[ Name: updateWeightDisplay ]]
                    -- upvalues: l_v16_RecipeData_2 (ref), v166 (copy)
                    if l_v16_RecipeData_2.rngItem then
                        local v171 = l_v16_RecipeData_2.rngItem[v166 or 1];
                        if v171 then
                            v170.Interaction.Item.Inner.Weight.Text = ("%*%%"):format(v171.weight);
                            v170.Interaction.Item.Inner.Weight.Visible = true;
                            return;
                        else
                            v170.Interaction.Item.Inner.Weight.Visible = false;
                            v170.Interaction.Item.Inner.Mystery.Visible = false;
                        end;
                    end;
                end;
                v172(l_pattyBillboard_1);
                v172(v161.sign.Part.SurfaceGui);
                v169(l_pattyBillboard_1.Interaction.Item.Backdrop);
                v169(l_pattyBillboard_1.Interaction.Item.Glow);
                v169(v161.sign.Part.SurfaceGui.Interaction.Item.Backdrop);
                v169(v161.sign.Part.SurfaceGui.Interaction.Item.Glow);
                local l_Icon_0 = v161.sign.Part.SurfaceGui.Interaction.Item.Inner.Icon;
                v20:SetIcon(l_Icon_0, v155.recipe, {
                    type = l_v16_RecipeData_2 and l_v16_RecipeData_2.item and l_v16_RecipeData_2.item.type or "Inventory", 
                    isRecipe = true, 
                    rngIndex = v166
                });
                l_Icon_0 = l_pattyBillboard_1.Interaction.Item.Inner.Icon;
                v20:SetIcon(l_Icon_0, v155.recipe, {
                    type = l_v16_RecipeData_2 and l_v16_RecipeData_2.item and l_v16_RecipeData_2.item.type or "Inventory", 
                    isRecipe = true, 
                    rngIndex = v166
                });
            end;
            local v175 = nil;
            v156:Add(function() --[[ Line: 802 ]]
                -- upvalues: v175 (ref)
                if not v175 then
                    return;
                else
                    v175:Stop();
                    v175:Destroy();
                    v175 = nil;
                    return;
                end;
            end);
            local function v176() --[[ Line: 812 ]] --[[ Name: showFinishedState ]]
                -- upvalues: v175 (ref), v150 (copy), v154 (copy), l_v16_RecipeData_2 (copy), v155 (copy)
                if v175 then
                    v175:Stop();
                    v175:Destroy();
                    v175 = nil;
                end;
                v150:_setPattyVisuals({
                    v154
                }, "Ready");
                v150.Notification:Notify({
                    message = ("Order up! Your %* is ready!"):format(l_v16_RecipeData_2.displayName or v155.recipe), 
                    duration = 6, 
                    sfxName = "UI.Crafting.Bell", 
                    isPositive = true
                });
            end;
            local l_Claim_0 = l_pattyBillboard_1.Interaction.PurchaseOptions.Claim;
            local l_SurfaceAppearance_0 = v161.patty.SurfaceAppearance;
            if l_v16_RecipeData_2.item then
                v174();
            elseif l_v16_RecipeData_2.rngItem then
                local v179 = 1;
                local l_Simple_0 = v17.Simple;
                do
                    local l_v179_0 = v179;
                    v156:Add(l_Simple_0(1, function() --[[ Line: 838 ]]
                        -- upvalues: v174 (copy), l_v179_0 (ref), l_v16_RecipeData_2 (copy)
                        v174(l_v179_0);
                        l_v179_0 = l_v179_0 + 1;
                        if l_v179_0 > #l_v16_RecipeData_2.rngItem then
                            l_v179_0 = 1;
                        end;
                    end, true));
                end;
            end;
            if v159 <= 0 then
                v176();
                --[[ close >= 10 ]]
            else
                v150:_setPattyVisuals({
                    v154
                }, "InProgress");
                do
                    local l_v156_0, l_v159_0, l_v175_0 = v156, v159, v175;
                    local function v186() --[[ Line: 857 ]] --[[ Name: playSFX ]]
                        -- upvalues: l_v175_0 (ref), v29 (ref), v161 (copy), v20 (ref)
                        l_v175_0 = v29:PlaySound({
                            name = "UI.Crafting.CookingSizzle", 
                            adornee = v161.patty, 
                            properties = {
                                Looped = true, 
                                Volume = 1.6, 
                                RollOffMaxDistance = 20
                            }
                        });
                        v20:IterateClass(v161.patty, "ParticleEmitter", function(v185) --[[ Line: 868 ]]
                            v185.Enabled = true;
                        end);
                    end;
                    if l_v159_0 > 3 then
                        local l_Attribute_0 = v161.patty:GetAttribute("Origin");
                        local v188 = l_Attribute_0 and l_Attribute_0.UpVector;
                        local v189 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut);
                        local v190 = TweenInfo.new(0.8, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out);
                        local v191 = TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.In);
                        local v192 = 0;
                        do
                            local l_v192_0 = v192;
                            v21("NumberValue", l_v192_0, v189, {
                                Value = 540
                            }, function(v194) --[[ Line: 883 ]]
                                -- upvalues: l_v192_0 (ref)
                                l_v192_0 = v194;
                            end);
                            local v195 = l_Attribute_0 + v188 * 2.4;
                            local v197 = v21("CFrameValue", l_Attribute_0, v190, {
                                Value = v195
                            }, function(v196) --[[ Line: 889 ]]
                                -- upvalues: v161 (copy)
                                v161.patty.CFrame = v196;
                                v161.pattyBillboard.Adornee.Position = v161.patty.Position + Vector3.new(0, 3.5999999046325684, 0, 0);
                            end);
                            local v199 = l_RunService_0.RenderStepped:Connect(function() --[[ Line: 894 ]]
                                -- upvalues: v161 (copy), l_v192_0 (ref)
                                local l_patty_2 = v161.patty;
                                l_patty_2.CFrame = l_patty_2.CFrame * CFrame.Angles(0, 0, (math.rad(l_v192_0)));
                            end);
                            local l_v190_0 = v190 --[[ copy: 28 -> 34 ]];
                            local l_l_Attribute_0_0 = l_Attribute_0 --[[ copy: 25 -> 35 ]];
                            v197:Add(function() --[[ Line: 898 ]]
                                -- upvalues: v189 (copy), l_v190_0 (copy), v21 (ref), v195 (copy), v191 (copy), l_l_Attribute_0_0 (copy), v161 (copy), v199 (ref), v186 (copy), v197 (ref), v150 (copy), v30 (ref)
                                task.delay(v189.Time - l_v190_0.Time, function() --[[ Line: 899 ]]
                                    -- upvalues: v21 (ref), v195 (ref), v191 (ref), l_l_Attribute_0_0 (ref), v161 (ref), v199 (ref), v186 (ref), v197 (ref), v150 (ref), v30 (ref)
                                    v21("CFrameValue", v195, v191, {
                                        Value = l_l_Attribute_0_0
                                    }, function(v202) --[[ Line: 900 ]]
                                        -- upvalues: v161 (ref)
                                        v161.patty.CFrame = v202;
                                        v161.pattyBillboard.Adornee.Position = v161.patty.Position + Vector3.new(0, 3.5999999046325684, 0, 0);
                                    end):Add(function() --[[ Line: 905 ]]
                                        -- upvalues: v199 (ref), v186 (ref), v197 (ref), v150 (ref), v30 (ref)
                                        v199:Disconnect();
                                        v199 = nil;
                                        v186();
                                        v197 = nil;
                                        if not v150.isCrafting then
                                            return;
                                        else
                                            v30:Shake("CraftingShake", {
                                                originalPivot = v150.craftingCamera.CFrame, 
                                                preserveCFrameOnFinished = true
                                            });
                                            return;
                                        end;
                                    end);
                                end);
                            end);
                            v29:PlaySound({
                                name = "UI.Crafting.Swoosh", 
                                adornee = v161.patty, 
                                properties = {
                                    Looped = false, 
                                    Volume = 0.6, 
                                    RollOffMaxDistance = 20
                                }
                            });
                        end;
                    else
                        v186();
                    end;
                    local function _() --[[ Line: 948 ]] --[[ Name: updateProgress ]]
                        -- upvalues: l_v159_0 (ref), l_v16_RecipeData_2 (copy), l_SurfaceAppearance_0 (copy), v32 (ref), v33 (ref), l_Claim_0 (copy)
                        local v203 = 1 - l_v159_0 / l_v16_RecipeData_2.timeToCraft;
                        l_SurfaceAppearance_0.Color = v32:Lerp(v33, v203);
                        l_Claim_0.Unsorted.ProgressBar.UIGradient.Offset = Vector2.new(math.clamp(v203 - 1, -1, 0), 0);
                    end;
                    local v207 = v17.Simple(1, function() --[[ Line: 960 ]]
                        -- upvalues: l_v159_0 (ref), l_v156_0 (ref), v176 (copy), v20 (ref), v161 (copy), l_Claim_0 (copy), l_v16_RecipeData_2 (copy), l_SurfaceAppearance_0 (copy), v32 (ref), v33 (ref)
                        l_v159_0 = l_v159_0 - 1;
                        if l_v159_0 < 1 then
                            l_v156_0:Remove("CountdownTimer");
                            v176();
                            return;
                        else
                            local v205 = v20:SecondsToClock(l_v159_0);
                            v161.sign.Part.SurfaceGui.Interaction.Timer.Text = v205;
                            l_Claim_0.Timer.Text = v205;
                            local v206 = 1 - l_v159_0 / l_v16_RecipeData_2.timeToCraft;
                            l_SurfaceAppearance_0.Color = v32:Lerp(v33, v206);
                            l_Claim_0.Unsorted.ProgressBar.UIGradient.Offset = Vector2.new(math.clamp(v206 - 1, -1, 0), 0);
                            return;
                        end;
                    end, true);
                    l_v156_0:Add(v207, "CountdownTimer");
                end;
            end;
        end;
    end;
end;
return v37;