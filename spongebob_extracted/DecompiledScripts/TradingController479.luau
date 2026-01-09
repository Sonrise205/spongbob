local l_Players_0 = game:GetService("Players");
local l_ReplicatedFirst_0 = game:GetService("ReplicatedFirst");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_RunService_0 = game:GetService("RunService");
local l_TweenService_0 = game:GetService("TweenService");
local l_UserInputService_0 = game:GetService("UserInputService");
local v6 = require(l_ReplicatedStorage_0.Packages.Knit);
local v7 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v8 = require(l_ReplicatedStorage_0.Packages.Input);
local l_PreferredInput_0 = v8.PreferredInput;
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v11 = require(l_ReplicatedFirst_0.PlaceIds);
local v12 = require(l_ReplicatedStorage_0.Shared.Modules.Timer);
local v13 = nil;
local v14 = nil;
local v15 = nil;
local v16 = v8.Mouse.new();
local v17 = Vector2.new(40, 0);
local v18 = v6.CreateController({
    Name = script.Name, 
    _characters = {}
});
local v19 = nil;
local v20 = nil;
local v21 = nil;
v18.KnitInit = function(_) --[[ Line: 44 ]] --[[ Name: KnitInit ]]
    -- upvalues: v13 (ref), v6 (copy), v14 (ref)
    v13 = v6.GetController("DataController");
    v14 = v6.GetController("UIController");
end;
v18.KnitStart = function(v23) --[[ Line: 49 ]] --[[ Name: KnitStart ]]
    -- upvalues: v11 (copy), v21 (ref), v6 (copy), v15 (ref), v14 (ref), v7 (copy), l_Players_0 (copy), v12 (copy), v16 (copy), v19 (ref), l_UserInputService_0 (copy), v20 (ref)
    if not v11:IsTrading() then
        return;
    else
        v21 = Instance.new("Highlight");
        v21.FillTransparency = 0.5;
        v21.FillColor = Color3.new(0, 0, 0);
        v21.OutlineTransparency = 1;
        v21.OutlineColor = Color3.new(1, 1, 1);
        v21.DepthMode = Enum.HighlightDepthMode.Occluded;
        v21.Parent = v6.PlayerGui;
        v15 = v14:GetModuleAsync("TradeRequest"):expect();
        local v24 = RaycastParams.new();
        v24.FilterType = Enum.RaycastFilterType.Include;
        v24.FilterDescendantsInstances = v23._characters;
        local function v33(v25) --[[ Line: 69 ]] --[[ Name: playerAdded ]]
            -- upvalues: v6 (ref), v7 (ref), v23 (copy), v24 (copy)
            if v25 == v6.Player then
                return;
            else
                local v26 = v7.new();
                v26:Add(function() --[[ Line: 76 ]]
                    -- upvalues: v26 (ref)
                    v26 = nil;
                end);
                local function v31(v27) --[[ Line: 80 ]] --[[ Name: characterAdded ]]
                    -- upvalues: v26 (ref), v23 (ref), v24 (ref)
                    local v28 = v26:Extend();
                    v28:Add(function() --[[ Line: 83 ]]
                        -- upvalues: v23 (ref), v27 (copy), v24 (ref), v28 (ref)
                        local v29 = table.find(v23._characters, v27);
                        if v29 then
                            table.remove(v23._characters, v29);
                            v24.FilterDescendantsInstances = v23._characters;
                        end;
                        v28 = nil;
                    end);
                    table.insert(v23._characters, v27);
                    v24.FilterDescendantsInstances = v23._characters;
                    if v27:IsDescendantOf(workspace) then
                        v28:AttachTo(v27);
                        return;
                    else
                        local v30 = v27.AncestryChanged:Connect(function() --[[ Line: 102 ]]
                            -- upvalues: v27 (copy), v28 (ref)
                            if v27:IsDescendantOf(workspace) then
                                v28:Remove("AncestryListener");
                                v28:AttachTo(v27);
                            end;
                        end);
                        v28:Add(v30, "AncestryListener");
                        return;
                    end;
                end;
                if v25.Character then
                    v31(v25.Character);
                end;
                local l_CharacterAdded_0 = v25.CharacterAdded;
                v26:Add(l_CharacterAdded_0:Connect(v31));
                v26:AttachTo(v25);
                return;
            end;
        end;
        for _, v35 in l_Players_0:GetPlayers() do
            task.spawn(v33, v35);
        end;
        l_Players_0.PlayerAdded:Connect(v33);
        local v36 = 0;
        local v37 = 0;
        local function _() --[[ Line: 129 ]] --[[ Name: resetClicks ]]
            -- upvalues: v37 (ref)
            v37 = 0;
        end;
        v12.Simple(0.2, function() --[[ Line: 133 ]]
            -- upvalues: v14 (ref), v23 (copy), v16 (ref), v24 (copy), v19 (ref), v37 (ref)
            if v14:IsPrimaryMenuOpen() then
                v23:SetHoverTarget();
                return;
            else
                local v39 = v16:Raycast(v24, 200);
                if not v39 or not v39.Instance then
                    v23:SetHoverTarget();
                    return;
                else
                    local l_FirstAncestorOfClass_0 = v39.Instance:FindFirstAncestorOfClass("Model");
                    if v19 == l_FirstAncestorOfClass_0 then
                        return;
                    else
                        v37 = 0;
                        v23:SetHoverTarget(l_FirstAncestorOfClass_0);
                        return;
                    end;
                end;
            end;
        end);
        local v41 = {
            Enum.UserInputType.MouseButton1, 
            Enum.KeyCode.ButtonR2, 
            Enum.UserInputType.Touch
        };
        l_UserInputService_0.InputBegan:Connect(function(v42, v43) --[[ Line: 162 ]]
            -- upvalues: v20 (ref), v19 (ref), v41 (copy), v36 (ref), v37 (ref), v15 (ref)
            if v43 then
                return;
            elseif not v20 or not v19 then
                return;
            else
                local v44 = table.find(v41, v42.UserInputType);
                local v45 = table.find(v41, v42.KeyCode);
                if not v44 and not v45 then
                    return;
                else
                    local v46 = os.clock();
                    if v46 - v36 >= 1 then
                        v37 = 1;
                    else
                        v37 = v37 + 1;
                    end;
                    v36 = v46;
                    if v37 < 2 then
                        return;
                    else
                        v37 = 0;
                        v15:Send(v20);
                        return;
                    end;
                end;
            end;
        end);
        return;
    end;
