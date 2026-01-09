local l___DEV___0 = _G.__DEV__;
local l_Error_0 = require(script.Parent.Parent:WaitForChild("luau-polyfill")).Error;
local l_console_0 = require(script.Parent.Parent:WaitForChild("shared")).console;
local _ = require(script.Parent.Parent:WaitForChild("shared"));
local _ = require(script.Parent:WaitForChild("ReactLazy"));
local l_getComponentName_0 = require(script.Parent.Parent:WaitForChild("shared")).getComponentName;
local l_REACT_ELEMENT_TYPE_0 = require(script.Parent.Parent:WaitForChild("shared")).ReactSymbols.REACT_ELEMENT_TYPE;
local l_ReactCurrentOwner_0 = require(script.Parent.Parent:WaitForChild("shared")).ReactSharedInternals.ReactCurrentOwner;
local v8 = {
    key = true, 
    ref = true, 
    __self = true, 
    __source = true
};
local v9 = nil;
local v10 = nil;
local v11 = nil;
if l___DEV___0 then
    v11 = {};
end;
local v12 = {};
local function _(v13) --[[ Line: 59 ]] --[[ Name: hasValidRef ]]
    -- upvalues: l___DEV___0 (copy)
    if l___DEV___0 and v13.ref ~= nil and type(v13.ref) == "table" and v13.ref.isReactWarning then
        return false;
    else
        return v13.ref ~= nil;
    end;
end;
local function _(v15) --[[ Line: 73 ]] --[[ Name: hasValidKey ]]
    -- upvalues: l___DEV___0 (copy)
    if l___DEV___0 and v15.key ~= nil and type(v15.key) == "table" and v15.key.isReactWarning then
        return false;
    else
        return v15.key ~= nil;
    end;
end;
local v17 = {
    isReactWarning = true
};
local function v23(v18, v19) --[[ Line: 92 ]] --[[ Name: defineKeyPropWarningGetter ]]
    -- upvalues: l___DEV___0 (copy), v9 (ref), l_console_0 (copy), v17 (copy)
    local function _() --[[ Line: 93 ]]
        -- upvalues: l___DEV___0 (ref), v9 (ref), l_console_0 (ref), v19 (copy)
        if l___DEV___0 and not v9 then
            v9 = true;
            l_console_0.error("%s: `key` is not a prop. Trying to access it will result in `nil` being returned. If you need to access the same value within the child component, you should pass it as a different prop. (https://reactjs.org/link/special-props)", v19);
        end;
    end;
    v18.key = nil;
    setmetatable(v18, {
        __index = function(_, v22) --[[ Line: 112 ]] --[[ Name: __index ]]
            -- upvalues: l___DEV___0 (ref), v9 (ref), l_console_0 (ref), v19 (copy), v17 (ref)
            if v22 == "key" then
                if l___DEV___0 and not v9 then
                    v9 = true;
                    l_console_0.error("%s: `key` is not a prop. Trying to access it will result in `nil` being returned. If you need to access the same value within the child component, you should pass it as a different prop. (https://reactjs.org/link/special-props)", v19);
                end;
                return v17;
            else
                return nil;
            end;
        end
    });
end;
local function v29(v24, v25) --[[ Line: 124 ]] --[[ Name: defineRefPropWarningGetter ]]
    -- upvalues: l___DEV___0 (copy), v10 (ref), l_console_0 (copy), v17 (copy)
    local function _() --[[ Line: 127 ]]
        -- upvalues: l___DEV___0 (ref), v10 (ref), l_console_0 (ref), v25 (copy)
        if l___DEV___0 and not v10 then
            v10 = true;
            l_console_0.error("%s: `ref` is not a prop. Trying to access it will result in `nil` being returned. If you need to access the same value within the child component, you should pass it as a different prop. (https://reactjs.org/link/special-props)", v25);
        end;
    end;
    v24.ref = nil;
    setmetatable(v24, {
        __index = function(_, v28) --[[ Line: 146 ]] --[[ Name: __index ]]
            -- upvalues: l___DEV___0 (ref), v10 (ref), l_console_0 (ref), v25 (copy), v17 (ref)
            if v28 == "ref" then
                if l___DEV___0 and not v10 then
                    v10 = true;
                    l_console_0.error("%s: `ref` is not a prop. Trying to access it will result in `nil` being returned. If you need to access the same value within the child component, you should pass it as a different prop. (https://reactjs.org/link/special-props)", v25);
                end;
                return v17;
            else
                return nil;
            end;
        end
    });
