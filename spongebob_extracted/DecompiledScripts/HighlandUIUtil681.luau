local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = require(l_ReplicatedStorage_0.Packages.Knit);
local _ = require(l_ReplicatedStorage_0.Packages.Dumpster);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v4 = {
    bypassLoadVisuals = false, 
    frameTime = 0.016666666666666666, 
    populateBy = 60
};
local v5 = {
    filterClass = "TextButton", 
    frameTime = 0.016666666666666666, 
    forceDefer = false
};
return table.freeze({
    loadOnDemand = function(v6, v7, v8, v9, v10, v11) --[[ Line: 33 ]] --[[ Name: loadOnDemand ]]
        -- upvalues: v4 (copy)
        if not v6 or #v6 < 1 then
            return;
        else
            if v8 then
                v8 = v8:Extend();
            end;
            v11 = v11 or v4;
            local v12 = v11.frameTime or v4.frameTime;
            local v13 = v11.populateBy or v4.populateBy;
            local v14 = 0;
            local v15 = v8:Extend();
            local function v21() --[[ Line: 53 ]] --[[ Name: populateAssets ]]
                -- upvalues: v14 (ref), v6 (copy), v15 (copy), v11 (ref), v10 (copy), v8 (ref), v12 (copy), v9 (copy), v13 (copy)
                if v14 + 1 > #v6 then
                    return;
                else
                    if v14 == 0 then
                        v14 = 1;
                    end;
                    v15:Destroy();
                    local v16 = 0;
                    if not v11.bypassLoadVisuals and v10 then
                        v10(v15);
                    end;
                    for _ = v14, #v6 do
                        local l_v14_0 = v14;
                        local v19 = v6[v14];
                        local v20 = v14 + 1;
                        v8:Add(task.delay(v12 * (v16 * 0.5), function() --[[ Line: 78 ]]
                            -- upvalues: v9 (ref), v19 (ref), l_v14_0 (copy), v20 (copy), v14 (ref), v15 (ref)
                            v9(v19, l_v14_0);
                            v19 = nil;
                            if v20 == v14 then
                                v15:Destroy();
                            end;
                        end));
                        v14 = v14 + 1;
                        v16 = v16 + 1;
                        if v13 <= v16 then
                            v16 = 0;
                            return;
                        else
                            --[[ close >= 5 ]]
                        end;
                    end;
                    return;
                end;
            end;
            v21();
            local function v22() --[[ Line: 102 ]] --[[ Name: updateScrollFrame ]]
                -- upvalues: v7 (copy), v21 (copy)
                if v7.CanvasPosition.Y >= (v7.AbsoluteCanvasSize.Y - v7.AbsoluteSize.Y) * 0.9 then
                    v21();
                end;
            end;
            v7.CanvasPosition = Vector2.new(0, 0);
            local l_v7_PropertyChangedSignal_0 = v7:GetPropertyChangedSignal("CanvasPosition");
            v8:Add(l_v7_PropertyChangedSignal_0:Connect(v22));
            if v7.CanvasPosition.Y >= (v7.AbsoluteCanvasSize.Y - v7.AbsoluteSize.Y) * 0.9 then
                v21();
            end;
            return v8;
        end;
    end, 
    deferClearBrowser = function(v24, v25) --[[ Line: 124 ]] --[[ Name: deferClearBrowser ]]
        -- upvalues: v5 (copy)
        v25 = v25 or v5;
        local v26 = v25.filterClass or v5.filterClass;
        local v27 = v25.frameTime or v5.frameTime;
        local l_v24_Children_0 = v24:GetChildren();
        if #l_v24_Children_0 >= 60 or v25.forceDefer then
            for v29, v30 in l_v24_Children_0 do
                if v30.Name == "Template" or v30.Name == "__DELETING__" or v30.ClassName ~= v26 then
                    --[[ close >= 9 ]]
                elseif v25.predicate and not v25.predicate(v30) then
                    --[[ close >= 9 ]]
                else
                    v30.Name = "__DELETING__";
                    v30.Visible = false;
                    do
                        local l_v30_0 = v30;
                        task.delay(v27 * (v29 * 0.6), function() --[[ Line: 146 ]]
                            -- upvalues: l_v30_0 (ref), v29 (copy), l_v24_Children_0 (ref)
                            l_v30_0:Destroy();
                            l_v30_0 = nil;
                            if v29 == #l_v24_Children_0 then
                                table.clear(l_v24_Children_0);
                                l_v24_Children_0 = nil;
                            end;
                        end);
                    end;
                end;
            end;
            return;
        else
            for _, v33 in l_v24_Children_0 do
                if v33.Name ~= "Template" and v33.ClassName == v26 and (not v25.predicate or v25.predicate(v33)) then
                    v33:Destroy();
                end;
            end;
            return;
        end;
    end, 
    loopEntries = function(v34, v35, v36) --[[ Line: 173 ]] --[[ Name: loopEntries ]]
        for _, v38 in v34:GetChildren() do
            if v38.Name ~= "Template" and v38:IsA(v35) then
                v36(v38);
            end;
        end;
    end
});