local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_RunService_0 = game:GetService("RunService");
local l_TweenService_0 = game:GetService("TweenService");
local v3 = require(l_ReplicatedStorage_0.Packages.Knit);
local v4 = require(l_ReplicatedStorage_0.Packages.RailUtil);
local v5 = require(l_ReplicatedStorage_0.Packages.BaseComponent);
local v6 = require(l_ReplicatedStorage_0.Packages.WaitFor);
local v7 = require(l_ReplicatedStorage_0.Packages.Janitor);
local v8 = require(l_ReplicatedStorage_0.Packages.Fusion);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v10 = require(l_ReplicatedStorage_0.Shared.Util.AnimationHandler);
local v11 = require(l_ReplicatedStorage_0.Shared.TowerOfKarate.AnimationData);
local _ = require(l_ReplicatedStorage_0.Shared.Data.Variables);
local v13 = require(l_ReplicatedStorage_0.Shared.Util.PathUtil);
local v14 = v3.GetController("UIController");
local v15 = l_RunService_0:IsStudio() and true;
local v16 = TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut);
local v17 = {
    Methods = {}, 
    Extensions = {
        v5
    }
};
v17.Methods._PlayEntityAnimation = function(v18, v19, v20) --[[ Line: 49 ]] --[[ Name: _PlayEntityAnimation ]]
    -- upvalues: v10 (copy)
    local l__visualModel_0 = v18._visualModel;
    local v22 = ("Enemies.%*.%*"):format(v18:GetAttribute("ReferenceName"), v19);
    local v23 = v20 or {};
    v23.stopPlayingTracks = true;
    if l__visualModel_0 then
        v10:PlayAnimation(l__visualModel_0, v22, v23);
    end;
end;
v17.Methods._SetAttackConfig = function(v24, v25) --[[ Line: 66 ]] --[[ Name: _SetAttackConfig ]]
    v24._attackConfig = v25;
end;
v17.Methods._SetEntityAnimation = function(v26, v27) --[[ Line: 77 ]] --[[ Name: _SetEntityAnimation ]]
    local l__visualModel_1 = v26._visualModel;
    if l__visualModel_1 and v27 then
        l__visualModel_1:SetAttribute("AnimationId", v27);
    end;
end;
v17.Methods._SetupAttack = function(v29) --[[ Line: 84 ]] --[[ Name: _SetupAttack ]]
    -- upvalues: v4 (copy), v13 (copy), v11 (copy), v7 (copy)
    local l_v29_Attribute_0 = v29:GetAttribute("ReferenceName");
    local v31 = v4.Instance.ensureAnimator(v29._visualModel);
    local l_AnimationId_0 = v13(v11, (("Enemies.%*"):format(l_v29_Attribute_0))).Attack.AnimationId;
    if v29._attackConfig ~= nil then
        local v33 = v29._attackConfig and v29._attackConfig.stop;
        v29._attackConfig.stop = function() --[[ Line: 93 ]]
            -- upvalues: v29 (copy), v33 (copy)
            for _, v35 in v29.Instance:GetDescendants() do
                if v35:IsA("ParticleEmitter") then
                    v35.Enabled = false;
                    v35:Clear();
                elseif v35:IsA("Beam") then
                    v35.Enabled = false;
                end;
            end;
            if v33 and typeof(v33) == "function" then
                v33();
            end;
        end;
    end;
    v31.AnimationPlayed:Connect(function(v36) --[[ Line: 109 ]]
        -- upvalues: v29 (copy), l_AnimationId_0 (copy), v7 (ref)
        if v29._attackConfig == nil then
            return;
        else
            local l_AnimationId_1 = v36.Animation.AnimationId;
            if typeof(l_AnimationId_0) == "table" and not table.find(l_AnimationId_0, l_AnimationId_1) then
                return;
            elseif typeof(l_AnimationId_0) ~= "table" and l_AnimationId_1 ~= l_AnimationId_0 then
                return;
            else
                if v29._attackConfig.start then
                    v29._attackConfig.start();
                end;
                local v38 = v7.new();
                if v29._attackConfig.markers then
                    for v39, v40 in v29._attackConfig.markers do
                        v38:Add(v36:GetMarkerReachedSignal(v39):Connect(function(v41) --[[ Line: 130 ]]
                            -- upvalues: v40 (copy), v36 (copy)
                            v40(v41, v36);
                        end));
                    end;
                end;
                v36.Stopped:Once(function() --[[ Line: 136 ]]
                    -- upvalues: v38 (copy), v29 (ref)
                    v38:Destroy();
                    if v29._attackConfig.stop then
                        v29._attackConfig.stop();
                    end;
                end);
                return;
            end;
        end;
    end);
