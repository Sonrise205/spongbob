local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_Players_0 = game:GetService("Players");
local l_ReplicatedFirst_0 = game:GetService("ReplicatedFirst");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("Debris");
local _ = game:GetService("UserInputService");
local v6 = require(l_ReplicatedStorage_0.Packages.Knit);
local v7 = require(l_ReplicatedStorage_0.Packages.RailComponent);
local v8 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v9 = require(l_ReplicatedStorage_0.Packages.RemoteComponent);
local v10 = require(l_ReplicatedStorage_0.Packages.BaseComponent);
local _ = require(l_ReplicatedStorage_0.Packages.RailUtil);
local v12 = require(l_ReplicatedStorage_0.Shared.TowerOfKarate.GlovesData);
local v13 = require(l_ReplicatedFirst_0.PlaceIds);
local v14 = require(l_ReplicatedStorage_0.Shared.TowerOfKarate.Constants);
local v15 = v6.GetController("TowerKarateController");
local v17 = v7.new({
    Tag = "KarateGloves", 
    Ancestors = {
        workspace
    }, 
    Extensions = {
        v10, 
        v9, 
        {
            ShouldConstruct = function(v16) --[[ Line: 35 ]] --[[ Name: ShouldConstruct ]]
                -- upvalues: v6 (copy)
                return v16:GetOwner() == v6.Player;
            end
        }
    }
});
v17.RemoteNamespace = "KarateGlove_Comm";
v17.Construct = function(v18) --[[ Line: 54 ]] --[[ Name: Construct ]]
    -- upvalues: v12 (copy), v8 (copy)
    v18._gearName = v18:GetAttribute("ReferenceName");
    v18._gearData = v12.getGloveData(v18._gearName);
    v18.dump = v8.new();
end;
v17.GetOwner = function(v19) --[[ Line: 61 ]] --[[ Name: GetOwner ]]
    -- upvalues: l_Players_0 (copy)
    return l_Players_0:GetPlayerFromCharacter(v19.Instance.Parent);
end;
v17.Start = function(v20) --[[ Line: 65 ]] --[[ Name: Start ]]
    -- upvalues: l_ContextActionService_0 (copy), v13 (copy), v6 (copy)
    l_ContextActionService_0:BindAction("Karate_Attack", function(_, v22, _) --[[ Line: 66 ]] --[[ Name: attemptAttack ]]
        -- upvalues: v20 (copy)
        if v22 ~= Enum.UserInputState.Begin then
            return;
        else
            v20.Server:Attack();
            return;
        end;
    end, false, Enum.KeyCode.ButtonR2, Enum.UserInputType.MouseButton1);
    if v13:IsGame() then
        v20:_ConnectAbility();
        local v24 = v6.Player:WaitForChild("PlayerGui"):WaitForChild("MobileButtons", 40);
        if not v24 then
            return;
        else
            v20:AddTask(v24.Main_TOK.Attack.Activated:Connect(function() --[[ Line: 91 ]]
                -- upvalues: v20 (copy)
                if Enum.UserInputState.Begin ~= Enum.UserInputState.Begin then
                    return;
                else
                    v20.Server:Attack();
                    return;
                end;
            end));
        end;
    end;
end;
v17.Stop = function(v25) --[[ Line: 97 ]] --[[ Name: Stop ]]
    -- upvalues: l_ContextActionService_0 (copy)
    l_ContextActionService_0:UnbindAction("Karate_Attack");
    v25.dump:Destroy();
end;
v17._ConnectAbility = function(v26) --[[ Line: 102 ]] --[[ Name: _ConnectAbility ]]
    -- upvalues: v6 (copy), v14 (copy), v15 (copy), l_ContextActionService_0 (copy)
    local function v29(_, v28) --[[ Line: 103 ]] --[[ Name: useAbility ]]
        -- upvalues: v6 (ref), v14 (ref), v26 (copy)
        if v28 ~= Enum.UserInputState.Begin then
            return;
        elseif (v6.Player:GetAttribute("AbilityCharge") or 0) < v14.REQUIRED_ABILITY_CHARGE then
            return;
        else
            v26.Server:PerformAbility();
            return;
        end;
    end;
    v15.UseAbility:Connect(function() --[[ Line: 117 ]]
        -- upvalues: v6 (ref), v14 (ref), v26 (copy)
        if Enum.UserInputState.Begin ~= Enum.UserInputState.Begin then
            return;
        elseif (v6.Player:GetAttribute("AbilityCharge") or 0) < v14.REQUIRED_ABILITY_CHARGE then
            return;
        else
            v26.Server:PerformAbility();
            return;
        end;
    end);
    l_ContextActionService_0:BindAction("Karate_Ability", v29, false, Enum.KeyCode.Q, Enum.KeyCode.ButtonL2);
end;
return v17;