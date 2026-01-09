local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.Types);
local v2 = require(l_Parent_0.External);
local function v3(v4, v5) --[[ Line: 17 ]] --[[ Name: evaluate ]]
    -- upvalues: v2 (copy), v3 (copy)
    if v4.validity == "busy" then
        return v2.logError("infiniteLoop");
    else
        local v6 = v4.lastChange == nil;
        local v7 = v4.validity == "invalid";
        if v6 or v7 or v5 then
            local v8 = v6 or v5;
            if not v8 then
                for v9 in v4.dependencySet do
                    v3(v9, false);
                    if v9.lastChange > v4.lastChange then
                        v8 = true;
                        break;
                    end;
                end;
            end;
            local v10 = false;
            if v8 then
                for v11 in v4.dependencySet do
                    v11.dependentSet[v4] = nil;
                    v4.dependencySet[v11] = nil;
                end;
                v4.validity = "busy";
                v10 = v4:_evaluate() or v6;
            end;
            if v10 then
                v4.lastChange = os.clock();
            end;
            v4.validity = "valid";
            return v10;
        else
            return false;
        end;
    end;
end;
return v3;