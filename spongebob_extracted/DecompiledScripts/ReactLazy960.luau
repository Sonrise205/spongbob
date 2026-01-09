local l_console_0 = require(script.Parent.Parent:WaitForChild("shared")).console;
local l_inspect_0 = require(script.Parent.Parent:WaitForChild("luau-polyfill")).util.inspect;
local _ = require(script.Parent.Parent:WaitForChild("shared"));
local l_REACT_LAZY_TYPE_0 = require(script.Parent.Parent:WaitForChild("shared")).ReactSymbols.REACT_LAZY_TYPE;
lazyInitializer = function(v4) --[[ Line: 71 ]] --[[ Name: lazyInitializer ]]
    -- upvalues: l_console_0 (copy), l_inspect_0 (copy)
    if v4._status == -1 then
        local v5 = v4._result();
        v4._status = 0;
        v4._result = v5;
        v5:andThen(function(v6) --[[ Line: 79 ]]
            -- upvalues: v4 (copy), l_console_0 (ref), l_inspect_0 (ref)
            if v4._status == 0 then
                local l_default_0 = v6.default;
                if _G.__DEV__ and l_default_0 == nil then
                    l_console_0.error("lazy: Expected the result of a dynamic import() call. Instead received: `%s`\n\nYour code should look like: \n  local MyComponent = lazy(function() return reqquire(script.Parent.MyComponent) end)", l_inspect_0(v6));
                end;
                local l_v4_0 = v4;
                l_v4_0._status = 1;
                l_v4_0._result = l_default_0;
            end;
        end, function(v9) --[[ Line: 100 ]]
            -- upvalues: v4 (copy)
            if v4._status == 0 then
                local l_v4_1 = v4;
                l_v4_1._status = 2;
                l_v4_1._result = v9;
            end;
        end);
    end;
    if v4._status == 1 then
        return v4._result;
    else
        error(v4._result);
        return;
    end;
end;
return {
    lazy = function(v11) --[[ Line: 118 ]]
        -- upvalues: l_REACT_LAZY_TYPE_0 (copy), l_console_0 (copy)
        local v12 = {
            _status = -1, 
            _result = v11
        };
        local v13 = {
            ["$$typeof"] = l_REACT_LAZY_TYPE_0, 
            _payload = v12, 
            _init = lazyInitializer
        };
        if _G.__DEV__ then
            local v14 = nil;
            local v15 = nil;
            do
                local l_v14_0, l_v15_0 = v14, v15;
                setmetatable(v13, {
                    __index = function(_, v19) --[[ Line: 140 ]] --[[ Name: __index ]]
                        -- upvalues: l_v14_0 (ref), l_v15_0 (ref)
                        if v19 == "defaultProps" then
                            return l_v14_0;
                        elseif v19 == "propTypes" then
                            return l_v15_0;
                        else
                            return;
                        end;
                    end, 
                    __newindex = function(v20, v21, v22) --[[ Line: 149 ]] --[[ Name: __newindex ]]
                        -- upvalues: l_console_0 (ref), l_v14_0 (ref), l_v15_0 (ref)
                        if v21 == "defaultProps" then
                            l_console_0.error("React.lazy(...): It is not supported to assign `defaultProps` to a lazy component import. Either specify them where the component is defined, or create a wrapping component around it.");
                            l_v14_0 = v22;
                            setmetatable(v20, {
                                __index = function() --[[ Line: 160 ]] --[[ Name: __index ]]

                                end, 
                                __newindex = function() --[[ Line: 161 ]] --[[ Name: __newindex ]]

                                end
                            });
                        end;
                        if v21 == "propTypes" then
                            l_console_0.error("React.lazy(...): It is not supported to assign `propTypes` to a lazy component import. Either specify them where the component is defined, or create a wrapping component around it.");
                            l_v15_0 = v22;
                            setmetatable(v20, {
                                __index = function() --[[ Line: 174 ]] --[[ Name: __index ]]

                                end, 
                                __newindex = function() --[[ Line: 175 ]] --[[ Name: __newindex ]]

                                end
                            });
                        end;
                    end
                });
            end;
        end;
        return v13;
    end
};