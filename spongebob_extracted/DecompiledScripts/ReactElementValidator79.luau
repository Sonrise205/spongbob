local v0 = require(script.Parent.Parent:WaitForChild("luau-polyfill"));
local l_Array_0 = v0.Array;
local l_Boolean_0 = v0.Boolean;
local l_Object_0 = v0.Object;
local l_console_0 = require(script.Parent.Parent:WaitForChild("shared")).console;
local l_inspect_0 = v0.util.inspect;
local _ = require(script.Parent.Parent:WaitForChild("shared"));
local l_isValidElementType_0 = require(script.Parent.Parent:WaitForChild("shared")).isValidElementType;
local l_getComponentName_0 = require(script.Parent.Parent:WaitForChild("shared")).getComponentName;
local l_ReactSymbols_0 = require(script.Parent.Parent:WaitForChild("shared")).ReactSymbols;
local l_getIteratorFn_0 = l_ReactSymbols_0.getIteratorFn;
local _ = l_ReactSymbols_0.REACT_FORWARD_REF_TYPE;
local _ = l_ReactSymbols_0.REACT_MEMO_TYPE;
local l_REACT_FRAGMENT_TYPE_0 = l_ReactSymbols_0.REACT_FRAGMENT_TYPE;
local l_REACT_ELEMENT_TYPE_0 = l_ReactSymbols_0.REACT_ELEMENT_TYPE;
local l_warnAboutSpreadingKeyToJSX_0 = require(script.Parent.Parent:WaitForChild("shared")).ReactFeatureFlags.warnAboutSpreadingKeyToJSX;
local l_checkPropTypes_0 = require(script.Parent.Parent:WaitForChild("shared")).checkPropTypes;
local l_ReactCurrentOwner_0 = require(script.Parent.Parent:WaitForChild("shared")).ReactSharedInternals.ReactCurrentOwner;
local l_ReactElement_0 = require(script.Parent:WaitForChild("ReactElement"));
local l_isValidElement_0 = l_ReactElement_0.isValidElement;
local l_createElement_0 = l_ReactElement_0.createElement;
local l_cloneElement_0 = l_ReactElement_0.cloneElement;
local l_jsxDEV_0 = l_ReactElement_0.jsxDEV;
local l_setExtraStackFrame_0 = require(script.Parent.Parent:WaitForChild("shared")).ReactSharedInternals.ReactDebugCurrentFrame.setExtraStackFrame;
local l_describeUnknownElementTypeFrameInDEV_0 = require(script.Parent.Parent:WaitForChild("shared")).ReactComponentStackFrame.describeUnknownElementTypeFrameInDEV;
local v25 = {};
local function _(v26) --[[ Line: 63 ]] --[[ Name: setCurrentlyValidatingElement ]]
    -- upvalues: l_describeUnknownElementTypeFrameInDEV_0 (copy), l_setExtraStackFrame_0 (copy)
    if _G.__DEV__ then
        if v26 then
            local l__owner_0 = v26._owner;
            local v28 = nil;
            if l__owner_0 then
                v28 = l__owner_0.type;
            end;
            local v29 = l_describeUnknownElementTypeFrameInDEV_0(v26.type, v26._source, v28);
            l_setExtraStackFrame_0(v29);
            return;
        else
            l_setExtraStackFrame_0(nil);
        end;
    end;
end;
local v31 = nil;
if _G.__DEV__ then
    v31 = false;
end;
local function _(v32, v33) --[[ Line: 91 ]] --[[ Name: hasOwnProperty ]]
    return v32[v33] ~= nil;
end;
local function _() --[[ Line: 95 ]] --[[ Name: getDeclarationErrorAddendum ]]
    -- upvalues: l_ReactCurrentOwner_0 (copy), l_getComponentName_0 (copy)
    if l_ReactCurrentOwner_0.current then
        local v35 = l_getComponentName_0(l_ReactCurrentOwner_0.current.type);
        if v35 then
            return "\n\nCheck the render method of `" .. v35 .. "`.";
        end;
    end;
    return "";
