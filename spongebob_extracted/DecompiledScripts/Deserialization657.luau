local v0 = require(script.Parent.Parent.TypeId);
local _ = require(script.Parent.Parent.Buffer.Reader);
local v2 = require(script.Parent.Parent.Vlq);
local v3 = {};
local function v6(v4) --[[ Line: 11 ]] --[[ Name: deserialize ]]
    -- upvalues: v0 (copy), v3 (copy)
    local v5 = v4.readu8();
    return v3[v0.toType(v5)](v4);
end;
v3.array = function(v7) --[[ Line: 18 ]] --[[ Name: array ]]
    -- upvalues: v2 (copy), v6 (copy)
    local v8 = v2.decode(v7);
    local v9 = {};
    for _ = 1, v8 do
        table.insert(v9, v6(v7));
    end;
    return v9;
end;
v3.dictionary = function(v11) --[[ Line: 29 ]] --[[ Name: dictionary ]]
    -- upvalues: v2 (copy), v0 (copy), v3 (copy)
    local v12 = v2.decode(v11);
    local v13 = {};
    for _ = 1, v12 do
        local v15 = v11.readu8();
        local v16 = v3[v0.toType(v15)](v11);
        local v17 = v11.readu8();
        v13[v16] = v3[v0.toType(v17)](v11);
    end;
    return v13;
end;
v3["nil"] = function() --[[ Line: 43 ]]
    return nil;
end;
v3.string = function(v18) --[[ Line: 47 ]] --[[ Name: string ]]
    -- upvalues: v2 (copy)
    local v19 = v2.decode(v18);
    return (v18.readstring(v19));
end;
v3.number = function(v20) --[[ Line: 54 ]] --[[ Name: number ]]
    return v20.readf64();
end;
v3.boolean = function(v21) --[[ Line: 58 ]] --[[ Name: boolean ]]
    if v21.readu8() == 1 then
        return true;
    else
        return false;
    end;
end;
v3.Vector2 = function(v22) --[[ Line: 62 ]] --[[ Name: Vector2 ]]
    local v23 = v22.readf32();
    local v24 = v22.readf32();
    return Vector2.new(v23, v24);
end;
v3.Vector3 = function(v25) --[[ Line: 69 ]] --[[ Name: Vector3 ]]
    return (Vector3.new(v25.readf32(), v25.readf32(), (v25.readf32())));
end;
v3.Vector2int16 = function(v26) --[[ Line: 77 ]] --[[ Name: Vector2int16 ]]
    local v27 = v26.readi16();
    local v28 = v26.readi16();
    return Vector2int16.new(v27, v28);
end;
v3.Vector3int16 = function(v29) --[[ Line: 84 ]] --[[ Name: Vector3int16 ]]
    local v30 = v29.readi16();
    local v31 = v29.readi16();
    local v32 = v29.readi16();
    return Vector3int16.new(v30, v31, v32);
end;
v3.CFrame = function(v33) --[[ Line: 92 ]] --[[ Name: CFrame ]]
    local v34 = Vector3.new(v33.readf32(), v33.readf32(), v33.readf32());
    local v35 = Vector3.new(v33.readf32(), v33.readf32(), v33.readf32());
    local l_Magnitude_0 = v35.Magnitude;
    if l_Magnitude_0 ~= 0 then
        return CFrame.fromAxisAngle(v35, l_Magnitude_0) + v34;
    else
        return CFrame.new(v34);
    end;
end;
return v3;