end;
v18.SetHoverTarget = function(v47, v48) --[[ Line: 198 ]] --[[ Name: SetHoverTarget ]]
    -- upvalues: v19 (ref), v20 (ref), l_Players_0 (copy), v21 (ref), v7 (copy), l_ReplicatedStorage_0 (copy), v6 (copy), l_PreferredInput_0 (copy), v17 (copy), l_RunService_0 (copy), l_UserInputService_0 (copy), l_TweenService_0 (copy)
    if v19 == v48 then
        return;
    else
        if v47.hoverDump then
            v47.hoverDump:Destroy();
        end;
        v19 = v48;
        v20 = v48 and l_Players_0:GetPlayerFromCharacter(v48) or nil;
        v21.FillTransparency = 1;
        v21.OutlineTransparency = 1;
        v21.Adornee = v48;
        if not v48 then
            return;
        else
            v47.hoverDump = v7.new();
            local v49 = l_ReplicatedStorage_0.GUI.Objects.TradingPlayerTooltip:Clone();
            v49.Enabled = true;
            v49.Parent = v6.PlayerGui;
            local l_ViewportSize_0 = workspace.CurrentCamera.ViewportSize;
            local l_zero_0 = Vector2.zero;
            local function _() --[[ Line: 228 ]] --[[ Name: updatePositionInfo ]]
                -- upvalues: l_zero_0 (ref), l_PreferredInput_0 (ref), v17 (ref), l_ViewportSize_0 (ref)
                l_zero_0 = if l_PreferredInput_0.Current == "Touch" then v17 else Vector2.zero;
                l_ViewportSize_0 = workspace.CurrentCamera.ViewportSize;
            end;
            v47.hoverDump:Connect(l_RunService_0.RenderStepped, function() --[[ Line: 233 ]]
                -- upvalues: v49 (copy), l_UserInputService_0 (ref), l_ViewportSize_0 (ref), l_zero_0 (ref)
                local l_AbsoluteSize_0 = v49.Main.AbsoluteSize;
                local l_l_UserInputService_0_MouseLocation_0 = l_UserInputService_0:GetMouseLocation();
                local v55 = math.clamp(if l_l_UserInputService_0_MouseLocation_0.X > l_ViewportSize_0.X / 2 then l_l_UserInputService_0_MouseLocation_0.X - l_AbsoluteSize_0.X - l_zero_0.X else l_l_UserInputService_0_MouseLocation_0.X + l_zero_0.X, 0, l_ViewportSize_0.X - l_AbsoluteSize_0.X);
                local v56 = math.clamp(l_l_UserInputService_0_MouseLocation_0.Y + l_zero_0.Y, 0, l_ViewportSize_0.Y - l_AbsoluteSize_0.Y);
                v49.Main.Position = UDim2.fromOffset(v55, v56);
            end);
            v47.hoverDump:Add(v49);
            v47.hoverDump:Add(function() --[[ Line: 260 ]]
                if highlightTween then
                    highlightTween:Cancel();
                end;
            end);
            highlightTween = l_TweenService_0:Create(v21, TweenInfo.new(0.5), {
                OutlineTransparency = 0, 
                FillTransparency = 0.5
            });
            highlightTween.Completed:Once(function() --[[ Line: 271 ]]
                highlightTween:Destroy();
                highlightTween = nil;
            end);
            highlightTween:Play();
            return;
        end;
    end;
end;
return v18;