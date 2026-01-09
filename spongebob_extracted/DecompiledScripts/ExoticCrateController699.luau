local l_ReplicatedFirst_0 = game:GetService("ReplicatedFirst");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_RunService_0 = game:GetService("RunService");
local l_TweenService_0 = game:GetService("TweenService");
local l_UserInputService_0 = game:GetService("UserInputService");
local v5 = require(l_ReplicatedStorage_0.Packages.Knit);
local v6 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local _ = require(l_ReplicatedStorage_0.Packages.TableUtil);
local _ = require(l_ReplicatedStorage_0.Packages.Promise);
local v9 = require(l_ReplicatedStorage_0.Packages.Signal);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v11 = require(l_ReplicatedFirst_0.PlaceIds);
local v12 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local v13 = require(l_ReplicatedStorage_0.Shared.Modules.ColorPalette);
local v14 = require(l_ReplicatedStorage_0.Shared.Data.InventoryAtlas);
local v15 = require(l_ReplicatedStorage_0.Shared.Modules.Tweener);
local v16 = nil;
local v17 = nil;
local v18 = nil;
local v19 = nil;
local v20 = nil;
local v21 = nil;
local v22 = nil;
local v23 = nil;
local v24 = nil;
local v25 = nil;
local v26 = nil;
local v27 = nil;
local v28 = nil;
local v29 = nil;
local v30 = nil;
local v31 = nil;
local v32 = nil;
local v33 = nil;
local v34 = nil;
local v35 = CFrame.Angles(0, 3.141592653589793, 0);
local v36 = {
    Enum.UserInputType.MouseButton1, 
    Enum.UserInputType.Touch
};
local l_CurrentCamera_0 = workspace.CurrentCamera;
local v38 = v5.CreateController({
    Name = script.Name, 
    UnitGained = v9.new(), 
    _opening = false, 
    _revealingItem = false
});
v38.KnitInit = function(_) --[[ Line: 71 ]] --[[ Name: KnitInit ]]
    -- upvalues: v16 (ref), v5 (copy), v17 (ref), v18 (ref), v19 (ref), v20 (ref), v21 (ref), v22 (ref), v23 (ref), v24 (ref), v25 (ref)
    v16 = v5.GetController("DataController");
    v17 = v5.GetService("TreasureService");
    v18 = v5.GetController("CharacterController");
    v19 = v5.GetController("DeviceTypeController");
    v20 = v5.GetController("UIController");
    v21 = v5.GetController("UnitViewerController");
    v22 = v5.GetController("AudioController");
    v23 = v5.GetController("VDayGiftController");
    v24 = v5.GetController("CamShakeController");
    v25 = v5.GetController("TreasureController");
end;
v38.KnitStart = function(v40) --[[ Line: 85 ]] --[[ Name: KnitStart ]]
    -- upvalues: v11 (copy), v26 (ref), v20 (ref), v27 (ref), v28 (ref), v29 (ref), v30 (ref), v31 (ref), v32 (ref), v33 (ref), v25 (ref), v34 (ref), l_ReplicatedStorage_0 (copy), v16 (ref), v5 (copy)
    if not v11:IsHUB() then
        return;
    else
        v26 = v20:GetModuleAsync("TreasureOpen"):expect();
        v27 = v20:GetModuleAsync("Rewards"):expect();
        v28 = v20:GetModuleAsync("PromptOverlay"):expect();
        v29 = v20:GetModuleAsync("TreasureResults"):expect();
        local function v45(v41, v42, v43, v44) --[[ Line: 95 ]] --[[ Name: treasureAreaAdded ]]
            -- upvalues: v30 (ref), v31 (ref), v32 (ref), v33 (ref)
            v30 = v41;
            v31 = v42;
            v32 = v43;
            v33 = v44;
        end;
        if v25:GetArea() then
            local l_v25_Area_0, v47, v48, v49 = v25:GetArea();
            v30 = l_v25_Area_0;
            v31 = v47;
            v32 = v48;
            v33 = v49;
        end;
        v25.TreasureAreaLoaded:Connect(v45);
        v25.StopOpenAll:Connect(function() --[[ Line: 108 ]]
            -- upvalues: v40 (copy)
            v40:ToggleOpenAll(false);
        end);
        v34 = l_ReplicatedStorage_0.Models.RNG_BOXES.HydraCrate;
        v16:OnChanged(v5.Player, "Inventory", function(v50) --[[ Line: 117 ]]
            -- upvalues: v40 (copy)
            if not v40._chestName or not v40._openAll then
                return;
            else
                if not v50[v40._chestName] then
                    v40:ToggleOpenAll(false);
                end;
                return;
            end;
        end, true);
        return;
    end;
