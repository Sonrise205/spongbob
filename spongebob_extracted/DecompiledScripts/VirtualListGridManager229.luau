local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_RunService_0 = game:GetService("RunService");
local v2 = require(l_ReplicatedStorage_0.Packages.Knit);
local v3 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v4 = require(l_ReplicatedStorage_0.Packages.TableUtil);
local v5 = require(l_ReplicatedStorage_0.Packages.Signal);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v7 = require(l_ReplicatedStorage_0.Shared.Data.UnitShared);
local v8 = require(l_ReplicatedStorage_0.Shared.Modules.UnitViewport);
local v9 = require(l_ReplicatedStorage_0.Shared.Modules.Timer);
local v10 = nil;
local v11 = {};
v11.__index = v11;
v11.new = function(v12, v13, v14, v15) --[[ Line: 25 ]] --[[ Name: new ]]
    -- upvalues: v11 (copy), v3 (copy), v5 (copy), v4 (copy)
    local v16 = setmetatable({}, v11);
    v16.dumpster = v3.new();
    v16.config = {
        ITEM_WIDTH = 140, 
        ITEM_HEIGHT = 140, 
        PADDING_X = 22, 
        PADDING_Y = 20, 
        ITEMS_PER_ROW = 6, 
        VISIBLE_ROWS = 3, 
        TOTAL_VISIBLE_ITEMS = 18
    };
    v16.ViewportsCache = {};
    v16.ItemVisible = v16.dumpster:Construct(v5);
    v16.defaultConfigProps = v4.Copy(v16.config, true);
    v16.scrollingFrame = v12;
    v16.template = v13;
    v16.template.Visible = false;
    v16.clickCallback = v14;
    v16.eventDictionary = v15;
    v16._buttonDumps = {};
    v16.state = {
        visibleItems = {}, 
        visibleItemsData = {}, 
        uidsVisible = {}, 
        itemPool = {}, 
        items = {}
    };
    v16:Init();
    return v16;
end;
v11.Init = function(v17) --[[ Line: 71 ]] --[[ Name: Init ]]
    v17.scrollingFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y;
    v17.scrollingFrame.ScrollingEnabled = true;
    v17.scrollConnection = v17.scrollingFrame:GetPropertyChangedSignal("CanvasPosition"):Connect(function() --[[ Line: 76 ]]
        -- upvalues: v17 (copy)
        v17:updateVisibleItems();
    end);
    v17:updateCanvasSize();
    v17:updateVisibleItems();
    v17:StartRecycler();
end;
v11.GetVisibleItems = function(v18) --[[ Line: 87 ]] --[[ Name: GetVisibleItems ]]
    return table.clone(v18.state.visibleItemsData);
end;
v11.setItems = function(v19, v20) --[[ Line: 91 ]] --[[ Name: setItems ]]
    v19.state.items = v20;
    v19:updateCanvasSize();
    v19:updateVisibleItems();
