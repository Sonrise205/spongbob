local _ = game:GetService("Debris");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_TweenService_0 = game:GetService("TweenService");
local v3 = require(l_ReplicatedStorage_0.Packages.BaseComponent);
local v4 = require(l_ReplicatedStorage_0.Packages.RailComponent);
local _ = require(l_ReplicatedStorage_0.Packages.RailUtil);
local _ = require(l_ReplicatedStorage_0.Packages.Tree);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local _ = require(l_ReplicatedStorage_0.Shared.Data.Variables);
local v9 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local l_BaseEntity_ClientExtension_0 = require(script.Parent:WaitForChild("BaseEntity_ClientExtension"));
local v11 = v4.new({
    Tag = string.split(script.Name, "_")[1], 
    Ancestors = {
        workspace
    }, 
    Extensions = {
        v3, 
        l_BaseEntity_ClientExtension_0
    }
});
local _ = function(v12, v13) --[[ Line: 58 ]] --[[ Name: toggleBeams ]]
    for _, v15 in v12 do
        v15.Enabled = v13;
    end;
end;
v11.Construct = function(_) --[[ Line: 64 ]] --[[ Name: Construct ]]

end;
v11.Start = function(v18) --[[ Line: 66 ]] --[[ Name: Start ]]
    -- upvalues: v9 (copy), l_TweenService_0 (copy)
    local l_VFX_0 = v18.Instance:WaitForChild("VFX");
    local l_BeamEndAttachment_0 = v18._visualModel:WaitForChild("RootPart"):WaitForChild("mixamorig:Hips").BeamEndAttachment;
    local v21 = {};
    local v22 = {};
    local v23 = {};
    local v24 = {};
    local v25 = {};
    local v26 = {};
    v9:IterateClass(l_BeamEndAttachment_0, "ParticleEmitter", function(v27) --[[ Line: 80 ]]
        -- upvalues: v22 (copy)
        table.insert(v22, v27);
    end);
    v9:IterateClass(l_VFX_0.Hit, "ParticleEmitter", function(v28) --[[ Line: 84 ]]
        -- upvalues: v23 (copy)
        table.insert(v23, v28);
    end);
    v9:IterateClass(l_VFX_0.Attack, "ParticleEmitter", function(v29) --[[ Line: 88 ]]
        -- upvalues: v24 (copy)
        table.insert(v24, v29);
    end);
    v9:IterateClass(l_VFX_0.Primary, "Attachment", function(v30) --[[ Line: 92 ]]
        -- upvalues: v21 (copy), v25 (copy)
        v21[v30.Name] = v30;
        v30:SetAttribute("OriginalCFrame", v30.CFrame);
        local l_v30_FirstAncestorOfClass_0 = v30:FindFirstAncestorOfClass("ParticleEmitter");
        if l_v30_FirstAncestorOfClass_0 then
            table.insert(v25, l_v30_FirstAncestorOfClass_0);
        end;
    end);
    v9:IterateClass(l_VFX_0.Primary, "Beam", function(v32) --[[ Line: 103 ]]
        -- upvalues: v26 (copy)
        v26[v32.Name] = v32;
        v32.Enabled = false;
    end);
    local v33 = {};
    v18:_SetAttackConfig({
        markers = {
            Charge = function() --[[ Line: 112 ]]
                -- upvalues: v9 (ref), v22 (copy), v26 (copy), v21 (copy), v33 (copy), l_BeamEndAttachment_0 (copy), l_TweenService_0 (ref), v25 (copy)
                v9:ToggleEmitters(v22, true);
                for v34 = 1, 6 do
                    local v35 = v26[("Charge%*"):format(v34)];
                    local v36 = v21[("BeamStartAttachment%*"):format(v34)];
                    v33[v35] = v36.CFrame;
                    v36.Position = l_BeamEndAttachment_0.Position;
                    v35.Enabled = true;
                    l_TweenService_0:Create(v36, TweenInfo.new(0.2), {
                        CFrame = v36:GetAttribute("OriginalCFrame")
                    }):Play();
                end;
                v9:ToggleEmitters(v25, true);
            end, 
            Attack = function() --[[ Line: 132 ]]
                -- upvalues: v9 (ref), v24 (copy)
                v9:JustEmit(v24, true);
            end, 
            Hit = function() --[[ Line: 136 ]]
                -- upvalues: v9 (ref), v23 (copy)
                v9:ToggleEmitters(v23, true, true);
            end, 
            StopCharge = function() --[[ Line: 140 ]]
                -- upvalues: v9 (ref), v22 (copy), v26 (copy), v21 (copy), l_TweenService_0 (ref), l_BeamEndAttachment_0 (copy), v33 (copy)
                v9:ToggleEmitters(v22, false);
                for v37 = 1, 6 do
                    local v38 = v26[("Charge%*"):format(v37)];
                    local v39 = v21[("BeamStartAttachment%*"):format(v37)];
                    local v40 = l_TweenService_0:Create(v39, TweenInfo.new(0.35), {
                        Position = l_BeamEndAttachment_0.Position
                    });
                    do
                        local l_v40_0 = v40;
                        l_v40_0.Completed:Once(function() --[[ Line: 154 ]]
                            -- upvalues: l_v40_0 (ref), v38 (copy), v39 (copy)
                            l_v40_0:Destroy();
                            l_v40_0 = nil;
                            v38.Enabled = false;
                            v39.CFrame = v39:GetAttribute("OriginalCFrame");
                        end);
                        l_v40_0:Play();
                    end;
                end;
                task.delay(0.35 + task.wait(), function() --[[ Line: 165 ]]
                    -- upvalues: v33 (ref)
                    table.clear(v33);
                end);
            end, 
            StopHit = function() --[[ Line: 170 ]]
                -- upvalues: v9 (ref), v23 (copy)
                v9:ToggleEmitters(v23, false);
            end
        }
    });
end;
v11.Stop = function(_) --[[ Line: 177 ]] --[[ Name: Stop ]]

end;
return v11;