local l_Players_0 = game:GetService("Players");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_RunService_0 = game:GetService("RunService");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_ReplicatedFirst_0 = game:GetService("ReplicatedFirst");
local _ = game:GetService("UserInputService");
local v6 = require(l_ReplicatedFirst_0.PlaceIds);
local v7 = require(l_ReplicatedStorage_0.Packages.Knit);
local _ = require(l_ReplicatedStorage_0.Packages.WaitFor);
local v9 = require(l_ReplicatedStorage_0.Platformer.Constants);
local v10 = require(script.Parent.Controller);
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_PlayerGui_0 = l_LocalPlayer_0:WaitForChild("PlayerGui");
local v13 = nil;
local v14 = false;
local function v15(v16) --[[ Line: 32 ]] --[[ Name: onCharacterAdded ]]
    -- upvalues: v10 (copy), v13 (ref), v15 (copy)
    local v17 = v10.new(v16);
    if not v17 then
        return;
    else
        v17.humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping, false);
        local v18 = nil;
        v18 = v16.AncestryChanged:Connect(function() --[[ Line: 43 ]]
            -- upvalues: v16 (copy), v18 (ref), v17 (copy), v13 (ref)
            if not v16:IsDescendantOf(game) then
                v18:Disconnect();
                v17:destroy();
                if v13 == v17 then
                    v13 = nil;
                end;
            end;
        end);
        local v19 = nil;
        v19 = v16.ChildAdded:Connect(function(v20) --[[ Line: 54 ]]
            -- upvalues: v19 (ref), v17 (copy), v13 (ref), v16 (copy), v15 (ref)
            if not v20:IsA("Humanoid") then
                return;
            else
                v19:Disconnect();
                v17:destroy();
                if v13 == v17 then
                    v13 = nil;
                end;
                if not v16 or not v16.Parent then
                    return;
                else
                    v15(v16);
                    return;
                end;
            end;
        end);
        v13 = v17;
        return;
    end;
end;
local function v24(v21) --[[ Line: 75 ]] --[[ Name: onRenderStep ]]
    -- upvalues: v13 (ref), v14 (ref)
    if not v13 then
        return;
    else
        local v22 = Vector3.new(0, 0, 0, 0);
        if v13.humanoid.WalkSpeed ~= 0 then
            v22 = v13.humanoid:GetMoveVelocity() / v13.humanoid.WalkSpeed;
        end;
        local l_Jump_0 = v13.humanoid.Jump;
        if v13:isGrounded() and v14 then
            v13:toggleSprint(true);
            v14 = false;
        end;
        v13:setInputDirection(v22);
        v13:update(v21);
        if l_Jump_0 and not v13.character:HasTag("Dizzy") then
            v13:performAction("BaseJump");
        end;
        return;
    end;
end;
local function v29(_, v26, _) --[[ Line: 104 ]] --[[ Name: onSpecialActionInput ]]
    -- upvalues: v13 (ref), l_LocalPlayer_0 (copy), v14 (ref)
    if v26 ~= Enum.UserInputState.Begin and v26 ~= Enum.UserInputState.End then
        return;
    elseif not v13 then
        return;
    elseif v13:isSwimming() or v13:isClimbing() then
        return;
    elseif l_LocalPlayer_0:GetAttribute("DISABLE_SPRINT") or v13.humanoid.PlatformStand then
        return;
    elseif not v13:isGrounded() and v26 == Enum.UserInputState.Begin then
        v13:performAction("Dash");
        v14 = true;
        return;
    else
        if v26 == Enum.UserInputState.End then
            v14 = false;
        end;
        local v28 = v26 == Enum.UserInputState.Begin;
        v13:toggleSprint(v28);
        return;
    end;
