local _ = game:GetService("Players");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_RunService_0 = game:GetService("RunService");
local l_TweenService_0 = game:GetService("TweenService");
local v4 = require(l_ReplicatedStorage_0.Packages.Knit);
local v5 = require(l_ReplicatedStorage_0.Packages.RailUtil);
local v6 = require(l_ReplicatedStorage_0.Packages.BaseComponent);
local v7 = require(l_ReplicatedStorage_0.Packages.WaitFor);
local v8 = require(l_ReplicatedStorage_0.Packages.Janitor);
local v9 = require(l_ReplicatedStorage_0.Packages.Fusion);
local v10 = require(l_ReplicatedStorage_0.Packages.TableUtil);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local _ = require(l_ReplicatedStorage_0.Shared.Util.AnimationHandler);
local _ = require(l_ReplicatedStorage_0.Shared.TowerOfKarate.AnimationData);
local _ = require(l_ReplicatedStorage_0.Shared.Data.Variables);
local _ = require(l_ReplicatedStorage_0.Shared.Util.PathUtil);
local v16 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local v17 = require(l_ReplicatedStorage_0.Shared.Modules.Timer);
local v18 = require(l_ReplicatedStorage_0.Shared.Data.AudioData);
local v19 = require(l_ReplicatedStorage_0.PetAttackInfos);
local _ = v4.GetController("UIController");
local _ = l_RunService_0:IsStudio() and true;
local _ = TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut);
local l_peek_0 = v9.peek;
local v24 = {
    Methods = {}, 
    Extensions = {
        v6
    }
};
v24.Methods._SetAttackConfig = function(v25, v26) --[[ Line: 57 ]] --[[ Name: _SetAttackConfig ]]
    v25._attackConfig = v26;
