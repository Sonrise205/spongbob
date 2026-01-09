local v0 = require(script.Parent.TypeId);
local v1 = require(script.Parent.Vlq);
local v2 = require(script.Parent.isArray);
local v3 = require(script.Parent.Buffer.Writer);
local v4 = require(script.Parent.Serde.Serialization);
local v5 = nil;
local v6 = nil;
local v7 = nil;
local v8 = nil;
local function v9(v10) --[[ Line: 32 ]] --[[ Name: copyDeep ]]
    -- upvalues: v9 (copy)
    if type(v10) ~= "table" then
        return v10;
    else
        local v11 = table.clone(v10);
        for v12, v13 in v10 do
            if type(v13) == "table" then
                v11[v12] = v9(v13);
            end;
        end;
        return v11;
    end;
end;
local function v23(v14, v15, v16, v17, v18, v19, v20) --[[ Line: 48 ]] --[[ Name: diffValue ]]
    -- upvalues: v2 (copy), v6 (ref), v5 (ref)
    if typeof(v14) ~= "table" or typeof(v15) ~= "table" then
        if v14 ~= v15 then
            v19[v16] = v15;
            return true;
        else
            return false;
        end;
    elseif v2(v14) and v2(v15) then
        local v21 = v6(v14, v15, v20);
        if v21 then
            v17[v16] = v21;
            return true;
        else
            return false;
        end;
    elseif not v2(v14) and not v2(v15) then
        local v22 = v5(v14, v15, v20);
        if v22 then
            v18[v16] = v22;
            return true;
        else
            return false;
        end;
    else
        v19[v16] = v15;
        return true;
    end;
