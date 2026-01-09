local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.TableUtil);
local v2 = {
    DamageMult = 1, 
    Cooldown = 0.5, 
    Damage = 10, 
    SlamData = {
        AttackIndex = 5, 
        AttackDamage = 5, 
        ImpactDamage = 25, 
        Range = 20
    }
};
local v3 = {};
local v4 = {};
for _, v6 in script:GetChildren() do
    local v7 = require(v6);
    v1.Reconcile(v7, v2);
    v4[v6.Name] = v1.Lock(v7);
end;
v3.getGloveData = function(v8) --[[ Line: 42 ]] --[[ Name: getGloveData ]]
    -- upvalues: v4 (copy)
    return v4[v8];
end;
return v3;