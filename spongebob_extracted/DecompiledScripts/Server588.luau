local v0 = require(script.RemoteProperty);
local v1 = require(script.RemoteSignal);
local _ = require(script.Parent.Types);
local v3 = require(script.Parent.Util);
local v30 = {
    BindFunction = function(v4, v5, v6, v7, v8) --[[ Line: 37 ]] --[[ Name: BindFunction ]]
        -- upvalues: v3 (copy)
        assert(v3.IsServer, "BindFunction must be called from the server");
        local v9 = v3.GetCommSubFolder(v4, "RF"):Expect("Failed to get Comm RF folder");
        local l_RemoteFunction_0 = Instance.new("RemoteFunction");
        l_RemoteFunction_0.Name = v5;
        local v11 = false;
        if type(v7) == "table" then
            v11 = #v7 > 0;
        end;
        local v12 = false;
        if type(v8) == "table" then
            v12 = #v8 > 0;
        end;
        local function v18(v13, ...) --[[ Line: 50 ]] --[[ Name: ProcessOutbound ]]
            -- upvalues: v8 (copy)
            local v14 = table.pack(...);
            for _, v16 in ipairs(v8) do
                local v17 = table.pack(v16(v13, v14));
                if not v17[1] then
                    return table.unpack(v17, 2, v17.n);
                else
                    v14.n = #v14;
                end;
            end;
            return table.unpack(v14, 1, v14.n);
        end;
        if v11 and v12 then
            l_RemoteFunction_0.OnServerInvoke = function(v19, ...) --[[ Line: 62 ]] --[[ Name: OnServerInvoke ]]
                -- upvalues: v7 (copy), v18 (copy), v6 (copy)
                local v20 = table.pack(...);
                for _, v22 in ipairs(v7) do
                    local v23 = table.pack(v22(v19, v20));
                    if not v23[1] then
                        return table.unpack(v23, 2, v23.n);
                    else
                        v20.n = #v20;
                    end;
                end;
                return v18(v19, v6(v19, table.unpack(v20, 1, v20.n)));
            end;
        elseif v11 then
            l_RemoteFunction_0.OnServerInvoke = function(v24, ...) --[[ Line: 75 ]] --[[ Name: OnServerInvoke ]]
                -- upvalues: v7 (copy), v6 (copy)
                local v25 = table.pack(...);
                for _, v27 in ipairs(v7) do
                    local v28 = table.pack(v27(v24, v25));
                    if not v28[1] then
                        return table.unpack(v28, 2, v28.n);
                    else
                        v25.n = #v25;
                    end;
                end;
                return v6(v24, table.unpack(v25, 1, v25.n));
            end;
        elseif v12 then
            l_RemoteFunction_0.OnServerInvoke = function(v29, ...) --[[ Line: 88 ]] --[[ Name: OnServerInvoke ]]
                -- upvalues: v18 (copy), v6 (copy)
                return v18(v29, v6(v29, ...));
            end;
        else
            l_RemoteFunction_0.OnServerInvoke = v6;
        end;
        l_RemoteFunction_0.Parent = v9;
        return l_RemoteFunction_0;
    end
};
v30.WrapMethod = function(v31, v32, v33, v34, v35) --[[ Line: 99 ]] --[[ Name: WrapMethod ]]
    -- upvalues: v3 (copy), v30 (copy)
    assert(v3.IsServer, "WrapMethod must be called from the server");
    local v36 = v32[v33];
    assert(type(v36) == "function", "Value at index " .. v33 .. " must be a function; got " .. type(v36));
    return v30.BindFunction(v31, v33, function(...) --[[ Line: 109 ]]
        -- upvalues: v36 (copy), v32 (copy)
        return v36(v32, ...);
    end, v34, v35);
end;
v30.CreateSignal = function(v37, v38, v39, v40, v41) --[[ Line: 114 ]] --[[ Name: CreateSignal ]]
    -- upvalues: v3 (copy), v1 (copy)
    assert(v3.IsServer, "CreateSignal must be called from the server");
    local v42 = v3.GetCommSubFolder(v37, "RE"):Expect("Failed to get Comm RE folder");
    return (v1.new(v42, v38, v39, v40, v41));
end;
v30.CreateProperty = function(v43, v44, v45, v46, v47) --[[ Line: 127 ]] --[[ Name: CreateProperty ]]
    -- upvalues: v3 (copy), v0 (copy)
    assert(v3.IsServer, "CreateProperty must be called from the server");
    local v48 = v3.GetCommSubFolder(v43, "RP"):Expect("Failed to get Comm RP folder");
    return (v0.new(v48, v44, v45, v46, v47));
end;
return v30;