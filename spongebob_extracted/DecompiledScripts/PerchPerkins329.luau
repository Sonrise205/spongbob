local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.Promise);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v3 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
return function(v4) --[[ Line: 8 ]]
    -- upvalues: v3 (copy), v1 (copy)
    local l_speedMultiplier_0 = v4.speedMultiplier;
    local l_Attack_0 = v4.model.VFX.Attack;
    local l_Hit_0 = l_Attack_0.Hit;
    local l_PrimaryPart_0 = l_Attack_0.PrimaryPart;
    local v9 = v4.pivotHitPart(l_Hit_0, l_PrimaryPart_0);
    local l_v3_2DDistance_0 = v3:Get2DDistance(l_Attack_0.Attack.Position, v9.Position);
    local v11 = {
        [true] = TweenInfo.new(0.5 / l_speedMultiplier_0, Enum.EasingStyle.Quart, Enum.EasingDirection.In), 
        [false] = TweenInfo.new(0.25 / l_speedMultiplier_0, Enum.EasingStyle.Quart)
    };
    local v12 = {};
    local v13 = {};
    local v14 = {};
    local v15 = {};
    local v16 = {
        start = {}, 
        target = {}
    };
    local v17 = {};
    v3:IterateClass(l_Attack_0.Charge, "ParticleEmitter", function(v18) --[[ Line: 33 ]]
        -- upvalues: v12 (copy), v3 (ref), l_speedMultiplier_0 (copy)
        table.insert(v12, v18);
        v3:AdjustEmitterSpeed(v18, l_speedMultiplier_0);
    end);
    v3:IterateClass(l_Attack_0.Attack, "ParticleEmitter", function(v19) --[[ Line: 38 ]]
        -- upvalues: v13 (copy), v3 (ref), l_v3_2DDistance_0 (copy), l_speedMultiplier_0 (copy)
        table.insert(v13, v19);
        v3:EmitterSpeedFromDistance(v19, l_v3_2DDistance_0, l_speedMultiplier_0);
    end);
    v3:IterateClass(l_Attack_0.Hit, "ParticleEmitter", function(v20) --[[ Line: 43 ]]
        -- upvalues: v14 (copy), v3 (ref), l_speedMultiplier_0 (copy)
        table.insert(v14, v20);
        v3:AdjustEmitterSpeed(v20, l_speedMultiplier_0);
    end);
    v3:IterateClass(l_PrimaryPart_0, "Beam", function(v21) --[[ Line: 48 ]]
        -- upvalues: v15 (copy)
        table.insert(v15, v21);
    end);
    local function _(v22) --[[ Line: 52 ]] --[[ Name: getOriginalCFrame ]]
        local l_v22_Attribute_0 = v22:GetAttribute("Origin");
        if not l_v22_Attribute_0 then
            l_v22_Attribute_0 = v22.CFrame;
            v22:SetAttribute("Origin", l_v22_Attribute_0);
        end;
        return l_v22_Attribute_0;
    end;
    for _, v26 in l_PrimaryPart_0:GetChildren() do
        if v26:IsA("Attachment") then
            local v27 = string.lower(v26.Name);
            if string.find(v27, "start") then
                local v28 = string.match(v27, "^(.-)start");
                local l_start_0 = v16.start;
                local l_v26_Attribute_0 = v26:GetAttribute("Origin");
                if not l_v26_Attribute_0 then
                    l_v26_Attribute_0 = v26.CFrame;
                    v26:SetAttribute("Origin", l_v26_Attribute_0);
                end;
                l_start_0[v28] = l_v26_Attribute_0;
            elseif string.find(v27, "end") then
                local v31 = string.match(v27, "^(.-)end");
                local l_target_0 = v16.target;
                local l_v26_Attribute_1 = v26:GetAttribute("Origin");
                if not l_v26_Attribute_1 then
                    l_v26_Attribute_1 = v26.CFrame;
                    v26:SetAttribute("Origin", l_v26_Attribute_1);
                end;
                l_target_0[v31] = l_v26_Attribute_1;
                v17[v31] = v26;
            end;
        end;
    end;
    for v34, v35 in v17 do
        v35.CFrame = v16.start[v34];
    end;
    local function v47(v36) --[[ Line: 82 ]] --[[ Name: tweenBeams ]]
        -- upvalues: v16 (copy), v11 (copy), v17 (copy), v1 (ref), v3 (ref), v15 (copy)
        local v37 = {};
        local v38 = if v36 then v16.target else v16.start;
        local v39 = v11[v36];
        for v40, v41 in v17 do
            table.insert(v37, v1.new(function(v42) --[[ Line: 89 ]]
                -- upvalues: v3 (ref), v41 (copy), v39 (copy), v38 (copy), v40 (copy)
                v3:Tween(v41, v39, {
                    CFrame = v38[v40]
                }, v42);
            end));
        end;
        if v36 then
            for _, v44 in v15 do
                v44.Enabled = true;
            end;
            return;
        else
            v1.allSettled(v37):andThen(function() --[[ Line: 99 ]]
                -- upvalues: v15 (ref)
                for _, v46 in v15 do
                    v46.Enabled = false;
                end;
            end);
            return;
        end;
    end;
    return {
        Charge = function() --[[ Line: 108 ]] --[[ Name: Charge ]]
            -- upvalues: v3 (ref), v12 (copy), v47 (copy)
            v3:ToggleEmitters(v12, true);
            v47(true);
        end, 
        Attack = function() --[[ Line: 113 ]] --[[ Name: Attack ]]
            -- upvalues: v3 (ref), v13 (copy)
            v3:ToggleEmitters(v13, true);
        end, 
        Hit = function() --[[ Line: 117 ]] --[[ Name: Hit ]]
            -- upvalues: v3 (ref), v14 (copy)
            v3:ToggleEmitters(v14, true, true);
        end, 
        StopAttack = function() --[[ Line: 121 ]] --[[ Name: StopAttack ]]
            -- upvalues: v3 (ref), v13 (copy)
            v3:ToggleEmitters(v13, false);
        end, 
        StopHit = function() --[[ Line: 125 ]] --[[ Name: StopHit ]]
            -- upvalues: v3 (ref), v12 (copy), v14 (copy), v47 (copy)
            v3:ToggleEmitters(v12, false);
            v3:ToggleEmitters(v14, false);
            v47(false);
        end
    };
end;