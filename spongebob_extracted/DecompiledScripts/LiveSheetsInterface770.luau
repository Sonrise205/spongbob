local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Shared.Util.PathUtil);
local v2 = {
    "StringValue", 
    "NumberValue", 
    "BoolValue"
};
local v3 = {};
local v4 = nil;
local v5 = nil;
do
    local l_v5_0 = v5;
    v4 = function() --[[ Line: 35 ]] --[[ Name: getLiveSheets ]]
        -- upvalues: l_v5_0 (ref), l_ReplicatedStorage_0 (copy)
        if not l_v5_0 then
            l_v5_0 = l_ReplicatedStorage_0:FindFirstChild("LiveSheets");
        end;
        return l_v5_0;
    end;
end;
v5 = function(v7) --[[ Line: 47 ]] --[[ Name: validateConfig ]]
    -- upvalues: v2 (copy)
    for _, v9 in v2 do
        if v7:IsA(v9) then
            return true;
        end;
    end;
    return false;
end;
v3.GetSheet = function(_, v11) --[[ Line: 60 ]] --[[ Name: GetSheet ]]
    -- upvalues: v4 (ref)
    local v12 = v4();
    return v12 and v12:FindFirstChild(v11);
end;
v3.GetConfig = function(_, v14, v15, v16) --[[ Line: 72 ]] --[[ Name: GetConfig ]]
    -- upvalues: v4 (ref), v1 (copy), v2 (copy)
    local v17 = false;
    local v18 = v4();
    if not v18 then
        warn("[LiveSheets]: LiveSheets configuration not found");
        return;
    else
        local v19 = v1(v18, v14);
        if not v19 then
            if not v16 then
                warn((("[LiveSheets]: Could not find config for: %*"):format(v14)));
            end;
            return;
        else
            if v15 then
                local v20;
                for _, v22 in v2 do
                    if v19:IsA(v22) then
                        v20 = true;
                        v17 = true;
                    end;
                    if v17 then
                        break;
                    end;
                end;
                if not v17 then
                    v20 = false;
                end;
                v17 = false;
                if not v20 then
                    warn((("[LiveSheets]: Config: %* is not a supported value type"):format(v14)));
                    return;
                end;
            end;
            return v19;
        end;
    end;
end;
v3.GetValue = function(v23, v24) --[[ Line: 109 ]] --[[ Name: GetValue ]]
    local l_v23_Config_0 = v23:GetConfig(v24, true);
    return l_v23_Config_0 and l_v23_Config_0.Value;
end;
v3.OnValueChanged = function(v26, v27, v28, v29) --[[ Line: 125 ]] --[[ Name: OnValueChanged ]]
    -- upvalues: v2 (copy)
    local v30 = false;
    local v31 = false;
    local v32;
    if typeof(v27) == "string" then
        v32 = v26:GetConfig(v27, true);
    else
        if v27:IsA("Instance") then
            local v33;
            for _, v35 in v2 do
                if v27:IsA(v35) then
                    v33 = true;
                    v30 = true;
                end;
                if v30 then
                    break;
                end;
            end;
            if not v30 then
                v33 = false;
            end;
            v30 = false;
            if v33 then
                v32 = v27;
                v31 = true;
            end;
        end;
        if not v31 then
            v32 = nil;
        end;
    end;
    v31 = false;
    if not v32 then
        return;
    else
        if v29 then
            v28(v32.Value);
        end;
        local v36 = v32:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 141 ]]
            -- upvalues: v28 (copy), v32 (copy)
            v28(v32.Value);
        end);
        return function() --[[ Line: 145 ]]
            -- upvalues: v36 (copy)
            v36:Disconnect();
        end;
    end;
end;
return v3;