end;
v11.updateCanvasSize = function(v21) --[[ Line: 97 ]] --[[ Name: updateCanvasSize ]]
    local v22 = v21.config.ITEM_WIDTH * v21.config.ITEMS_PER_ROW + v21.config.PADDING_X * (v21.config.ITEMS_PER_ROW - 1);
    local v23 = math.ceil(#v21.state.items / v21.config.ITEMS_PER_ROW);
    local v24 = v21.config.ITEM_HEIGHT * v23 + v21.config.PADDING_Y * (v23 - 1);
    v21.scrollingFrame.CanvasSize = UDim2.fromOffset(v22, v24);
end;
v11.getItem = function(v25) --[[ Line: 109 ]] --[[ Name: getItem ]]
    local v26 = table.remove(v25.state.itemPool);
    if not v26 then
        v26 = v25.template:Clone();
        v26.Parent = v25.scrollingFrame;
        v26.Size = UDim2.fromOffset(v25.config.ITEM_WIDTH, v25.config.ITEM_HEIGHT);
    end;
    return v26;
end;
v11.recycleItem = function(v27, v28) --[[ Line: 121 ]] --[[ Name: recycleItem ]]
    if v27._buttonDumps[v28] then
        v27._buttonDumps[v28]:Destroy();
    end;
    table.insert(v27.state.itemPool, v28);
    v28.Parent = nil;
end;
v11.updateVisibleItems = function(v29, v30) --[[ Line: 131 ]] --[[ Name: updateVisibleItems ]]
    -- upvalues: l_RunService_0 (copy), v7 (copy), v10 (ref)
    local v31 = math.floor(v29.scrollingFrame.CanvasPosition.Y / (v29.config.ITEM_HEIGHT + v29.config.PADDING_Y)) * v29.config.ITEMS_PER_ROW + 1;
    local v32 = 10;
    local v33 = 1;
    for _, v35 in v29.state.visibleItems do
        v29:recycleItem(v35);
        v33 = v33 + 1;
        if v33 % v32 == 0 then
            v33 = 1;
            l_RunService_0.RenderStepped:Wait();
        end;
    end;
    v33 = 1;
    v32 = 10;
    table.clear(v29.state.visibleItemsData);
    table.clear(v29.state.visibleItems);
    if v30 then
        return;
    else
        for v36 = v31, math.min(v31 + (v29.config.VISIBLE_ROWS + 1) * v29.config.ITEMS_PER_ROW - 1, #v29.state.items) do
            local v37 = v29:getItem();
            local v38 = v36 - 1;
            local v39 = math.floor(v38 / v29.config.ITEMS_PER_ROW);
            local v40 = v38 % v29.config.ITEMS_PER_ROW;
            local v41 = v40 * v29.config.ITEM_WIDTH + v40 * v29.config.PADDING_X;
            local v42 = v39 * v29.config.ITEM_HEIGHT + v39 * v29.config.PADDING_Y;
            local v43 = v29.state.items[v36];
            v37.Position = UDim2.fromOffset(v41, v42);
            v37.Name = v43.UID;
            v37.Content.Info.UnitName.Text = v7:GetUnitValue(v43.Name, "FullName") or v43.Name;
            v37.Content.Info.Level.Text = ("Lvl. %*"):format(v43.Data.Level or 1);
            v37.Content.Info.Cost.Amount.Text = ("$%*"):format((v7:GetUnitValue(v43.Name, "Cost")));
            v37.Visible = true;
            v37.Parent = v29.scrollingFrame;
            if v29._buttonDumps[v37] then
                v29._buttonDumps[v37]:Destroy();
            end;
            v29._buttonDumps[v37] = v29.dumpster:Extend();
            local v44 = v29:getUnitViewport(v43.Name, v37.Content.Info);
            v44:SetVisible(true);
            v29._buttonDumps[v37]:Add(function() --[[ Line: 198 ]]
                -- upvalues: v29 (copy), v37 (copy), v44 (copy), v43 (copy)
                v29._buttonDumps[v37] = nil;
                v44:SetVisible(false);
                task.delay(30, function() --[[ Line: 202 ]]
                    -- upvalues: v29 (ref), v43 (ref), v44 (ref)
                    v29:cacheViewport(v43.Name, v44);
                end);
            end);
            local v45 = {};
            if v29.eventDictionary then
                if v29.eventDictionary.MouseEnter then
                    v45.MouseEnter = function() --[[ Line: 211 ]]
                        -- upvalues: v29 (copy), v37 (copy), v43 (copy)
                        v29.eventDictionary:MouseEnter(v37, v43);
                    end;
                end;
                if v29.eventDictionary.MouseLeave then
                    v45.MouseLeave = function() --[[ Line: 217 ]]
                        -- upvalues: v29 (copy), v37 (copy), v43 (copy)
                        v29.eventDictionary:MouseLeave(v37, v43);
                    end;
                end;
            end;
            v29._buttonDumps[v37]:Add(v10:HandleButton(v37, function() --[[ Line: 223 ]]
                -- upvalues: v29 (copy), v37 (copy), v43 (copy)
                v29.clickCallback(v37, v43);
            end, v45));
            v29.state.visibleItemsData[v37] = v43;
            table.insert(v29.state.visibleItems, v37);
            v29.ItemVisible:Fire(v37, v43);
        end;
        return;
    end;
end;
v11.scrollToItem = function(v46, v47) --[[ Line: 241 ]] --[[ Name: scrollToItem ]]
    local v48 = nil;
    for v49, v50 in v46.state.items do
        if v50.UID == v47 then
            v48 = v49;
            break;
        end;
    end;
    if not v48 then
        return;
    else
        local v51 = math.floor((v48 - 1) / v46.config.ITEMS_PER_ROW) * (v46.config.ITEM_HEIGHT + v46.config.PADDING_Y);
        v46.scrollingFrame.CanvasPosition = Vector2.new(0, v51);
        return;
    end;
end;
v11.getUnitViewport = function(v52, v53, v54) --[[ Line: 265 ]] --[[ Name: getUnitViewport ]]
    -- upvalues: v8 (copy)
    local _ = os.clock();
    local v56 = nil;
    if v52.ViewportsCache[v53] then
        local v57 = v52.ViewportsCache[v53][1];
        if v57 then
            v56 = v57.viewportClass;
            v56:SwitchParent(v54);
            table.remove(v52.ViewportsCache[v53], 1);
        end;
    end;
    if not v56 then
        v56 = v8.new(v54, v53);
    end;
    return v56;
end;
v11.cacheViewport = function(v58, v59, v60) --[[ Line: 286 ]] --[[ Name: cacheViewport ]]
    if not v58.ViewportsCache[v59] then
        v58.ViewportsCache[v59] = {};
    end;
    table.insert(v58.ViewportsCache[v59], {
        cachedAt = os.clock(), 
        viewportClass = v60
    });
    v60:SwitchParent(nil);
end;
v11.StartRecycler = function(v61) --[[ Line: 301 ]] --[[ Name: StartRecycler ]]
    -- upvalues: v9 (copy), l_RunService_0 (copy)
    v61.dumpster:Add(v9.Simple(120, function() --[[ Line: 304 ]]
        -- upvalues: v61 (copy), l_RunService_0 (ref)
        local v62 = 1;
        for v63, v64 in v61.ViewportsCache do
            local v65 = table.clone(v64);
            for v66, v67 in v64 do
                if os.clock() - v67.cachedAt >= 120 then
                    v67.viewportClass:Destroy();
                    table.remove(v65, v66);
                end;
                v62 = v62 + 1;
                if v62 % 10 == 0 then
                    v62 = 1;
                    l_RunService_0.RenderStepped:Wait();
                end;
            end;
            table.clear(v64);
            v61.ViewportsCache[v63] = v65;
        end;
    end));
end;
v11.Destroy = function(v68) --[[ Line: 331 ]] --[[ Name: Destroy ]]
    if v68.scrollConnection then
        v68.scrollConnection:Disconnect();
    end;
    for _, v70 in v68.state.visibleItems do
        v70:Destroy();
    end;
    for _, v72 in v68.state.itemPool do
        v72:Destroy();
    end;
    table.clear(v68.state.visibleItemsData);
    table.clear(v68.state.visibleItems);
    table.clear(v68.state.itemPool);
    table.clear(v68.state.items);
end;
v2.OnStart():andThen(function() --[[ Line: 352 ]]
    -- upvalues: v10 (ref), v2 (copy)
    v10 = v2.GetController("UIController");
end);
return v11;