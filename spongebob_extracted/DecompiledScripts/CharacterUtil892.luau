local l_Players_0 = game:GetService("Players");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_InsertService_0 = game:GetService("InsertService");
local l_StarterPlayer_0 = game:GetService("StarterPlayer");
local v4 = require(l_ReplicatedStorage_0.Packages.Promise);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v6 = {};
local v7 = {};
l_Players_0.PlayerRemoving:Connect(function(v8) --[[ Line: 14 ]]
    -- upvalues: v7 (copy)
    local v9 = {};
    for v10, v11 in pairs(v7) do
        if v11 and v11.players then
            if table.find(v11.players, v8) then
                table.remove(v11.players);
            end;
            if #v11.players < 1 then
                v11.acc:Destroy();
                v11.acc = nil;
                table.insert(v9, v10);
            end;
        end;
    end;
    for _, v13 in ipairs(v9) do
        v7[v13] = nil;
    end;
end);
v6.Check = function(_, v15) --[[ Line: 39 ]] --[[ Name: Check ]]
    if not v15 or not v15.Character then
        return;
    elseif not v15 or not v15.Character:FindFirstChild("Humanoid") then
        return;
    elseif not v15 or not v15.Character:FindFirstChild("HumanoidRootPart") then
        return;
    else
        return true;
    end;
end;
v6.GetHumanoid = function(_, v17) --[[ Line: 56 ]] --[[ Name: GetHumanoid ]]
    if not v17 or not v17.Character then
        return;
    else
        local l_Humanoid_0 = v17.Character:FindFirstChild("Humanoid");
        if not l_Humanoid_0 then
            return;
        else
            return l_Humanoid_0;
        end;
    end;
end;
v6.GetHumanoidDescription = function(_, v20) --[[ Line: 71 ]] --[[ Name: GetHumanoidDescription ]]
    -- upvalues: v6 (copy)
    local l_v6_Humanoid_0 = v6:GetHumanoid(v20);
    if not l_v6_Humanoid_0 then
        return;
    else
        return l_v6_Humanoid_0:GetAppliedDescription();
    end;
end;
v6.GetAnimator = function(v22, v23) --[[ Line: 82 ]] --[[ Name: GetAnimator ]]
    local l_v22_Humanoid_0 = v22:GetHumanoid(v23);
    if not l_v22_Humanoid_0 then
        return;
    else
        local l_Animator_0 = l_v22_Humanoid_0:FindFirstChild("Animator");
        if not l_Animator_0 then
            return;
        else
            return l_Animator_0;
        end;
    end;
end;
v6.GetHumanoidRootPart = function(_, v27) --[[ Line: 99 ]] --[[ Name: GetHumanoidRootPart ]]
    if not v27 or not v27.Character then
        return;
    else
        local l_PrimaryPart_0 = v27.Character.PrimaryPart;
        if not l_PrimaryPart_0 then
            return;
        else
            return l_PrimaryPart_0;
        end;
    end;
end;
v6.GetTool = function(_, v30) --[[ Line: 113 ]] --[[ Name: GetTool ]]
    if not v30 or not v30.Character then
        return;
    else
        return v30.Character:FindFirstChildOfClass("Tool");
    end;
end;
v6.EquipTool = function(_, v32, v33, v34) --[[ Line: 121 ]] --[[ Name: EquipTool ]]
    -- upvalues: v6 (copy)
    local l_v6_Humanoid_1 = v6:GetHumanoid(v32);
    if not l_v6_Humanoid_1 then
        return;
    else
        if v34 then
            l_v6_Humanoid_1:UnequipTools(v32, true);
        end;
        l_v6_Humanoid_1:EquipTool(v33);
        return;
    end;