end;
local function v60() --[[ Line: 135 ]] --[[ Name: initialize ]]
    -- upvalues: v7 (copy), l_RunService_0 (copy), v9 (copy), v24 (copy), l_ContextActionService_0 (copy), v29 (copy), v6 (copy), l_LocalPlayer_0 (copy), l_PlayerGui_0 (copy), v15 (copy)
    local _ = v7.GetService("GameService");
    local v31 = v7.GetService("SessionService");
    l_RunService_0:BindToRenderStep(v9.CONTROLLER_RENDER_STEP_BIND, Enum.RenderPriority.Last.Value, v24);
    l_ContextActionService_0:BindAction(v9.SPECIAL_ACTION_BIND, v29, false, v9.KEYBOARD_SPECIAL_KEY_CODE, v9.GAMEPAD_SPECIAL_KEY_CODE);
    local v32 = script.MobileButtons:Clone();
    local l_Main_0 = v32.Main;
    local v34 = v6:IsGame();
    local v35 = v6:IsKarateLobby();
    if v34 or v35 then
        if v34 then
            local v36 = v31:PromiseGetMatchSettings():expect();
            if v36 ~= nil and v36.Mode == "TowerOfKarate" then
                l_Main_0 = v32.Main_TOK;
            end;
        else
            l_Main_0 = v32.Main_TOK;
            l_Main_0.MouseLock.Visible = false;
        end;
        if l_Main_0:FindFirstChild("MouseLock") ~= nil then
            l_Main_0.MouseLock.Active = true;
            l_Main_0.MouseLock.Activated:Connect(function() --[[ Line: 171 ]]
                -- upvalues: l_LocalPlayer_0 (ref)
                local v37 = l_LocalPlayer_0:GetAttribute("MouseLockState") or false;
                l_LocalPlayer_0:SetAttribute("MouseLockState", not v37);
            end);
        end;
    end;
    l_Main_0.Visible = true;
    local l_Sprint_0 = l_Main_0.Sprint;
    local _ = l_Main_0.Mount;
    v32.Enabled = false;
    v32.Parent = l_PlayerGui_0;
    local v40 = nil;
    local v41 = nil;
    local v42 = {};
    local function v45() --[[ Line: 189 ]] --[[ Name: updateVisibility ]]
        -- upvalues: v40 (ref), v32 (copy), l_LocalPlayer_0 (ref), v41 (ref)
        if not v40 then
            v32.Enabled = false;
            return;
        else
            if l_LocalPlayer_0:GetAttribute("DISABLE_SPRINT") then
                v32.Enabled = false;
            end;
            local l_v32_0 = v32;
            local v44 = false;
            if v41 ~= nil then
                v44 = v41.Visible;
            end;
            l_v32_0.Enabled = v44;
            return;
        end;
    end;
    l_LocalPlayer_0:GetAttributeChangedSignal("DISABLE_SPRINT"):Connect(v45);
    local function v46() --[[ Line: 205 ]] --[[ Name: updateMobileButtons ]]
        -- upvalues: v41 (ref), l_Main_0 (ref)
        if not v41 then
            return;
        else
            l_Main_0.Position = v41.Position;
            l_Main_0.Size = v41.Size;
            return;
        end;
    end;
    l_Sprint_0.InputBegan:Connect(function(v47) --[[ Line: 214 ]]
        -- upvalues: v29 (ref), v9 (ref)
        if v47.UserInputType == Enum.UserInputType.Touch then
            v29(v9.SPECIAL_ACTION_BIND, Enum.UserInputState.Begin, v47);
        end;
    end);
    l_Sprint_0.InputEnded:Connect(function(v48) --[[ Line: 220 ]]
        -- upvalues: v29 (ref), v9 (ref)
        if v48.UserInputType == Enum.UserInputType.Touch then
            v29(v9.SPECIAL_ACTION_BIND, Enum.UserInputState.End, v48);
        end;
    end);
    local function _() --[[ Line: 226 ]] --[[ Name: hookJumpButton ]]
        -- upvalues: v41 (ref), l_Main_0 (ref), v42 (copy), v46 (copy)
        if v41 then
            l_Main_0.Position = v41.Position;
            l_Main_0.Size = v41.Size;
        end;
        table.insert(v42, v41:GetPropertyChangedSignal("Size"):Connect(v46));
        table.insert(v42, v41:GetPropertyChangedSignal("Position"):Connect(v46));
    end;
    local function v55() --[[ Line: 232 ]] --[[ Name: handleTouchGui ]]
        -- upvalues: v40 (ref), v45 (copy), v41 (ref), l_Main_0 (ref), v42 (copy), v46 (copy), v32 (copy), l_LocalPlayer_0 (ref)
        v40:GetPropertyChangedSignal("Enabled"):Connect(v45);
        v41 = v40:WaitForChild("TouchControlFrame"):FindFirstChild("JumpButton");
        if not v41 then
            v40.DescendantAdded:Connect(function(v50) --[[ Line: 239 ]]
                -- upvalues: v41 (ref), l_Main_0 (ref), v42 (ref), v46 (ref), v40 (ref), v32 (ref), l_LocalPlayer_0 (ref), v45 (ref)
                if v50.Name == "JumpButton" then
                    v41 = v50;
                    if v41 then
                        l_Main_0.Position = v41.Position;
                        l_Main_0.Size = v41.Size;
                    end;
                    table.insert(v42, v41:GetPropertyChangedSignal("Size"):Connect(v46));
                    table.insert(v42, v41:GetPropertyChangedSignal("Position"):Connect(v46));
                    if not v40 then
                        v32.Enabled = false;
                    else
                        if l_LocalPlayer_0:GetAttribute("DISABLE_SPRINT") then
                            v32.Enabled = false;
                        end;
                        local l_v32_1 = v32;
                        local v52 = false;
                        if v41 ~= nil then
                            v52 = v41.Visible;
                        end;
                        l_v32_1.Enabled = v52;
                    end;
                    v50:GetPropertyChangedSignal("Visible"):Connect(v45);
                end;
            end);
            return;
        else
            if v41 then
                l_Main_0.Position = v41.Position;
                l_Main_0.Size = v41.Size;
            end;
            table.insert(v42, v41:GetPropertyChangedSignal("Size"):Connect(v46));
            table.insert(v42, v41:GetPropertyChangedSignal("Position"):Connect(v46));
            if not v40 then
                v32.Enabled = false;
                return;
            else
                if l_LocalPlayer_0:GetAttribute("DISABLE_SPRINT") then
                    v32.Enabled = false;
                end;
                local l_v32_2 = v32;
                local v54 = false;
                if v41 ~= nil then
                    v54 = v41.Visible;
                end;
                l_v32_2.Enabled = v54;
                return;
            end;
        end;
    end;
    v40 = l_PlayerGui_0:FindFirstChild("TouchGui");
    if v40 then
        v55();
    else
        l_PlayerGui_0.ChildAdded:Connect(function(v56) --[[ Line: 259 ]]
            -- upvalues: v40 (ref), v55 (copy)
            if v56.Name == "TouchGui" then
                v40 = v56;
                v55();
            end;
        end);
    end;
    l_PlayerGui_0.ChildRemoved:Connect(function(v57) --[[ Line: 267 ]]
        -- upvalues: v40 (ref), v41 (ref), v32 (copy), l_LocalPlayer_0 (ref)
        if v57.Name == "TouchGui" then
            v40 = nil;
            v41 = nil;
            if not v40 then
                v32.Enabled = false;
                return;
            else
                if l_LocalPlayer_0:GetAttribute("DISABLE_SPRINT") then
                    v32.Enabled = false;
                end;
                local l_v32_3 = v32;
                local v59 = false;
                if v41 ~= nil then
                    v59 = v41.Visible;
                end;
                l_v32_3.Enabled = v59;
            end;
        end;
    end);
    l_LocalPlayer_0.CharacterAdded:Connect(v15);
    if l_LocalPlayer_0.Character then
        v15(l_LocalPlayer_0.Character);
    end;
end;
v7.OnStart():await();
v60();