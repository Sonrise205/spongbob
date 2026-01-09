local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.Knit);
local _ = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v3 = require(l_ReplicatedStorage_0.Packages.TableUtil);
local v4 = require(l_ReplicatedStorage_0.Packages.Promise);
local v5 = require(l_ReplicatedStorage_0.Packages.Signal);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v7 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local v8 = nil;
local v9 = v1.CreateController({
    Name = script.Name, 
    _unitCountCache = {}, 
    IsLoaded = false, 
    Loaded = v5.new(), 
    UnitCountChanged = v5.new()
});
v9.KnitInit = function(_) --[[ Line: 40 ]] --[[ Name: KnitInit ]]
    -- upvalues: v8 (ref), v1 (copy)
    v8 = v1.GetService("GlobalUnitTrackerService");
end;
v9.KnitStart = function(v11) --[[ Line: 45 ]] --[[ Name: KnitStart ]]
    -- upvalues: v8 (ref), v3 (copy)
    v11._unitCountCache = v8:GetInitialCount():expect();
    v8.GlobalCountUpdated:Connect(function(v12) --[[ Line: 48 ]]
        -- upvalues: v11 (copy), v3 (ref)
        for v13, v14 in v12 do
            v11._unitCountCache[v13] = v3.Copy(v14, true);
        end;
        v11.UnitCountChanged:Fire();
    end);
    v11.IsLoaded = true;
    v11.Loaded:Fire();
end;
v9.GetAll = function(v15) --[[ Line: 63 ]] --[[ Name: GetAll ]]
    -- upvalues: v3 (copy)
    if not v15.IsLoaded then
        v15.Loaded:Wait();
    end;
    return v3.Copy(v15._unitCountCache, true);
end;
v9.GetCount = function(v16, v17, v18) --[[ Line: 72 ]] --[[ Name: GetCount ]]
    if not v16.IsLoaded then
        v16.Loaded:Wait();
    end;
    if not v16._unitCountCache[v17] then
        return;
    else
        v18 = v18 or {};
        if v18.Shiny and v18.Mega then
            return v16._unitCountCache[v17].ShinyMega or 0;
        elseif v18.Shiny then
            return v16._unitCountCache[v17].Shiny or 0;
        elseif v18.Mega then
            return v16._unitCountCache[v17].Mega or 0;
        else
            return v16._unitCountCache[v17].Normal or 0;
        end;
    end;
end;
v9.ApplyCountToLabel = function(v19, v20, v21, v22, v23, v24, v25) --[[ Line: 102 ]] --[[ Name: ApplyCountToLabel ]]
    -- upvalues: v4 (copy), v7 (copy)
    if v23 then
        v20 = v20 .. "_Pet";
    end;
    return v4.new(function(v26) --[[ Line: 107 ]]
        -- upvalues: v19 (copy), v20 (ref), v21 (copy), v25 (copy), v22 (copy), v7 (ref), v24 (copy)
        local l_v19_Count_0 = v19:GetCount(v20, v21 or {});
        if not l_v19_Count_0 then
            if v25 then
                v22.Visible = false;
            end;
            return v26(false);
        else
            local function v29() --[[ Line: 118 ]] --[[ Name: updateCount ]]
                -- upvalues: l_v19_Count_0 (ref), v19 (ref), v20 (ref), v21 (ref), v22 (ref), v7 (ref), v24 (ref)
                l_v19_Count_0 = v19:GetCount(v20, v21 or {});
                v22.Visible = true;
                local v28 = v7:SuffixNumber(l_v19_Count_0, false, 1) or tostring(l_v19_Count_0);
                if v24 then
                    v22.Text = string.format(v24, v28);
                    return;
                else
                    v22.Text = v28;
                    return;
                end;
            end;
            v29();
            v26(true, v19.UnitCountChanged:Connect(v29));
            return;
        end;
    end);
end;
return v9;