end;
v6.UnequipTool = function(v36, v37, v38) --[[ Line: 134 ]] --[[ Name: UnequipTool ]]
    -- upvalues: v6 (copy)
    local l_v6_Humanoid_2 = v6:GetHumanoid(v37);
    if not l_v6_Humanoid_2 then
        return;
    else
        local l_v36_Tool_0 = v36:GetTool(v37);
        if not l_v36_Tool_0 then
            return;
        elseif v38 then
            l_v36_Tool_0:Destroy();
            return;
        else
            l_v6_Humanoid_2:UnequipTools();
            return l_v36_Tool_0;
        end;
    end;
end;
v6.GetHeight = function(_, v42) --[[ Line: 156 ]] --[[ Name: GetHeight ]]
    if not v42 or not v42.Character then
        return;
    else
        local l_PrimaryPart_1 = v42.Character.PrimaryPart;
        local l_Humanoid_1 = v42.Character:FindFirstChild("Humanoid");
        if not l_PrimaryPart_1 or not l_Humanoid_1 then
            return;
        else
            return l_Humanoid_1.HipHeight + l_PrimaryPart_1.Size.Y / 2;
        end;
    end;
end;
v6.GetHeightScale = function(_, v46) --[[ Line: 171 ]] --[[ Name: GetHeightScale ]]
    if not v46 or not v46.Character then
        return;
    else
        local l_BodyHeightScale_0 = v46.Character:FindFirstChild("Humanoid"):FindFirstChild("BodyHeightScale");
        if l_BodyHeightScale_0 then
            return l_BodyHeightScale_0.Value;
        else
            return 1;
        end;
    end;
end;
v6.ToggleMassless = function(_, v49, v50) --[[ Line: 182 ]] --[[ Name: ToggleMassless ]]
    if not v49 or not v49.Character then
        return;
    else
        for _, v52 in v49.Character:GetDescendants() do
            if v52:IsA("BasePart") then
                v52.Massless = v50;
            end;
        end;
        return;
    end;
end;
v6.GetFace = function(_, v54) --[[ Line: 195 ]] --[[ Name: GetFace ]]
    if not v54 or not v54.Character then
        return;
    else
        local l_Head_0 = v54.Character:FindFirstChild("Head");
        return l_Head_0 and l_Head_0:FindFirstChild("face");
    end;
end;
v6.ApplyDescriptionToHumanoid = function(_, v57, v58) --[[ Line: 206 ]] --[[ Name: ApplyDescriptionToHumanoid ]]
    -- upvalues: v4 (copy)
    return v4.new(function(v59, v60) --[[ Line: 207 ]]
        -- upvalues: v57 (copy), v58 (copy)
        if not v57 then
            return v60("No humanoid given");
        else
            return v59(v57:ApplyDescription(v58));
        end;
    end):catch(warn);
end;
v6.LoadAsset = function(_, v62, v63) --[[ Line: 217 ]] --[[ Name: LoadAsset ]]
    -- upvalues: v4 (copy), v7 (copy), l_InsertService_0 (copy)
    return v4.retryWithDelay(function() --[[ Line: 218 ]]
        -- upvalues: v4 (ref), v7 (ref), v63 (copy), l_InsertService_0 (ref)
        return v4.new(function(v64) --[[ Line: 219 ]]
            -- upvalues: v7 (ref), v63 (ref), l_InsertService_0 (ref)
            if v7[v63] then
                v64(v7[v63]);
            end;
            v64(l_InsertService_0:LoadAsset(v63));
        end);
    end, 10, 0.5):andThen(function(v65, v66) --[[ Line: 226 ]]
        -- upvalues: v62 (copy), v7 (ref), v63 (copy)
        if not v66 then
            local v67 = v65.acc:Clone();
            if v62 then
                table.insert(v65.players, v62);
            end;
            return v67;
        else
            local v68 = v65:GetChildren()[1];
            if v68 and v68:IsA("Accessory") then
                v7[v63] = {
                    acc = v68, 
                    players = {
                        v62
                    }
                };
                return v68:Clone();
            else
                return;
            end;
        end;
    end);
