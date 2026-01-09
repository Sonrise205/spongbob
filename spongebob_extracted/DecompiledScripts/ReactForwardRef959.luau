local l_console_0 = require(script.Parent.Parent:WaitForChild("shared")).console;
local l_ReactSymbols_0 = require(script.Parent.Parent:WaitForChild("shared")).ReactSymbols;
local _ = require(script.Parent.Parent:WaitForChild("shared"));
local l_REACT_FORWARD_REF_TYPE_0 = l_ReactSymbols_0.REACT_FORWARD_REF_TYPE;
local l_REACT_MEMO_TYPE_0 = l_ReactSymbols_0.REACT_MEMO_TYPE;
return {
    forwardRef = function(v5) --[[ Line: 27 ]]
        -- upvalues: l_REACT_MEMO_TYPE_0 (copy), l_console_0 (copy), l_REACT_FORWARD_REF_TYPE_0 (copy)
        if _G.__DEV__ then
            if typeof(v5) == "table" and v5["$$typeof"] == l_REACT_MEMO_TYPE_0 then
                l_console_0.error("forwardRef requires a render function but received a `memo` component. Instead of forwardRef(memo(...)), use memo(forwardRef(...)).");
            elseif typeof(v5) ~= "function" then
                l_console_0.error("forwardRef requires a render function but was given %s.", (typeof(v5)));
            else
                local v6, _ = debug.info(v5, "a");
                if v6 ~= 0 and v6 ~= 2 then
                    l_console_0.error("forwardRef render functions accept exactly two parameters: props and ref. %s", v6 == 1 and "Did you forget to use the ref parameter?" or "Any additional parameter will be undefined.");
                end;
            end;
        end;
        local v8 = {
            ["$$typeof"] = l_REACT_FORWARD_REF_TYPE_0, 
            render = v5
        };
        if _G.__DEV__ then
            local v9 = nil;
            do
                local l_v9_0 = v9;
                setmetatable(v8, {
                    __index = function(v11, v12) --[[ Line: 84 ]] --[[ Name: __index ]]
                        -- upvalues: l_v9_0 (ref)
                        if v12 == "displayName" then
                            return l_v9_0;
                        else
                            return (rawget(v11, v12));
                        end;
                    end, 
                    __newindex = function(v13, v14, v15) --[[ Line: 90 ]] --[[ Name: __newindex ]]
                        -- upvalues: l_v9_0 (ref)
                        if v14 == "displayName" then
                            l_v9_0 = v15;
                            return;
                        else
                            rawset(v13, v14, v15);
                            return;
                        end;
                    end
                });
            end;
        end;
        return v8;
    end
};