end;
v17.Methods._SetupDeathAnimation = function(v42) --[[ Line: 146 ]] --[[ Name: _SetupDeathAnimation ]]
    -- upvalues: v4 (copy), v13 (copy), v11 (copy), v7 (copy), l_TweenService_0 (copy), v16 (copy), l_RunService_0 (copy)
    local l_v42_Attribute_0 = v42:GetAttribute("ReferenceName");
    local v44 = v4.Instance.ensureAnimator(v42._visualModel);
    local l_AnimationId_2 = v13(v11, (("Enemies.%*"):format(l_v42_Attribute_0))).Death.AnimationId;
    v44.AnimationPlayed:Connect(function(v46) --[[ Line: 152 ]]
        -- upvalues: l_AnimationId_2 (copy), v42 (copy), v7 (ref), l_TweenService_0 (ref), v16 (ref), l_RunService_0 (ref)
        if v46.Animation.AnimationId ~= l_AnimationId_2 then
            return;
        else
            if v42._attackConfig.start then
                v42._attackConfig.start();
            end;
            local v47 = v7.new();
            v47:Add(v46:GetMarkerReachedSignal("FadeOut"):Connect(function() --[[ Line: 165 ]]
                -- upvalues: v42 (ref), l_TweenService_0 (ref), v16 (ref), l_RunService_0 (ref)
                for _, v49 in v42.Instance:GetDescendants() do
                    if v49:IsA("ParticleEmitter") then
                        v49:Clear();
                    end;
                    if v49:IsA("BasePart") and v49.Transparency < 1 then
                        l_TweenService_0:Create(v49, v16, {
                            Transparency = 1
                        }):Play();
                    end;
                end;
                local l_CFrameValue_0 = Instance.new("CFrameValue");
                l_CFrameValue_0.Value = v42.Instance:GetPivot();
                local v51 = l_TweenService_0:Create(l_CFrameValue_0, TweenInfo.new(3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
                    Value = l_CFrameValue_0.Value * CFrame.new(0, -5, 0)
                });
                v42:AddTask(l_RunService_0.Heartbeat:Connect(function() --[[ Line: 195 ]]
                    -- upvalues: v42 (ref), l_CFrameValue_0 (copy)
                    v42.Instance:PivotTo(l_CFrameValue_0.Value);
                end));
                v51:Play();
                v42:AddTask(l_CFrameValue_0);
            end));
            v46.Stopped:Once(function() --[[ Line: 203 ]]
                -- upvalues: v47 (copy), v42 (ref)
                v47:Destroy();
                if v42._attackConfig.stop then
                    v42._attackConfig.stop();
                end;
            end);
            return;
        end;
    end);
