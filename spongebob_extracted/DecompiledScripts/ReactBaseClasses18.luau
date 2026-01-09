local l___DEV___0 = _G.__DEV__;
local l___COMPAT_WARNINGS___0 = _G.__COMPAT_WARNINGS__;
local l_Object_0 = require(script.Parent.Parent:WaitForChild("luau-polyfill")).Object;
local l_console_0 = require(script.Parent.Parent:WaitForChild("shared")).console;
local _ = require(script.Parent.Parent:WaitForChild("shared"));
local l_ReactNoopUpdateQueue_0 = require(script.Parent:WaitForChild("ReactNoopUpdateQueue"));
local v6 = {};
if l___DEV___0 then
    l_Object_0.freeze(v6);
end;
local l_UninitializedState_0 = require(script.Parent.Parent:WaitForChild("shared")).UninitializedState;
local v8 = {
    isReactComponent = true
};
local function _(v9) --[[ Line: 48 ]] --[[ Name: trimPath ]]
    local v10 = string.match(v9, "%.%u[%.%w]-$");
    if v10 then
        return string.gsub(v10, "^%.", "");
    else
        return v9;
    end;
end;
local function _(v12, v13, v14) --[[ Line: 62 ]] --[[ Name: warnAboutExistingLifecycle ]]
    -- upvalues: l_console_0 (copy)
    l_console_0.warn("%s already defined '%s', but it also defining the deprecated Roact method '%s'. %s should only implement one of these methods, preferably using the non-deprecated name.", v12, v14, v13, v12);
end;
local function _(v16, v17, v18) --[[ Line: 72 ]] --[[ Name: warnAboutDeprecatedLifecycleName ]]
    -- upvalues: l___DEV___0 (copy), l___COMPAT_WARNINGS___0 (copy), l_console_0 (copy)
    if l___DEV___0 and l___COMPAT_WARNINGS___0 then
        local v19, v20 = debug.info(3, "sln");
        local l_warn_0 = l_console_0.warn;
        local v22 = "%s is using method '%s', which is no longer supported and should be updated to '%s'\nFile: %s:%s";
        local l_v16_0 = v16;
        local l_v17_0 = v17;
        local l_v18_0 = v18;
        local v26 = string.match(v19, "%.%u[%.%w]-$");
        l_warn_0(v22, l_v16_0, l_v17_0, l_v18_0, if v26 then string.gsub(v26, "^%.", "") else v19, (tostring(v20)));
    end;
end;
local v28 = {
    didMount = "componentDidMount", 
    shouldUpdate = "shouldComponentUpdate", 
    willUpdate = "UNSAFE_componentWillUpdate", 
    didUpdate = "componentDidUpdate", 
    willUnmount = "componentWillUnmount"
};
local function v47(v29, v30, v31) --[[ Line: 94 ]] --[[ Name: handleNewLifecycle ]]
    -- upvalues: v28 (copy), l_console_0 (copy), l___DEV___0 (copy), l___COMPAT_WARNINGS___0 (copy)
    if v28[v30] ~= nil then
        if v29[v28[v30]] ~= nil then
            local l___componentName_0 = v29.__componentName;
            local l_v30_0 = v30;
            local v34 = v28[v30];
            l_console_0.warn("%s already defined '%s', but it also defining the deprecated Roact method '%s'. %s should only implement one of these methods, preferably using the non-deprecated name.", l___componentName_0, v34, l_v30_0, l___componentName_0);
        elseif v30 == "willUpdate" and v29.componentWillUpdate then
            local l___componentName_1 = v29.__componentName;
            l_console_0.warn("%s already defined '%s', but it also defining the deprecated Roact method '%s'. %s should only implement one of these methods, preferably using the non-deprecated name.", l___componentName_1, "UNSAFE_componentWillUpdate", v30, l___componentName_1);
        else
            local l___componentName_2 = v29.__componentName;
            local l_v30_1 = v30;
            local v38 = v28[v30];
            if l___DEV___0 and l___COMPAT_WARNINGS___0 then
                local v39, v40 = debug.info(3, "sln");
                local l_warn_1 = l_console_0.warn;
                local v42 = "%s is using method '%s', which is no longer supported and should be updated to '%s'\nFile: %s:%s";
                local l_l___componentName_2_0 = l___componentName_2;
                local l_l_v30_1_0 = l_v30_1;
                local l_v38_0 = v38;
                local v46 = string.match(v39, "%.%u[%.%w]-$");
                l_warn_1(v42, l_l___componentName_2_0, l_l_v30_1_0, l_v38_0, if v46 then string.gsub(v46, "^%.", "") else v39, (tostring(v40)));
            end;
        end;
        v30 = v28[v30];
    end;
    rawset(v29, v30, v31);
end;
local v49 = {
    __newindex = v47, 
    __index = v8, 
    __tostring = function(v48) --[[ Line: 124 ]] --[[ Name: __tostring ]]
        return v48.__componentName;
    end
};
local v50 = setmetatable({
    __componentName = "Component"
}, v49);
local v51 = not _G.__TESTEZ_RUNNING_TEST__ and 900 or 0;
local v52 = 1;
local v53 = table.create(v51);
for _ = 1, v51 do
    table.insert(v53, {
        props = nil, 
        context = nil, 
        state = l_UninitializedState_0, 
        __refs = v6, 
        __updater = l_ReactNoopUpdateQueue_0
    });
