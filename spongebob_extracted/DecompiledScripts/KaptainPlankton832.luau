local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_RunService_0 = game:GetService("RunService");
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v3 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
return function(v4) --[[ Line: 7 ]]
    -- upvalues: v3 (copy), l_RunService_0 (copy)
    local l_speedMultiplier_0 = v4.speedMultiplier;
    local l_Attack_0 = v4.model.VFX.Attack;
    local l_Hit_0 = l_Attack_0.Hit;
    local l_Attack_1 = l_Attack_0.Attack;
    local l_PrimaryPart_0 = l_Attack_0.PrimaryPart;
    local l_Weld_0 = l_Attack_1:FindFirstChildOfClass("Weld");
    l_Attack_1.Size = l_Attack_1.Size * Vector3.new(1, 1, 0, 0);
    local l_Weld_1 = l_Hit_0:FindFirstChildOfClass("Weld");
    local l_Size_0 = l_Hit_0.Size;
    l_Hit_0.Size = l_Size_0 * Vector3.new(1, 1, 0, 0);
    local l_l_Weld_0_Attribute_0 = l_Weld_0:GetAttribute("OriginalC0");
    if not l_l_Weld_0_Attribute_0 then
        l_l_Weld_0_Attribute_0 = l_Weld_0.C0;
        l_Weld_0:SetAttribute("OriginalC0", l_l_Weld_0_Attribute_0);
    end;
    l_Weld_0.C0 = l_l_Weld_0_Attribute_0 * CFrame.new(0, 16, 0);
    local v14 = l_Weld_1.C0 * CFrame.new(0, 0, -l_Size_0.Z / 2);
    l_Weld_1.C0 = v14;
    local l_v3_2DDistance_0 = v3:Get2DDistance(l_PrimaryPart_0.Position, l_Attack_1.Position);
    local l_v3_2DDistance_1 = v3:Get2DDistance(l_PrimaryPart_0.Position, l_Hit_0.Position);
    local _ = math.clamp(v4.range - l_v3_2DDistance_0, 5, v4.range);
    local v18 = math.clamp(v4.range - l_v3_2DDistance_1, 5, v4.range);
    local v19 = {};
    local v20 = {};
    local v21 = {};
    local v22 = {};
    local v23 = {};
    if l_Attack_0:FindFirstChild("Charge_Ultimate") then
        v3:IterateClass(l_Attack_0.Charge, "ParticleEmitter", function(v24) --[[ Line: 70 ]]
            -- upvalues: v19 (copy), v3 (ref), l_speedMultiplier_0 (copy)
            table.insert(v19, v24);
            v3:AdjustEmitter(v24, l_speedMultiplier_0);
        end);
    end;
    v3:IterateClass(l_Attack_1, "ParticleEmitter", function(v25) --[[ Line: 77 ]]
        -- upvalues: v20 (copy), v21 (copy), v3 (ref), l_speedMultiplier_0 (copy)
        if v25.Parent.Name == "Attachment1" then
            table.insert(v20, v25);
        else
            table.insert(v21, v25);
        end;
        v3:AdjustEmitter(v25, l_speedMultiplier_0);
    end);
    v3:IterateClass(l_Hit_0, "ParticleEmitter", function(v26) --[[ Line: 87 ]]
        -- upvalues: v22 (copy), v3 (ref), l_speedMultiplier_0 (copy)
        table.insert(v22, v26);
        v3:AdjustEmitter(v26, l_speedMultiplier_0);
    end);
    v3:IterateClass(l_Attack_0.Impact, "ParticleEmitter", function(v27) --[[ Line: 92 ]]
        -- upvalues: v23 (copy), v3 (ref), l_speedMultiplier_0 (copy)
        table.insert(v23, v27);
        v3:AdjustEmitter(v27, l_speedMultiplier_0);
    end);
    local v28 = {};
    local _ = function() --[[ Line: 99 ]] --[[ Name: cleanupConnections ]]
        -- upvalues: v28 (ref)
        if not v28 then
            return;
        else
            for _, v30 in v28 do
                v30:Disconnect();
            end;
            table.clear(v28);
            v28 = nil;
            return;
        end;
    end;
    return {
        Charge = function() --[[ Line: 113 ]] --[[ Name: Charge ]]
            -- upvalues: v3 (ref), v19 (copy), l_l_Weld_0_Attribute_0 (ref), l_Weld_0 (copy), l_speedMultiplier_0 (copy), v20 (copy)
            v3:ToggleEmitters(v19, true);
            local l_l_l_Weld_0_Attribute_0_0 = l_l_Weld_0_Attribute_0;
            v3:Tween(l_Weld_0, TweenInfo.new(1.2 / l_speedMultiplier_0), {
                C0 = l_l_l_Weld_0_Attribute_0_0
            });
            v3:ToggleEmitters(v20, true, true);
        end, 
        Attack = function() --[[ Line: 122 ]] --[[ Name: Attack ]]
            -- upvalues: v3 (ref), v21 (copy), v23 (copy), v28 (ref), l_RunService_0 (ref), l_Attack_0 (copy), v14 (copy), v18 (copy), l_Size_0 (copy), l_Weld_1 (copy), l_speedMultiplier_0 (copy), l_Hit_0 (copy)
            v3:ToggleEmitters(v21, true, true);
            v3:ToggleEmitters(v23, true);
            table.insert(v28, l_RunService_0.Heartbeat:Connect(function(v33) --[[ Line: 126 ]]
                -- upvalues: l_Attack_0 (ref)
                local l_Attachment_0 = l_Attack_0.Impact.Attachment;
                l_Attachment_0.CFrame = l_Attachment_0.CFrame * CFrame.Angles(-1.5707963267948966 * v33, 0, 0);
            end));
            local v35 = v14 * CFrame.new(0, 0, v18 / 2);
            local v36 = Vector3.new(l_Size_0.X, l_Size_0.Y, v18);
            v3:Tween(l_Weld_1, TweenInfo.new(0.5 / l_speedMultiplier_0), {
                C0 = v35
            });
            v3:Tween(l_Hit_0, TweenInfo.new(0.5 / l_speedMultiplier_0), {
                Size = v36
            });
        end, 
        Hit = function() --[[ Line: 137 ]] --[[ Name: Hit ]]
            -- upvalues: v3 (ref), v22 (copy)
            v3:ToggleEmitters(v22, true, true);
        end, 
        StopAttack = function() --[[ Line: 141 ]] --[[ Name: StopAttack ]]
            -- upvalues: v3 (ref), v21 (copy), l_speedMultiplier_0 (copy), v20 (copy), v19 (copy), l_Weld_0 (copy), l_l_Weld_0_Attribute_0 (ref)
            v3:ToggleEmitters(v21, false);
            task.wait(0.18 / l_speedMultiplier_0);
            v3:ToggleEmitters(v20, false);
            v3:ToggleEmitters(v19, false);
            l_Weld_0.C0 = l_l_Weld_0_Attribute_0;
        end, 
        StopHit = function() --[[ Line: 150 ]] --[[ Name: StopHit ]]
            -- upvalues: v3 (ref), v23 (copy), v22 (copy), l_speedMultiplier_0 (copy), v28 (ref)
            v3:ToggleEmitters(v23, false);
            v3:ToggleEmitters(v22, false);
            task.wait(1 / l_speedMultiplier_0);
            if not v28 then
                return;
            else
                for _, v38 in v28 do
                    v38:Disconnect();
                end;
                table.clear(v28);
                v28 = nil;
                return;
            end;
        end
    };
end;