end;
v6 = function(v24, v25, v26) --[[ Line: 90 ]] --[[ Name: diffArray ]]
    -- upvalues: v23 (copy), v9 (copy)
    if v24 == v25 then
        return nil;
    else
        local v27 = 0;
        local v28 = {};
        if #v24 > #v25 then
            v27 = #v24 - #v25;
        elseif #v25 > #v24 then
            for v29 = #v24 + 1, #v25 do
                table.insert(v28, v25[v29]);
            end;
        end;
        local v30 = {};
        local v31 = {};
        local v32 = {};
        local v33 = 0;
        for v34 = 1, math.min(#v24, #v25) do
            local v35 = v24[v34];
            local v36 = v25[v34];
            if v23(v35, v36, v34, v31, v32, v30, v26) then
                v33 = v33 + 1;
            end;
        end;
        if v27 > 0 or #v28 > 0 or v33 > 0 then
            if v26 then
                for _ = 1, v27 do
                    table.remove(v24, #v24);
                end;
                for _, v39 in v28 do
                    table.insert(v24, (v9(v39)));
                end;
                for v40, v41 in v30 do
                    v24[v40] = v9(v41);
                end;
            end;
            return {
                removals = v27, 
                additions = v28, 
                changes = v30, 
                arrayDiffs = v31, 
                dictionaryDiffs = v32, 
                changeCount = v33
            };
        else
            return nil;
        end;
    end;
end;
v5 = function(v42, v43, v44) --[[ Line: 148 ]] --[[ Name: diffDictionary ]]
    -- upvalues: v23 (copy), v9 (copy)
    if v42 == v43 then
        return nil;
    else
        local v45 = {};
        local v46 = 0;
        for v47 in v42 do
            if v43[v47] == nil then
                v45[v47] = true;
                v46 = v46 + 1;
            end;
        end;
        local v48 = {};
        local v49 = {};
        local v50 = {};
        local v51 = 0;
        for v52, v53 in v43 do
            local v54 = v42[v52];
            if v23(v54, v53, v52, v49, v50, v48, v44) then
                v51 = v51 + 1;
            end;
        end;
        if v46 > 0 or v51 > 0 then
            if v44 then
                for v55 in v45 do
                    v42[v55] = nil;
                end;
                for v56, v57 in v48 do
                    v42[v56] = v9(v57);
                end;
            end;
            return {
                removals = v45, 
                removalCount = v46, 
                changes = v48, 
                arrayDiffs = v49, 
                dictionaryDiffs = v50, 
                changeCount = v51
            };
        else
            return nil;
        end;
    end;
end;
v7 = function(v58, v59) --[[ Line: 199 ]] --[[ Name: writeArrayDiff ]]
    -- upvalues: v1 (copy), v4 (copy), v7 (ref), v8 (ref), v0 (copy)
    local l_removals_0 = v59.removals;
    local l_additions_0 = v59.additions;
    local l_changeCount_0 = v59.changeCount;
    local function _() --[[ Line: 204 ]] --[[ Name: writeRemovals ]]
        -- upvalues: v1 (ref), v58 (copy), l_removals_0 (copy)
        v1.encode(v58, l_removals_0);
    end;
    local _ = function() --[[ Line: 208 ]] --[[ Name: writeAdditions ]]
        -- upvalues: v1 (ref), v58 (copy), l_additions_0 (copy), v4 (ref)
        v1.encode(v58, #l_additions_0);
        for _, v65 in l_additions_0 do
            v4.serialize(v58, v65);
        end;
    end;
    local function v73() --[[ Line: 216 ]] --[[ Name: writeChanges ]]
        -- upvalues: v1 (ref), v58 (copy), l_changeCount_0 (copy), v59 (copy), v4 (ref), v7 (ref), v8 (ref)
        v1.encode(v58, l_changeCount_0);
        for v67, v68 in v59.changes do
            v1.encode(v58, v67);
            v4.serialize(v58, v68);
        end;
        for v69, v70 in v59.arrayDiffs do
            v1.encode(v58, v69);
            v7(v58, v70);
        end;
        for v71, v72 in v59.dictionaryDiffs do
            v1.encode(v58, v71);
            v8(v58, v72);
        end;
    end;
    if l_changeCount_0 > 0 then
        if l_removals_0 > 0 then
            v58.writeu8(v0.fromType("arrayChangesRemovals"));
            v1.encode(v58, l_removals_0);
            v73();
            return;
        elseif #l_additions_0 > 0 then
            v58.writeu8(v0.fromType("arrayChangesAdditions"));
            v1.encode(v58, #l_additions_0);
            for _, v75 in l_additions_0 do
                v4.serialize(v58, v75);
            end;
            v73();
            return;
        else
            v58.writeu8(v0.fromType("arrayChanges"));
            v73();
            return;
        end;
    elseif l_removals_0 > 0 then
        v58.writeu8(v0.fromType("arrayRemovals"));
        v1.encode(v58, l_removals_0);
        return;
    else
        if #l_additions_0 > 0 then
            v58.writeu8(v0.fromType("arrayAdditions"));
            v1.encode(v58, #l_additions_0);
            for _, v77 in l_additions_0 do
                v4.serialize(v58, v77);
            end;
        end;
        return;
    end;
end;
v8 = function(v78, v79) --[[ Line: 257 ]] --[[ Name: writeDictionaryDiff ]]
    -- upvalues: v0 (copy), v1 (copy), v4 (copy), v7 (ref), v8 (ref)
    local l_removalCount_0 = v79.removalCount;
    local l_changeCount_1 = v79.changeCount;
    local v82 = v0.fromType(l_removalCount_0 > 0 and l_changeCount_1 > 0 and "dictionaryRemovalsChanges" or l_removalCount_0 > 0 and "dictionaryRemovals" or "dictionaryChanges");
    v78.writeu8(v82);
    if l_removalCount_0 > 0 then
        v1.encode(v78, l_removalCount_0);
    end;
    for v83 in v79.removals do
        v4.serialize(v78, v83);
    end;
    if l_changeCount_1 > 0 then
        v1.encode(v78, l_changeCount_1);
    end;
    for v84, v85 in v79.changes do
        v4.serialize(v78, v84);
        v4.serialize(v78, v85);
    end;
    for v86, v87 in v79.arrayDiffs do
        v4.serialize(v78, v86);
        v7(v78, v87);
    end;
    for v88, v89 in v79.dictionaryDiffs do
        v4.serialize(v78, v88);
        v8(v78, v89);
    end;
end;
local function v95(v90, v91) --[[ Line: 312 ]] --[[ Name: diffImmutable ]]
    -- upvalues: v3 (copy), v2 (copy), v4 (copy), v6 (ref), v7 (ref), v5 (ref), v8 (ref)
    local v92 = v3.new();
    if typeof(v90) == "table" and typeof(v91) == "table" then
        if v2(v90) then
            if not v2(v91) then
                v4.serialize(v92, v91);
            else
                local v93 = v6(v90, v91, false);
                if v93 ~= nil then
                    v7(v92, v93);
                else
                    return nil;
                end;
            end;
        elseif v2(v91) then
            v4.serialize(v92, v91);
        else
            local v94 = v5(v90, v91, false);
            if v94 ~= nil then
                v8(v92, v94);
            else
                return nil;
            end;
        end;
        return v92.finish();
    else
        v4.serialize(v92, v91);
        return v92.finish();
    end;
end;
local function v101(v96, v97) --[[ Line: 370 ]] --[[ Name: diffMutable ]]
    -- upvalues: v3 (copy), v2 (copy), v4 (copy), v9 (copy), v6 (ref), v7 (ref), v5 (ref), v8 (ref)
    local v98 = v3.new();
    if typeof(v96) == "table" and typeof(v97) == "table" then
        if v2(v96) then
            if not v2(v97) then
                v4.serialize(v98, v97);
                v96 = v9(v97);
            else
                local v99 = v6(v96, v97, true);
                if v99 ~= nil then
                    v7(v98, v99);
                else
                    return nil;
                end;
            end;
        elseif v2(v97) then
            v4.serialize(v98, v97);
            v96 = v9(v97);
        else
            local v100 = v5(v96, v97, true);
            if v100 ~= nil then
                v8(v98, v100);
            else
                return nil;
            end;
        end;
        return v98.finish(), v96;
    else
        v4.serialize(v98, v97);
        return v98.finish(), (v9(v97));
    end;
end;
return {
    diffImmutable = v95, 
    diffMutable = v101
};