end;
local function _(v37) --[[ Line: 106 ]] --[[ Name: getSourceInfoErrorAddendum ]]
    if v37 ~= nil then
        return "\n\nCheck your code at " .. string.gsub(v37.fileName, "^.*[\\/]", "") .. ":" .. v37.lineNumber .. ".";
    else
        return "";
    end;
end;
local function _(v39) --[[ Line: 116 ]] --[[ Name: getSourceInfoErrorAddendumForProps ]]
    if v39 ~= nil then
        local l___source_0 = v39.__source;
        if l___source_0 ~= nil then
            return "\n\nCheck your code at " .. string.gsub(l___source_0.fileName, "^.*[\\/]", "") .. ":" .. l___source_0.lineNumber .. ".";
        else
            return "";
        end;
    else
        return "";
    end;
end;
local v42 = {};
local function v49(v43) --[[ Line: 133 ]] --[[ Name: getCurrentComponentErrorInfo ]]
    -- upvalues: l_ReactCurrentOwner_0 (copy), l_getComponentName_0 (copy), l_Boolean_0 (copy)
    local v44 = false;
    local v45;
    if l_ReactCurrentOwner_0.current then
        local v46 = l_getComponentName_0(l_ReactCurrentOwner_0.current.type);
        if v46 then
            v45 = "\n\nCheck the render method of `" .. v46 .. "`.";
            v44 = true;
        end;
    end;
    if not v44 then
        v45 = "";
    end;
    v44 = false;
    if not l_Boolean_0.toJSBoolean(v45) then
        local v47 = if typeof(v43) == "string" then v43 else if typeof(v43) == "table" then v43.displayName or v43.name else nil;
        if not v47 and typeof(v43) == "function" then
            local v48 = debug.info(v43, "n");
            v47 = if v48 ~= "" then v48 else nil;
        end;
        if v47 then
            v45 = string.format("\n\nCheck the top-level render call using <%s>.", v47);
        end;
    end;
    return v45;
end;
local function v58(v50, v51, v52) --[[ Line: 175 ]] --[[ Name: validateExplicitKey ]]
    -- upvalues: v49 (copy), v42 (copy), l_ReactCurrentOwner_0 (copy), l_getComponentName_0 (copy), l_describeUnknownElementTypeFrameInDEV_0 (copy), l_setExtraStackFrame_0 (copy), l_console_0 (copy)
    if v50._store == nil or v50._store.validated then
        return;
    else
        v50._store.validated = true;
        if v50.key ~= nil ~= (v52 ~= nil) then
            return;
        else
            local v53 = v49(v51);
            if v42[v53] then
                return;
            else
                v42[v53] = true;
                local v54 = "";
                if v50 and v50._owner and v50._owner ~= l_ReactCurrentOwner_0.current then
                    v54 = string.format(" It was passed a child from %s.", (tostring(l_getComponentName_0(v50._owner.type))));
                end;
                if _G.__DEV__ then
                    if _G.__DEV__ then
                        if v50 then
                            local l__owner_1 = v50._owner;
                            local v56 = nil;
                            if l__owner_1 then
                                v56 = l__owner_1.type;
                            end;
                            local v57 = l_describeUnknownElementTypeFrameInDEV_0(v50.type, v50._source, v56);
                            l_setExtraStackFrame_0(v57);
                        else
                            l_setExtraStackFrame_0(nil);
                        end;
                    end;
                    if v50.key ~= nil and v52 ~= nil then
                        l_console_0.error("Child element received a \"key\" prop (\"%s\") in addition to a key in the \"children\" table of its parent (\"%s\"). Please provide only one key definition. When both are present, the \"key\" prop will take precedence.%s%s See https://reactjs.org/link/warning-keys for more information.", tostring(v50.key), tostring(v52), v53, v54);
                    else
                        l_console_0.error("Each child in a list should have a unique \"key\" prop.%s%s See https://reactjs.org/link/warning-keys for more information.", v53, v54);
                    end;
                    if _G.__DEV__ then
                        l_setExtraStackFrame_0(nil);
                    end;
                end;
                return;
            end;
        end;
    end;