end;
local function v32(v30) --[[ Line: 158 ]] --[[ Name: warnIfStringRefCannotBeAutoConverted ]]
    -- upvalues: l___DEV___0 (copy), l_ReactCurrentOwner_0 (copy), l_getComponentName_0 (copy), v11 (ref)
    if l___DEV___0 and type(v30.ref) == "string" and l_ReactCurrentOwner_0.current then
        local v31 = l_getComponentName_0(l_ReactCurrentOwner_0.current.type);
        if not v11[v31] then
            error(string.format("Component \"%s\" contains the string ref \"%s\". Support for string refs has been removed. We recommend using useRef() or createRef() instead. Learn more about using refs safely here: https://reactjs.org/link/strict-mode-string-ref", v31 or "Unknown", v30.ref));
        end;
    end;
end;
local function v45(v33, v34, v35, v36, v37, v38, v39) --[[ Line: 209 ]] --[[ Name: ReactElement ]]
    -- upvalues: l_REACT_ELEMENT_TYPE_0 (copy), l___DEV___0 (copy)
    local v40 = {
        type = v33, 
        key = v34, 
        ref = v35, 
        props = v39, 
        _owner = v38, 
        ["$$typeof"] = l_REACT_ELEMENT_TYPE_0
    };
    if l___DEV___0 then
        local v41 = {
            validated = false
        };
        v40._store = setmetatable({}, {
            __index = v41, 
            __newindex = function(v42, v43, v44) --[[ Line: 246 ]] --[[ Name: __newindex ]]
                -- upvalues: v41 (copy)
                if v43 == "validated" then
                    v41.validated = v44;
                    return;
                else
                    rawset(v42, v43, v44);
                    return;
                end;
            end
        });
        setmetatable(v40, {
            __index = {
                _self = v36, 
                _source = v37
            }
        });
    end;
    return v40;
end;
v12.jsx = function(_, _, _) --[[ Line: 277 ]]
    error("JSX is currently unsupported");
end;
v12.jsxDEV = function(_, _, _, _, _) --[[ Line: 332 ]]
    error("JSX is currently unsupported");
    return nil;
end;
v12.createElement = function(v54, v55, ...) --[[ Line: 408 ]] --[[ Name: createElement ]]
    -- upvalues: l___DEV___0 (copy), v32 (copy), v23 (copy), v29 (copy), v45 (copy), l_ReactCurrentOwner_0 (copy)
    local v56 = if v55 ~= nil then table.clone(v55) else {};
    local v57 = nil;
    local v58 = nil;
    local v59 = nil;
    if v55 ~= nil then
        if (not (l___DEV___0 and v55.ref ~= nil and type(v55.ref) == "table") or not v55.ref.isReactWarning) and v55.ref ~= nil then
            v58 = v55.ref;
            if l___DEV___0 then
                v32(v55);
            end;
        end;
        if (not (l___DEV___0 and v55.key ~= nil and type(v55.key) == "table") or not v55.key.isReactWarning) and v55.key ~= nil then
            local l_key_0 = v55.key;
            v57 = if type(l_key_0) == "number" then l_key_0 else tostring(l_key_0);
        end;
        v59 = if v55.__source == nil then nil else v55.__source;
        if v56.key ~= nil then
            v56.key = nil;
        end;
        if v56.ref ~= nil then
            v56.ref = nil;
        end;
        if v56.__self ~= nil then
            v56.__self = nil;
        end;
        if v56.__source ~= nil then
            v56.__source = nil;
        end;
    end;
    local v61 = select("#", ...);
    if v61 == 1 then
        v56.children = select(1, ...);
    elseif v61 > 1 then
        local v62 = table.create(v61);
        for v63 = 1, v61 do
            table.insert(v62, (select(v63, ...)));
        end;
        if l___DEV___0 then
            table.freeze(v62);
        end;
        v56.children = v62;
    end;
    if type(v54) == "table" and v54.defaultProps then
        local l_defaultProps_0 = v54.defaultProps;
        for v65, _ in l_defaultProps_0 do
            if v56[v65] == nil then
                v56[v65] = l_defaultProps_0[v65];
            end;
        end;
    end;
    if l___DEV___0 then
        if v57 or v58 then
            local v67 = nil;
            v67 = if type(v54) == "function" then debug.info(v54, "n") or "<function>" else if type(v54) == "table" then v54.displayName or v54.name or "Unknown" else v54;
            if v57 then
                v23(v56, v67);
            end;
            if v58 then
                v29(v56, v67);
            end;
        end;
        if v59 == nil then
            v59 = {
                fileName = debug.info(3, "s"), 
                lineNumber = debug.info(3, "l")
            };
        end;
    end;
    return (v45(v54, v57, v58, nil, v59, l_ReactCurrentOwner_0.current, v56));
