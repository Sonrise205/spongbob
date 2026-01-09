local l_shared_0 = require(script.Parent.Parent:WaitForChild("shared"));
local l_console_0 = l_shared_0.console;
local v2 = require(script.Parent.Parent:WaitForChild("luau-polyfill"));
local l_Array_0 = v2.Array;
local l_Object_0 = v2.Object;
local l_inspect_0 = v2.util.inspect;
local l_ReactSymbols_0 = l_shared_0.ReactSymbols;
local l_REACT_MEMO_TYPE_0 = l_ReactSymbols_0.REACT_MEMO_TYPE;
local l_REACT_ELEMENT_TYPE_0 = l_ReactSymbols_0.REACT_ELEMENT_TYPE;
local l_isValidElementType_0 = l_shared_0.isValidElementType;
local l_getComponentName_0 = l_shared_0.getComponentName;
return {
    memo = function(v11, v12) --[[ Line: 37 ]]
        -- upvalues: l_isValidElementType_0 (copy), l_Object_0 (copy), l_Array_0 (copy), l_REACT_ELEMENT_TYPE_0 (copy), l_getComponentName_0 (copy), l_inspect_0 (copy), l_console_0 (copy), l_REACT_MEMO_TYPE_0 (copy)
        if _G.__DEV__ and not l_isValidElementType_0(v11) then
            local v13 = "";
            if v11 == nil or typeof(v11) == "table" and #l_Object_0.keys(v11) == 0 then
                v13 = v13 .. " You likely forgot to export your component from the file it's defined in, or you might have mixed up default and named imports.";
            end;
            local v14 = nil;
            if v11 == nil then
                v14 = "nil";
            elseif l_Array_0.isArray(v11) then
                v14 = "array";
            elseif v11 ~= nil and typeof(v11) == "table" and v11["$$typeof"] == l_REACT_ELEMENT_TYPE_0 then
                v14 = string.format("<%s />", l_getComponentName_0(v11.type) or "UNKNOWN");
                v13 = " Did you accidentally export a JSX literal or Element instead of a component?";
            else
                v14 = typeof(v11);
                if v11 ~= nil then
                    v13 = "\n" .. l_inspect_0(v11);
                end;
            end;
            l_console_0.error("memo: The first argument must be a component. Instead received: `%s`.%s", v14, v13);
        end;
        local v15 = {
            ["$$typeof"] = l_REACT_MEMO_TYPE_0, 
            type = v11, 
            compare = v12 or nil
        };
        if _G.__DEV__ then
            local v16 = nil;
            do
                local l_v16_0 = v16;
                setmetatable(v15, {
                    __index = function(v18, v19) --[[ Line: 103 ]] --[[ Name: __index ]]
                        -- upvalues: l_v16_0 (ref)
                        if v19 == "displayName" then
                            return l_v16_0;
                        else
                            return (rawget(v18, v19));
                        end;
                    end, 
                    __newindex = function(v20, v21, v22) --[[ Line: 109 ]] --[[ Name: __newindex ]]
                        -- upvalues: l_v16_0 (ref), v11 (copy)
                        if v21 == "displayName" then
                            l_v16_0 = v22;
                            if typeof(v11) == "table" and v11.displayName == nil then
                                v11.displayName = l_v16_0;
                                return;
                            end;
                        else
                            rawset(v20, v21, v22);
                        end;
                    end
                });
            end;
        end;
        return v15;
    end
};