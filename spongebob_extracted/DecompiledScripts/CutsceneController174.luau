local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.Knit);
local _ = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v3 = require(l_ReplicatedStorage_0.Packages.Promise);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v5 = require(l_ReplicatedStorage_0.Shared.Modules.WWSDebug);
local v6 = nil;
local v7 = nil;
local v8 = nil;
local v9 = false;
local v10 = nil;
local v11 = {};
local v12 = v1.CreateController({
    Name = script.Name, 
    Client = {}
});
v12.KnitInit = function(_) --[[ Line: 51 ]] --[[ Name: KnitInit ]]
    -- upvalues: v6 (ref), v1 (copy), v7 (ref), v8 (ref), v11 (copy)
    v6 = v1.GetController("DataController");
    v7 = v1.GetService("CutsceneService");
    v8 = v1.GetService("TradingService");
    for _, v15 in script.Cutscenes:GetChildren() do
        local v16 = require(v15);
        v11[v15.Name] = v16;
    end;
end;
v12.KnitStart = function(v17) --[[ Line: 63 ]] --[[ Name: KnitStart ]]
    -- upvalues: v7 (ref)
    v7.Play:Connect(function(v18, ...) --[[ Line: 64 ]]
        -- upvalues: v17 (copy)
        v17:Play(v18, ...);
    end);
    v7.Skip:Connect(function(v19, v20, ...) --[[ Line: 68 ]]
        -- upvalues: v17 (copy)
        v17[v19 and "ForceSkip" or "Skip"](v17, v20, ...);
    end);
end;
v12.Play = function(v21, v22, ...) --[[ Line: 75 ]] --[[ Name: Play ]]
    -- upvalues: v9 (ref), v10 (ref), v8 (ref), v3 (copy)
    local v23 = v21:_createCutscene(v22, ...);
    if not v23 then
        return;
    else
        v9 = true;
        v10 = v23;
        local v24 = {
            ...
        };
        v8.CancelRequests:Fire();
        v3.new(function(v25) --[[ Line: 87 ]]
            -- upvalues: v23 (copy), v24 (copy)
            v25((v23:Play(table.unpack(v24))));
        end):andThen(function(v26) --[[ Line: 90 ]]
            -- upvalues: v9 (ref), v10 (ref), v23 (copy)
            v9 = false;
            v10 = nil;
            if not v26 and not v23._skipped then
                v23:_cleanup();
            end;
        end);
        return;
    end;
end;
v12.Skip = function(_) --[[ Line: 100 ]] --[[ Name: Skip ]]
    -- upvalues: v9 (ref), v10 (ref)
    if not v9 or not v10 then
        return;
    else
        v10._skipped = true;
        v10:Skip();
        return;
    end;
end;
v12.ForceSkip = function(v28, v29, ...) --[[ Line: 109 ]] --[[ Name: ForceSkip ]]
    local v30 = v28:_createCutscene(v29, ...);
    if not v30 then
        return;
    else
        v30:Skip(...);
        return;
    end;
end;
v12.IsPlaying = function(_) --[[ Line: 118 ]] --[[ Name: IsPlaying ]]
    -- upvalues: v9 (ref)
    return v9;
end;
v12._createCutscene = function(_, v33, ...) --[[ Line: 124 ]] --[[ Name: _createCutscene ]]
    -- upvalues: v9 (ref), v11 (copy), v5 (copy)
    if v9 then
        return;
    else
        local v34 = v11[v33];
        if not v34 then
            v5:Warn("Cutscene not found:", v33);
            return;
        else
            local v35 = v34.new(...);
            if not v35 then
                v5:Warn("Failed to create cutscene:", v33);
                return;
            else
                return v35;
            end;
        end;
    end;
end;
return v12;