end;
v12.cloneAndReplaceKey = function(v68, v69) --[[ Line: 587 ]]
    -- upvalues: v45 (copy)
    return (v45(v68.type, v69, v68.ref, v68._self, v68._source, v68._owner, v68.props));
end;
v12.cloneElement = function(v70, v71, ...) --[[ Line: 605 ]]
    -- upvalues: l_Error_0 (copy), l_ReactCurrentOwner_0 (copy), l___DEV___0 (copy), v8 (copy), v45 (copy)
    if v70 == nil then
        error(l_Error_0.new("React.cloneElement(...): The argument must be a React element, but you passed " .. tostring(v70)));
    end;
    local l_props_0 = v70.props;
    local v73 = if l_props_0 ~= nil then table.clone(l_props_0) else {};
    local l_key_1 = v70.key;
    local l_ref_0 = v70.ref;
    local l__source_0 = v70._source;
    local l__owner_0 = v70._owner;
    if v71 ~= nil then
        local l_ref_1 = v71.ref;
        if l_ref_1 ~= nil then
            l_ref_0 = l_ref_1;
            l__owner_0 = l_ReactCurrentOwner_0.current;
        elseif not l___DEV___0 or v71.ref == nil or type(v71.ref) ~= "table" or not v71.ref.isReactWarning then
            local _ = v71.ref ~= nil;
        end;
        local l_key_2 = v71.key;
        if l_key_2 ~= nil then
            l_key_1 = if type(l_key_2) == "number" then l_key_2 else l_key_2 or "nil";
        elseif not l___DEV___0 or v71.key == nil or type(v71.key) ~= "table" or not v71.key.isReactWarning then
            local _ = v71.key ~= nil;
        end;
    end;
    local l_type_0 = v70.type;
    local v83 = if type(l_type_0) == "table" then l_type_0.defaultProps else nil;
    if v71 ~= nil then
        for v84, _ in v71 do
            if v71[v84] ~= nil and not v8[v84] then
                if v71[v84] == nil and v83 ~= nil then
                    v73[v84] = v83[v84];
                else
                    v73[v84] = v71[v84];
                end;
            end;
        end;
    end;
    local v86 = select("#", ...);
    if v86 == 1 then
        v73.children = select(1, ...);
    elseif v86 > 1 then
        v73.children = {
            ...
        };
    end;
    return (v45(v70.type, l_key_1, l_ref_0, nil, l__source_0, l__owner_0, v73));
end;
v12.isValidElement = function(v87) --[[ Line: 721 ]]
    -- upvalues: l_REACT_ELEMENT_TYPE_0 (copy)
    local v88 = false;
    if type(v87) == "table" then
        v88 = v87["$$typeof"] == l_REACT_ELEMENT_TYPE_0;
    end;
    return v88;
end;
return v12;