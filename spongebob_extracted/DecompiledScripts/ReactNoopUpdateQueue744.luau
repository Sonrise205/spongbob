local l_console_0 = require(script.Parent.Parent:WaitForChild("shared")).console;
local v1 = {};
local function _(v2, v3) --[[ Line: 14 ]] --[[ Name: warnNoop ]]
    -- upvalues: v1 (copy), l_console_0 (copy)
    if _G.__DEV__ then
        local v4 = v2.__componentName or "ReactClass";
        local v5 = v4 .. "." .. v3;
        if v1[v5] then
            return;
        else
            l_console_0.error("Can't call %s on a component that is not yet mounted. This is a no-op, but it might indicate a bug in your application. Instead, assign to `self.state` directly with the desired state in the %s component's `init` method.", v3, v4);
            v1[v5] = true;
        end;
    end;
end;
return {
    isMounted = function(_) --[[ Line: 49 ]] --[[ Name: isMounted ]]
        return false;
    end, 
    enqueueForceUpdate = function(v8, _, _) --[[ Line: 67 ]] --[[ Name: enqueueForceUpdate ]]
        -- upvalues: v1 (copy), l_console_0 (copy)
        if _G.__DEV__ then
            local v11 = v8.__componentName or "ReactClass";
            local v12 = v11 .. "." .. "forceUpdate";
            if v1[v12] then
                return;
            else
                l_console_0.error("Can't call %s on a component that is not yet mounted. This is a no-op, but it might indicate a bug in your application. Instead, assign to `self.state` directly with the desired state in the %s component's `init` method.", "forceUpdate", v11);
                v1[v12] = true;
            end;
        end;
    end, 
    enqueueReplaceState = function(v13, _, _, _) --[[ Line: 83 ]] --[[ Name: enqueueReplaceState ]]
        -- upvalues: v1 (copy), l_console_0 (copy)
        if _G.__DEV__ then
            local v17 = v13.__componentName or "ReactClass";
            local v18 = v17 .. "." .. "replaceState";
            if v1[v18] then
                return;
            else
                l_console_0.error("Can't call %s on a component that is not yet mounted. This is a no-op, but it might indicate a bug in your application. Instead, assign to `self.state` directly with the desired state in the %s component's `init` method.", "replaceState", v17);
                v1[v18] = true;
            end;
        end;
    end, 
    enqueueSetState = function(v19, _, _, _) --[[ Line: 98 ]] --[[ Name: enqueueSetState ]]
        -- upvalues: v1 (copy), l_console_0 (copy)
        if _G.__DEV__ then
            local v23 = v19.__componentName or "ReactClass";
            local v24 = v23 .. "." .. "setState";
            if v1[v24] then
                return;
            else
                l_console_0.error("Can't call %s on a component that is not yet mounted. This is a no-op, but it might indicate a bug in your application. Instead, assign to `self.state` directly with the desired state in the %s component's `init` method.", "setState", v23);
                v1[v24] = true;
            end;
        end;
    end
};