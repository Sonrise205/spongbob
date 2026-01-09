local l_Players_0 = game:GetService("Players");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v2 = require(l_ReplicatedStorage_0.Packages.Knit);
local v3 = require(l_ReplicatedStorage_0.Packages.Promise);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v5 = require(l_ReplicatedStorage_0.Packages.Trove);
local v6 = require(l_ReplicatedStorage_0.Shared.Modules.WWSDebug);
local v7 = require(l_ReplicatedStorage_0.Shared.Util.DataUtils);
local v8 = nil;
local v9 = v2.CreateController({
    Name = "DataController", 
    _trove = v5.new()
});
local function _(v10, v11) --[[ Line: 49 ]] --[[ Name: assertTableExists ]]
    -- upvalues: v6 (copy)
    if v10 then
        return true;
    else
        v6:AssertWarnFormat("Table/list not found in Replica! Path: %s, Full Trace: %s", tostring(v11), debug.traceback());
        return false;
    end;
end;
v9.Get = function(_, v14, v15) --[[ Line: 63 ]] --[[ Name: Get ]]
    -- upvalues: v6 (copy), v9 (copy), v7 (copy)
    v6:Assert(v14 ~= nil, "Player passed is nil.");
    local v16 = tostring(v14.UserId);
    return (v9:_getReplica(v16):andThen(function(v17) --[[ Line: 69 ]]
        -- upvalues: v7 (ref), v15 (copy)
        return v7:TryGetValueFromTablePath(v17.Data, v15);
    end, v6.BasicPromiseCatchWarn));
end;
v9.GetReplica = function(v18, v19) --[[ Line: 78 ]] --[[ Name: GetReplica ]]
    -- upvalues: l_Players_0 (copy)
    if not v19 then
        v19 = l_Players_0.LocalPlayer;
    end;
    return v18:_getReplica((tostring(v19.UserId)));
end;
v9.IsProfileActive = function(_) --[[ Line: 86 ]] --[[ Name: IsProfileActive ]]
    -- upvalues: v2 (copy)
    return v2.Player:GetAttribute("DATA_LOADED");
end;
v9.OnChanged = function(_, v22, v23, v24, v25) --[[ Line: 98 ]] --[[ Name: OnChanged ]]
    -- upvalues: v6 (copy), v9 (copy)
    v6:Assert(v22 ~= nil, "Player passed is nil.");
    local v26 = tostring(v22.UserId);
    return v9:_getReplica(v26):andThen(function(v27) --[[ Line: 106 ]]
        -- upvalues: v23 (copy), v24 (copy), v25 (copy), v9 (ref), v22 (copy)
        local v30 = v27:ListenToChange(v23, function(v28, v29) --[[ Line: 108 ]]
            -- upvalues: v24 (ref)
            v24(v28, v29);
        end);
        if v25 then
            task.spawn(function() --[[ Line: 113 ]]
                -- upvalues: v24 (ref), v9 (ref), v22 (ref), v23 (ref)
                v24(v9:Get(v22, v23):expect(), nil);
            end);
        end;
        return v30;
    end, v6.BasicPromiseCatchWarn):expect();
end;
v9._constructDataFromPath = function(_, v32, v33) --[[ Line: 128 ]] --[[ Name: _constructDataFromPath ]]
    assert(v32 ~= nil, "Data base passed for deconstruction is nil.");
    if v33 then
        for _, v35 in ipairs(v33:split(".")) do
            v32 = v32[v35];
        end;
    end;
    return v32;
end;
v9._getReplica = function(_, v37) --[[ Line: 141 ]] --[[ Name: _getReplica ]]
    -- upvalues: v6 (copy), v8 (ref), v5 (copy), v3 (copy)
    v6:Assert(v37 ~= nil, "Replica token passed is nil.");
    local v38 = v8.ReplicaClasses[v37];
    local v39 = v5.new();
    if v38 then
        return v3.resolve(v38);
    else
        return (v3.new(function(v40) --[[ Line: 153 ]]
            -- upvalues: v38 (copy), v39 (copy), v8 (ref), v37 (copy)
            if v38 then
                v40(v38);
                return;
            else
                v39:Add(v8.ReplicaOfClassCreated(v37, v40));
                return;
            end;
        end):tap(function() --[[ Line: 163 ]]
            -- upvalues: v39 (copy)
            v39:Destroy();
        end):andThen(function(v41) --[[ Line: 168 ]]
            -- upvalues: v6 (ref), v3 (ref)
            if not v41 then
                v6:Warn("ReplicaService passed a nil reference on class created. \nTrace:", debug.traceback());
                return v3.reject();
            else
                return v3.resolve(v41);
            end;
        end, v6.BasicPromiseCatchWarn));
    end;
end;
v9._tryGetTableFromReplica = function(_, v43, v44) --[[ Line: 182 ]] --[[ Name: _tryGetTableFromReplica ]]
    -- upvalues: v7 (copy), v6 (copy)
    local v45 = v7:TryGetValueFromTablePath(v43.Data, v44);
    local v46;
    if v45 then
        v46 = true;
    else
        v6:AssertWarnFormat("Table/list not found in Replica! Path: %s, Full Trace: %s", tostring(v44), debug.traceback());
        v46 = false;
    end;
    if not v46 then
        return nil;
    else
        return v45;
    end;
end;
v9._buildReplicaOnChangedConnection = function(_, v48, v49, v50, v51) --[[ Line: 205 ]] --[[ Name: _buildReplicaOnChangedConnection ]]
    local v52 = v49 .. "." .. v50;
    local v53 = nil;
    v53 = v48:ListenToChange(v52, function(v54) --[[ Line: 213 ]]
        -- upvalues: v53 (ref), v51 (copy), v50 (copy)
        if not v54 then
            v53:Disconnect();
            return;
        else
            v51(v50, v54);
            return;
        end;
    end);
    return v53;
end;
v9.KnitInit = function(_) --[[ Line: 229 ]] --[[ Name: KnitInit ]]
    -- upvalues: v8 (ref), l_ReplicatedStorage_0 (copy)
    v8 = require(l_ReplicatedStorage_0.ReplicaController);
    v8:RequestData();
end;
v9.KnitStart = function(_) --[[ Line: 234 ]] --[[ Name: KnitStart ]]

end;
return v9;