end;
local function v61(v55, v56, v57) --[[ Line: 160 ]] --[[ Name: setStateInInit ]]
    -- upvalues: l___DEV___0 (copy), l_console_0 (copy), l_Object_0 (copy)
    if l___DEV___0 and v57 ~= nil then
        l_console_0.warn("Received a `callback` argument to `setState` during initialization of \"%s\". The callback behavior is not supported when using `setState` in `init`.\n\nConsider defining similar behavior in a `compontentDidMount` method instead.", v55.__componentName);
    end;
    local v58 = v56 and type(v56);
    if v56 == nil or v58 ~= "table" and v58 ~= "function" then
        error("setState(...): takes an object of state variables to update or a function which returns an object of state variables.");
    end;
    local l_state_0 = v55.state;
    local v60 = nil;
    v60 = if v58 == "function" then v56(l_state_0, v55.props) else v56;
    v55.state = l_Object_0.assign({}, l_state_0, v60);
end;
v50.extend = function(v62, v63) --[[ Line: 200 ]] --[[ Name: extend ]]
    -- upvalues: l___COMPAT_WARNINGS___0 (copy), l_console_0 (copy), v52 (ref), v51 (copy), v53 (copy), l_UninitializedState_0 (copy), v6 (copy), l_ReactNoopUpdateQueue_0 (copy), v61 (copy)
    if v63 == nil then
        if l___COMPAT_WARNINGS___0 then
            l_console_0.warn("Component:extend() accepting no arguments is deprecated, and will not be supported in a future version of Roact. Please provide an explicit name.");
        end;
        v63 = "";
    elseif type(v63) ~= "string" then
        error("Component class name must be a string");
    end;
    local v64 = {
        __componentName = v63, 
        setState = v62.setState, 
        forceUpdate = v62.forceUpdate, 
        init = nil
    };
    v64.__index = v64;
    v64.__ctor = function(v65, v66, v67) --[[ Line: 234 ]] --[[ Name: __ctor ]]
        -- upvalues: v52 (ref), v51 (ref), v53 (ref), l_UninitializedState_0 (ref), v6 (ref), l_ReactNoopUpdateQueue_0 (ref), v64 (copy), v61 (ref)
        local v68 = nil;
        if v52 <= v51 then
            v68 = v53[v52];
            v68.props = v65;
            v68.context = v66;
            v53[v52] = nil;
            v52 = v52 + 1;
        else
            v68 = {
                props = v65, 
                context = v66, 
                state = l_UninitializedState_0, 
                __refs = v6, 
                __updater = v67 or l_ReactNoopUpdateQueue_0
            };
        end;
        v68 = setmetatable(v68, v64);
        if v64.init and type(v64.init) == "function" then
            v68.setState = v61;
            v64.init(v68, v65, v66);
            v68.setState = nil;
        end;
        return v68;
    end;
    setmetatable(v64, (getmetatable(v62)));
    return v64;
end;
v50.setState = function(v69, v70, v71) --[[ Line: 326 ]] --[[ Name: setState ]]
    if v70 ~= nil and type(v70) ~= "table" and type(v70) ~= "function" then
        error("setState(...): takes an object of state variables to update or a function which returns an object of state variables.");
    end;
    v69.__updater.enqueueSetState(v69, v70, v71, "setState");
end;
v50.forceUpdate = function(v72, v73) --[[ Line: 355 ]] --[[ Name: forceUpdate ]]
    v72.__updater.enqueueForceUpdate(v72, v73, "forceUpdate");
end;
if l___DEV___0 then
    local v74 = {
        isMounted = {
            "isMounted", 
            "Instead, make sure to clean up subscriptions and pending requests in componentWillUnmount to prevent memory leaks."
        }, 
        replaceState = {
            "replaceState", 
            "Refactor your code to use setState instead (see https://github.com/facebook/react/issues/3236)."
        }
    };
    local function _(v75, v76) --[[ Line: 379 ]]
        -- upvalues: v50 (copy), l_console_0 (copy)
        v50[v75] = function() --[[ Line: 380 ]]
            -- upvalues: l_console_0 (ref), v76 (copy)
            l_console_0.warn("%s(...) is deprecated in plain JavaScript React classes. %s", v76[1], v76[2]);
            return nil;
        end;
    end;
    for v78, _ in v74 do
        if v74[v78] ~= nil then
            local v80 = v74[v78];
            v50[v78] = function() --[[ Line: 380 ]]
                -- upvalues: l_console_0 (copy), v80 (copy)
                l_console_0.warn("%s(...) is deprecated in plain JavaScript React classes. %s", v80[1], v80[2]);
                return nil;
            end;
        end;
    end;
end;
local v81 = v50:extend("PureComponent");
v81.extend = v50.extend;
local v82 = {
    isReactComponent = true, 
    isPureReactComponent = true
};
setmetatable(v81, {
    __newindex = v47, 
    __index = v82, 
    __tostring = function(v83) --[[ Line: 427 ]] --[[ Name: __tostring ]]
        return v83.__componentName;
    end
});
return {
    Component = v50, 
    PureComponent = v81
};