end;
v17.Methods._SetupDebugging = function(v52) --[[ Line: 213 ]] --[[ Name: _SetupDebugging ]]
    -- upvalues: v8 (copy), l_RunService_0 (copy), v15 (copy)
    local l_v52_Scope_0 = v52:GetScope();
    local v54 = l_v52_Scope_0:Value(v52._isAlive);
    local v55 = l_v52_Scope_0:Value(workspace:GetAttribute("ENEMY_DEBUG") or false);
    local v56 = l_v52_Scope_0:Value(v52:GetAttribute("EntityState"));
    local v57 = {
        Attacking = Color3.fromHSV(0, 1, 1), 
        Pursuing = Color3.fromHSV(0, 0.5, 1), 
        Dying = Color3.fromHSV(0, 0, 0.2), 
        Dead = Color3.fromHSV(0, 0, 0.2), 
        Walking = Color3.fromHSV(0.6, 1, 1), 
        Idling = Color3.fromHSV(0.3, 1, 1), 
        Stunned = Color3.fromRGB(207, 49, 255)
    };
    local l_Attachment_0 = Instance.new("Attachment");
    l_Attachment_0.CFrame = CFrame.new(0, v52._height / 2 + 3, 0);
    l_Attachment_0.Name = "DEBUG_STATUS_ATTACHMENT";
    l_Attachment_0.Parent = v52.Instance.PrimaryPart;
    local function v60(v59) --[[ Line: 234 ]] --[[ Name: textLabel ]]
        -- upvalues: l_v52_Scope_0 (copy), v8 (ref)
        return l_v52_Scope_0:New("TextLabel")({
            Size = v59.Size or UDim2.fromScale(0.47, 1), 
            BackgroundTransparency = 1, 
            TextScaled = true, 
            Text = v59.Text, 
            TextColor3 = v59.TextColor3 or Color3.new(1, 1, 1), 
            Font = Enum.Font.SourceSansBold, 
            Name = v59.Name, 
            TextXAlignment = v59.TextXAlignment, 
            LayoutOrder = v59.LayoutOrder, 
            [v8.Children] = {
                l_v52_Scope_0:New("UIStroke")({
                    Color = Color3.new(0, 0, 0), 
                    Thickness = 2
                })
            }
        });
    end;
    local function v62(v61) --[[ Line: 255 ]] --[[ Name: createLabel ]]
        -- upvalues: l_v52_Scope_0 (copy), v8 (ref), v60 (copy)
        return l_v52_Scope_0:New("Frame")({
            Name = v61.Name, 
            LayoutOrder = v61.LayoutOrder, 
            Size = UDim2.fromScale(1, 0.33), 
            BackgroundTransparency = 1, 
            [v8.Children] = {
                l_v52_Scope_0:New("UIListLayout")({
                    Padding = UDim.new(0, 14), 
                    FillDirection = Enum.FillDirection.Horizontal, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    VerticalAlignment = Enum.VerticalAlignment.Center
                }), 
                v60(v61.Title), 
                v60(v61.State)
            }
        });
    end;
    local v63 = UDim2.fromScale(0.3, 1);
    l_v52_Scope_0:New("BillboardGui")({
        Name = "DEBUG_STATUS", 
        Active = true, 
        ClipsDescendants = true, 
        LightInfluence = 1, 
        Size = UDim2.fromScale(4, 2), 
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
        ResetOnSpawn = false, 
        AutoLocalize = false, 
        MaxDistance = 160, 
        Adornee = l_Attachment_0, 
        Parent = l_Attachment_0, 
        Enabled = l_v52_Scope_0:Computed(function(v64) --[[ Line: 348 ]]
            -- upvalues: v55 (copy)
            return v64(v55) == true;
        end), 
        [v8.Children] = {
            l_v52_Scope_0:New("UIListLayout")({
                Padding = UDim.new(0, 0), 
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }), 
            (function() --[[ Line: 318 ]] --[[ Name: createDamageLabel ]]
                -- upvalues: v62 (copy), v63 (copy), v52 (copy)
                return v62({
                    Name = "State", 
                    LayoutOrder = 1, 
                    Title = {
                        Text = "Damage:", 
                        Size = v63
                    }, 
                    State = {
                        Text = v52:GetAttribute("AttackDamage"), 
                        TextColor3 = Color3.fromHex("#ff4d00")
                    }
                });
            end)(), 
            (function() --[[ Line: 301 ]] --[[ Name: createHealthLabel ]]
                -- upvalues: v62 (copy), v52 (copy)
                return v62({
                    Name = "State", 
                    LayoutOrder = 2, 
                    Title = {
                        Text = "Max Health:", 
                        Size = UDim2.fromScale(0.42, 1)
                    }, 
                    State = {
                        Text = v52:GetAttribute("MaxHealth"), 
                        TextColor3 = Color3.new(0, 1, 0)
                    }
                });
            end)(), 
            (function() --[[ Line: 278 ]] --[[ Name: createStateLabel ]]
                -- upvalues: v62 (copy), v63 (copy), l_v52_Scope_0 (copy), v56 (copy), v57 (copy)
                return v62({
                    Name = "State", 
                    LayoutOrder = 3, 
                    Title = {
                        Text = "State:", 
                        Size = v63
                    }, 
                    State = {
                        Text = l_v52_Scope_0:Computed(function(v65) --[[ Line: 289 ]]
                            -- upvalues: v56 (ref)
                            return v65(v56);
                        end), 
                        TextColor3 = l_v52_Scope_0:Computed(function(v66) --[[ Line: 293 ]]
                            -- upvalues: v56 (ref), v57 (ref)
                            return v57[v66(v56)] or Color3.new(1, 1, 1);
                        end)
                    }
                });
            end)()
        }
    });
    v52:ObserveAttribute("IsAlive", function(v67) --[[ Line: 366 ]]
        -- upvalues: v54 (copy)
        v54:set(v67);
    end);
    v52:ObserveAttribute("EntityState", function(v68) --[[ Line: 370 ]]
        -- upvalues: v56 (copy), v52 (copy)
        v56:set(v68);
        if v68 == "Dying" then
            local l_VFX_0 = v52.Instance:FindFirstChild("VFX");
            if l_VFX_0 then
                for _, v71 in l_VFX_0:GetDescendants() do
                    if v71:IsA("ParticleEmitter") then
                        v71:Clear();
                    end;
                    if v71:IsA("Beam") or v71:IsA("ParticleEmitter") then
                        v71.Enabled = false;
                    end;
                end;
            end;
        end;
    end);
    v52:AddTask(workspace:GetAttributeChangedSignal("ENEMY_DEBUG"):Connect(function() --[[ Line: 390 ]]
        -- upvalues: v55 (copy)
        local v72 = workspace:GetAttribute("ENEMY_DEBUG") or false;
        v55:set(v72);
    end));
    if workspace:GetAttribute("ENEMY_DEBUG") == nil then
        workspace:SetAttribute("ENEMY_DEBUG", l_RunService_0:IsStudio() and v15);
    end;
