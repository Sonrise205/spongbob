local l_ReplicatedFirst_0 = game:GetService("ReplicatedFirst");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("RunService");
local l_UserInputService_0 = game:GetService("UserInputService");
local v4 = require(l_ReplicatedStorage_0.Packages.Knit);
local v5 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v7 = require(l_ReplicatedStorage_0.Shared.Data.Variables);
local v8 = require(l_ReplicatedFirst_0.PlaceIds);
local v9 = require(script.Mount);
local v10 = nil;
local v11 = nil;
local v12 = nil;
local v13 = nil;
local v14 = nil;
local v15 = nil;
local v16 = v5.new();
local v17 = v4.CreateController({
    Name = script.Name, 
    Client = {}
});
v17.KnitInit = function(_) --[[ Line: 45 ]] --[[ Name: KnitInit ]]
    -- upvalues: v10 (ref), v4 (copy), v11 (ref), v12 (ref), v13 (ref)
    v10 = v4.GetController("DataController");
    v11 = v4.GetService("MountService");
    v12 = v4.GetController("UIController");
    v13 = v4.GetController("CharacterController");
end;
v17.KnitStart = function(v19) --[[ Line: 53 ]] --[[ Name: KnitStart ]]
    -- upvalues: v8 (copy), v14 (ref), v12 (ref), v4 (copy), v9 (copy), v15 (ref), v16 (copy), l_UserInputService_0 (copy), v7 (copy), v10 (ref), v13 (ref)
    if v8:IsAFK() then
        return;
    else
        v14 = v12:GetModuleAsync("Notification"):expect();
        local function v22(v20) --[[ Line: 60 ]] --[[ Name: mountAdded ]]
            -- upvalues: v4 (ref), v9 (ref), v15 (ref), v16 (ref), v12 (ref)
            if v20:GetAttribute("Owner") ~= v4.Player.UserId then
                return;
            else
                local v21 = v9.new(v20);
                v15 = v21;
                v16:AttachTo(v20);
                v16:Add(v21);
                v16:Add(function() --[[ Line: 71 ]]
                    -- upvalues: v15 (ref), v21 (copy)
                    if v15 == v21 then
                        v15 = nil;
                    end;
                end);
                if v12:GetToggleState("Items") then
                    v12:Toggle("Items", false);
                end;
                return;
            end;
        end;
        local l_Mounts_0 = workspace:WaitForChild("Mounts");
        l_Mounts_0.ChildAdded:Connect(v22);
        for _, v25 in l_Mounts_0:GetChildren() do
            task.spawn(v22, v25);
        end;
        l_UserInputService_0.InputEnded:Connect(function(v26, v27) --[[ Line: 90 ]]
            -- upvalues: v7 (ref), v19 (copy)
            if v27 then
                return;
            else
                if v26.KeyCode == v7.MOUNTS.PC_KEYBIND or v26.KeyCode == v7.MOUNTS.GAMEPAD_KEYBIND then
                    v19:Mount({
                        toggle = true
                    });
                end;
                return;
            end;
        end);
        local l_MobileButtons_0 = v4.Player.PlayerGui:WaitForChild("MobileButtons");
        local l_Main_0 = l_MobileButtons_0.Main;
        local l_Main_TOK_0 = l_MobileButtons_0.Main_TOK;
        local l_Mount_0 = l_Main_0.Mount;
        local l_Mount_1 = l_Main_TOK_0.Mount;
        l_Mount_0.Activated:Connect(function() --[[ Line: 107 ]]
            -- upvalues: v19 (copy)
            v19:Mount({
                toggle = true
            });
        end);
        l_Mount_1.Activated:Connect(function() --[[ Line: 111 ]]
            -- upvalues: v19 (copy)
            v19:Mount({
                toggle = true
            });
        end);
        v10:OnChanged(v4.Player, "Mount", function(v33) --[[ Line: 115 ]]
            -- upvalues: l_Mount_0 (copy), l_Mount_1 (copy)
            local l_l_Mount_0_0 = l_Mount_0;
            local v35 = false;
            if v33 ~= nil then
                v35 = v33 ~= "";
            end;
            l_l_Mount_0_0.Visible = v35;
            l_l_Mount_0_0 = l_Mount_1;
            v35 = false;
            if v33 ~= nil then
                v35 = v33 ~= "";
            end;
            l_l_Mount_0_0.Visible = v35;
        end, true);
        local v36 = false;
        local l_Mounts_1 = workspace:WaitForChild("Mounts");
        v13.HiddenChanged:Connect(function(v38) --[[ Line: 123 ]]
            -- upvalues: v19 (copy), v36 (ref), l_Mounts_1 (copy)
            if v38 then
                if not v19:GetMount() then
                    return;
                else
                    v19:Dismount();
                    v36 = true;
                    l_Mounts_1.Parent = nil;
                    return;
                end;
            else
                if v36 then
                    v36 = false;
                    l_Mounts_1.Parent = workspace;
                    v19:Mount({
                        silent = true
                    });
                end;
                return;
            end;
        end);
        return;
    end;
end;
v17.GetMount = function(_) --[[ Line: 146 ]] --[[ Name: GetMount ]]
    -- upvalues: v15 (ref)
    return v15;
end;
v17.Mount = function(v40, v41) --[[ Line: 150 ]] --[[ Name: Mount ]]
    -- upvalues: v12 (ref), v10 (ref), v4 (copy), v14 (ref), v11 (ref)
    if v12.primaryMenuActive == "PlayScreen" then
        return;
    else
        v41 = v41 or {};
        if v40:GetMount() then
            if v41.toggle then
                v40:Dismount();
            end;
            return;
        elseif not v40:_checkIfCanMount() then
            return;
        else
            v10:Get(v4.Player, "Mount"):andThen(function(v42) --[[ Line: 169 ]]
                -- upvalues: v40 (copy), v14 (ref), v11 (ref), v41 (ref)
                if not v40:_checkIfCanMount() then
                    return;
                elseif not v42 or v42 == "" then
                    v14:Notify({
                        message = "Equip a mount in the Items menu", 
                        isPositive = false
                    });
                    return;
                else
                    v11:Mount(v42, v41);
                    return;
                end;
            end);
            return;
        end;
    end;
end;
v17.Equip = function(v43, v44) --[[ Line: 187 ]] --[[ Name: Equip ]]
    -- upvalues: v10 (ref), v4 (copy), v11 (ref)
    if v10:Get(v4.Player, "Mount"):expect() == v44 then
        v43:Dismount(true);
        return;
    elseif not v43:_checkIfCanMount() then
        return;
    else
        v11:Mount(v44);
        return;
    end;
end;
v17.Dismount = function(_, v46) --[[ Line: 202 ]] --[[ Name: Dismount ]]
    -- upvalues: v11 (ref)
    v11:Dismount(v46);
end;
v17._checkIfCanMount = function(_) --[[ Line: 208 ]] --[[ Name: _checkIfCanMount ]]
    -- upvalues: v13 (ref), v14 (ref)
    local l_v13_Humanoid_0 = v13:GetHumanoid();
    if not l_v13_Humanoid_0 then
        return false;
    elseif l_v13_Humanoid_0.Sit == true then
        v14:Notify({
            message = "You cannot mount while sitting", 
            isPositive = false
        });
        return false;
    else
        return true;
    end;
end;
return v17;