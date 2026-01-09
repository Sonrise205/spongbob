local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.PubTypes);
local v2 = require(l_Parent_0.Logging.logError);
local v3 = require(l_Parent_0.Utility.xtypeof);
return function(v4) --[[ Line: 13 ]] --[[ Name: Out ]]
    -- upvalues: v2 (copy), v3 (copy)
    return {
        type = "SpecialKey", 
        kind = "Out", 
        stage = "observer", 
        apply = function(_, v6, v7, v8) --[[ Line: 19 ]] --[[ Name: apply ]]
            -- upvalues: v4 (copy), v2 (ref), v3 (ref)
            local l_status_0, l_result_0 = pcall(v7.GetPropertyChangedSignal, v7, v4);
            if not l_status_0 then
                v2("invalidOutProperty", nil, v7.ClassName, v4);
                return;
            elseif v3(v6) ~= "State" or v6.kind ~= "Value" then
                v2("invalidOutType");
                return;
            else
                v6:set(v7[v4]);
                table.insert(v8, l_result_0:Connect(function() --[[ Line: 29 ]]
                    -- upvalues: v6 (copy), v7 (copy), v4 (ref)
                    v6:set(v7[v4]);
                end));
                table.insert(v8, function() --[[ Line: 33 ]]
                    -- upvalues: v6 (copy)
                    v6:set(nil);
                end);
                return;
            end;
        end
    };
end;