end;
v17.Methods.GetEntityMetadata = function(v73) --[[ Line: 402 ]] --[[ Name: GetEntityMetadata ]]
    return v73._entityMetadata;
end;
v17.Methods.SetEntityState = function(v74, v75) --[[ Line: 407 ]] --[[ Name: SetEntityState ]]
    v74:SetAttribute("EntityState", v75);
end;
v17.Methods.IsAlive = function(v76) --[[ Line: 411 ]] --[[ Name: IsAlive ]]
    return v76:GetAttribute("IsAlive") == true;
end;
v17.Methods.IsStunned = function(v77) --[[ Line: 415 ]] --[[ Name: IsStunned ]]
    return v77:GetAttribute("EntityState") == "Stunned";
end;
v17.Methods.PromiseAttackPosition = function(v78) --[[ Line: 419 ]] --[[ Name: PromiseAttackPosition ]]
    -- upvalues: v6 (copy)
    local v79 = v6.Custom(function() --[[ Line: 420 ]]
        -- upvalues: v78 (copy)
        return v78:GetAttribute("AttackPosition");
    end, 5);
    v78:AddPromise(v79);
    return v79;
end;
v17.Constructing = function(v80) --[[ Line: 431 ]] --[[ Name: Constructing ]]
    -- upvalues: v6 (copy)
    v80._visualModel = v80.Instance:WaitForChild("VisualModel");
    v80._visualModel:SetAttribute("AnimationId", "");
    v6.Custom(function() --[[ Line: 435 ]]
        -- upvalues: v80 (copy)
        return v80.Instance.PrimaryPart;
    end, 5):await();
    v80._primaryPart = v80.Instance.PrimaryPart;
    if v80._primaryPart then
        v80._height = v80._primaryPart.Size.Y;
    end;
    v80:_SetupAttack();
    v80:_SetupDeathAnimation();
end;
v17.Constructed = function(_) --[[ Line: 450 ]] --[[ Name: Constructed ]]