end;
v24.Methods._SetupAttack = function(v27) --[[ Line: 68 ]] --[[ Name: _SetupAttack ]]
    -- upvalues: v5 (copy), l_ReplicatedStorage_0 (copy), l_TweenService_0 (copy), v18 (copy), v4 (copy), v8 (copy), v17 (copy)
    local l_Attribute_0 = v27.Instance:GetAttribute("PetType");
    local v29 = v5.Instance.ensureAnimator(v27._visualModel);
    local l_AnimationId_0 = l_ReplicatedStorage_0.Animations.Pets:FindFirstChild(l_Attribute_0).Attack.AnimationId;
    if v27._attackConfig ~= nil then
        local v31 = v27._attackConfig and v27._attackConfig.stop;
        v27._attackConfig.stop = function() --[[ Line: 78 ]]
            -- upvalues: v27 (copy), v31 (copy)
            for _, v33 in v27.Instance:GetDescendants() do
                if v33:IsA("ParticleEmitter") then
                    v33.Enabled = false;
                    v33:Clear();
                elseif v33:IsA("Beam") then
                    v33.Enabled = false;
                end;
            end;
            if v31 and typeof(v31) == "function" then
                v31();
            end;
        end;
    end;
    v29.AnimationPlayed:Connect(function(v34) --[[ Line: 94 ]]
        -- upvalues: v27 (copy), l_AnimationId_0 (copy), l_TweenService_0 (ref), v18 (ref), l_Attribute_0 (copy), v4 (ref), v8 (ref), v17 (ref)
        if v27._attackConfig == nil then
            return;
        else
            local l_AnimationId_1 = v34.Animation.AnimationId;
            if typeof(l_AnimationId_0) == "table" and not table.find(l_AnimationId_0, l_AnimationId_1) then
                return;
            elseif typeof(l_AnimationId_0) ~= "table" and l_AnimationId_1 ~= l_AnimationId_0 then
                return;
            else
                local l_Position_0 = v27._mover.Transform.Position;
                local v37 = select(2, v27:PromiseAttackPosition():await());
                local v38 = v27:GetSpeedMultiplier() or 1;
                local v39 = CFrame.lookAt(l_Position_0, (Vector3.new(v37.X, l_Position_0.Y, v37.Z)));
                l_TweenService_0:Create(v27._mover, TweenInfo.new(0.1 / v38), {
                    Transform = v39
                }):Play();
                if v27._attackConfig.start then
                    v27._attackConfig.start();
                end;
                if v18.SFX.PetAttacks[l_Attribute_0] ~= nil then
                    v4.GetController("AudioController"):PlaySound({
                        name = ("SFX.PetAttacks.%*"):format(l_Attribute_0), 
                        properties = v18.SFX.PetAttacks[l_Attribute_0], 
                        soundGroup = "Master.SFX.VFX"
                    });
                end;
                local v40 = v8.new();
                if v27._attackConfig.markers then
                    for v41, v42 in v27._attackConfig.markers do
                        v40:Add(v34:GetMarkerReachedSignal(v41):Connect(function(v43) --[[ Line: 133 ]]
                            -- upvalues: v42 (copy), v34 (copy)
                            v42(v43, v34);
                        end));
                    end;
                end;
                local v44 = (v27:GetAttribute("DamageRate") or 0.2) / v38;
                v40:Add(v34:GetMarkerReachedSignal("DamageStart"):Connect(function() --[[ Line: 142 ]]
                    -- upvalues: v40 (copy), v17 (ref), v44 (copy), v27 (ref), v4 (ref)
                    v40:Add(v17.Simple(v44, function() --[[ Line: 143 ]]
                        -- upvalues: v27 (ref), v4 (ref)
                        if v27:GetAttribute("OwnerId") ~= v4.Player.UserId then
                            return;
                        else
                            local l_v27_EnemiesInAttack_0 = v27:GetEnemiesInAttack();
                            if not l_v27_EnemiesInAttack_0 or #l_v27_EnemiesInAttack_0 < 1 then
                                return;
                            else
                                v4.GetService("PetService"):DamageEnemy(v27:GetAttribute("UID"), v27:GetAttribute("AttackPosition"), l_v27_EnemiesInAttack_0);
                                return;
                            end;
                        end;
                    end), nil, "DamageTimer");
                end));
                v40:Add(v34:GetMarkerReachedSignal("DamageEnd"):Connect(function() --[[ Line: 166 ]]
                    -- upvalues: v40 (copy)
                    v40:Remove("DamageTimer");
                end));
                v34.Stopped:Once(function() --[[ Line: 171 ]]
                    -- upvalues: v40 (copy), v27 (ref)
                    v40:Destroy();
                    if v27._attackConfig.stop then
                        v27._attackConfig.stop();
                    end;
                    v27:SetAttribute("Attacking", false);
                    task.delay(v27:GetAttribute("AttackFrequency") / (v27:GetSpeedMultiplier() or 1), function() --[[ Line: 181 ]]
                        -- upvalues: v27 (ref)
                        v27:SetAttribute("CanAttack", true);
                    end);
                end);
                return;
            end;
        end;
    end);
end;
local function _(v46, v47) --[[ Line: 189 ]] --[[ Name: toNumberOr ]]
    if typeof(v46) == "number" and v46 == v46 then
        return v46;
    else
        return v47;
    end;
end;
local function _(v49, v50) --[[ Line: 196 ]] --[[ Name: toStringOr ]]
    if typeof(v49) == "string" then
        return v49;
    elseif typeof(v49) == "number" and v49 == v49 then
        return (tostring(v49));
    else
        return v50;
    end;
end;
v24.Methods._SetupDebugging = function(_) --[[ Line: 205 ]] --[[ Name: _SetupDebugging ]]
    -- upvalues: v9 (copy)
