local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.ProbabilityDistributor);
local v2 = {};
local v3 = {};
v2.Enums = v3;
v3.CollectorMode = {
    MultiCollector = "MultiCollector", 
    SingleCollector = "SingleCollector"
};
v2.DROPLET_COLLISION_GROUP = "Droplet";
local function _(v4) --[[ Line: 261 ]] --[[ Name: IsWeightedArray ]]
    if typeof(v4) ~= "table" then
        return false;
    elseif not (v4[1] ~= nil) then
        return false;
    else
        local v5 = v4[1].Weight ~= nil;
        local v6 = v4[1].Value ~= nil;
        return v5 and v6;
    end;
end;
v2.parse = function(v8, v9) --[[ Line: 278 ]] --[[ Name: parse ]]
    -- upvalues: v1 (copy), v2 (copy)
    if typeof(v8) == "NumberRange" then
        return v9:NextNumber(v8.Min, v8.Max);
    else
        local v10;
        if typeof(v8) ~= "table" then
            v10 = false;
        elseif not (v8[1] ~= nil) then
            v10 = false;
        else
            local v11 = v8[1].Weight ~= nil;
            local v12 = v8[1].Value ~= nil;
            v10 = v11 and v12;
        end;
        if v10 then
            v10 = v1.new(v8, v9);
            return v2.parse(v10:Roll(), v9);
        else
            assert(typeof(v8) == "number", "Invalid value type");
            return v8;
        end;
    end;
end;
v2.calculateDropletValues = function(v13, v14, v15, v16) --[[ Line: 292 ]] --[[ Name: calculateDropletValues ]]
    -- upvalues: v2 (copy)
    local v17 = Random.new(v15);
    local v18 = {};
    for v19 = 1, v14 do
        v18[v19] = {
            RawValue = v2.parse(v13, v17), 
            RawLifeTime = v2.parse(v16, v17)
        };
    end;
    return v18;
end;
return v2;