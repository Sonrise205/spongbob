local l_console_0 = require(script.Parent.Parent:WaitForChild("shared")).console;
local l_ReactSymbols_0 = require(script.Parent.Parent:WaitForChild("shared")).ReactSymbols;
local l_REACT_PROVIDER_TYPE_0 = l_ReactSymbols_0.REACT_PROVIDER_TYPE;
local l_REACT_CONTEXT_TYPE_0 = l_ReactSymbols_0.REACT_CONTEXT_TYPE;
return {
    createContext = function(v4, v5) --[[ Line: 23 ]]
        -- upvalues: l_REACT_CONTEXT_TYPE_0 (copy), l_REACT_PROVIDER_TYPE_0 (copy), l_console_0 (copy)
        local v6 = {
            ["$$typeof"] = l_REACT_CONTEXT_TYPE_0, 
            _calculateChangedBits = v5, 
            _currentValue = v4, 
            _currentValue2 = v4, 
            _threadCount = 0, 
            Provider = nil, 
            Consumer = nil, 
            displayName = nil, 
            _currentRenderer = nil, 
            _currentRenderer2 = nil
        };
        v6.Provider = {
            ["$$typeof"] = l_REACT_PROVIDER_TYPE_0, 
            _context = v6
        };
        local v7 = false;
        if _G.__DEV__ then
            local v8 = {
                ["$$typeof"] = l_REACT_CONTEXT_TYPE_0, 
                _context = v6, 
                _calculateChangedBits = v6._calculateChangedBits
            };
            setmetatable(v8, {
                __index = function(_, v10) --[[ Line: 68 ]] --[[ Name: __index ]]
                    -- upvalues: v6 (copy)
                    if v10 == "_currentValue" then
                        return v6._currentValue;
                    elseif v10 == "_currentValue2" then
                        return v6._currentValue2;
                    elseif v10 == "_threadCount" then
                        return v6._threadCount;
                    elseif v10 == "displayName" then
                        return v6.displayName;
                    else
                        return nil;
                    end;
                end, 
                __newindex = function(_, v12, v13) --[[ Line: 81 ]] --[[ Name: __newindex ]]
                    -- upvalues: v6 (copy), v7 (ref), l_console_0 (ref)
                    if v12 == "_currentValue" then
                        v6._currentValue = v13;
                        return;
                    elseif v12 == "_currentValue2" then
                        v6._currentValue2 = v13;
                        return;
                    elseif v12 == "_threadCount" then
                        v6._threadCount = v13;
                        return;
                    else
                        if v12 == "displayName" and not v7 then
                            l_console_0.warn("Setting `displayName` on Context.Consumer has no effect. " .. "You should set it directly on the context with Context.displayName = " .. v13 .. ".");
                            v7 = true;
                        end;
                        return;
                    end;
                end
            });
            v6.Consumer = v8;
        else
            v6.Consumer = v6;
        end;
        if _G.__DEV__ then
            v6._currentRenderer = nil;
            v6._currentRenderer2 = nil;
        end;
        return v6;
    end
};