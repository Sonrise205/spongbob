local l_ReplicatedFirst_0 = game:GetService("ReplicatedFirst");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_RunService_0 = game:GetService("RunService");
local l_TweenService_0 = game:GetService("TweenService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_GamepadService_0 = game:GetService("GamepadService");
local v6 = require(l_ReplicatedStorage_0.Packages.Knit);
local v7 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local _ = require(l_ReplicatedStorage_0.Packages.TableUtil);
local _ = require(l_ReplicatedStorage_0.Packages.Promise);
local v10 = require(l_ReplicatedStorage_0.Packages.Signal);
local _ = require(l_ReplicatedStorage_0.Shared.Data.Icons);
local v12 = require(l_ReplicatedStorage_0.Shared.Modules.Tweener);
local v13 = require(l_ReplicatedStorage_0.Shared.Data.UnitShared);
local v14 = require(l_ReplicatedStorage_0.Shared.Data.PetShared);
local v15 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local v16 = require(l_ReplicatedStorage_0.Shared.Data.InventoryAtlas);
local v17 = require(l_ReplicatedStorage_0.Shared.Modules.RarityVisuals);
local v18 = require(l_ReplicatedFirst_0.PlaceIds);
local v19 = nil;
local v20 = nil;
local v21 = nil;
local v22 = nil;
local v23 = nil;
local v24 = CFrame.new(0, 1000000000, 0);
local v25 = l_ReplicatedStorage_0.VFX.Rewards.TestReward_VFX:Clone();
v25.CFrame = v24;
v25.Parent = workspace;
return {
    primaryMenu = true, 
    ignoreClosePrimaryMenus = true, 
    _queue = {}, 
    _canContinue = true, 
    Finished = v10.new(), 
    ToggleProperties = {
        Main = {
            Open = {
                Position = UDim2.fromScale(0, 0)
            }, 
            Close = {
                Position = UDim2.fromScale(0, 0)
            }
        }
    }, 
    Init = function(v26, v27, v28) --[[ Line: 69 ]] --[[ Name: Init ]]
        -- upvalues: v19 (ref), v6 (copy), v20 (ref), v21 (ref), v22 (ref), v23 (ref), l_TweenService_0 (copy)
        v19 = v6.GetController("UIController");
        v20 = v6.GetService("UnitService");
        v21 = v6.GetService("RewardService");
        v22 = v6.GetController("CharacterController");
        v23 = v6.GetController("DeviceTypeController");
        v26.currentMode = v28;
        v26.ui = v27;
        v26.main = v27.Main;
        v26.top = v26.main.Top;
        v26.continueBtn = v26.main.Continue;
        v26.rewardIcon = v26.main.RewardIcon;
        v26.rewardName = v26.top.RewardName;
        v26.rewardRarity = v26.top.RewardRarity;
        v26.rewardAmount = v26.main.Amount;
        local v29 = TweenInfo.new(0.125, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut);
        local v30 = TweenInfo.new(0.7142857142857143, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out);
        local v31 = TweenInfo.new(0.625, Enum.EasingStyle.Back, Enum.EasingDirection.In);
        v26.outInfo = v31;
        v26.elasticInfo = v30;
        v26.originalIconPosition = v26.rewardIcon.Position;
        v26.topTweens = {
            l_TweenService_0:Create(v26.top.Left, v29, {
                Size = UDim2.fromScale(0.5, 1)
            }), 
            l_TweenService_0:Create(v26.top.Right, v29, {
                Size = UDim2.fromScale(0.5, 1)
            })
        };
        v26.iconTween = l_TweenService_0:Create(v26.rewardIcon, v30, {
            Size = v26.rewardIcon.Size
        });
        v26.iconTweenOut = l_TweenService_0:Create(v26.rewardIcon, v31, {
            Position = UDim2.fromScale(0.5, 2)
        });
        v26:Reset();
        v21.RewardsEarned:Connect(function(v32) --[[ Line: 116 ]]
            -- upvalues: v26 (copy)
            v26:QueueRewards(v32);
        end);
    end, 
    Start = function(v33) --[[ Line: 122 ]] --[[ Name: Start ]]
        -- upvalues: v19 (ref)
        v33.iconTween.Completed:Connect(function() --[[ Line: 123 ]]
            -- upvalues: v33 (copy)
            v33._canContinue = true;
        end);
        v33.iconTweenOut.Completed:Connect(function() --[[ Line: 127 ]]
            -- upvalues: v33 (copy), v19 (ref)
            if #v33._queue < 1 then
                v19:Toggle(script.Name, false);
                v33:Reset();
                v33.Finished:Fire();
                return;
            else
                v33:Reset();
                return;
            end;
        end);
    end, 
    Opened = function(v34) --[[ Line: 140 ]] --[[ Name: Opened ]]
        -- upvalues: v22 (ref), v23 (ref), l_GamepadService_0 (copy), v7 (copy), l_UserInputService_0 (copy)
        v22:ToggleHideAll(true);
        pcall(function() --[[ Line: 144 ]]
            -- upvalues: v23 (ref), l_GamepadService_0 (ref)
            if v23:IsConsole() then
                l_GamepadService_0:EnableGamepadCursor(nil);
            end;
        end);
        v34._inputDump = v7.new();
        v34._inputDump:Add(l_UserInputService_0.InputBegan:Connect(function(v35) --[[ Line: 152 ]]
            -- upvalues: v34 (copy)
            if v35.UserInputType == Enum.UserInputType.MouseButton1 or v35.UserInputType == Enum.UserInputType.Touch then
                v34:_attemptContinue();
            end;
        end));
        v34._inputDump:Add(v23.GamepadButtonPressed:Connect(function() --[[ Line: 158 ]]
            -- upvalues: v34 (copy)
            v34:_attemptContinue();
        end));
        v34._inputDump:Add(function() --[[ Line: 162 ]]
            -- upvalues: v34 (copy)
            v34._inputDump = nil;
        end);
    end, 
    Closed = function(v36) --[[ Line: 167 ]] --[[ Name: Closed ]]
        -- upvalues: v22 (ref), v23 (ref), l_RunService_0 (copy), v19 (ref)
        if v36._dump then
            v36._dump:Destroy();
        end;
        if v36._inputDump then
            v36._inputDump:Destroy();
        end;
        v36.rewardRarity.Visible = true;
        if not v36._fromTreasureOpenAll then
            v22:ToggleHideAll(false);
            v23:TogglePlayerControls(true);
        end;
        l_RunService_0.RenderStepped:Wait();
        l_RunService_0.RenderStepped:Wait();
        if not v36._fromTreasureOpenAll and v36._allToggled then
            v19:RevertFromToggleAll(v36._allToggled);
            table.clear(v36._allToggled);
            v36._allToggled = nil;
        end;
        if v36._finishedCallback then
            task.spawn(function() --[[ Line: 196 ]]
                -- upvalues: v36 (copy)
                v36._finishedCallback();
            end);
            v36._finishedCallback = nil;
        end;
        v36:Reset();
        if not v36._fromTreasureOpenAll then
            workspace.CurrentCamera.CameraType = Enum.CameraType.Custom;
        end;
    end, 
    CanOpen = function(_) --[[ Line: 210 ]] --[[ Name: CanOpen ]]
        -- upvalues: v18 (copy)
        return v18:IsHUB();
    end, 
    Reset = function(v38) --[[ Line: 215 ]] --[[ Name: Reset ]]
        if v38._dump then
            v38._dump:Destroy();
        end;
        v38.rewardIcon.Position = v38.originalIconPosition;
        v38.rewardIcon.Size = UDim2.fromScale(0, 0);
        v38.top.Left.Size = UDim2.fromScale(0, 1);
        v38.top.Right.Size = UDim2.fromScale(0, 1);
    end, 
    ShowReward = function(v39, v40) --[[ Line: 227 ]] --[[ Name: ShowReward ]]
        -- upvalues: l_RunService_0 (copy), v13 (copy), v14 (copy), v16 (copy), v7 (copy), v17 (copy), v15 (copy), l_ReplicatedStorage_0 (copy), v19 (ref), v12 (copy), v25 (copy), v24 (copy)
        if v39._dump then
            v39._dump:Destroy();
        end;
        if v40 then
            v39._finishedCallback = v40;
        end;
        v39._canContinue = false;
        l_RunService_0.RenderStepped:Wait();
        l_RunService_0.RenderStepped:Wait();
        l_RunService_0.RenderStepped:Wait();
        local v41 = v39._queue[1];
        local v42 = true;
        local _ = v41.name;
        local v44 = v41.amount or 1;
        local v45 = false;
        local l_name_1 = v41.name;
        local v47 = nil;
        if v41.type == "Unit" then
            l_name_1 = v13:GetUnitValue(v41.name, "FullName") or v41.name;
            v47 = select(2, v13:GetRarity(v41.name));
        elseif v41.type == "Pet" then
            l_name_1 = v14:GetPetValue(v41.name, "FullName") or v41.name;
            v47 = select(2, v14:GetRarity(v41.name));
        else
            local l_v16_ByItemName_0 = v16:GetByItemName(v41.name);
            if l_v16_ByItemName_0 then
                l_name_1 = l_v16_ByItemName_0.displayName or l_v16_ByItemName_0.DisplayName or v41.name;
                v47 = l_v16_ByItemName_0.rarity or l_v16_ByItemName_0.Rarity;
                v45 = l_v16_ByItemName_0.isMount or false;
            end;
        end;
        v42 = not v45;
        v39.rewardAmount.Text = ("x%*"):format(v44);
        v39.rewardName.Text = l_name_1;
        v39.rewardRarity.Text = v47;
        table.remove(v39._queue, 1);
        v39._dump = v7.new();
        if v47 then
            v39._dump:Add(v17.new(v39.rewardRarity, v47));
        end;
        for _, v50 in v39.topTweens do
            v50:Play();
        end;
        if v42 then
            v39.rewardIcon.Image = v15:GetIconFromRewardData(v41) or "";
            v39.iconTween:Play();
        end;
        workspace.CurrentCamera.CameraType = Enum.CameraType.Scriptable;
        local l_CFrame_0 = workspace.CurrentCamera.CFrame;
        local l_LookVector_0 = l_CFrame_0.LookVector;
        local v53 = nil;
        local v54 = nil;
        if v45 then
            v53 = l_ReplicatedStorage_0.Models.Mounts:FindFirstChild(v41.name);
            v53 = v53 and v53:Clone();
            if not v53 then
                v19:Toggle(script.Name, false);
                return;
            else
                for _, v56 in v53:GetDescendants() do
                    if v56:IsA("BasePart") then
                        v56.Anchored = true;
                        v56.CanCollide = false;
                    end;
                end;
                v53:ScaleTo(v53:GetScale() / 2);
                v54 = v53:GetScale();
                local l_v53_ExtentsSize_0 = v53:GetExtentsSize();
                local v58 = math.max(2.5, math.max(l_v53_ExtentsSize_0.X, l_v53_ExtentsSize_0.Y, l_v53_ExtentsSize_0.Z) * 0.8) + 3;
                local v59 = v53:GetAttribute("RewardScreenAngle") or CFrame.Angles(0, 0, 0);
                v53:PivotTo(l_CFrame_0 * CFrame.Angles(0, 3.141592653589793, 0) * v59 + l_LookVector_0 * v58 - Vector3.new(0, 0, 0, 0));
                v53:ScaleTo(0.001);
                v53.PrimaryPart.Anchored = true;
                v53.Parent = workspace;
                local function v66() --[[ Line: 340 ]] --[[ Name: tweenRotation ]]
                    -- upvalues: v53 (ref), v12 (ref)
                    local v60 = TweenInfo.new(1, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut);
                    local l_v53_Pivot_0 = v53:GetPivot();
                    local v62, _, _ = l_v53_Pivot_0:ToOrientation();
                    v12("NumberValue", v62, v60, {
                        Value = 360
                    }, function(v65) --[[ Line: 348 ]]
                        -- upvalues: v53 (ref), l_v53_Pivot_0 (copy)
                        v53:PivotTo(l_v53_Pivot_0 * CFrame.Angles(0, math.rad(-v65), 0));
                    end):Add(function() --[[ Line: 352 ]]

                    end);
                end;
                local v68 = v12("NumberValue", v53:GetScale(), v39.elasticInfo, {
                    Value = v54
                }, function(v67) --[[ Line: 364 ]]
                    -- upvalues: v53 (ref)
                    v53:ScaleTo(v67);
                end);
                v68:Add(function() --[[ Line: 368 ]]
                    -- upvalues: v66 (copy), v39 (copy)
                    v66();
                    v39._canContinue = true;
                end);
                v39._mountModel = v53;
                v39._dump:Add(function() --[[ Line: 375 ]]
                    -- upvalues: v39 (copy)
                    v39._mountModel = nil;
                end);
                v39._dump:Add(v53);
                if v68 then
                    v39._dump:Add(v68);
                end;
                v25.CFrame = l_CFrame_0 * CFrame.Angles(0, 3.141592653589793, 0) + l_LookVector_0 * v58 + l_LookVector_0 * 3 - Vector3.new(0, 1, 0, 0);
            end;
        elseif v41.type == "Pet" or v41.type == "Pets" then
            v53 = l_ReplicatedStorage_0.Models.Pets:FindFirstChild(v41.name);
            v53 = v53 and v53:Clone();
            if not v53 then
                v19:Toggle(script.Name, false);
                return;
            else
                for _, v70 in v53:GetDescendants() do
                    if v70:IsA("BasePart") then
                        v70.Anchored = true;
                        v70.CanCollide = false;
                    end;
                end;
                v54 = v53:GetScale();
                local l_v53_ExtentsSize_1 = v53:GetExtentsSize();
                local v72 = math.max(2.5, math.max(l_v53_ExtentsSize_1.X, l_v53_ExtentsSize_1.Y, l_v53_ExtentsSize_1.Z) * 0.8) + 3;
                local v73 = v53:GetAttribute("RewardScreenAngle") or CFrame.Angles(0, 0, 0);
                v53:PivotTo(l_CFrame_0 * CFrame.Angles(0, 3.141592653589793, 0) * v73 + l_LookVector_0 * v72 - Vector3.new(0, v53:GetExtentsSize().Y / 2, 0));
                v53:ScaleTo(0.001);
                v53.PrimaryPart.Anchored = true;
                v53.Parent = workspace;
                local function v80() --[[ Line: 423 ]] --[[ Name: tweenRotation ]]
                    -- upvalues: v53 (ref), v12 (ref)
                    local v74 = TweenInfo.new(1, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut);
                    local l_v53_Pivot_1 = v53:GetPivot();
                    local v76, _, _ = l_v53_Pivot_1:ToOrientation();
                    v12("NumberValue", v76, v74, {
                        Value = 360
                    }, function(v79) --[[ Line: 431 ]]
                        -- upvalues: v53 (ref), l_v53_Pivot_1 (copy)
                        v53:PivotTo(l_v53_Pivot_1 * CFrame.Angles(0, math.rad(-v79), 0));
                    end):Add(function() --[[ Line: 435 ]]

                    end);
                end;
                local v82 = v12("NumberValue", v53:GetScale(), v39.elasticInfo, {
                    Value = v54
                }, function(v81) --[[ Line: 447 ]]
                    -- upvalues: v53 (ref)
                    v53:ScaleTo(v81);
                end);
                v82:Add(function() --[[ Line: 451 ]]
                    -- upvalues: v80 (copy), v39 (copy)
                    v80();
                    v39._canContinue = true;
                end);
                v39._mountModel = v53;
                v39._dump:Add(function() --[[ Line: 458 ]]
                    -- upvalues: v39 (copy)
                    v39._mountModel = nil;
                end);
                v39._dump:Add(v53);
                if v82 then
                    v39._dump:Add(v82);
                end;
                local l_FirstChild_0 = l_ReplicatedStorage_0.Animations.Pets:FindFirstChild(v41.name);
                l_FirstChild_0 = l_FirstChild_0 and l_FirstChild_0:FindFirstChild("Idle");
                if l_FirstChild_0 then
                    local v84 = v53.AnimationController:LoadAnimation(l_FirstChild_0);
                    v84.Looped = true;
                    v84:Play();
                end;
                v25.CFrame = l_CFrame_0 * CFrame.Angles(0, 3.141592653589793, 0) + l_LookVector_0 * v72 + l_LookVector_0 * 3 - Vector3.new(0, 1, 0, 0);
            end;
        else
            v25.CFrame = l_CFrame_0 + l_LookVector_0 * 5 - Vector3.new(0, 1, 0, 0);
        end;
        v39._vfxPart = v25;
        v39._dump:Add(function() --[[ Line: 533 ]]
            -- upvalues: v25 (ref), v24 (ref), v39 (copy)
            v25.CFrame = v24;
            v39._vfxPart = nil;
        end);
        if not v39._allToggled then
            v39._allToggled = v19:ToggleAll({
                script.Name
            }, false);
        end;
        v19:Toggle(script.Name, true);
    end, 
    QueueRewards = function(v85, v86, v87, v88) --[[ Line: 545 ]] --[[ Name: QueueRewards ]]
        v85._queue = v86;
        v85._allToggled = v87;
        v85._fromTreasureOpenAll = v88 or false;
        if v87 then
            v85.rewardRarity.Visible = false;
        else
            v85.rewardRarity.Visible = true;
        end;
        if #v86 < 1 then
            v85._queue = {
                v86
            };
        end;
        v85:ShowReward();
    end, 
    _attemptContinue = function(v89) --[[ Line: 565 ]] --[[ Name: _attemptContinue ]]
        -- upvalues: l_TweenService_0 (copy), v12 (copy)
        if not v89._canContinue then
            return;
        else
            if v89._vfxPart then
                local v90 = l_TweenService_0:Create(v89._vfxPart, v89.outInfo, {
                    CFrame = v89._vfxPart.CFrame * CFrame.new(0, -10, 0)
                });
                do
                    local l_v90_0 = v90;
                    l_v90_0.Completed:Once(function() --[[ Line: 575 ]]
                        -- upvalues: l_v90_0 (ref)
                        l_v90_0:Destroy();
                        l_v90_0 = nil;
                    end);
                    l_v90_0:Play();
                end;
            end;
            if v89._unitModel then
                local l_Pivot_0 = v89._unitModel:GetPivot();
                v12("CFrameValue", l_Pivot_0, v89.outInfo, {
                    Value = l_Pivot_0 * CFrame.new(0, -10, 0)
                }, function(v93) --[[ Line: 588 ]]
                    -- upvalues: v89 (copy)
                    if not v89._unitModel then
                        return;
                    else
                        v89._unitModel:PivotTo(v93);
                        return;
                    end;
                end);
            end;
            if v89._mountModel then
                local l_Pivot_1 = v89._mountModel:GetPivot();
                v12("CFrameValue", l_Pivot_1, v89.outInfo, {
                    Value = l_Pivot_1 * CFrame.new(0, -10, 0)
                }, function(v95) --[[ Line: 602 ]]
                    -- upvalues: v89 (copy)
                    if not v89._mountModel then
                        return;
                    else
                        v89._mountModel:PivotTo(v95);
                        return;
                    end;
                end);
            end;
            v89.iconTweenOut:Play();
            return;
        end;
    end
};