end;
local function v66(v59, v60) --[[ Line: 250 ]] --[[ Name: validateChildKeys ]]
    -- upvalues: l_Array_0 (copy), l_isValidElement_0 (copy), v58 (copy), l_getIteratorFn_0 (copy)
    if typeof(v59) ~= "table" then
        return;
    elseif l_Array_0.isArray(v59) then
        for v61 = 1, #v59 do
            local v62 = v59[v61];
            if l_isValidElement_0(v62) then
                v58(v62, v60);
            end;
        end;
        return;
    else
        if l_isValidElement_0(v59) then
            if v59._store then
                v59._store.validated = true;
                return;
            end;
        elseif v59 then
            local v63 = l_getIteratorFn_0(v59);
            if typeof(v63) == "function" and v63 ~= v59.entries then
                local v64 = v63(v59);
                local v65 = v64.next();
                while not v65.done do
                    if l_isValidElement_0(v65.value) then
                        v58(v65.value, v60, v65.key);
                    end;
                    v65 = v64.next();
                end;
            end;
        end;
        return;
    end;
end;
local function v73(v67) --[[ Line: 293 ]] --[[ Name: validatePropTypes ]]
    -- upvalues: l_getComponentName_0 (copy), l_checkPropTypes_0 (copy), v31 (ref), l_console_0 (copy)
    if _G.__DEV__ or _G.__DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION__ then
        local l_type_0 = v67.type;
        if l_type_0 == nil or typeof(l_type_0) == "string" then
            return;
        else
            local v69 = nil;
            local v70 = nil;
            if typeof(l_type_0) == "function" then
                return;
            elseif typeof(l_type_0) == "table" then
                v69 = l_type_0.propTypes;
                v70 = l_type_0.validateProps;
                if v69 or v70 then
                    local v71 = l_getComponentName_0(l_type_0);
                    l_checkPropTypes_0(v69, v70, v67.props, "prop", v71, v67);
                elseif l_type_0.PropTypes ~= nil and not v31 then
                    v31 = true;
                    local v72 = l_getComponentName_0(l_type_0);
                    l_console_0.error("Component %s declared `PropTypes` instead of `propTypes`. Did you misspell the property assignment?", v72 or "Unknown");
                end;
                if l_type_0.getDefaultProps ~= nil then
                    l_console_0.error("getDefaultProps is only used on classic React.createClass definitions. Use a static property named `defaultProps` instead.");
                end;
            else
                return;
            end;
        end;
    end;
end;
local function v84(v74) --[[ Line: 343 ]] --[[ Name: validateFragmentProps ]]
    -- upvalues: l_Object_0 (copy), l_describeUnknownElementTypeFrameInDEV_0 (copy), l_setExtraStackFrame_0 (copy), l_console_0 (copy)
    if _G.__DEV__ then
        local v75 = l_Object_0.keys(v74.props);
        for v76 = 1, #v75 do
            local v77 = v75[v76];
            if v77 ~= "children" and v77 ~= "key" then
                if _G.__DEV__ then
                    if v74 then
                        local l__owner_2 = v74._owner;
                        local v79 = nil;
                        if l__owner_2 then
                            v79 = l__owner_2.type;
                        end;
                        local v80 = l_describeUnknownElementTypeFrameInDEV_0(v74.type, v74._source, v79);
                        l_setExtraStackFrame_0(v80);
                    else
                        l_setExtraStackFrame_0(nil);
                    end;
                end;
                l_console_0.error("Invalid prop `%s` supplied to `React.Fragment`. React.Fragment can only have `key` and `children` props.", v77);
                if _G.__DEV__ then
                    l_setExtraStackFrame_0(nil);
                    break;
                else
                    break;
                end;
            end;
        end;
        if v74.ref ~= nil then
            if _G.__DEV__ then
                if v74 then
                    local l__owner_3 = v74._owner;
                    local v82 = nil;
                    if l__owner_3 then
                        v82 = l__owner_3.type;
                    end;
                    local v83 = l_describeUnknownElementTypeFrameInDEV_0(v74.type, v74._source, v82);
                    l_setExtraStackFrame_0(v83);
                else
                    l_setExtraStackFrame_0(nil);
                end;
            end;
            l_console_0.error("Invalid attribute `ref` supplied to `React.Fragment`.");
            if _G.__DEV__ then
                l_setExtraStackFrame_0(nil);
            end;
        end;
    end;
