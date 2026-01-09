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
            if v42._attackConfig and v42._attackConfig.start then
                v42._attackConfig.start();
            end;
            local v47 = v7.new();
            v47:Add(v46:GetMarkerReachedSignal("FadeOut"):Connect(function() --[[ Line: 166 ]]
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
                v42:AddTask(l_RunService_0.Heartbeat:Connect(function() --[[ Line: 192 ]]
                    -- upvalues: v42 (ref), l_CFrameValue_0 (copy)
                    v42.Instance:PivotTo(l_CFrameValue_0.Value);
                end));
                v51:Play();
                v42:AddTask(l_CFrameValue_0);
            end));
            v46.Stopped:Once(function() --[[ Line: 200 ]]
                -- upvalues: v47 (copy), v42 (ref)
                v47:Destroy();
                if v42._attackConfig and v42._attackConfig.stop then
                    v42._attackConfig.stop();
                end;
            end);
            return;
        end;
    end);
end;
local function _(v52, v53) --[[ Line: 211 ]] --[[ Name: toNumberOr ]]
    if typeof(v52) == "number" and v52 == v52 then
        return v52;
    else
        return v53;
    end;
end;
local function _(v55, v56) --[[ Line: 218 ]] --[[ Name: toStringOr ]]
    if typeof(v55) == "string" then
        return v55;
    elseif typeof(v55) == "number" and v55 == v55 then
        return (tostring(v55));
    else
        return v56;
    end;
