local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Shared.Data.Variables);
local v2 = require(l_ReplicatedStorage_0.Packages.Component);
local v3 = require(l_ReplicatedStorage_0.Packages.Knit);
local v4 = v2.new({
    Tag = "NPEHidden", 
    Ancestors = {
        workspace
    }
});
v4.RestoreOriginalProps = function(v5) --[[ Line: 16 ]] --[[ Name: RestoreOriginalProps ]]
    for v6, v7 in v5._originalProps do
        for v8, v9 in v7 do
            v6[v8] = v9;
        end;
    end;
end;
v4.Construct = function(v10) --[[ Line: 25 ]] --[[ Name: Construct ]]
    v10._propsSetup = false;
    v10._originalProps = {};
end;
v4.Start = function(v11) --[[ Line: 30 ]] --[[ Name: Start ]]
    -- upvalues: v3 (copy), v1 (copy)
    for _, v13 in (v11.Instance:GetDescendants()) do
        v11._originalProps[v13] = {};
        if v13:IsA("BasePart") then
            v11._originalProps[v13].Transparency = v13.Transparency;
            v11._originalProps[v13].CanCollide = v13.CanCollide;
            v11._originalProps[v13].CanQuery = v13.CanQuery;
            v13.Transparency = 1;
            v13.CanCollide = false;
            v13.CanQuery = false;
        elseif v13:IsA("Decal") then
            v11._originalProps[v13].Transparency = v13.Transparency;
            v13.Transparency = 1;
        elseif v13:IsA("Beam") or v13:IsA("BillboardGui") or v13:IsA("ParticleEmitter") then
            v11._originalProps[v13].Enabled = v13.Enabled;
            v13.Enabled = false;
        end;
    end;
    local v14 = v3.GetController("DataController");
    local v15 = v3.GetController("NPEController");
    v14:OnChanged(v3.Player, "NPEStage", function(v16) --[[ Line: 53 ]]
        -- upvalues: v15 (copy), v1 (ref), v11 (copy)
        if v15:IsInNPE() and v16 < v1.NPE.FINISHED_STAGE then
            if v11._propsSetup then
                return;
            else
                v11._propsSetup = true;
                return;
            end;
        else
            v11:RestoreOriginalProps();
            return;
        end;
    end, true);
end;
v4.Stop = function(_) --[[ Line: 65 ]] --[[ Name: Stop ]]

end;
return v4;