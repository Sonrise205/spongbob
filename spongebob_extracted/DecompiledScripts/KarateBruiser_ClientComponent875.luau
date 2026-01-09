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
    v11:_SetAttackConfig({
        markers = {
            Hit = function() --[[ Line: 62 ]]
                -- upvalues: v11 (copy), v4 (ref)
                local l_VFX_0 = v11.Instance:WaitForChild("VFX");
                local v13 = l_VFX_0 and l_VFX_0:FindFirstChild("Hit");
                v4.Instance.emitParticles(v13);
            end
        }
    });
end;
v9.Stop = function(_) --[[ Line: 71 ]] --[[ Name: Stop ]]

end;
return v9;