end;
v17.Started = function(v82) --[[ Line: 452 ]] --[[ Name: Started ]]
    -- upvalues: v8 (copy), v14 (copy)
    local l_v82_Scope_0 = v82:GetScope();
    local v84 = l_v82_Scope_0:Value(v82:GetAttribute("Health"));
    local l_v82_Attribute_0 = v82:GetAttribute("MaxHealth");
    local v86 = l_v82_Scope_0:Value(v82:GetAttribute("IsAlive"));
    v82:ObserveAttribute("Health", function(v87) --[[ Line: 460 ]]
        -- upvalues: v84 (copy)
        v84:set(v87);
    end);
    v82:ObserveAttribute("IsAlive", function(v88) --[[ Line: 463 ]]
        -- upvalues: v86 (copy)
        v86:set(v88);
    end);
    local v89 = v82.Instance.PrimaryPart:WaitForChild("HealthAttachment", 10);
    l_v82_Scope_0:New("BillboardGui")({
        Name = "Healthbar", 
        Size = UDim2.fromScale(5, 0.6), 
        ResetOnSpawn = false, 
        Adornee = v89, 
        Parent = v89, 
        Enabled = l_v82_Scope_0:Computed(function(v90) --[[ Line: 476 ]]
            -- upvalues: v86 (copy)
            return v90(v86) == true;
        end), 
        [v8.Children] = {
            l_v82_Scope_0:New("Frame")({
                Name = "Bar", 
                Size = UDim2.fromScale(1, 1), 
                BackgroundColor3 = Color3.fromRGB(34, 34, 34), 
                [v8.Children] = {
                    l_v82_Scope_0:New("UICorner")({
                        CornerRadius = UDim.new(1, 0)
                    }), 
                    l_v82_Scope_0:New("UIPadding")({
                        PaddingBottom = UDim.new(0.1, 0), 
                        PaddingLeft = UDim.new(0.02, 0), 
                        PaddingRight = UDim.new(0.02, 0), 
                        PaddingTop = UDim.new(0.1, 0)
                    }), 
                    l_v82_Scope_0:New("Frame")({
                        Name = "Fill", 
                        BackgroundColor3 = Color3.new(1, 1, 1), 
                        Size = l_v82_Scope_0:Computed(function(v91) --[[ Line: 502 ]]
                            -- upvalues: v84 (copy), l_v82_Attribute_0 (copy)
                            return UDim2.fromScale(math.clamp(v91(v84) / l_v82_Attribute_0, 0, 1), 1);
                        end), 
                        [v8.Children] = {
                            l_v82_Scope_0:New("UICorner")({
                                CornerRadius = UDim.new(1, 0)
                            }), 
                            l_v82_Scope_0:New("UIGradient")({
                                Rotation = 90, 
                                Color = ColorSequence.new({
                                    ColorSequenceKeypoint.new(0, Color3.fromHex("#9dff1c")), 
                                    ColorSequenceKeypoint.new(1, Color3.fromHex("#135b01"))
                                })
                            })
                        }
                    })
                }
            })
        }
    });
    v82:_SetupDebugging();
    v82:ObserveAttribute("EntityState", function(v92) --[[ Line: 530 ]]
        -- upvalues: v82 (copy)
        if v92 == "Pursuing" or v92 == "Walking" then
            v82:_PlayEntityAnimation("Walk", {
                Speed = v82:GetAttribute("WalkAnimSpeed") or 1
            });
            return;
        elseif v92 == "Stunned" then
            v82:_PlayEntityAnimation("Stunned");
            return;
        else
            if v92 == "Idling" then
                v82:_PlayEntityAnimation("Idle");
            end;
            return;
        end;
    end);
    if v82:GetAttribute("IsBoss") == true then
        v82:ObserveAttribute("Activated", function(v93) --[[ Line: 543 ]]
            -- upvalues: v14 (ref), v82 (copy), l_v82_Attribute_0 (copy)
            if not v93 then
                return;
            else
                local l_BossHealthBar_0 = v14:GetModuleAsync("GameUI_TowerOfKarate"):expect():CreateBossHealthBar(v82.Instance);
                l_BossHealthBar_0.Inner.BossName.Text = v82.Instance.Name;
                v82:ObserveAttribute("Health", function(v95) --[[ Line: 554 ]]
                    -- upvalues: l_BossHealthBar_0 (copy), l_v82_Attribute_0 (ref)
                    l_BossHealthBar_0.Inner.ArmorFill.Size = UDim2.fromScale(math.clamp(v95 / l_v82_Attribute_0, 0, 1), 1);
                    l_BossHealthBar_0.Inner.Amount.Text = ("%*/%*"):format(v95, l_v82_Attribute_0);
                end);
                v82:AddTask(l_BossHealthBar_0);
                return;
            end;
        end);
    end;
end;
v17.Stopped = function(_) --[[ Line: 568 ]] --[[ Name: Stopped ]]

end;
return v17;