end;
local function v102(v85, v86, v87, v88, v89, v90) --[[ Line: 369 ]] --[[ Name: jsxWithValidation ]]
    -- upvalues: l_isValidElementType_0 (copy), l_Object_0 (copy), l_ReactCurrentOwner_0 (copy), l_getComponentName_0 (copy), l_Array_0 (copy), l_REACT_ELEMENT_TYPE_0 (copy), l_inspect_0 (copy), l_console_0 (copy), l_jsxDEV_0 (copy), v66 (copy), l_warnAboutSpreadingKeyToJSX_0 (copy), l_REACT_FRAGMENT_TYPE_0 (copy), v84 (copy), v73 (copy)
    local v91 = false;
    local v92 = l_isValidElementType_0(v85);
    if not v92 then
        local v93 = "";
        if v85 == nil or typeof(v85) == "table" and #l_Object_0.keys(v85) == 0 then
            v93 = v93 .. " You likely forgot to export your component from the file it's defined in, or you might have mixed up default and named imports.";
        end;
        local v94 = if v89 ~= nil then "\n\nCheck your code at " .. string.gsub(v89.fileName, "^.*[\\/]", "") .. ":" .. v89.lineNumber .. "." else "";
        if v94 then
            v93 = v93 .. v94;
        else
            local l_v93_0 = v93;
            local v96;
            if l_ReactCurrentOwner_0.current then
                local v97 = l_getComponentName_0(l_ReactCurrentOwner_0.current.type);
                if v97 then
                    v96 = "\n\nCheck the render method of `" .. v97 .. "`.";
                    v91 = true;
                end;
            end;
            if not v91 then
                v96 = "";
            end;
            v91 = false;
            v93 = l_v93_0 .. v96;
        end;
        local v98 = nil;
        if v85 == nil then
            v98 = "nil";
        elseif l_Array_0.isArray(v85) then
            v98 = "array";
        elseif typeof(v85) == "table" and v85["$$typeof"] == l_REACT_ELEMENT_TYPE_0 then
            v98 = string.format("<%s />", l_getComponentName_0(v85.type) or "Unknown");
            v93 = v93 .. " Did you accidentally export a JSX literal or Element instead of a component?";
        else
            v98 = typeof(v85);
            v93 = v93 .. "\n" .. l_inspect_0(v85);
        end;
        if _G.__DEV__ then
            l_console_0.error("React.jsx: type is invalid -- expected a string (for built-in components) or a class/function (for composite components) but got: %s.%s", v98, v93);
        end;
    end;
    local v99 = l_jsxDEV_0(v85, v86, v87, v89, v90);
    if v99 == nil then
        return v99;
    else
        if v92 then
            local l_children_0 = v86.children;
            if l_children_0 ~= nil then
                if v88 then
                    if l_Array_0.isArray(l_children_0) then
                        for v101 = 1, #l_children_0 do
                            v66(l_children_0[v101], v85);
                        end;
                        l_Object_0.freeze(l_children_0);
                    elseif _G.__DEV__ then
                        l_console_0.error("React.jsx: Static children should always be an array. You are likely explicitly calling React.jsxs or React.jsxDEV. Use the Babel transform instead.");
                    end;
                else
                    v66(l_children_0, v85);
                end;
            end;
        end;
        if _G.__DEV__ and l_warnAboutSpreadingKeyToJSX_0 and v86.key ~= nil then
            l_console_0.error("React.jsx: Spreading a key to JSX is a deprecated pattern. Explicitly pass a key after spreading props in your JSX call. E.g. <%s {...props} key={key} />", l_getComponentName_0(v85) or "ComponentName");
        end;
        if v85 == l_REACT_FRAGMENT_TYPE_0 then
            v84(v99);
            return v99;
        else
            v73(v99);
            return v99;
        end;
    end;
