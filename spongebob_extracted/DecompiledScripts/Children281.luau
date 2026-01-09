local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.PubTypes);
local v2 = require(l_Parent_0.Logging.logWarn);
local v3 = require(l_Parent_0.State.Observer);
local v4 = require(l_Parent_0.Utility.xtypeof);
return {
    type = "SpecialKey", 
    kind = "Children", 
    stage = "descendants", 
    apply = function(_, v6, v7, v8) --[[ Line: 24 ]] --[[ Name: apply ]]
        -- upvalues: v4 (copy), v3 (copy), v2 (copy)
        local v9 = {};
        local v10 = {};
        local v11 = {};
        local v12 = {};
        local v13 = false;
        local v14 = nil;
        local function v29() --[[ Line: 38 ]] --[[ Name: updateChildren ]]
            -- upvalues: v13 (ref), v10 (ref), v9 (ref), v12 (ref), v11 (ref), v4 (ref), v7 (copy), v3 (ref), v14 (ref), v2 (ref), v6 (ref)
            if not v13 then
                return;
            else
                v13 = false;
                local l_v9_0 = v9;
                local l_v10_0 = v10;
                v10 = l_v9_0;
                v9 = l_v10_0;
                l_v9_0 = v11;
                l_v10_0 = v12;
                v12 = l_v9_0;
                v11 = l_v10_0;
                table.clear(v9);
                table.clear(v11);
                l_v9_0 = function(v17, v18) --[[ Line: 49 ]] --[[ Name: processChild ]]
                    -- upvalues: v4 (ref), v9 (ref), v10 (ref), v7 (ref), l_v9_0 (copy), v12 (ref), v3 (ref), v14 (ref), v11 (ref), v2 (ref)
                    local v19 = v4(v17);
                    if v19 == "Instance" then
                        v9[v17] = true;
                        if v10[v17] == nil then
                            v17.Parent = v7;
                            return;
                        else
                            v10[v17] = nil;
                            return;
                        end;
                    elseif v19 == "State" then
                        local v20 = v17:get(false);
                        if v20 ~= nil then
                            l_v9_0(v20, v18);
                        end;
                        local v21 = v12[v17];
                        if v21 == nil then
                            v21 = v3(v17):onChange(v14);
                        else
                            v12[v17] = nil;
                        end;
                        v11[v17] = v21;
                        return;
                    elseif v19 == "table" then
                        for v22, v23 in pairs(v17) do
                            local v24 = typeof(v22);
                            local v25 = nil;
                            if v24 == "string" then
                                v25 = v22;
                            elseif v24 == "number" and v18 ~= nil then
                                v25 = v18 .. "_" .. v22;
                            end;
                            l_v9_0(v23, v25);
                        end;
                        return;
                    else
                        v2("unrecognisedChildType", v19);
                        return;
                    end;
                end;
                if v6 ~= nil then
                    l_v9_0(v6);
                end;
                for v26 in pairs(v10) do
                    v26.Parent = nil;
                end;
                for _, v28 in pairs(v12) do
                    v28();
                end;
                return;
            end;
        end;
        v14 = function() --[[ Line: 130 ]]
            -- upvalues: v13 (ref), v29 (copy)
            if not v13 then
                v13 = true;
                task.defer(v29);
            end;
        end;
        table.insert(v8, function() --[[ Line: 137 ]]
            -- upvalues: v6 (ref), v13 (ref), v29 (copy)
            v6 = nil;
            v13 = true;
            v29();
        end);
        v13 = true;
        v29();
    end
};