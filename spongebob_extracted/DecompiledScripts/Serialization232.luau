local v0 = require(script.Parent.Parent.TypeId);
local v1 = require(script.Parent.Parent.isArray);
local _ = require(script.Parent.Parent.Buffer.Writer);
local v3 = require(script.Parent.Parent.Vlq);
local v4 = {};
local function v10(v5, v6) --[[ Line: 12 ]] --[[ Name: serialize ]]
    -- upvalues: v1 (copy), v0 (copy), v4 (copy)
    local v7 = typeof(v6);
    local v8 = nil;
    local v9 = nil;
    if v7 == "table" then
        if v1(v6) then
            v8 = v0.fromType("array");
            v9 = v4.array;
        else
            v8 = v0.fromType("dictionary");
            v9 = v4.dictionary;
        end;
    else
        v8 = v0.fromType(v7);
        v9 = v4[v7];
    end;
    if v9 == nil then
        error((("invalid type '%*'"):format(v7)));
        return;
    else
        v5.writeu8(v8);
        v9(v5, v6);
        return;
    end;
end;
v4.array = function(v11, v12) --[[ Line: 37 ]] --[[ Name: array ]]
    -- upvalues: v3 (copy), v10 (copy)
    v3.encode(v11, #v12);
    for _, v14 in v12 do
        v10(v11, v14);
    end;
end;
v4.dictionary = function(v15, v16) --[[ Line: 45 ]] --[[ Name: dictionary ]]
    -- upvalues: v3 (copy), v10 (copy)
    local v17 = 0;
    for _ in v16 do
        v17 = v17 + 1;
    end;
    v3.encode(v15, v17);
    for v19, v20 in v16 do
        v10(v15, v19);
        v10(v15, v20);
    end;
end;
v4["nil"] = function() --[[ Line: 59 ]]

end;
v4.string = function(v21, v22) --[[ Line: 61 ]] --[[ Name: string ]]
    -- upvalues: v3 (copy)
    v3.encode(v21, #v22);
    v21.writestring(v22);
end;
v4.number = function(v23, v24) --[[ Line: 66 ]] --[[ Name: number ]]
    v23.writef64(v24);
end;
v4.boolean = function(v25, v26) --[[ Line: 70 ]] --[[ Name: boolean ]]
    v25.writeu8(v26 and 1 or 0);
end;
v4.Vector2 = function(v27, v28) --[[ Line: 74 ]] --[[ Name: Vector2 ]]
    v27.writef32(v28.X);
    v27.writef32(v28.Y);
end;
v4.Vector3 = function(v29, v30) --[[ Line: 79 ]] --[[ Name: Vector3 ]]
    v29.writef32(v30.X);
    v29.writef32(v30.Y);
    v29.writef32(v30.Z);
end;
v4.Vector2int16 = function(v31, v32) --[[ Line: 85 ]] --[[ Name: Vector2int16 ]]
    v31.writei16(v32.X);
    v31.writei16(v32.Y);
end;
v4.Vector3int16 = function(v33, v34) --[[ Line: 90 ]] --[[ Name: Vector3int16 ]]
    v33.writei16(v34.X);
    v33.writei16(v34.Y);
    v33.writei16(v34.Z);
end;
v4.CFrame = function(v35, v36) --[[ Line: 96 ]] --[[ Name: CFrame ]]
    local v37, v38 = v36:ToAxisAngle();
    v37 = v37 * v38;
    v35.writef32(v36.Position.X);
    v35.writef32(v36.Position.Y);
    v35.writef32(v36.Position.Z);
    v35.writef32(v37.X);
    v35.writef32(v37.Y);
    v35.writef32(v37.Z);
end;
return {
    serializers = v4, 
    serialize = v10
};