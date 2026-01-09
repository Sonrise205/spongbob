local v0 = require(script.Parent.Util);
local _ = require(script.Parent.Types);
local v2 = require(script.Parent.Parent.Promise);
local v3 = require(script.ClientRemoteSignal);
local v4 = require(script.ClientRemoteProperty);
return {
    GetFunction = function(v5, v6, v7, v8, v9) --[[ Line: 9 ]] --[[ Name: GetFunction ]]
        -- upvalues: v0 (copy), v2 (copy)
        assert(not v0.IsServer, "GetFunction must be called from the client");
        local v10 = v0.GetCommSubFolder(v5, "RF"):Expect("Failed to get Comm RF folder"):WaitForChild(v6, v0.WaitForChildTimeout);
        assert(v10 ~= nil, "Failed to find RemoteFunction: " .. v6);
        local v11 = false;
        if type(v8) == "table" then
            v11 = #v8 > 0;
        end;
        local v12 = false;
        if type(v9) == "table" then
            v12 = #v9 > 0;
        end;
        local function v17(v13) --[[ Line: 22 ]] --[[ Name: ProcessOutbound ]]
            -- upvalues: v9 (copy)
            for _, v15 in ipairs(v9) do
                local v16 = table.pack(v15(v13));
                if not v16[1] then
                    return table.unpack(v16, 2, v16.n);
                else
                    v13.n = #v13;
                end;
            end;
            return table.unpack(v13, 1, v13.n);
        end;
        if v11 then
            if v7 then
                return function(...) --[[ Line: 34 ]]
                    -- upvalues: v2 (ref), v12 (copy), v10 (copy), v17 (copy), v8 (copy)
                    local v18 = table.pack(...);
                    return v2.new(function(v19, v20) --[[ Line: 36 ]]
                        -- upvalues: v12 (ref), v10 (ref), v17 (ref), v18 (copy), v8 (ref)
                        local l_status_0, l_result_0 = pcall(function() --[[ Line: 37 ]]
                            -- upvalues: v12 (ref), v10 (ref), v17 (ref), v18 (ref)
                            if v12 then
                                return table.pack(v10:InvokeServer(v17(v18)));
                            else
                                return table.pack(v10:InvokeServer(table.unpack(v18, 1, v18.n)));
                            end;
                        end);
                        if l_status_0 then
                            for _, v24 in ipairs(v8) do
                                local v25 = table.pack(v24(l_result_0));
                                if not v25[1] then
                                    return table.unpack(v25, 2, v25.n);
                                else
                                    l_result_0.n = #l_result_0;
                                end;
                            end;
                            v19(table.unpack(l_result_0, 1, l_result_0.n));
                            return;
                        else
                            v20(l_result_0);
                            return;
                        end;
                    end);
                end;
            else
                return function(...) --[[ Line: 59 ]]
                    -- upvalues: v12 (copy), v10 (copy), v17 (copy), v8 (copy)
                    local v26 = nil;
                    v26 = if v12 then table.pack(v10:InvokeServer(v17(table.pack(...)))) else table.pack(v10:InvokeServer(...));
                    for _, v28 in ipairs(v8) do
                        local v29 = table.pack(v28(v26));
                        if not v29[1] then
                            return table.unpack(v29, 2, v29.n);
                        else
                            v26.n = #v26;
                        end;
                    end;
                    return table.unpack(v26, 1, v26.n);
                end;
            end;
        elseif v7 then
            return function(...) --[[ Line: 78 ]]
                -- upvalues: v2 (ref), v12 (copy), v10 (copy), v17 (copy)
                local v30 = table.pack(...);
                return v2.new(function(v31, v32) --[[ Line: 80 ]]
                    -- upvalues: v12 (ref), v10 (ref), v17 (ref), v30 (copy)
                    local l_status_1, l_result_1 = pcall(function() --[[ Line: 81 ]]
                        -- upvalues: v12 (ref), v10 (ref), v17 (ref), v30 (ref)
                        if v12 then
                            return table.pack(v10:InvokeServer(v17(v30)));
                        else
                            return table.pack(v10:InvokeServer(table.unpack(v30, 1, v30.n)));
                        end;
                    end);
                    if l_status_1 then
                        v31(table.unpack(l_result_1, 1, l_result_1.n));
                        return;
                    else
                        v32(l_result_1);
                        return;
                    end;
                end);
            end;
        elseif v12 then
            return function(...) --[[ Line: 97 ]]
                -- upvalues: v10 (copy), v17 (copy)
                return v10:InvokeServer(v17(table.pack(...)));
            end;
        else
            return function(...) --[[ Line: 101 ]]
                -- upvalues: v10 (copy)
                return v10:InvokeServer(...);
            end;
        end;
    end, 
    GetSignal = function(v35, v36, v37, v38) --[[ Line: 109 ]] --[[ Name: GetSignal ]]
        -- upvalues: v0 (copy), v3 (copy)
        assert(not v0.IsServer, "GetSignal must be called from the client");
        local v39 = v0.GetCommSubFolder(v35, "RE"):Expect("Failed to get Comm RE folder"):WaitForChild(v36, v0.WaitForChildTimeout);
        assert(v39 ~= nil, "Failed to find RemoteEvent: " .. v36);
        return v3.new(v39, v37, v38);
    end, 
    GetProperty = function(v40, v41, v42, v43) --[[ Line: 122 ]] --[[ Name: GetProperty ]]
        -- upvalues: v0 (copy), v4 (copy)
        assert(not v0.IsServer, "GetProperty must be called from the client");
        local v44 = v0.GetCommSubFolder(v40, "RP"):Expect("Failed to get Comm RP folder"):WaitForChild(v41, v0.WaitForChildTimeout);
        assert(v44 ~= nil, "Failed to find RemoteEvent for RemoteProperty: " .. v41);
        return v4.new(v44, v42, v43);
    end
};