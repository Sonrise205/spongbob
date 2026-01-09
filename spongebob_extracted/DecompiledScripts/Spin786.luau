local _ = game:GetService("Players");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = require(l_ReplicatedStorage_0.Packages.Knit);
local v3 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v5 = require(l_ReplicatedStorage_0.Packages.Component).new({
    Tag = script.Name, 
    Ancestors = {
        workspace
    }, 
    Extensions = {
        {
            ShouldConstruct = function(v4) --[[ Line: 16 ]] --[[ Name: ShouldConstruct ]]
                return v4.Instance:IsA("BasePart") or v4.Instance:IsA("Model");
            end
        }
    }
});
v5.Construct = function(v6) --[[ Line: 22 ]] --[[ Name: Construct ]]
    -- upvalues: v3 (copy)
    v6.dumpster = v3.new();
    v6.spinAxis = v6.Instance:GetAttribute("SpinAxis") or Vector3.new(0, 1, 0, 0);
    v6.spinSpeed = v6.Instance:GetAttribute("SpinSpeed") or 15;
    v6.weld = v6.Instance:FindFirstChildOfClass("Weld");
    v6.lastPivot = if v6.weld then v6.weld.C0 else v6.Instance:GetPivot();
end;
v5.RenderSteppedUpdate = function(v7, v8) --[[ Line: 30 ]] --[[ Name: RenderSteppedUpdate ]]
    local v9 = v7.lastPivot * CFrame.fromAxisAngle(v7.spinAxis, math.rad(v7.spinSpeed) * v8);
    v7.lastPivot = v9;
    if v7.weld then
        v7.weld.C0 = v9;
        return;
    else
        v7.Instance:PivotTo(v9);
        return;
    end;
end;
v5.Destroy = function(v10) --[[ Line: 41 ]] --[[ Name: Destroy ]]
    v10.dumpster:Destroy();
    v10.dumpster = nil;
end;
return v5;