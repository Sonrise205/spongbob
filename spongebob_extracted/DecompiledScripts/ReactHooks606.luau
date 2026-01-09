local l_Array_0 = require(script.Parent.Parent:WaitForChild("luau-polyfill")).Array;
local l_console_0 = require(script.Parent.Parent:WaitForChild("shared")).console;
local _ = require(script.Parent.Parent:WaitForChild("shared"));
local _ = require(script.Parent.Parent:WaitForChild("shared"));
local l_ReactCurrentDispatcher_0 = require(script.Parent.Parent:WaitForChild("shared")).ReactSharedInternals.ReactCurrentDispatcher;
local function _() --[[ Line: 44 ]] --[[ Name: resolveDispatcher ]]
    -- upvalues: l_ReactCurrentDispatcher_0 (copy), l_console_0 (copy)
    local l_current_0 = l_ReactCurrentDispatcher_0.current;
    if _G.__DEV__ and l_current_0 == nil then
        l_console_0.error("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for one of the following reasons:\n1. You might have mismatching versions of React and the renderer (such as React DOM)\n2. You might be breaking the Rules of Hooks\n3. You might have more than one copy of React in the same app\nSee https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.");
    end;
    return l_current_0;
end;
return {
    useContext = function(v7, v8, ...) --[[ Line: 67 ]] --[[ Name: useContext ]]
        -- upvalues: l_ReactCurrentDispatcher_0 (copy), l_console_0 (copy), l_Array_0 (copy)
        local l_current_1 = l_ReactCurrentDispatcher_0.current;
        if _G.__DEV__ and l_current_1 == nil then
            l_console_0.error("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for one of the following reasons:\n1. You might have mismatching versions of React and the renderer (such as React DOM)\n2. You might be breaking the Rules of Hooks\n3. You might have more than one copy of React in the same app\nSee https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.");
        end;
        local l_l_current_1_0 = l_current_1;
        if _G.__DEV__ then
            if v8 ~= nil then
                l_console_0.error("useContext() second argument is reserved for future use in React. Passing it is not supported. You passed: %s.%s", v8, typeof(v8) == "number" and l_Array_0.isArray({
                    ...
                }) and "\n\nDid you call Array.map(useContext)? Calling Hooks inside a loop is not supported. Learn more at https://reactjs.org/link/rules-of-hooks" or "");
            end;
            if v7._context ~= nil then
                l_current_1 = v7._context;
                if l_current_1.Consumer == v7 then
                    l_console_0.error("Calling useContext(Context.Consumer) is not supported, may cause bugs, and will be removed in a future major release. Did you mean to call useContext(Context) instead?");
                elseif l_current_1.Provider == v7 then
                    l_console_0.error("Calling useContext(Context.Provider) is not supported. Did you mean to call useContext(Context) instead?");
                end;
            end;
        end;
        return l_l_current_1_0.useContext(v7, v8);
    end, 
    useState = function(v11, ...) --[[ Line: 108 ]] --[[ Name: useState ]]
        -- upvalues: l_ReactCurrentDispatcher_0 (copy), l_console_0 (copy)
        local l_current_2 = l_ReactCurrentDispatcher_0.current;
        if _G.__DEV__ and l_current_2 == nil then
            l_console_0.error("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for one of the following reasons:\n1. You might have mismatching versions of React and the renderer (such as React DOM)\n2. You might be breaking the Rules of Hooks\n3. You might have more than one copy of React in the same app\nSee https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.");
        end;
        return l_current_2.useState(v11, ...);
    end, 
    useReducer = function(v13, v14, v15) --[[ Line: 117 ]] --[[ Name: useReducer ]]
        -- upvalues: l_ReactCurrentDispatcher_0 (copy), l_console_0 (copy)
        local l_current_3 = l_ReactCurrentDispatcher_0.current;
        if _G.__DEV__ and l_current_3 == nil then
            l_console_0.error("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for one of the following reasons:\n1. You might have mismatching versions of React and the renderer (such as React DOM)\n2. You might be breaking the Rules of Hooks\n3. You might have more than one copy of React in the same app\nSee https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.");
        end;
        return l_current_3.useReducer(v13, v14, v15);
    end, 
    useRef = function(v17) --[[ Line: 128 ]] --[[ Name: useRef ]]
        -- upvalues: l_ReactCurrentDispatcher_0 (copy), l_console_0 (copy)
        local l_current_4 = l_ReactCurrentDispatcher_0.current;
        if _G.__DEV__ and l_current_4 == nil then
            l_console_0.error("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for one of the following reasons:\n1. You might have mismatching versions of React and the renderer (such as React DOM)\n2. You might be breaking the Rules of Hooks\n3. You might have more than one copy of React in the same app\nSee https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.");
        end;
        return l_current_4.useRef(v17);
    end, 
    useBinding = function(v19) --[[ Line: 135 ]] --[[ Name: useBinding ]]
        -- upvalues: l_ReactCurrentDispatcher_0 (copy), l_console_0 (copy)
        local l_current_5 = l_ReactCurrentDispatcher_0.current;
        if _G.__DEV__ and l_current_5 == nil then
            l_console_0.error("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for one of the following reasons:\n1. You might have mismatching versions of React and the renderer (such as React DOM)\n2. You might be breaking the Rules of Hooks\n3. You might have more than one copy of React in the same app\nSee https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.");
        end;
        return l_current_5.useBinding(v19);
    end, 
    useEffect = function(v21, v22) --[[ Line: 147 ]] --[[ Name: useEffect ]]
        -- upvalues: l_ReactCurrentDispatcher_0 (copy), l_console_0 (copy)
        local l_current_6 = l_ReactCurrentDispatcher_0.current;
        if _G.__DEV__ and l_current_6 == nil then
            l_console_0.error("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for one of the following reasons:\n1. You might have mismatching versions of React and the renderer (such as React DOM)\n2. You might be breaking the Rules of Hooks\n3. You might have more than one copy of React in the same app\nSee https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.");
        end;
        return l_current_6.useEffect(v21, v22);
    end, 
    useLayoutEffect = function(v24, v25) --[[ Line: 157 ]] --[[ Name: useLayoutEffect ]]
        -- upvalues: l_ReactCurrentDispatcher_0 (copy), l_console_0 (copy)
        local l_current_7 = l_ReactCurrentDispatcher_0.current;
        if _G.__DEV__ and l_current_7 == nil then
            l_console_0.error("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for one of the following reasons:\n1. You might have mismatching versions of React and the renderer (such as React DOM)\n2. You might be breaking the Rules of Hooks\n3. You might have more than one copy of React in the same app\nSee https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.");
        end;
        return l_current_7.useLayoutEffect(v24, v25);
    end, 
    useCallback = function(v27, v28) --[[ Line: 167 ]] --[[ Name: useCallback ]]
        -- upvalues: l_ReactCurrentDispatcher_0 (copy), l_console_0 (copy)
        local l_current_8 = l_ReactCurrentDispatcher_0.current;
        if _G.__DEV__ and l_current_8 == nil then
            l_console_0.error("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for one of the following reasons:\n1. You might have mismatching versions of React and the renderer (such as React DOM)\n2. You might be breaking the Rules of Hooks\n3. You might have more than one copy of React in the same app\nSee https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.");
        end;
        return l_current_8.useCallback(v27, v28);
    end, 
    useMemo = function(v30, v31) --[[ Line: 173 ]] --[[ Name: useMemo ]]
        -- upvalues: l_ReactCurrentDispatcher_0 (copy), l_console_0 (copy)
        local l_current_9 = l_ReactCurrentDispatcher_0.current;
        if _G.__DEV__ and l_current_9 == nil then
            l_console_0.error("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for one of the following reasons:\n1. You might have mismatching versions of React and the renderer (such as React DOM)\n2. You might be breaking the Rules of Hooks\n3. You might have more than one copy of React in the same app\nSee https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.");
        end;
        return l_current_9.useMemo(v30, v31);
    end, 
    useImperativeHandle = function(v33, v34, v35) --[[ Line: 179 ]] --[[ Name: useImperativeHandle ]]
        -- upvalues: l_ReactCurrentDispatcher_0 (copy), l_console_0 (copy)
        local l_current_10 = l_ReactCurrentDispatcher_0.current;
        if _G.__DEV__ and l_current_10 == nil then
            l_console_0.error("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for one of the following reasons:\n1. You might have mismatching versions of React and the renderer (such as React DOM)\n2. You might be breaking the Rules of Hooks\n3. You might have more than one copy of React in the same app\nSee https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.");
        end;
        return l_current_10.useImperativeHandle(v33, v34, v35);
    end, 
    useDebugValue = function(v37, v38) --[[ Line: 189 ]] --[[ Name: useDebugValue ]]
        -- upvalues: l_ReactCurrentDispatcher_0 (copy), l_console_0 (copy)
        if _G.__DEV__ then
            local l_current_11 = l_ReactCurrentDispatcher_0.current;
            if _G.__DEV__ and l_current_11 == nil then
                l_console_0.error("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for one of the following reasons:\n1. You might have mismatching versions of React and the renderer (such as React DOM)\n2. You might be breaking the Rules of Hooks\n3. You might have more than one copy of React in the same app\nSee https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.");
            end;
            return l_current_11.useDebugValue(v37, v38);
        else
            return nil;
        end;
    end, 
    emptyObject = {}, 
    useOpaqueIdentifier = function() --[[ Line: 214 ]]
        -- upvalues: l_ReactCurrentDispatcher_0 (copy), l_console_0 (copy)
        local l_current_12 = l_ReactCurrentDispatcher_0.current;
        if _G.__DEV__ and l_current_12 == nil then
            l_console_0.error("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for one of the following reasons:\n1. You might have mismatching versions of React and the renderer (such as React DOM)\n2. You might be breaking the Rules of Hooks\n3. You might have more than one copy of React in the same app\nSee https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.");
        end;
        return l_current_12.useOpaqueIdentifier();
    end, 
    useMutableSource = function(v41, v42, v43) --[[ Line: 220 ]]
        -- upvalues: l_ReactCurrentDispatcher_0 (copy), l_console_0 (copy)
        local l_current_13 = l_ReactCurrentDispatcher_0.current;
        if _G.__DEV__ and l_current_13 == nil then
            l_console_0.error("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for one of the following reasons:\n1. You might have mismatching versions of React and the renderer (such as React DOM)\n2. You might be breaking the Rules of Hooks\n3. You might have more than one copy of React in the same app\nSee https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.");
        end;
        return l_current_13.useMutableSource(v41, v42, v43);
    end
};