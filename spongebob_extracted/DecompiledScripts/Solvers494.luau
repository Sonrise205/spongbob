local v0 = {};
for _, v2 in script:GetChildren() do
    local v3 = require(v2);
    v3.Solvers = v0;
    v0[v2.Name] = v3;
end;
return v0;