end;
v38.IsOpening = function(v51) --[[ Line: 130 ]] --[[ Name: IsOpening ]]
    return v51._opening;
end;
local function _(v52, v53, v54) --[[ Line: 134 ]] --[[ Name: toggleEmitters ]]
    -- upvalues: v12 (copy)
    if not v52 and typeof(v52) == "Instance" then
        return;
    else
        v12:IterateClass(v52, "ParticleEmitter", function(v55) --[[ Line: 139 ]]
            -- upvalues: v53 (copy), v54 (copy)
            if v53 ~= nil and v53(v55) == true then
                return;
            elseif v54 == false then
                v55.Enabled = false;
                return;
            else
                v55:Emit(v55:GetAttribute("EmitCount") or 1);
                if v54 then
                    v55.Enabled = true;
                end;
                return;
            end;
        end);
        return;
    end;
end;
v38.OpenTreasure = function(v57, v58, v59, v60, v61) --[[ Line: 157 ]] --[[ Name: OpenTreasure ]]
    -- upvalues: v14 (copy), v6 (copy), v20 (ref), v31 (ref), v32 (ref), v19 (ref), v18 (ref), l_RunService_0 (copy), l_CurrentCamera_0 (copy), v34 (ref), v35 (copy), v15 (copy), l_TweenService_0 (copy), v24 (ref), v12 (copy), v22 (ref), l_UserInputService_0 (copy), v36 (copy)
    v57._opening = true;
    if not v14:GetByItemName(v58) then
        v57._opening = false;
        return;
    else
        v57._dump = v6.new();
        if not v57._allToggled then
            v57._allToggled = v20:ToggleAll(nil, false);
        end;
        v31.Attachment.SpotLight.Enabled = false;
        v32.Attachment.SpotLight.Enabled = false;
        v19:TogglePlayerControls(false);
        v18:ToggleHideAll(true);
        if l_RunService_0:IsStudio() then
            warn("Taps:", v59, "\nTreasure Gained:", v60);
        end;
        local v62 = v59[1];
        if typeof(v59[1]) == "table" then
            v62 = v59[1][1];
        end;
        l_CurrentCamera_0.CameraType = Enum.CameraType.Scriptable;
        l_CurrentCamera_0.CFrame = v31.CFrame;
        local v63 = v34:Clone();
        v57.chestContainer = v63;
        v57:_setRarityVisual(v62, 1, v61);
        v57._dump:Add(function() --[[ Line: 197 ]]
            -- upvalues: v57 (copy)
            v57.chestContainer = nil;
        end);
        v63:PivotTo(v31.CFrame * v35 + v31.CFrame.LookVector * 5.25 + Vector3.new(0, 0, 0, 0));
        v63.Parent = workspace;
        v57._dump:Add(v63);
        local l_v63_Scale_0 = v63:GetScale();
        local v65 = TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, -1, true);
        local _ = v15("NumberValue", l_v63_Scale_0, v65, {
            Value = l_v63_Scale_0 * 1.2
        }, function(v66) --[[ Line: 210 ]]
            -- upvalues: v63 (copy)
            v63:ScaleTo(v66);
        end);
        local l_v63_Pivot_0 = v63:GetPivot();
        local v69 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
        local l_CFrame_0 = l_CurrentCamera_0.CFrame;
        local function _() --[[ Line: 219 ]] --[[ Name: doLeftTween ]]
            -- upvalues: v57 (copy), v15 (ref), l_v63_Pivot_0 (copy), v69 (copy), v63 (copy)
            v57._dump:Add(v15("CFrameValue", l_v63_Pivot_0, v69, {
                Value = l_v63_Pivot_0 * CFrame.Angles(math.rad((math.random(-24, 24))), -0.5235987755982988, 0)
            }, function(v71) --[[ Line: 222 ]]
                -- upvalues: v63 (ref)
                v63:PivotTo(v71);
            end));
        end;
        local function _() --[[ Line: 227 ]] --[[ Name: doRightTween ]]
            -- upvalues: v57 (copy), v15 (ref), l_v63_Pivot_0 (copy), v69 (copy), v63 (copy)
            v57._dump:Add(v15("CFrameValue", l_v63_Pivot_0, v69, {
                Value = l_v63_Pivot_0 * CFrame.Angles(math.rad((math.random(-24, 24))), 0.5235987755982988, 0)
            }, function(v73) --[[ Line: 230 ]]
                -- upvalues: v63 (ref)
                v63:PivotTo(v73);
            end));
        end;
        local function v103(v75, v76) --[[ Line: 235 ]] --[[ Name: doTapTween ]]
            -- upvalues: v57 (copy), l_v63_Pivot_0 (copy), l_TweenService_0 (ref), v24 (ref), l_CFrame_0 (copy), l_CurrentCamera_0 (ref), v63 (copy), v12 (ref), l_RunService_0 (ref)
            if v57._dump:Get("RenderSteppedLoop") then
                v57._dump:Remove("RenderSteppedLoop");
            end;
            if v57._dump:Get("NumTween") then
                v57._dump:Remove("NumTween");
            end;
            if v57._dump:Get("NumTween2") then
                v57._dump:Remove("NumTween2");
            end;
            if v57._dump:Get("CFTween") then
                v57._dump:Remove("CFTween");
            end;
            if v57._dump:Get("AngleTween") then
                v57._dump:Remove("AngleTween");
            end;
            local v77 = TweenInfo.new(0.04, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, true);
            local l_NumberValue_0 = Instance.new("NumberValue");
            l_NumberValue_0.Value = 0;
            local l_NumberValue_1 = Instance.new("NumberValue");
            l_NumberValue_1.Value = 0;
            local l_CFrameValue_0 = Instance.new("CFrameValue");
            l_CFrameValue_0.Value = l_v63_Pivot_0;
            local v81 = l_TweenService_0:Create(l_NumberValue_0, v77, {
                Value = -15
            });
            local v82 = l_TweenService_0:Create(l_NumberValue_0, v77, {
                Value = 15
            });
            local v83 = l_TweenService_0:Create(l_CFrameValue_0, TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, true), {
                Value = l_v63_Pivot_0 + l_v63_Pivot_0.LookVector * 1.5
            });
            v57._dump:Add(l_NumberValue_0);
            v57._dump:Add(l_NumberValue_1);
            v57._dump:Add(l_CFrameValue_0);
            v57._dump:Add(v81, "NumTween");
            v57._dump:Add(v82, "NumTween2");
            v57._dump:Add(v83, "CFTween");
            local function v87(v84) --[[ Line: 289 ]] --[[ Name: playRotationTween ]]
                -- upvalues: v57 (ref), v81 (copy), v82 (copy), l_TweenService_0 (ref), l_NumberValue_1 (copy), v77 (copy), v24 (ref), l_CFrame_0 (ref), l_CurrentCamera_0 (ref)
                v84 = string.lower(v84);
                if v57._dump:Get("AngleTween") then
                    v57._dump:Remove("AngleTween");
                end;
                if v84 == "left" then
                    v81:Play();
                else
                    v82:Play();
                end;
                local v85 = math.random(-15, 15);
                local v86 = l_TweenService_0:Create(l_NumberValue_1, v77, {
                    Value = v85
                });
                v86:Play();
                v24:Shake("KarenCrateShake", {
                    originalPivot = l_CFrame_0
                }, function() --[[ Line: 307 ]]
                    -- upvalues: l_CurrentCamera_0 (ref), l_CFrame_0 (ref)
                    l_CurrentCamera_0.CFrame = l_CFrame_0;
                end);
                v57._dump:Add(v86, "AngleTween");
            end;
            v83:Play();
            v87("left");
            local l_Click_0 = v63.Click;
            if l_Click_0 or typeof(l_Click_0) ~= "Instance" then
                local l_v12_0 = v12;
                local l_l_Click_0_0 = l_Click_0;
                local v91 = "ParticleEmitter";
                local v92 = nil;
                local v93 = true;
                l_v12_0:IterateClass(l_l_Click_0_0, v91, function(v94) --[[ Line: 139 ]]
                    -- upvalues: v92 (copy), v93 (copy)
                    if v92 ~= nil and v92(v94) == true then
                        return;
                    elseif v93 == false then
                        v94.Enabled = false;
                        return;
                    else
                        v94:Emit(v94:GetAttribute("EmitCount") or 1);
                        if v93 then
                            v94.Enabled = true;
                        end;
                        return;
                    end;
                end);
            end;
            v57._dump:Add(l_RunService_0.RenderStepped:Connect(function() --[[ Line: 319 ]]
                -- upvalues: l_NumberValue_1 (copy), l_NumberValue_0 (copy), v63 (ref), l_CFrameValue_0 (copy)
                local v95 = CFrame.Angles(math.rad(l_NumberValue_1.Value or 0), 0, (math.rad(l_NumberValue_0.Value or 0)));
                v63:PivotTo(l_CFrameValue_0.Value * v95);
            end), "RenderSteppedLoop");
            l_Click_0 = 0;
            v75 = v75 or 2;
            v57._dump:Add(v81.Completed:Connect(function() --[[ Line: 327 ]]
                -- upvalues: v87 (copy)
                v87("right");
            end));
            v57._dump:Add(v82.Completed:Connect(function() --[[ Line: 331 ]]
                -- upvalues: l_Click_0 (ref), v75 (ref), v57 (ref), v24 (ref), v63 (ref), v12 (ref), v76 (copy), v87 (copy)
                l_Click_0 = l_Click_0 + 1;
                if v75 <= l_Click_0 then
                    if v57._dump:Get("RenderSteppedLoop") then
                        v57._dump:Remove("RenderSteppedLoop");
                    end;
                    if v57._dump:Get("NumTween") then
                        v57._dump:Remove("NumTween");
                    end;
                    if v57._dump:Get("NumTween2") then
                        v57._dump:Remove("NumTween2");
                    end;
                    if v57._dump:Get("CFTween") then
                        v57._dump:Remove("CFTween");
                    end;
                    if v57._dump:Get("AngleTween") then
                        v57._dump:Remove("AngleTween");
                    end;
                    v24:Stop();
                    local l_Click_1 = v63.Click;
                    if l_Click_1 or typeof(l_Click_1) ~= "Instance" then
                        local l_v12_1 = v12;
                        local l_l_Click_1_0 = l_Click_1;
                        local v99 = "ParticleEmitter";
                        local v100 = nil;
                        local v101 = false;
                        l_v12_1:IterateClass(l_l_Click_1_0, v99, function(v102) --[[ Line: 139 ]]
                            -- upvalues: v100 (copy), v101 (copy)
                            if v100 ~= nil and v100(v102) == true then
                                return;
                            elseif v101 == false then
                                v102.Enabled = false;
                                return;
                            else
                                v102:Emit(v102:GetAttribute("EmitCount") or 1);
                                if v101 then
                                    v102.Enabled = true;
                                end;
                                return;
                            end;
                        end);
                    end;
                    if v76 then
                        v76();
                    end;
                    return;
                else
                    v87("left");
                    return;
                end;
            end));
        end;
        v22:FadeMusicVolume(0.3, 0.5);
        local v104 = 1;
        local v105 = #v59;
        if typeof(v59[1]) == "table" then
            v105 = #v59[1];
        end;
        v20:Toggle("TreasureOpen", true);
        local function v127() --[[ Line: 403 ]] --[[ Name: doTap ]]
            -- upvalues: v104 (ref), v105 (ref), v57 (copy), v20 (ref), v22 (ref), v63 (copy), l_TweenService_0 (ref), v15 (ref), l_v63_Pivot_0 (copy), v31 (ref), l_CurrentCamera_0 (ref), v103 (copy), v24 (ref), v60 (copy), v59 (copy), v58 (copy), v12 (ref), v61 (copy)
            v104 = v104 + 1;
            if v104 > v105 + 1 and v57._revealingItem then
                return;
            elseif v104 > v105 + 1 and not v57._revealingItem then
                v57._revealingItem = true;
                v20:Toggle("TreasureOpen", false);
                v22:PlaySound({
                    name = "HydraCrate.Reward", 
                    soundGroup = "Master.SFX.UI"
                });
                local function v111() --[[ Line: 420 ]] --[[ Name: fadeAway ]]
                    -- upvalues: v63 (ref), l_TweenService_0 (ref), v57 (ref), v15 (ref), l_v63_Pivot_0 (ref), v31 (ref)
                    for _, v107 in v63:GetDescendants() do
                        if v107:IsA("BasePart") or v107:IsA("Decal") then
                            local v108 = l_TweenService_0:Create(v107, TweenInfo.new(0.15), {
                                Transparency = 1
                            });
                            do
                                local l_v108_0 = v108;
                                v57._dump:Add(l_v108_0.Completed:Once(function() --[[ Line: 426 ]]
                                    -- upvalues: l_v108_0 (ref)
                                    l_v108_0:Destroy();
                                    l_v108_0 = nil;
                                end));
                                v57._dump:Add(l_v108_0);
                                l_v108_0:Play();
                            end;
                        end;
                    end;
                    v57._dump:Add(v15("CFrameValue", l_v63_Pivot_0, TweenInfo.new(0.25), {
                        Value = l_v63_Pivot_0 + v31.CFrame.LookVector * -2.625
                    }, function(v110) --[[ Line: 439 ]]
                        -- upvalues: v63 (ref)
                        v63:PivotTo(v110);
                    end));
                end;
                local l_FieldOfView_0 = l_CurrentCamera_0.FieldOfView;
                local v113 = l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(1), {
                    FieldOfView = l_FieldOfView_0 + 10
                });
                v113:Play();
                v57._dump:Add(v113);
                v103(5, function() --[[ Line: 450 ]]
                    -- upvalues: v15 (ref), l_v63_Pivot_0 (ref), v31 (ref), v63 (ref), l_TweenService_0 (ref), l_CurrentCamera_0 (ref), l_FieldOfView_0 (copy), v57 (ref), v111 (copy), v24 (ref), v60 (ref), v59 (ref), v58 (ref), v12 (ref)
                    local v114 = TweenInfo.new(0.25);
                    local v115 = TweenInfo.new(0.25);
                    local v117 = v15("CFrameValue", l_v63_Pivot_0, v114, {
                        Value = l_v63_Pivot_0 + v31.CFrame.LookVector * 10.5
                    }, function(v116) --[[ Line: 456 ]]
                        -- upvalues: v63 (ref)
                        v63:PivotTo(v116);
                    end);
                    local v118 = l_TweenService_0:Create(l_CurrentCamera_0, v115, {
                        FieldOfView = l_FieldOfView_0
                    });
                    v118:Play();
                    v57._dump:Add(v118);
                    v117:Add(function() --[[ Line: 465 ]]
                        -- upvalues: v111 (ref), v24 (ref), v60 (ref), v57 (ref), v59 (ref), v58 (ref), v63 (ref), v12 (ref)
                        v111();
                        v24:Shake("VDayGiftShake", {
                            originalPivot = workspace.CurrentCamera.CFrame
                        }, function() --[[ Line: 469 ]]
                            -- upvalues: v60 (ref), v57 (ref), v59 (ref), v58 (ref)
                            if #v60 > 1 then
                                v57:RevealItemsOpened(v60, v59);
                                return;
                            else
                                v57:RevealItem(v60, v59[#v59], v58);
                                return;
                            end;
                        end);
                        v57._dump:Add(task.delay(0.075, function() --[[ Line: 478 ]]
                            -- upvalues: v63 (ref), v12 (ref)
                            local l_Explosion_0 = v63.Explosion;
                            if not l_Explosion_0 and typeof(l_Explosion_0) == "Instance" then
                                return;
                            else
                                local l_v12_2 = v12;
                                local l_l_Explosion_0_0 = l_Explosion_0;
                                local v122 = "ParticleEmitter";
                                local v123 = nil;
                                local v124 = nil;
                                l_v12_2:IterateClass(l_l_Explosion_0_0, v122, function(v125) --[[ Line: 139 ]]
                                    -- upvalues: v123 (copy), v124 (copy)
                                    if v123 ~= nil and v123(v125) == true then
                                        return;
                                    elseif v124 == false then
                                        v125.Enabled = false;
                                        return;
                                    else
                                        v125:Emit(v125:GetAttribute("EmitCount") or 1);
                                        if v124 then
                                            v125.Enabled = true;
                                        end;
                                        return;
                                    end;
                                end);
                                return;
                            end;
                        end));
                    end);
                end);
                return;
            else
                v103(2);
                local v126 = nil;
                v126 = if typeof(v59[1]) == "table" then v59[1][math.clamp(v104 - 1, 1, #v59[1])] else v59[math.clamp(v104 - 1, 1, #v59)];
                if v126 then
                    v57:_setRarityVisual(v126, v104, v61);
                end;
                if v104 <= v105 + 1 then
                    v22:PlaySound({
                        name = ("HydraCrate.Upgrade%*"):format(v104 - 1), 
                        soundGroup = "Master.SFX.UI"
                    });
                end;
                return;
            end;
        end;
        v57._dump:Add(l_UserInputService_0.InputBegan:Connect(function(v128, v129) --[[ Line: 541 ]]
            -- upvalues: v36 (ref), v127 (copy)
            if v129 or not table.find(v36, v128.UserInputType) then
                return;
            else
                v127();
                return;
            end;
        end));
        v57._dump:Add(v19.GamepadButtonPressed:Connect(v127));
        return;
    end;
end;
v38.RevealItemsOpened = function(v130, v131, _, _) --[[ Line: 552 ]] --[[ Name: RevealItemsOpened ]]
    -- upvalues: v20 (ref), v29 (ref)
    v130._dump:Clean();
    v130._dump = nil;
    v130._opening = false;
    v130._revealingItem = false;
    v20:Toggle("TreasureOpen", false):await();
    if v130._allToggled then
        v130._allToggled.TreasureOpen = nil;
    end;
    v29:ShowResults(v131, table.clone(v130._allToggled));
    v130._allToggled = nil;
end;
v38.RevealItem = function(v134, v135, _, v137) --[[ Line: 580 ]] --[[ Name: RevealItem ]]
    -- upvalues: v31 (ref), v32 (ref), v20 (ref), l_RunService_0 (copy), v21 (ref), v25 (ref), v27 (ref), v22 (ref)
    v134._dump:Clean();
    v134._dump:Add(function() --[[ Line: 583 ]]
        -- upvalues: v134 (copy), v31 (ref), v32 (ref)
        v134._dump = nil;
        if not v134._openAll then
            v134._allToggled = nil;
        end;
        task.delay(0.2, function() --[[ Line: 590 ]]
            -- upvalues: v31 (ref), v32 (ref), v134 (ref)
            v31.Attachment.SpotLight.Enabled = true;
            v32.Attachment.SpotLight.Enabled = true;
            v134._revealingItem = false;
        end);
        v134._opening = false;
    end);
    v20:Toggle("TreasureOpen", false):await();
    v134._allToggled.TreasureOpen = nil;
    local function v138() --[[ Line: 603 ]] --[[ Name: handleFinished ]]
        -- upvalues: v138 (ref), v134 (copy), l_RunService_0 (ref), v137 (copy)
        v138 = nil;
        v134._dump:Destroy();
        l_RunService_0.RenderStepped:Wait();
        if v134._openAll then
            v134:AttemptOpen(v137, 1, v134._openAll);
        end;
    end;
    if v135.type == "RandomUnit" or v135.type == "Unit" then
        v134._dump:Add(v21.QueueCompleted:Once(v138));
        v25.UnitGained:Fire({
            v135.unitData
        }, {
            fromNPE = false, 
            fromTreasureOpenAll = v134._openAll or false
        }, table.clone(v134._allToggled));
        return;
    else
        v134._dump:Add(v27.Finished:Once(v138));
        v27:QueueRewards(v135, table.clone(v134._allToggled), v134._openAll);
        task.delay(3.4, function() --[[ Line: 629 ]]
            -- upvalues: v22 (ref)
            v22:FadeMusicVolume(1, 0.5);
        end);
        return;
    end;
end;
v38.PlayAnimation = function(_, v140, v141, v142, v143, v144) --[[ Line: 635 ]] --[[ Name: PlayAnimation ]]
    if not v140 or not v141 then
        return;
    else
        if v144 == nil then
            v144 = true;
        end;
        v142 = v142 or {};
        local l_AnimationController_0 = v140:FindFirstChildOfClass("AnimationController");
        l_AnimationController_0 = l_AnimationController_0 and l_AnimationController_0:FindFirstChildOfClass("Animator");
        if not l_AnimationController_0 then
            return;
        else
            local v146 = l_AnimationController_0:LoadAnimation(v141);
            for v147, v148 in v142 do
                v146[v147] = v148;
            end;
            if v143 then
                for v149, v150 in v143 do
                    v146:GetMarkerReachedSignal(v149):Once(function(...) --[[ Line: 661 ]]
                        -- upvalues: v150 (copy), v146 (copy)
                        v150(v146, ...);
                    end);
                end;
            end;
            if v144 then
                v146:Play();
            end;
            return v146;
        end;
    end;
end;
v38.AttemptOpen = function(v151, v152, v153, v154) --[[ Line: 674 ]] --[[ Name: AttemptOpen ]]
    -- upvalues: v23 (ref), v28 (ref), v17 (ref), v20 (ref)
    if not v152 or v151:IsOpening() then
        return;
    elseif v23:IsOpening() then
        return;
    else
        v153 = v153 or 1;
        v154 = v153 <= 1;
        v151._chestName = v152;
        v151:ToggleOpenAll(v154 or false);
        local v155 = nil;
        v155 = task.delay(0.25, function() --[[ Line: 690 ]]
            -- upvalues: v155 (ref), v28 (ref)
            v155 = nil;
            v28:Toggle(true);
        end);
        if v153 > 1 then
            v17:OpenCustomChestAmount(v152, v153):andThen(function(v156, v157, v158) --[[ Line: 696 ]]
                -- upvalues: v20 (ref), v151 (copy), v152 (copy)
                if not v156 or not v157 then
                    v20:Toggle("Items", true);
                    return;
                else
                    v151:OpenTreasure(v152, v156, v157, v158);
                    return;
                end;
            end):catch(function() --[[ Line: 704 ]]
                -- upvalues: v20 (ref), v151 (copy)
                v20:Toggle("Items", true);
                if v151._openAll then
                    v151:OpenAllFailed(2);
                end;
            end):finally(function() --[[ Line: 710 ]]
                -- upvalues: v28 (ref), v155 (ref), v151 (copy)
                v28:Toggle(false);
                if v155 then
                    task.cancel(v155);
                end;
                v151._processingRequest = false;
            end);
            return;
        else
            v17:Open(v152):andThen(function(v159, v160, v161) --[[ Line: 722 ]]
                -- upvalues: v20 (ref), v151 (copy), v28 (ref), v155 (ref), v152 (copy)
                if not v159 or not v160 then
                    v20:Toggle("Items", true);
                    if v151._openAll then
                        v151:OpenAllFailed(1);
                    end;
                    v151:ToggleOpenAll(false);
                    return;
                else
                    v28:Toggle(false);
                    if v155 then
                        task.cancel(v155);
                    end;
                    v151:OpenTreasure(v152, v159, v160, v161);
                    return;
                end;
            end):catch(function(v162) --[[ Line: 742 ]]
                -- upvalues: v20 (ref), v151 (copy)
                warn("caught err", v162);
                v20:Toggle("Items", true);
                if v151._openAll then
                    v151:OpenAllFailed(2);
                end;
                v151:ToggleOpenAll(false);
            end):finally(function() --[[ Line: 751 ]]
                -- upvalues: v28 (ref), v155 (ref)
                v28:Toggle(false);
                if v155 then
                    task.cancel(v155);
                end;
            end);
            return;
        end;
    end;
end;
v38.OpenAllFailed = function(v163, v164) --[[ Line: 761 ]] --[[ Name: OpenAllFailed ]]
    -- upvalues: v20 (ref), v19 (ref), v18 (ref), l_CurrentCamera_0 (copy)
    warn((("[%*]: Open All Failed! Fail Id: (%*)"):format(script.Name, v164)));
    v163:ToggleOpenAll(false);
    if v163._allToggled then
        v20:RevertFromToggleAll(v163._allToggled);
        v163._allToggled = nil;
    end;
    v19:TogglePlayerControls(true);
    v18:ToggleHideAll(false);
    l_CurrentCamera_0.FieldOfView = 70;
    l_CurrentCamera_0.CameraType = Enum.CameraType.Custom;
end;
v38.ToggleOpenAll = function(v165, v166) --[[ Line: 778 ]] --[[ Name: ToggleOpenAll ]]
    -- upvalues: v26 (ref)
    v165._openAll = v166;
    v26:ReportOpenAll(v166);
end;
local v167 = {
    Rare = Color3.fromRGB(111, 255, 0), 
    Epic = Color3.fromRGB(162, 0, 255), 
    Legendary = Color3.fromRGB(242, 255, 0), 
    Mythic = Color3.fromRGB(255, 0, 187), 
    Secret = Color3.fromRGB(255, 0, 4)
};
v38._setRarityVisual = function(v168, v169, v170, v171) --[[ Line: 792 ]] --[[ Name: _setRarityVisual ]]
    -- upvalues: v33 (ref), v13 (copy), v167 (copy), v26 (ref)
    v170 = v170 or 1;
    if v33 then
        v33.SurfaceGui.ImageLabel.UIGradient.Color = v13.Gradient[v169];
        v33.SurfaceGui.Spotlight.UIGradient.Color = v13.Gradient[v169];
    end;
    if v168.chestContainer then
        v168.chestContainer.Screen.Decal.Color3 = v167[v169];
    end;
    v26:SetIndex(v169, v170, v171, true);
end;
return v38;