end;
v24.Methods._StartAttackBehavior = function(v53) --[[ Line: 403 ]] --[[ Name: _StartAttackBehavior ]]
    -- upvalues: l_RunService_0 (copy), l_peek_0 (copy)
    v53._targetEnemy = v53:GetScope():Value(nil);
    local l_Enemies_0 = workspace:WaitForChild("Enemies");
    local l_v53_Attribute_0 = v53:GetAttribute("AttackRange");
    v53:AddTask(l_RunService_0.Heartbeat:Connect(function() --[[ Line: 410 ]]
        -- upvalues: v53 (copy), l_Enemies_0 (copy), l_v53_Attribute_0 (copy), l_peek_0 (ref)
        if v53:GetAttribute("Attacking") == true then
            return;
        else
            local v56 = 1e999;
            local v57 = nil;
            for _, v59 in l_Enemies_0:GetChildren() do
                local l_Magnitude_0 = (v59:GetPivot().Position - v53._mover.Transform.Position).Magnitude;
                if v56 >= l_Magnitude_0 then
                    v56 = l_Magnitude_0;
                    v57 = v59;
                end;
            end;
            if l_v53_Attribute_0 < v56 then
                v53._targetEnemy:set(nil);
                return;
            else
                v53._targetEnemy:set(v57);
                if not v53:CanAttack() then
                    return;
                elseif not l_peek_0(v53._targetEnemy) then
                    return;
                else
                    v53:SetAttribute("AttackPosition", l_peek_0(v53._targetEnemy):GetPivot().Position);
                    v53:SetAttribute("CanAttack", false);
                    v53:SetAttribute("Attacking", true);
                    return;
                end;
            end;
        end;
    end));
end;
v24.Methods.CanAttack = function(v61) --[[ Line: 457 ]] --[[ Name: CanAttack ]]
    -- upvalues: l_peek_0 (copy)
    if not v61:GetAttribute("CanAttack") then
        return false;
    elseif v61:GetAttribute("Attacking") == true then
        return false;
    elseif not l_peek_0(v61._targetEnemy) then
        return false;
    else
        return true;
    end;
end;
v24.Methods.GetEnemiesInAttack = function(v62) --[[ Line: 473 ]] --[[ Name: GetEnemiesInAttack ]]
    -- upvalues: v16 (copy), l_peek_0 (copy), v10 (copy)
    local l_v62_Attribute_0 = v62:GetAttribute("AttackRange");
    local l_v62_Attribute_1 = v62:GetAttribute("AttackPosition");
    local l_Pivot_0 = v62._visualModel:GetPivot();
    local l_Position_1 = l_Pivot_0.Position;
    local l_v16_2DDistance_0 = v16:Get2DDistance(l_Position_1, l_v62_Attribute_1);
    local v68 = l_peek_0(v62._targetEnemy);
    local v90 = {
        Normal = function(_) --[[ Line: 484 ]]
            -- upvalues: v68 (copy)
            return {
                v68
            };
        end, 
        InRange = function(_) --[[ Line: 488 ]]
            -- upvalues: v62 (copy), l_Position_1 (copy), l_v62_Attribute_0 (copy)
            return v62:GetEnemiesInRange(l_Position_1, l_v62_Attribute_0);
        end, 
        Centered = function(v71) --[[ Line: 492 ]]
            -- upvalues: v62 (copy), l_Position_1 (copy)
            return v62:GetEnemiesInRange(l_Position_1, v71.Size);
        end, 
        Outward = function(v72) --[[ Line: 498 ]]
            -- upvalues: v62 (copy), l_v62_Attribute_1 (copy)
            return v62:GetEnemiesInRange(l_v62_Attribute_1, v72.Size);
        end, 
        OutwardInRange = function(_) --[[ Line: 507 ]]
            -- upvalues: v62 (copy), l_v62_Attribute_1 (copy), l_v62_Attribute_0 (copy)
            return v62:GetEnemiesInRange(l_v62_Attribute_1, l_v62_Attribute_0);
        end, 
        Beam = function(v74) --[[ Line: 516 ]]
            -- upvalues: v62 (copy), l_Position_1 (copy), l_v62_Attribute_0 (copy), l_v16_2DDistance_0 (copy), l_Pivot_0 (copy)
            local v75 = {};
            local l_v62_EnemiesInRange_0 = v62:GetEnemiesInRange(l_Position_1, l_v62_Attribute_0);
            if #l_v62_EnemiesInRange_0 < 1 then
                return v75;
            else
                local v77 = 1;
                if v74.RangeRatioCap then
                    v77 = (v77 or 1) * v74.RangeRatioCap;
                end;
                local v78 = nil;
                v78 = (if v74.Range then v74.Range else l_v16_2DDistance_0) * v77;
                local v79 = l_Pivot_0 * CFrame.new(0, 0, -v78 / 2);
                local v80 = Vector3.new(v74.Size, 12, v78) / 2;
                local v81 = -v80;
                for _, v83 in l_v62_EnemiesInRange_0 do
                    local l_v83_BoundingBox_0, v85 = v83:GetBoundingBox();
                    local v86 = v79:ToObjectSpace(l_v83_BoundingBox_0);
                    local v87 = v85 / 2;
                    local v88 = v86.Position - v87;
                    local v89 = v86.Position + v87;
                    if v89.X >= v81.X and v88.X <= v80.X and v89.Y >= v81.Y and v88.Y <= v80.Y and v89.Z >= v81.Z and v88.Z <= v80.Z then
                        table.insert(v75, v83);
                    end;
                end;
                return v75;
            end;
        end
    };
    local v91 = {};
    for _, v93 in v62.attackInfo.AttackStyles do
        v91 = v10.Extend(v91, v90[v93.Style](v93));
    end;
    return v91;