end;
v17.Methods._SetupDebugging = function(v58) --[[ Line: 227 ]] --[[ Name: _SetupDebugging ]]
    -- upvalues: v8 (copy), l_RunService_0 (copy), v15 (copy)
    local l_v58_Scope_0 = v58:GetScope();
    local v60 = l_v58_Scope_0:Value(v58._isAlive);
    local v61 = l_v58_Scope_0:Value(workspace:GetAttribute("ENEMY_DEBUG") or false);
    local v62 = l_v58_Scope_0:Value(v58:GetAttribute("EntityState"));
    local l_v58_Attribute_0 = v58:GetAttribute("MaxHealth");
    local v64 = l_v58_Scope_0:Value(if typeof(l_v58_Attribute_0) == "number" and l_v58_Attribute_0 == l_v58_Attribute_0 then l_v58_Attribute_0 else 1);
    local l_v58_Attribute_1 = v58:GetAttribute("AttackDamage");
    local v66 = l_v58_Scope_0:Value(if typeof(l_v58_Attribute_1) == "number" and l_v58_Attribute_1 == l_v58_Attribute_1 then l_v58_Attribute_1 else 0);
    v58:ObserveAttribute("IsAlive", function(v67) --[[ Line: 238 ]]
        -- upvalues: v60 (copy)
        v60:set(v67 == true);
    end);
    v58:ObserveAttribute("EntityState", function(v68) --[[ Line: 242 ]]
        -- upvalues: v62 (copy), v58 (copy)
        v62:set(v68);
        if v68 == "Dying" then
            local l_VFX_0 = v58.Instance:FindFirstChild("VFX");
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
    v58:ObserveAttribute("MaxHealth", function(v72) --[[ Line: 260 ]]
        -- upvalues: v64 (copy)
        v64:set((math.max(1, if typeof(v72) == "number" and v72 == v72 then v72 else 1)));
    end);
    v58:ObserveAttribute("AttackDamage", function(v73) --[[ Line: 264 ]]
        -- upvalues: v66 (copy)
        v66:set((math.max(0, if typeof(v73) == "number" and v73 == v73 then v73 else 0)));
    end);
    local v74 = {
        Attacking = Color3.fromHSV(0, 1, 1), 
        Pursuing = Color3.fromHSV(0, 0.5, 1), 
        Dying = Color3.fromHSV(0, 0, 0.2), 
        Dead = Color3.fromHSV(0, 0, 0.2), 
        Walking = Color3.fromHSV(0.6, 1, 1), 
        Idling = Color3.fromHSV(0.3, 1, 1), 
        Stunned = Color3.fromRGB(207, 49, 255)
    };
    l_v58_Attribute_0 = Instance.new("Attachment");
    l_v58_Attribute_0.CFrame = CFrame.new(0, v58._height / 2 + 3, 0);
    l_v58_Attribute_0.Name = "DEBUG_STATUS_ATTACHMENT";
    l_v58_Attribute_0.Parent = v58.Instance.PrimaryPart;
    l_v58_Attribute_1 = function(v75) --[[ Line: 283 ]] --[[ Name: textLabel ]]
        -- upvalues: l_v58_Scope_0 (copy), v8 (ref)
        return l_v58_Scope_0:New("TextLabel")({
            Size = v75.Size or UDim2.fromScale(0.47, 1), 
            BackgroundTransparency = 1, 
            TextScaled = true, 
            Text = v75.Text, 
            TextColor3 = v75.TextColor3 or Color3.new(1, 1, 1), 
            Font = Enum.Font.SourceSansBold, 
            Name = v75.Name, 
            TextXAlignment = v75.TextXAlignment, 
            LayoutOrder = v75.LayoutOrder, 
            [v8.Children] = {
                l_v58_Scope_0:New("UIStroke")({
                    Color = Color3.new(0, 0, 0), 
                    Thickness = 2
                })
            }
        });
    end;
    local function v77(v76) --[[ Line: 304 ]] --[[ Name: createLabel ]]
        -- upvalues: l_v58_Scope_0 (copy), v8 (ref), l_v58_Attribute_1 (copy)
        return l_v58_Scope_0:New("Frame")({
            Name = v76.Name, 
            LayoutOrder = v76.LayoutOrder, 
            Size = UDim2.fromScale(1, 0.33), 
            BackgroundTransparency = 1, 
            [v8.Children] = {
                l_v58_Scope_0:New("UIListLayout")({
                    Padding = UDim.new(0, 14), 
                    FillDirection = Enum.FillDirection.Horizontal, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    VerticalAlignment = Enum.VerticalAlignment.Center
                }), 
                l_v58_Attribute_1(v76.Title), 
                l_v58_Attribute_1(v76.State)
            }
        });
    end;
    local v78 = UDim2.fromScale(0.3, 1);
    l_v58_Scope_0:New("BillboardGui")({
        Name = "DEBUG_STATUS", 
        Active = true, 
        ClipsDescendants = true, 
        LightInfluence = 1, 
        Size = UDim2.fromScale(4, 2), 
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
        ResetOnSpawn = false, 
        AutoLocalize = false, 
        MaxDistance = 160, 
        Adornee = l_v58_Attribute_0, 
        Parent = l_v58_Attribute_0, 
        Enabled = l_v58_Scope_0:Computed(function(v79) --[[ Line: 402 ]]
            -- upvalues: v61 (copy)
            return v79(v61) == true;
        end), 
        [v8.Children] = {
            l_v58_Scope_0:New("UIListLayout")({
                Padding = UDim.new(0, 0), 
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }), 
            (function() --[[ Line: 370 ]] --[[ Name: createDamageLabel ]]
                -- upvalues: v77 (copy), v78 (copy), l_v58_Scope_0 (copy), v66 (copy)
                return v77({
                    Name = "Damage", 
                    LayoutOrder = 1, 
                    Title = {
                        Text = "Damage:", 
                        Size = v78
                    }, 
                    State = {
                        Text = l_v58_Scope_0:Computed(function(v80) --[[ Line: 381 ]]
                            -- upvalues: v66 (ref)
                            local v81 = v80(v66);
                            return (tostring(if typeof(v81) == "number" and v81 == v81 then v81 else 0));
                        end), 
                        TextColor3 = Color3.fromHex("#ff4d00")
                    }
                });
            end)(), 
            (function() --[[ Line: 350 ]] --[[ Name: createHealthLabel ]]
                -- upvalues: v77 (copy), l_v58_Scope_0 (copy), v64 (copy)
                return v77({
                    Name = "MaxHealth", 
                    LayoutOrder = 2, 
                    Title = {
                        Text = "Max Health:", 
                        Size = UDim2.fromScale(0.42, 1)
                    }, 
                    State = {
                        Text = l_v58_Scope_0:Computed(function(v82) --[[ Line: 361 ]]
                            -- upvalues: v64 (ref)
                            local v83 = v82(v64);
                            return (tostring(if typeof(v83) == "number" and v83 == v83 then v83 else 1));
                        end), 
                        TextColor3 = Color3.new(0, 1, 0)
                    }
                });
            end)(), 
            (function() --[[ Line: 327 ]] --[[ Name: createStateLabel ]]
                -- upvalues: v77 (copy), v78 (copy), l_v58_Scope_0 (copy), v62 (copy), v74 (copy)
                return v77({
                    Name = "State", 
                    LayoutOrder = 3, 
                    Title = {
                        Text = "State:", 
                        Size = v78
                    }, 
                    State = {
                        Text = l_v58_Scope_0:Computed(function(v84) --[[ Line: 338 ]]
                            -- upvalues: v62 (ref)
                            local v85 = v84(v62);
                            if typeof(v85) == "string" then
                                return v85;
                            elseif typeof(v85) == "number" and v85 == v85 then
                                return (tostring(v85));
                            else
                                return "";
                            end;
                        end), 
                        TextColor3 = l_v58_Scope_0:Computed(function(v86) --[[ Line: 342 ]]
                            -- upvalues: v62 (ref), v74 (ref)
                            return v74[v86(v62)] or Color3.new(1, 1, 1);
                        end)
                    }
                });
            end)()
        }
    });
    v58:AddTask(workspace:GetAttributeChangedSignal("ENEMY_DEBUG"):Connect(function() --[[ Line: 420 ]]
        -- upvalues: v61 (copy)
        local v87 = workspace:GetAttribute("ENEMY_DEBUG") or false;
        v61:set(v87);
    end));
    if workspace:GetAttribute("ENEMY_DEBUG") == nil then
        workspace:SetAttribute("ENEMY_DEBUG", l_RunService_0:IsStudio() and v15);
    end;
end;
v17.Methods.GetEntityMetadata = function(v88) --[[ Line: 433 ]] --[[ Name: GetEntityMetadata ]]
    return v88._entityMetadata;
end;
v17.Methods.SetEntityState = function(v89, v90) --[[ Line: 438 ]] --[[ Name: SetEntityState ]]
    v89:SetAttribute("EntityState", v90);
end;
v17.Methods.IsAlive = function(v91) --[[ Line: 442 ]] --[[ Name: IsAlive ]]
    return v91:GetAttribute("IsAlive") == true;
end;
v17.Methods.IsStunned = function(v92) --[[ Line: 446 ]] --[[ Name: IsStunned ]]
    return v92:GetAttribute("EntityState") == "Stunned";
end;
v17.Methods.PromiseAttackPosition = function(v93) --[[ Line: 450 ]] --[[ Name: PromiseAttackPosition ]]
    -- upvalues: v6 (copy)
    local v94 = v6.Custom(function() --[[ Line: 451 ]]
        -- upvalues: v93 (copy)
        return v93:GetAttribute("AttackPosition");
    end, 5);
    v93:AddPromise(v94);
    return v94;
end;
v17.Constructing = function(v95) --[[ Line: 463 ]] --[[ Name: Constructing ]]
    -- upvalues: v6 (copy)
    v95._visualModel = v95.Instance:WaitForChild("VisualModel");
    v95._visualModel:SetAttribute("AnimationId", "");
    v6.Custom(function() --[[ Line: 467 ]]
        -- upvalues: v95 (copy)
        return v95.Instance.PrimaryPart;
    end, 5):await();
    v95._primaryPart = v95.Instance.PrimaryPart;
    if v95._primaryPart then
        v95._height = v95._primaryPart.Size.Y;
    end;
    v95:_SetupAttack();
    v95:_SetupDeathAnimation();
end;
v17.Constructed = function(_) --[[ Line: 482 ]] --[[ Name: Constructed ]]

end;
v17.Started = function(v97) --[[ Line: 484 ]] --[[ Name: Started ]]
    -- upvalues: v8 (copy), v14 (copy)
    local l_v97_Scope_0 = v97:GetScope();
    local l_v97_Attribute_0 = v97:GetAttribute("Health");
    local v100 = l_v97_Scope_0:Value(if typeof(l_v97_Attribute_0) == "number" and l_v97_Attribute_0 == l_v97_Attribute_0 then l_v97_Attribute_0 else 0);
    local v101 = 1;
    local l_v97_Attribute_1 = v97:GetAttribute("MaxHealth");
    local v103 = l_v97_Scope_0:Value((math.max(v101, if typeof(l_v97_Attribute_1) == "number" and l_v97_Attribute_1 == l_v97_Attribute_1 then l_v97_Attribute_1 else 1)));
    local v104 = l_v97_Scope_0:Value(v97:GetAttribute("IsAlive") == true);
    v97:ObserveAttribute("Health", function(v105) --[[ Line: 494 ]]
        -- upvalues: v100 (copy)
        v100:set((math.max(0, if typeof(v105) == "number" and v105 == v105 then v105 else 0)));
    end);
    v97:ObserveAttribute("MaxHealth", function(v106) --[[ Line: 497 ]]
        -- upvalues: v103 (copy)
        v103:set((math.max(1, if typeof(v106) == "number" and v106 == v106 then v106 else 1)));
    end);
    v97:ObserveAttribute("IsAlive", function(v107) --[[ Line: 500 ]]
        -- upvalues: v104 (copy)
        v104:set(v107 == true);
    end);
    l_v97_Attribute_0 = v97.Instance.PrimaryPart:WaitForChild("HealthAttachment", 10);
    l_v97_Scope_0:New("BillboardGui")({
        Name = "Healthbar", 
        Size = UDim2.fromScale(5, 0.6), 
        ResetOnSpawn = false, 
        Adornee = l_v97_Attribute_0, 
        Parent = l_v97_Attribute_0, 
        Enabled = l_v97_Scope_0:Computed(function(v108) --[[ Line: 513 ]]
            -- upvalues: v104 (copy)
            return v108(v104) == true;
        end), 
        [v8.Children] = {
            l_v97_Scope_0:New("Frame")({
                Name = "Bar", 
                Size = UDim2.fromScale(1, 1), 
                BackgroundColor3 = Color3.fromRGB(34, 34, 34), 
                [v8.Children] = {
                    l_v97_Scope_0:New("UICorner")({
                        CornerRadius = UDim.new(1, 0)
                    }), 
                    l_v97_Scope_0:New("UIPadding")({
                        PaddingBottom = UDim.new(0.1, 0), 
                        PaddingLeft = UDim.new(0.02, 0), 
                        PaddingRight = UDim.new(0.02, 0), 
                        PaddingTop = UDim.new(0.1, 0)
                    }), 
                    l_v97_Scope_0:New("Frame")({
                        Name = "Fill", 
                        BackgroundColor3 = Color3.new(1, 1, 1), 
                        Size = l_v97_Scope_0:Computed(function(v109) --[[ Line: 539 ]]
                            -- upvalues: v100 (copy), v103 (copy)
                            return UDim2.fromScale(math.clamp(v109(v100) / v109(v103), 0, 1), 1);
                        end), 
                        [v8.Children] = {
                            l_v97_Scope_0:New("UICorner")({
                                CornerRadius = UDim.new(1, 0)
                            }), 
                            l_v97_Scope_0:New("UIGradient")({
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
    v97:_SetupDebugging();
    v97:ObserveAttribute("EntityState", function(v110) --[[ Line: 568 ]]
        -- upvalues: v97 (copy)
        if v110 == "Pursuing" or v110 == "Walking" then
            v97:_PlayEntityAnimation("Walk", {
                Speed = v97:GetAttribute("WalkAnimSpeed") or 1
            });
            return;
        elseif v110 == "Stunned" then
            v97:_PlayEntityAnimation("Stunned");
            return;
        else
            if v110 == "Idling" then
                v97:_PlayEntityAnimation("Idle");
            end;
            return;
        end;
    end);
    if v97:GetAttribute("IsBoss") == true then
        v97:ObserveAttribute("Activated", function(v111) --[[ Line: 582 ]]
            -- upvalues: v14 (ref), v97 (copy)
            if not v111 then
                return;
            else
                local l_BossHealthBar_0 = v14:GetModuleAsync("GameUI_TowerOfKarate"):expect():CreateBossHealthBar(v97.Instance);
                l_BossHealthBar_0.Inner.BossName.Text = v97.Instance.Name;
                local function v117() --[[ Line: 593 ]] --[[ Name: updateBossBar ]]
                    -- upvalues: v97 (ref), l_BossHealthBar_0 (copy)
                    local l_v97_Attribute_2 = v97:GetAttribute("Health");
                    local v114 = if typeof(l_v97_Attribute_2) == "number" and l_v97_Attribute_2 == l_v97_Attribute_2 then l_v97_Attribute_2 else 0;
                    local v115 = 1;
                    local l_v97_Attribute_3 = v97:GetAttribute("MaxHealth");
                    l_v97_Attribute_2 = math.max(v115, if typeof(l_v97_Attribute_3) == "number" and l_v97_Attribute_3 == l_v97_Attribute_3 then l_v97_Attribute_3 else 1);
                    l_BossHealthBar_0.Inner.ArmorFill.Size = UDim2.fromScale(math.clamp(v114 / l_v97_Attribute_2, 0, 1), 1);
                    l_BossHealthBar_0.Inner.Amount.Text = string.format("%d/%d", v114, l_v97_Attribute_2);
                end;
                v117();
                v97:ObserveAttribute("Health", function() --[[ Line: 602 ]]
                    -- upvalues: v117 (copy)
                    v117();
                end);
                v97:ObserveAttribute("MaxHealth", function() --[[ Line: 605 ]]
                    -- upvalues: v117 (copy)
                    v117();
                end);
                v97:AddTask(l_BossHealthBar_0);
                return;
            end;
        end);
    end;
end;
v17.Stopped = function(_) --[[ Line: 614 ]] --[[ Name: Stopped ]]

end;
return v17;