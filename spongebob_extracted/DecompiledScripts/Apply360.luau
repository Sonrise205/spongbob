local v0 = require(script.Parent.Buffer.Reader);
local v1 = require(script.Parent.Serde.Deserialization);
local v2 = require(script.Parent.TypeId);
local v3 = require(script.Parent.Vlq);
local v4 = require(script.Parent.isArray);
local v5 = nil;
local v6 = nil;
local function v9(v7) --[[ Line: 14 ]] --[[ Name: deserialize ]]
    -- upvalues: v2 (copy), v1 (copy)
    local v8 = v7.readu8();
    return v1[v2.toType(v8)](v7);
end;
local function v19(v10, v11, v12, v13) --[[ Line: 21 ]] --[[ Name: applyValue ]]
    -- upvalues: v1 (copy), v4 (copy)
    local v14 = v1[v11](v10);
    if v13 then
        return v14;
    elseif typeof(v12) ~= "table" or typeof(v14) ~= "table" then
        return v14;
    elseif v4(v14) then
        table.clear(v12);
        for v15, v16 in v14 do
            v12[v15] = v16;
        end;
        return v12;
    else
        table.clear(v12);
        for v17, v18 in v14 do
            v12[v17] = v18;
        end;
        return v12;
    end;
end;
local function v27(v20, v21, v22, v23, v24) --[[ Line: 49 ]] --[[ Name: applyChange ]]
    -- upvalues: v2 (copy), v6 (ref), v5 (ref), v19 (copy)
    local v25 = v20.readu8();
    local v26 = v2.toType(v25);
    if v2.isArrayDiff(v25) then
        v22[v23] = v6(v20, v26, v21[v23], v24);
        return;
    elseif v2.isDictionaryDiff(v25) then
        v22[v23] = v5(v20, v26, v21[v23], v24);
        return;
    else
        v22[v23] = v19(v20, v26, v21[v23], v24);
        return;
    end;
end;
v6 = function(v28, v29, v30, v31) --[[ Line: 62 ]] --[[ Name: applyArray ]]
    -- upvalues: v3 (copy), v9 (copy), v27 (copy)
    local v32 = true;
    if v29 ~= "arrayRemovals" then
        v32 = v29 == "arrayChangesRemovals";
    end;
    local v33 = true;
    if v29 ~= "arrayAdditions" then
        v33 = v29 == "arrayChangesAdditions";
    end;
    local v34 = false;
    if v29 ~= "arrayRemovals" then
        v34 = v29 ~= "arrayAdditions";
    end;
    local v35 = if v32 then v3.decode(v28) else 0;
    local v36 = if v33 then v3.decode(v28) else 0;
    local v37 = if v31 then table.create(#v30 - v35 + v36) else v30;
    if v31 then
        table.move(v30, 1, #v30 - v35, 1, v37);
    end;
    if v32 and not v31 then
        for _ = 1, v35 do
            table.remove(v37, #v37);
        end;
    end;
    if v33 then
        for _ = 1, v36 do
            table.insert(v37, v9(v28));
        end;
    end;
    if v34 then
        for _ = 1, v3.decode(v28) do
            local v41 = v3.decode(v28);
            v27(v28, v30, v37, v41, v31);
        end;
    end;
    return v37;
end;
v5 = function(v42, v43, v44, v45) --[[ Line: 101 ]] --[[ Name: applyDictionary ]]
    -- upvalues: v3 (copy), v2 (copy), v1 (copy), v27 (copy)
    local v46 = if v45 then table.clone(v44) else v44;
    local v47 = v43 ~= "dictionaryChanges";
    local v48 = v43 ~= "dictionaryRemovals";
    if v47 then
        for _ = 1, v3.decode(v42) do
            local v50 = v42.readu8();
            v46[v1[v2.toType(v50)](v42)] = nil;
        end;
    end;
    if v48 then
        for _ = 1, v3.decode(v42) do
            local v52 = v42.readu8();
            local v53 = v1[v2.toType(v52)](v42);
            v27(v42, v44, v46, v53, v45);
        end;
    end;
    return v46;
end;
local function v60(v54, v55, v56) --[[ Line: 130 ]] --[[ Name: apply ]]
    -- upvalues: v0 (copy), v2 (copy), v5 (ref), v6 (ref), v19 (copy)
    local v57 = v0.new(v55);
    local v58 = v57.readu8();
    local v59 = v2.toType(v58);
    if v2.isDictionaryDiff(v58) then
        return v5(v57, v59, v54, v56);
    elseif v2.isArrayDiff(v58) then
        return v6(v57, v59, v54, v56);
    else
        return (v19(v57, v59, v54, v56));
    end;
end;
return {
    applyImmutable = function(v61, v62) --[[ Line: 166 ]] --[[ Name: applyImmutable ]]
        -- upvalues: v60 (copy)
        return v60(v61, v62, true);
    end, 
    applyMutable = function(v63, v64) --[[ Line: 202 ]] --[[ Name: applyMutable ]]
        -- upvalues: v60 (copy)
        return v60(v63, v64, false);
    end
};