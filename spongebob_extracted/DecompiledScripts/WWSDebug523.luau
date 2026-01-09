local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = l_ReplicatedStorage_0.Packages;
local v2 = require(l_ReplicatedStorage_0.Packages.TableUtil);
local v3 = {};
local function v11(v4, v5) --[[ Line: 40 ]] --[[ Name: concatTable ]]
    if #v4 < 2 then
        return v4[next(v4)];
    else
        local v6 = "";
        if v5 then
            for _, v8 in ipairs(v4) do
                v6 = v6 .. v5 .. v8;
            end;
            return v6;
        else
            for _, v10 in ipairs(v4) do
                v6 = v6 .. v10;
            end;
            return v6;
        end;
    end;
end;
local function v18(v12, v13) --[[ Line: 63 ]] --[[ Name: getPrefix ]]
    v12 = v12 + 1;
    local v14, v15, v16 = debug.info(v12, "sln");
    local v17 = string.split(v14, ".");
    v14 = v17[#v17];
    v16 = (not v16 or v16 == "") and "No Func/Anon" or v16 .. "()";
    if v13 then
        return string.format("[%s]:", v16);
    else
        return string.format("[%s:%s | %s]:", v14, tostring(v15), v16);
    end;
end;
v3.Print = function(_, ...) --[[ Line: 98 ]] --[[ Name: Print ]]
    -- upvalues: v3 (copy)
    v3:OffsetPrint(2, ...);
end;
v3.PrintFormat = function(_, v21, ...) --[[ Line: 103 ]] --[[ Name: PrintFormat ]]
    -- upvalues: v3 (copy)
    v3:OffsetPrint(2, v3:_smartFormat(v21, ...));
end;
v3.OffsetPrintFormat = function(_, v23, v24, ...) --[[ Line: 108 ]] --[[ Name: OffsetPrintFormat ]]
    -- upvalues: v3 (copy)
    v3:OffsetPrint(v23, v3:_smartFormat(v24, ...));
end;
v3.DebugWarn = function(_, ...) --[[ Line: 116 ]] --[[ Name: DebugWarn ]]
    -- upvalues: v3 (copy)
end;
v3.Warn = function(_, ...) --[[ Line: 125 ]] --[[ Name: Warn ]]
    -- upvalues: v3 (copy)
    v3:OffsetWarn(2, ...);
end;
v3.WarnFormat = function(_, v28, ...) --[[ Line: 130 ]] --[[ Name: WarnFormat ]]
    -- upvalues: v3 (copy)
    v3:OffsetWarn(2, v3:_smartFormat(v28, ...));
end;
v3.OffsetWarnFormat = function(_, v30, v31, ...) --[[ Line: 135 ]] --[[ Name: OffsetWarnFormat ]]
    -- upvalues: v3 (copy)
    v3:OffsetWarn(v30, v3:_smartFormat(v31, ...));
end;
v3.BasicPromiseCatchWarn = function(v32) --[[ Line: 140 ]] --[[ Name: BasicPromiseCatchWarn ]]
    -- upvalues: v3 (copy)
    v3:OffsetWarn(2, (tostring(v32)));
end;
v3.EmptyPromiseCatch = function() --[[ Line: 144 ]] --[[ Name: EmptyPromiseCatch ]]

end;
v3.Error = function(_, ...) --[[ Line: 151 ]] --[[ Name: Error ]]
    -- upvalues: v3 (copy)
    v3:OffsetError(2, ...);
end;
v3.ErrorFormat = function(_, v35, ...) --[[ Line: 156 ]] --[[ Name: ErrorFormat ]]
    -- upvalues: v3 (copy)
    v3:OffsetError(2, v3:_smartFormat(v35, ...));
end;
v3.OffsetErrorFormat = function(_, v37, v38, ...) --[[ Line: 161 ]] --[[ Name: OffsetErrorFormat ]]
    -- upvalues: v3 (copy)
    v3:OffsetError(v37, v3:_smartFormat(v38, ...));
end;
v3.Assert = function(_, v40, ...) --[[ Line: 170 ]] --[[ Name: Assert ]]
    -- upvalues: v3 (copy)
    v3:_deferredConcatAssertShell(v3.OffsetError, 2, v40, ...);
end;
v3.AssertFormat = function(_, v42, v43, ...) --[[ Line: 178 ]] --[[ Name: AssertFormat ]]
    -- upvalues: v3 (copy)
    if v42 then
        return v42;
    else
        v3:OffsetError(2, v3:_smartFormat(v43, ...));
        return;
    end;
end;
v3.AssertWarn = function(_, v45, ...) --[[ Line: 192 ]] --[[ Name: AssertWarn ]]
    -- upvalues: v3 (copy)
    v3:_deferredConcatAssertShell(v3.OffsetWarn, 2, v45, ...);
end;
v3.AssertWarnFormat = function(_, v47, v48, ...) --[[ Line: 202 ]] --[[ Name: AssertWarnFormat ]]
    -- upvalues: v3 (copy)
    if v47 then
        return v47;
    else
        v3:OffsetWarn(2, v3:_smartFormat(v48, ...));
        return;
    end;
end;
v3.AssertAll = function(_, v50, v51, ...) --[[ Line: 212 ]] --[[ Name: AssertAll ]]
    -- upvalues: v3 (copy)
    v3:_assertAllShell(v3.OffsetError, 2, v50, v51, ...);
end;
v3.AssertAllWarn = function(_, v53, v54, ...) --[[ Line: 217 ]] --[[ Name: AssertAllWarn ]]
    -- upvalues: v3 (copy)
    v3:_assertAllShell(v3.OffsetWarn, 2, v53, v54, ...);
end;
v3.ShowTrace = function(_, v56, v57) --[[ Line: 223 ]] --[[ Name: ShowTrace ]]
    v57 = v57 or 0;
    (if v56 then warn else print)(debug.traceback(nil, v57 + 2));
end;
v3.OffsetPrint = function(_, v59, ...) --[[ Line: 235 ]] --[[ Name: OffsetPrint ]]
    -- upvalues: v18 (copy)
    v59 = v59 + 1;
    print(v18(v59), ...);
end;
v3.OffsetWarn = function(_, v61, ...) --[[ Line: 243 ]] --[[ Name: OffsetWarn ]]
    -- upvalues: v18 (copy)
    v61 = v61 + 1;
    warn(v18(v61), ...);
end;
v3.OffsetError = function(_, v63, ...) --[[ Line: 251 ]] --[[ Name: OffsetError ]]
    -- upvalues: v11 (copy), v18 (copy)
    local v64 = v11({
        ...
    }, " ");
    v63 = v63 + 1;
    local v65 = v18(v63, true) .. " " .. v64;
    error(debug.traceback(v65, v63), v63);
end;
v3._deferredConcatAssertShell = function(_, v67, v68, v69, ...) --[[ Line: 272 ]] --[[ Name: _deferredConcatAssertShell ]]
    -- upvalues: v3 (copy)
    if v69 then
        return v69;
    else
        v68 = v68 + 1;
        v67(v3, v68, ...);
        return;
    end;
end;
v3._assertAllShell = function(_, v71, v72, v73, v74, ...) --[[ Line: 286 ]] --[[ Name: _assertAllShell ]]
    -- upvalues: v3 (copy)
    v73 = v73 or function(v75) --[[ Line: 293 ]]
        return v75 ~= nil;
    end;
    v74 = v74 or "Unexpected value %s encountered!";
    v72 = v72 + 1;
    for _, v77 in ipairs({
        ...
    }) do
        local v78 = v73(v77);
        if v78 then
            return v78;
        else
            v71(v3, v72 + 1, v3:_smartFormat(v74, (tostring(v77))));
        end;
    end;
end;
v3._smartFormat = function(_, v80, ...) --[[ Line: 321 ]] --[[ Name: _smartFormat ]]
    -- upvalues: v2 (copy), v3 (copy)
    local v81 = {
        ...
    };
    if not v81 or v2.IsEmpty(v81) then
        return v80;
    else
        local v82 = nil;
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 334 ]]
            -- upvalues: v82 (ref), v80 (copy), v81 (copy)
            v82 = string.format(v80, table.unpack(v81));
        end);
        if l_status_0 then
            return v82;
        else
            v3:Warn("Inproper format found in a WWSDebug *Format() statement!", "See string.format() for reference.", "\nvararg stringElements table =", v81, "\nInternal Error Message:\n\n", tostring(l_result_0), "\n", debug.traceback(), "\nReturning Corrupt Raw Message...");
            return v80 .. tostring(v81);
        end;
    end;
end;
return v3;