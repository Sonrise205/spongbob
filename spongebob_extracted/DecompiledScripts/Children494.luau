local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.Types);
local v2 = require(l_Parent_0.External);
local v3 = require(l_Parent_0.Graph.Observer);
local v4 = require(l_Parent_0.State.peek);
local v5 = require(l_Parent_0.State.castToState);
local v6 = require(l_Parent_0.Memory.doCleanup);
return {
    type = "SpecialKey", 
    kind = "Children", 
    stage = "descendants", 
    apply = function(_, v8, v9, v10) --[[ Line: 28 ]] --[[ Name: apply ]]
        -- upvalues: v5 (copy), v4 (copy), v3 (copy), v2 (copy), v6 (copy)
        local v11 = {};
        local v12 = {};
        local v13 = {};
        local v14 = {};
        local function v15() --[[ Line: 44 ]] --[[ Name: updateChildren ]]
            -- upvalues: v12 (ref), v11 (ref), v14 (ref), v13 (ref), v10 (copy), v5 (ref), v4 (ref), v3 (ref), v15 (copy), v2 (ref), v9 (ref), v6 (ref)
            local l_v11_0 = v11;
            local l_v12_0 = v12;
            v12 = l_v11_0;
            v11 = l_v12_0;
            l_v11_0 = v13;
            l_v12_0 = v14;
            v14 = l_v11_0;
            v13 = l_v12_0;
            l_v11_0 = function(v18, v19) --[[ Line: 48 ]] --[[ Name: processChild ]]
                -- upvalues: v11 (ref), v12 (ref), v10 (ref), v5 (ref), v4 (ref), l_v11_0 (copy), v14 (ref), v3 (ref), v15 (ref), v13 (ref), v2 (ref)
                local v20 = typeof(v18);
                if v20 == "Instance" then
                    v11[v18] = true;
                    if v12[v18] == nil then
                        v18.Parent = v10;
                        return;
                    else
                        v12[v18] = nil;
                        return;
                    end;
                elseif v5(v18) then
                    local v21 = v4(v18);
                    if v21 ~= nil then
                        l_v11_0(v21, v19);
                    end;
                    local v22 = v14[v18];
                    if v22 == nil then
                        v22 = {};
                        v3(v22, v18):onChange(v15);
                    else
                        v14[v18] = nil;
                    end;
                    v13[v18] = v22;
                    return;
                elseif v20 == "table" then
                    for v23, v24 in pairs(v18) do
                        local v25 = typeof(v23);
                        local v26 = nil;
                        if v25 == "string" then
                            v26 = v23;
                        elseif v25 == "number" and v19 ~= nil then
                            v26 = v19 .. "_" .. v23;
                        end;
                        l_v11_0(v24, v26);
                    end;
                    return;
                else
                    v2.logWarn("unrecognisedChildType", v20);
                    return;
                end;
            end;
            if v9 ~= nil then
                l_v11_0(v9);
            end;
            for v27 in pairs(v12) do
                v27.Parent = nil;
            end;
            table.clear(v12);
            for _, v29 in pairs(v14) do
                v6(v29);
            end;
            table.clear(v14);
        end;
        table.insert(v8, function() --[[ Line: 140 ]]
            -- upvalues: v9 (ref), v15 (copy)
            v9 = nil;
            v15();
        end);
        v15();
    end
};