end;
v24.Methods.GetEnemiesInRange = function(_, v95, v96) --[[ Line: 593 ]] --[[ Name: GetEnemiesInRange ]]
    -- upvalues: v16 (copy)
    local v97 = {};
    for _, v99 in workspace.Enemies:GetChildren() do
        if v99 and v99:GetAttribute("Dead") ~= true then
            local l_Position_2 = v99:GetPivot().Position;
            if v16:Get2DDistance(v95, l_Position_2) <= v96 then
                table.insert(v97, v99);
            end;
        end;
    end;
    return v97;
end;
v24.Methods.GetEntityMetadata = function(v101) --[[ Line: 617 ]] --[[ Name: GetEntityMetadata ]]
    return v101._entityMetadata;
end;
v24.Methods.SetEntityState = function(v102, v103) --[[ Line: 622 ]] --[[ Name: SetEntityState ]]
    v102:SetAttribute("EntityState", v103);
end;
v24.Methods.IsAlive = function(v104) --[[ Line: 626 ]] --[[ Name: IsAlive ]]
    return v104:GetAttribute("IsAlive") == true;
end;
v24.Methods.IsStunned = function(v105) --[[ Line: 630 ]] --[[ Name: IsStunned ]]
    return v105:GetAttribute("EntityState") == "Stunned";
end;
v24.Methods.PromiseAttackPosition = function(v106) --[[ Line: 634 ]] --[[ Name: PromiseAttackPosition ]]
    -- upvalues: v7 (copy)
    local v107 = v7.Custom(function() --[[ Line: 635 ]]
        -- upvalues: v106 (copy)
        return v106:GetAttribute("AttackPosition");
    end, 5);
    v106:AddPromise(v107);
    return v107;
end;
v24.Methods.GetSpeedMultiplier = function(_) --[[ Line: 643 ]] --[[ Name: GetSpeedMultiplier ]]
    -- upvalues: v4 (copy)
    return v4.GetService("GameService").GameSpeed:Get()[1];
end;
v24.Constructing = function(v109) --[[ Line: 651 ]] --[[ Name: Constructing ]]
    -- upvalues: v7 (copy), v19 (copy)
    v109._visualModel = v109.Instance:WaitForChild("VisualModel");
    v109:DefaultAttribute("Attacking", false);
    v109:DefaultAttribute("CanAttack", true);
    v7.Custom(function() --[[ Line: 656 ]]
        -- upvalues: v109 (copy)
        return v109.Instance.PrimaryPart;
    end, 5):await();
    v109._primaryPart = v109.Instance.PrimaryPart;
    v109.attackInfo = v19[v109.Instance:GetAttribute("PetType")];
    warn("PT", v109.Instance:GetAttribute("PetType"));
end;
v24.Constructed = function(_) --[[ Line: 666 ]] --[[ Name: Constructed ]]

end;
v24.Started = function(v111) --[[ Line: 668 ]] --[[ Name: Started ]]
    if not v111.attackInfo then
        warn("No attack info found for pet:", v111.Instance:GetAttribute("PetType"));
        return;
    else
        local _ = v111:GetScope();
        v111._mover = v111.Instance:WaitForChild("PET_CORE"):WaitForChild("Motor6D");
        v111:_SetupAttack();
        v111:_StartAttackBehavior();
        return;
    end;
end;
v24.Stopped = function(_) --[[ Line: 695 ]] --[[ Name: Stopped ]]

end;
return v24;