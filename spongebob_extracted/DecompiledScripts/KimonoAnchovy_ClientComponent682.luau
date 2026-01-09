local _ = game:GetService("Debris");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v2 = require(l_ReplicatedStorage_0.Packages.BaseComponent);
local v3 = require(l_ReplicatedStorage_0.Packages.RailComponent);
local v4 = require(l_ReplicatedStorage_0.Packages.RailUtil);
local _ = require(l_ReplicatedStorage_0.Packages.Tree);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local _ = require(l_ReplicatedStorage_0.Shared.Data.Variables);
local l_BaseEntity_ClientExtension_0 = require(script.Parent:WaitForChild("BaseEntity_ClientExtension"));
local v9 = v3.new({
    Tag = string.split(script.Name, "_")[1], 
    Ancestors = {
        workspace
    }, 
    Extensions = {
        v2, 
        l_BaseEntity_ClientExtension_0
    }
});
v9.Construct = function(_) --[[ Line: 57 ]] --[[ Name: Construct ]]

end;
v9.Start = function(v11) --[[ Line: 59 ]] --[[ Name: Start ]]
    -- upvalues: v4 (copy)
    local v12 = {
        LeftHand = v11._visualModel:FindFirstChild("mixamorig:LeftHand", true), 
        RightHand = v11._visualModel:FindFirstChild("mixamorig:RightHand", true)
    };
    v11:_SetAttackConfig({
        markers = {
            Hit = function(v13) --[[ Line: 68 ]]
                -- upvalues: v11 (copy), v12 (copy), v4 (ref)
                local l_VFX_0 = v11.Instance.VFX;
                local v15 = l_VFX_0 and l_VFX_0:FindFirstChild("Hit");
                if not v15 then
                    return;
                else
                    local v16 = v12[v13];
                    if v16 then
                        local l_WorldCFrame_0 = v16.WorldCFrame;
                        v15.Position = l_WorldCFrame_0.Position + l_WorldCFrame_0.LookVector * 1.4;
                    end;
                    v4.Instance.emitParticles(v15);
                    return;
                end;
            end
        }
    });
end;
v9.Stop = function(_) --[[ Line: 89 ]] --[[ Name: Stop ]]

end;
return v9;