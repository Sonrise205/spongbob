local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.TableUtil);
local v2 = require(l_ReplicatedStorage_0.Shared.Modules.WWSDebug);
local v3 = require(l_ReplicatedStorage_0.Shared.Data.InventoryAtlas);
local v4 = {
    Atlas = {}
};
local function _(v5) --[[ Line: 31 ]] --[[ Name: getPosition ]]
    v5 = v5 - 1;
    return Vector2.new(v5 % 8 * 128, v5 // 8 * 128);
end;
for _, v8 in script:WaitForChild("Sheets"):GetChildren() do
    v4.Atlas[v8.Name] = require(v8);
end;
local function _(v9) --[[ Line: 44 ]] --[[ Name: createGradient ]]
    local l_UIGradient_0 = Instance.new("UIGradient");
    for v11, v12 in v9 do
        l_UIGradient_0[v11] = v12;
    end;
    return l_UIGradient_0;
end;
v4.GetSheetData = function(v14, v15) --[[ Line: 55 ]] --[[ Name: GetSheetData ]]
    return v14.Atlas[v15];
end;
v4.GetSheetNameFromItemName = function(v16, v17) --[[ Line: 60 ]] --[[ Name: GetSheetNameFromItemName ]]
    -- upvalues: v1 (copy)
    for v18, v19 in v16.Atlas do
        if v1.Find(v19, function(_, v21) --[[ Line: 62 ]]
            -- upvalues: v17 (copy)
            return v21 == v17;
        end) then
            return v18;
        end;
    end;
end;
v4.GetSheetImage = function(v22, v23, v24) --[[ Line: 71 ]] --[[ Name: GetSheetImage ]]
    -- upvalues: v2 (copy)
    local l_v22_SheetData_0 = v22:GetSheetData(v23);
    local v26 = l_v22_SheetData_0 and l_v22_SheetData_0[v24];
    if not v26 or not v26.sheet or not v26.index then
        v2:Warn((("Failed to get image for sheet: %* | item name: %*"):format(v23, v24)));
        return;
    else
        return l_v22_SheetData_0._sheets[v26.sheet];
    end;
end;
v4.SetImage = function(v27, v28, v29, v30) --[[ Line: 84 ]] --[[ Name: SetImage ]]
    -- upvalues: v2 (copy), v3 (copy)
    if not v28 then
        v2:Warn("ImageLabel missing.", v30, v29);
        return;
    else
        v30 = v30 or v27:GetSheetNameFromItemName(v29);
        local l_v27_SheetData_0 = v27:GetSheetData(v30);
        local v32 = l_v27_SheetData_0 and l_v27_SheetData_0[v29];
        local l_v27_SheetImage_0 = v27:GetSheetImage(v30, v29);
        if not l_v27_SheetImage_0 or not v32 or not v32.sheet or not v32.index then
            v2:Warn((("Failed to set image for sheet: %* | item name: %*"):format(v30, v29)));
            return;
        else
            v28.Image = l_v27_SheetImage_0;
            v28.ScaleType = Enum.ScaleType.Crop;
            local v34 = v32.index - 1;
            v28.ImageRectOffset = Vector2.new(v34 % 8 * 128, v34 // 8 * 128);
            v28.ImageRectSize = Vector2.new(128, 128);
            local l_v3_ByItemName_0 = v3:GetByItemName(v29);
            if l_v3_ByItemName_0 and l_v3_ByItemName_0.iconGradient then
                v34 = v28:FindFirstChildOfClass("UIGradient");
                if not v34 then
                    local l_iconGradient_0 = l_v3_ByItemName_0.iconGradient;
                    local l_UIGradient_1 = Instance.new("UIGradient");
                    for v38, v39 in l_iconGradient_0 do
                        l_UIGradient_1[v38] = v39;
                    end;
                    l_UIGradient_1.Parent = v28;
                    return;
                else
                    for v40, v41 in l_v3_ByItemName_0.iconGradient do
                        v34[v40] = v41;
                    end;
                end;
            end;
            return;
        end;
    end;
end;
v4.CreateImage = function(v42, v43, v44, v45) --[[ Line: 120 ]] --[[ Name: CreateImage ]]
    -- upvalues: v2 (copy), v3 (copy)
    local l_v2_0 = v2;
    local v47 = false;
    if v45 ~= nil then
        v47 = typeof(v45) == "table";
    end;
    l_v2_0:Assert(v47, "Props must be a table");
    v44 = v44 or v42:GetSheetNameFromItemName(v43);
    l_v2_0 = v42:GetSheetData(v44);
    local v48 = l_v2_0 and l_v2_0[v43];
    v47 = v42:GetSheetImage(v44, v43);
    if not v47 or not v48 or not v48.sheet or not v48.index then
        v2:Warn((("Failed to create image for sheet: %* | item name: %*"):format(v44, v43)));
        return;
    else
        local l_ImageLabel_0 = Instance.new("ImageLabel");
        if v45 and typeof(v45) == "table" then
            if not v45.BackgroundTransparency then
                v45.BackgroundTransparency = 1;
            end;
            for v50, v51 in v45 do
                l_ImageLabel_0[v50] = v51;
            end;
        end;
        l_ImageLabel_0.Image = v47;
        l_ImageLabel_0.ScaleType = Enum.ScaleType.Crop;
        local v52 = v48.index - 1;
        l_ImageLabel_0.ImageRectOffset = Vector2.new(v52 % 8 * 128, v52 // 8 * 128);
        l_ImageLabel_0.ImageRectSize = Vector2.new(128, 128);
        local l_v3_ByItemName_1 = v3:GetByItemName(v43);
        if l_v3_ByItemName_1 and l_v3_ByItemName_1.iconGradient then
            local l_iconGradient_1 = l_v3_ByItemName_1.iconGradient;
            local l_UIGradient_2 = Instance.new("UIGradient");
            for v56, v57 in l_iconGradient_1 do
                l_UIGradient_2[v56] = v57;
            end;
            l_UIGradient_2.Parent = l_ImageLabel_0;
        end;
        return l_ImageLabel_0;
    end;
end;
return v4;