end;
v25.jsxWithValidation = v102;
v25.jsxWithValidationStatic = function(v103, v104, v105) --[[ Line: 491 ]]
    -- upvalues: v102 (copy)
    return (v102(v103, v104, v105, true));
end;
v25.jsxWithValidationDynamic = function(v106, v107, v108) --[[ Line: 495 ]]
    -- upvalues: v102 (copy)
    return (v102(v106, v107, v108, false));
end;
v25.createElementWithValidation = function(v109, v110, ...) --[[ Line: 500 ]] --[[ Name: createElementWithValidation ]]
    -- upvalues: l_isValidElementType_0 (copy), l_Object_0 (copy), l_ReactCurrentOwner_0 (copy), l_getComponentName_0 (copy), l_Array_0 (copy), l_REACT_ELEMENT_TYPE_0 (copy), l_inspect_0 (copy), l_console_0 (copy), l_createElement_0 (copy), v66 (copy), l_REACT_FRAGMENT_TYPE_0 (copy), v84 (copy), v73 (copy)
    local v111 = false;
    local v112 = l_isValidElementType_0(v109);
    if not v112 then
        local v113 = "";
        if v109 == nil or typeof(v109) == "table" and #l_Object_0.keys(v109) == 0 then
            v113 = v113 .. " You likely forgot to export your component from the file it's defined in, or you might have mixed up default and named imports.";
        end;
        local v114;
        if v110 ~= nil then
            local l___source_1 = v110.__source;
            v114 = if l___source_1 ~= nil then "\n\nCheck your code at " .. string.gsub(l___source_1.fileName, "^.*[\\/]", "") .. ":" .. l___source_1.lineNumber .. "." else "";
        else
            v114 = "";
        end;
        if v114 then
            v113 = v113 .. v114;
        else
            local l_v113_0 = v113;
            local v117;
            if l_ReactCurrentOwner_0.current then
                local v118 = l_getComponentName_0(l_ReactCurrentOwner_0.current.type);
                if v118 then
                    v117 = "\n\nCheck the render method of `" .. v118 .. "`.";
                    v111 = true;
                end;
            end;
            if not v111 then
                v117 = "";
            end;
            v111 = false;
            v113 = l_v113_0 .. v117;
        end;
        local v119 = nil;
        if v109 == nil then
            v119 = "nil";
        elseif l_Array_0.isArray(v109) then
            v119 = "array";
        elseif v109 ~= nil and typeof(v109) == "table" and v109["$$typeof"] == l_REACT_ELEMENT_TYPE_0 then
            v119 = string.format("<%s />", l_getComponentName_0(v109.type) or "Unknown");
            v113 = v113 .. " Did you accidentally export a JSX literal or Element instead of a component?";
        else
            v119 = typeof(v109);
            if v109 ~= nil then
                v113 = v113 .. "\n" .. l_inspect_0(v109);
            end;
        end;
        if _G.__DEV__ then
            l_console_0.error("React.createElement: type is invalid -- expected a string (for built-in components) or a class/function (for composite components) but got: %s.%s", v119, v113);
        end;
    end;
    local v120 = l_createElement_0(v109, v110, ...);
    if v120 == nil then
        return v120;
    else
        if v112 then
            for v121 = 1, select("#", ...) do
                v66(select(v121, ...), v109);
            end;
        end;
        if v109 == l_REACT_FRAGMENT_TYPE_0 then
            v84(v120);
            return v120;
        else
            v73(v120);
            return v120;
        end;
    end;
end;
v25.cloneElementWithValidation = function(v122, v123, ...) --[[ Line: 633 ]]
    -- upvalues: l_cloneElement_0 (copy), v66 (copy), v73 (copy)
    local v124 = {
        v122, 
        v123, 
        ...
    };
    local v125 = l_cloneElement_0(v122, v123, ...);
    for v126 = 3, #v124 do
        v66(v124[v126], v125.type);
    end;
    v73(v125);
    return v125;
end;
return v25;