end;
v6.SetJumpingEnabled = function(v69, v70, v71) --[[ Line: 247 ]] --[[ Name: SetJumpingEnabled ]]
    local l_v69_Humanoid_0 = v69:GetHumanoid(v70);
    if not l_v69_Humanoid_0 then
        return;
    else
        l_v69_Humanoid_0:SetStateEnabled(Enum.HumanoidStateType.Jumping, v71);
        return;
    end;
end;
v6.SetJumpPower = function(v73, v74, v75) --[[ Line: 256 ]] --[[ Name: SetJumpPower ]]
    -- upvalues: l_StarterPlayer_0 (copy)
    local l_v73_Humanoid_0 = v73:GetHumanoid(v74);
    if not l_v73_Humanoid_0 then
        return;
    else
        local l_JumpPower_0 = l_v73_Humanoid_0.JumpPower;
        l_v73_Humanoid_0.JumpPower = v75 or l_StarterPlayer_0.CharacterJumpPower;
        return l_JumpPower_0;
    end;
end;
v6.SetJumpHeight = function(v78, v79, v80) --[[ Line: 268 ]] --[[ Name: SetJumpHeight ]]
    -- upvalues: l_StarterPlayer_0 (copy)
    local l_v78_Humanoid_0 = v78:GetHumanoid(v79);
    if not l_v78_Humanoid_0 then
        return;
    else
        local l_JumpHeight_0 = l_v78_Humanoid_0.JumpHeight;
        l_v78_Humanoid_0.JumpHeight = v80 or l_StarterPlayer_0.CharacterJumpHeight;
        return l_JumpHeight_0;
    end;
end;
v6.CreateCharacterFromDescription = function(_, v84) --[[ Line: 281 ]] --[[ Name: CreateCharacterFromDescription ]]
    -- upvalues: v4 (copy), l_Players_0 (copy)
    return v4.retryWithDelay(function() --[[ Line: 282 ]]
        -- upvalues: v4 (ref), l_Players_0 (ref), v84 (copy)
        return v4.new(function(v85) --[[ Line: 283 ]]
            -- upvalues: l_Players_0 (ref), v84 (ref)
            local l_l_Players_0_HumanoidModelFromDescription_0 = l_Players_0:CreateHumanoidModelFromDescription(v84, Enum.HumanoidRigType.R15);
            for _, v88 in l_l_Players_0_HumanoidModelFromDescription_0:GetDescendants() do
                if v88:IsA("Script") or v88:IsA("LocalScript") or v88:IsA("ModuleScript") then
                    v88:Destroy();
                end;
            end;
            for _, v90 in l_l_Players_0_HumanoidModelFromDescription_0.Humanoid.Animator:GetPlayingAnimationTracks() do
                v90:Stop();
                v90:Destroy();
            end;
            v85(l_l_Players_0_HumanoidModelFromDescription_0);
        end);
    end, 10, 0.5);
end;
v6.DuplicateCharacter = function(v91, v92) --[[ Line: 303 ]] --[[ Name: DuplicateCharacter ]]
    if not v92 or not v92.Character then
        return;
    else
        return select(2, v91:DuplicateCharacterAsync(v92):await());
    end;
end;
v6.DuplicateCharacterAsync = function(v93, v94) --[[ Line: 311 ]] --[[ Name: DuplicateCharacterAsync ]]
    -- upvalues: v4 (copy), l_Players_0 (copy)
    local v95 = nil;
    if typeof(v94) == "Instance" then
        if not v94 or not v94.Character then
            return v4.reject("No player or character");
        else
            v95 = v93:GetHumanoidDescription(v94);
        end;
    elseif typeof(v94) == "number" then
        v95 = select(2, pcall(l_Players_0.GetHumanoidDescriptionFromUserId, l_Players_0, v94));
        if not v95 then
            return v4.reject("No description found");
        end;
    end;
    return v93:CreateCharacterFromDescription(v95);
end;
return v6;