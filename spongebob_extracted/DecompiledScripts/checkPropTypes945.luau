local l_Error_0 = require(script.Parent.Parent:WaitForChild("luau-polyfill")).Error;
local l_console_0 = require(script.Parent:WaitForChild("console"));
local v2 = {};
local l_describeUnknownElementTypeFrameInDEV_0 = require(script.Parent:WaitForChild("ReactComponentStackFrame")).describeUnknownElementTypeFrameInDEV;
local l_ReactSharedInternals_0 = require(script.Parent:WaitForChild("ReactSharedInternals"));
local l_describeError_0 = require(script.Parent:WaitForChild("ErrorHandling.roblox")).describeError;
local l_ReactDebugCurrentFrame_0 = l_ReactSharedInternals_0.ReactDebugCurrentFrame;
local function _(v7) --[[ Line: 32 ]] --[[ Name: setCurrentlyValidatingElement ]]
    -- upvalues: l_describeUnknownElementTypeFrameInDEV_0 (copy), l_ReactDebugCurrentFrame_0 (copy)
    if _G.__DEV__ then
        if v7 then
            local l__owner_0 = v7._owner;
            local v9 = l_describeUnknownElementTypeFrameInDEV_0(v7.type, v7._source, if l__owner_0 ~= nil then l__owner_0.type else nil);
            l_ReactDebugCurrentFrame_0.setExtraStackFrame(v9);
            return;
        else
            l_ReactDebugCurrentFrame_0.setExtraStackFrame(nil);
        end;
    end;
end;
return function(v11, v12, v13, v14, v15, v16) --[[ Line: 49 ]] --[[ Name: checkPropTypes ]]
    -- upvalues: l_console_0 (copy), l_Error_0 (copy), l_describeError_0 (copy), l_describeUnknownElementTypeFrameInDEV_0 (copy), l_ReactDebugCurrentFrame_0 (copy), v2 (copy)
    if _G.__DEV__ or _G.__DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION__ then
        if v11 and v12 then
            l_console_0.warn("You've defined both propTypes and validateProps on " .. (v15 or "a component"));
        end;
        if v12 then
            if typeof(v12) ~= "function" then
                l_console_0.error(("validateProps must be a function, but it is a %s.\nCheck the definition of the component %q."):format(typeof(v12), v15 or ""));
            else
                local v17, v18 = v12(v13);
                if not v17 then
                    v18 = v18 or "<Validator function did not supply a message>";
                    local v19 = string.format("validateProps failed on a %s type in %s: %s", v14, v15 or "<UNKNOWN Component>", (tostring(v18)));
                    error(v19);
                end;
            end;
        end;
        if v11 then
            assert(typeof(v11) == "table", "propTypes needs to be a table");
            for v20, _ in v11 do
                local _, v24 = xpcall(function() --[[ Line: 113 ]]
                    -- upvalues: v11 (copy), v20 (copy), l_Error_0 (ref), v15 (copy), v14 (copy), v13 (copy)
                    if typeof(v11[v20]) ~= "function" then
                        local v22 = l_Error_0.new((v15 or "React class") .. ": " .. v14 .. " type `" .. v20 .. "` is invalid; " .. "it must be a function, usually from the `prop-types` package, but received `" .. typeof(v11[v20]) .. "`.This often happens because of typos such as `PropTypes.function` instead of `PropTypes.func`.");
                        v22.name = "Invariant Violation";
                        error(v22);
                    end;
                    return v11[v20](v13, v20, v15, v14, nil, "SECRET_DO_NOT_PASS_THIS_OR_YOU_WILL_BE_FIRED");
                end, l_describeError_0);
                local v25 = typeof(v24) == "table";
                if v24 ~= nil and not v25 then
                    if _G.__DEV__ then
                        if v16 then
                            local l__owner_1 = v16._owner;
                            local v27 = l_describeUnknownElementTypeFrameInDEV_0(v16.type, v16._source, if l__owner_1 ~= nil then l__owner_1.type else nil);
                            l_ReactDebugCurrentFrame_0.setExtraStackFrame(v27);
                        else
                            l_ReactDebugCurrentFrame_0.setExtraStackFrame(nil);
                        end;
                    end;
                    l_console_0.error(string.format("%s: type specification of %s `%s` is invalid; the type checker function must return `nil` or an `Error` but returned a %s. You may have forgotten to pass an argument to the type checker creator (arrayOf, instanceOf, objectOf, oneOf, oneOfType, and shape all require an argument).", v15 or "React class", v14, v20, (typeof(v24))));
                    if _G.__DEV__ then
                        l_ReactDebugCurrentFrame_0.setExtraStackFrame(nil);
                    end;
                end;
                if v25 and v2[v24.message] == nil then
                    v2[tostring(v24.message)] = true;
                    if _G.__DEV__ then
                        if v16 then
                            local l__owner_2 = v16._owner;
                            local v29 = l_describeUnknownElementTypeFrameInDEV_0(v16.type, v16._source, if l__owner_2 ~= nil then l__owner_2.type else nil);
                            l_ReactDebugCurrentFrame_0.setExtraStackFrame(v29);
                        else
                            l_ReactDebugCurrentFrame_0.setExtraStackFrame(nil);
                        end;
                    end;
                    l_console_0.warn(string.format("Failed %s type: %s", v14, (tostring(v24.message))));
                    if _G.__DEV__ then
                        l_ReactDebugCurrentFrame_0.setExtraStackFrame(nil);
                    end;
                end;
            end;
        end;
    end;
end;