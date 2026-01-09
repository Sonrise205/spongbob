local l_Players_0 = game:GetService("Players");
local v1 = {};
local v2 = {};
local v3 = {};
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local v5 = {};
v5.__index = v5;
v5.UI_ELEMENTS_TO_AUTO_SCALE = {
    Frame = true, 
    CanvasGroup = true, 
    TextLabel = true, 
    ImageLabel = true, 
    TextButton = true, 
    ImageButton = true, 
    ScrollingFrame = true, 
    TextBox = true, 
    UIGridLayout = true, 
    UIListLayout = true, 
    UIPadding = true, 
    UIStroke = true, 
    UICorner = true, 
    Path2D = true, 
    UITextSizeConstraint = true, 
    UISizeConstraint = true
};
v5.AUTO_SCALE_IGNORE_ATTRIBUTE = "IGNORE_AUTO_SCALING";
local v6 = Vector2.new(1919, 1080);
local function _(v7) --[[ Line: 75 ]] --[[ Name: canAutoSize ]]
    if v7.Size.X.Offset == 0 and v7.Size.Y.Offset == 0 then
        return false;
    elseif v7.Parent and v7.Parent:FindFirstChildWhichIsA("UIGridLayout") then
        return false;
    else
        return true;
    end;
end;
local function v16(v9) --[[ Line: 88 ]] --[[ Name: verifyElement ]]
    if v9:IsA("UIGridLayout") then
        local v10 = false;
        if v9.CellPadding.X.Offset == 0 then
            v10 = v9.CellPadding.Y.Offset == 0;
        end;
        local v11 = false;
        if v9.CellSize.X.Offset == 0 then
            v11 = v9.CellSize.Y.Offset == 0;
        end;
        return not (v10 and v11);
    elseif v9:IsA("UIListLayout") then
        return v9.Padding.Offset ~= 0;
    elseif v9:IsA("UIPadding") then
        local v12 = v9.PaddingTop.Offset == 0;
        local v13 = v9.PaddingBottom.Offset == 0;
        local v14 = v9.PaddingLeft.Offset == 0;
        local v15 = v9.PaddingRight.Offset == 0;
        return not (v12 and v13 and v14 and v15);
    elseif v9:IsA("UICorner") then
        return v9.CornerRadius.Offset > 0;
    elseif v9:IsA("ScrollingFrame") then
        return true;
    elseif v9:IsA("ImageLabel") or v9:IsA("ImageButton") then
        if v9.ScaleType == Enum.ScaleType.Slice or v9.ScaleType == Enum.ScaleType.Tile then
            return true;
        elseif v9.Size.X.Offset == 0 and v9.Size.Y.Offset == 0 then
            return false;
        elseif v9.Parent and v9.Parent:FindFirstChildWhichIsA("UIGridLayout") then
            return false;
        else
            return true;
        end;
    elseif v9:IsA("GuiBase2d") then
        if v9.Size.X.Offset == 0 and v9.Size.Y.Offset == 0 then
            return false;
        elseif v9.Parent and v9.Parent:FindFirstChildWhichIsA("UIGridLayout") then
            return false;
        else
            return true;
        end;
    else
        return true;
    end;
end;
local function v24(v17, v18, v19) --[[ Line: 121 ]] --[[ Name: updateElementScale ]]
    local l_Scale_0 = v17.Size.X.Scale;
    local l_Scale_1 = v17.Size.Y.Scale;
    local v22 = math.round(v19.X.Offset * v18);
    local v23 = math.round(v19.Y.Offset * v18);
    v17.Size = UDim2.new(l_Scale_0, v22, l_Scale_1, v23);
    v17:SetAttribute("TargetOriginalSize", v17.Size);
end;
local v25 = nil;
local function v32(v26, v27) --[[ Line: 133 ]] --[[ Name: getInstanceFromPath ]]
    local v28 = string.split(v27, ".");
    local l_v26_0 = v26;
    for _, v31 in v28 do
        l_v26_0 = l_v26_0:FindFirstChild(v31);
        if not l_v26_0 then
            break;
        end;
    end;
    return l_v26_0;
end;
local _ = function(v33) --[[ Line: 149 ]] --[[ Name: scaleReferenceChanged ]]
    -- upvalues: v3 (copy)
    v33:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ Line: 150 ]]
        -- upvalues: v3 (ref), v33 (copy)
        for _, v35 in v3[v33] do
            v35:_update();
        end;
    end);
end;
local function v42(v37, v38) --[[ Line: 157 ]] --[[ Name: createScaleReference ]]
    -- upvalues: v6 (copy), l_LocalPlayer_0 (copy)
    local l_ScreenGui_0 = Instance.new("ScreenGui");
    l_ScreenGui_0.Name = "AutoScaleReference" .. v37;
    l_ScreenGui_0.ClipToDeviceSafeArea = false;
    l_ScreenGui_0.IgnoreGuiInset = v38;
    l_ScreenGui_0.ResetOnSpawn = false;
    local l_Frame_0 = Instance.new("Frame");
    l_Frame_0.Name = "Reference";
    l_Frame_0.AnchorPoint = Vector2.new(0.5, 0.5);
    l_Frame_0.BackgroundTransparency = 1;
    l_Frame_0.Position = UDim2.fromScale(0.5, 0.5);
    l_Frame_0.Size = UDim2.fromScale(1, 1);
    local l_UIAspectRatioConstraint_0 = Instance.new("UIAspectRatioConstraint");
    l_UIAspectRatioConstraint_0.AspectRatio = v6.X / v6.Y;
    l_UIAspectRatioConstraint_0.Parent = l_Frame_0;
    l_UIAspectRatioConstraint_0.Parent = l_Frame_0;
    l_Frame_0.Parent = l_ScreenGui_0;
    l_ScreenGui_0.Parent = l_LocalPlayer_0.PlayerGui;
    return l_Frame_0;
end;
local l_v32_0 = v32 --[[ copy: 11 -> 14 ]];
v25 = function(v44, v45) --[[ Line: 182 ]] --[[ Name: getScaleReference ]]
    -- upvalues: l_LocalPlayer_0 (copy), v1 (copy), l_v32_0 (copy), v3 (copy), v2 (copy), v42 (copy)
    local v46 = nil;
    local v47 = nil;
    local v48 = nil;
    v46 = v44:GetAttribute("AUTO_SCALE_REFERENCE");
    local l_v45_Attribute_0 = v45:GetAttribute("FORCE_DEFAULT_SCALING");
    if v46 and not l_v45_Attribute_0 then
        v47 = string.split(v46, ".");
        v48 = l_LocalPlayer_0.PlayerGui:FindFirstChild(v47[1]);
    end;
    if v1[v48] then
        return v1[v48];
    else
        if v46 and v48 then
            l_v45_Attribute_0 = table.concat(v47, ".", 2);
            local v50 = l_v32_0(v48, l_v45_Attribute_0);
            if v50 then
                local v51 = {
                    reference = v50, 
                    custom = true
                };
                v1[v48] = v51;
                v3[v50] = {};
                v50:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ Line: 150 ]]
                    -- upvalues: v3 (ref), v50 (copy)
                    for _, v53 in v3[v50] do
                        v53:_update();
                    end;
                end);
                return v51;
            end;
        end;
        l_v45_Attribute_0 = not v44.IgnoreGuiInset and "Inset" or "";
        local v54 = v2[l_v45_Attribute_0];
        if not v54 then
            local v55 = v42(l_v45_Attribute_0, v44.IgnoreGuiInset);
            v54 = {
                reference = v55, 
                custom = false
            };
            v2[l_v45_Attribute_0] = v54;
            v3[v55] = {};
            v55:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ Line: 150 ]]
                -- upvalues: v3 (ref), v55 (copy)
                for _, v57 in v3[v55] do
                    v57:_update();
                end;
            end);
        end;
        return v54;
    end;
end;
v32 = {
    UICorner = function(v58, v59, v60) --[[ Line: 228 ]]
        v58.CornerRadius = UDim.new(v60.Scale, (math.round(v60.Offset * v59)));
    end, 
    UIStroke = function(v61, v62, v63) --[[ Line: 232 ]]
        v61.Thickness = v63 * v62;
    end, 
    Path2D = function(v64, v65, v66) --[[ Line: 236 ]]
        v64.Thickness = v66 * v65;
    end, 
    UIPadding = function(v67, v68, v69) --[[ Line: 240 ]]
        for v70, v71 in v69 do
            local v72 = math.round(v71.Offset * v68);
            local v73 = UDim.new(v67[v70].Scale, v72);
            v67[v70] = v73;
            if v70 == "PaddingBottom" then
                v67:SetAttribute(("Target%*"):format(v70), v73);
            end;
        end;
    end, 
    UIListLayout = function(v74, v75, v76) --[[ Line: 253 ]]
        v74.Padding = UDim.new(v76.Scale, (math.round(v76.Offset * v75)));
    end, 
    UIGridLayout = function(v77, v78, v79, v80) --[[ Line: 257 ]]
        local v81 = math.floor(v79.X.Offset * v78);
        local v82 = math.floor(v79.Y.Offset * v78);
        local l_Scale_2 = v79.X.Scale;
        local l_Scale_3 = v79.Y.Scale;
        v77.CellPadding = UDim2.new(l_Scale_2, v81, l_Scale_3, v82);
        v81 = math.floor(v80.X.Offset * v78);
        v82 = math.floor(v80.Y.Offset * v78);
        l_Scale_2 = v80.X.Scale;
        l_Scale_3 = v80.Y.Scale;
        v77.CellSize = UDim2.new(l_Scale_2, v81, l_Scale_3, v82);
    end, 
    UITextSizeConstraint = function(v85, v86, v87) --[[ Line: 284 ]]
        v85.MaxTextSize = math.max(v87 * v86, v85.MinTextSize);
    end, 
    UISizeConstraint = function(v88, v89, v90, v91) --[[ Line: 292 ]]
        v88.MinSize = v90 * v89;
        v88.MaxSize = v91 * v89;
    end, 
    ScrollingFrame = function(v92, v93, v94, v95, v96) --[[ Line: 302 ]]
        -- upvalues: v24 (copy)
        if v94 then
            v24(v92, v93, v95);
        end;
        v92.ScrollBarThickness = v96 * v93;
    end, 
    ImageLabel = function(v97, v98, v99, v100, v101) --[[ Line: 316 ]]
        -- upvalues: v24 (copy)
        if v99 then
            v24(v97, v98, v100);
        end;
        if not v101 then
            return;
        elseif v101.type == "Slice" then
            v97.SliceScale = v101.value * v98;
            return;
        else
            if v101.type == "Tile" then
                v97.TileSize = UDim2.new(v101.value.X.Scale, math.round(v101.value.X.Offset * v98), v101.value.Y.Scale, (math.round(v101.value.Y.Offset * v98)));
            end;
            return;
        end;
    end
};
v32.ImageButton = v32.ImageLabel;
v5.new = function(v102) --[[ Line: 345 ]] --[[ Name: new ]]
    -- upvalues: v5 (copy), v16 (copy), v25 (ref), v3 (copy), v32 (copy), v24 (copy)
    local l_v102_FirstAncestorOfClass_0 = v102:FindFirstAncestorOfClass("ScreenGui");
    if not l_v102_FirstAncestorOfClass_0 or l_v102_FirstAncestorOfClass_0:GetAttribute(v5.AUTO_SCALE_IGNORE_ATTRIBUTE) then
        return;
    elseif l_v102_FirstAncestorOfClass_0.Name == "ChallengesGui" or l_v102_FirstAncestorOfClass_0.Name == "ChallengeToastGui" or l_v102_FirstAncestorOfClass_0.Name == "ChallengeProgressGui" then
        return;
    elseif not v16(v102) then
        return;
    else
        local v104 = setmetatable({
            element = v102
        }, v5);
        local v105 = v104:_calculateArgs();
        local v106 = v25(l_v102_FirstAncestorOfClass_0, v102);
        if v106.reference == v102 or #v104._args < 1 then
            table.clear(v104._args);
            v104:Destroy();
            return;
        else
            v3[v106.reference][v102] = v104;
            v104.scaleFunction = v32[v104.element.ClassName];
            if not v104.scaleFunction then
                v104.scaleFunction = v24;
            end;
            v104.scaleReference = v106;
            v104:_update();
            v104.connections = {};
            for _, v108 in v105 do
                table.insert(v104.connections, v102:GetAttributeChangedSignal(v108):Connect(function() --[[ Line: 389 ]]
                    -- upvalues: v104 (copy)
                    v104:_calculateArgs();
                    v104:_update();
                end));
            end;
            return v104;
        end;
    end;
end;
v5.Destroy = function(v109) --[[ Line: 400 ]] --[[ Name: Destroy ]]
    -- upvalues: v3 (copy)
    if v109.scaleReference and v3[v109.scaleReference.reference] then
        v3[v109.scaleReference.reference][v109.element] = nil;
    end;
    for _, v111 in v109.connections do
        v111:Disconnect();
    end;
    table.clear(v109);
    setmetatable(v109, nil);
end;
v5._calculateArgs = function(v112) --[[ Line: 415 ]] --[[ Name: _calculateArgs ]]
    local v113 = {};
    local l_element_0 = v112.element;
    local v115 = {};
    if l_element_0:IsA("ScrollingFrame") then
        table.insert(v113, l_element_0:GetAttribute("ForceAutoScale") or (not (l_element_0.Size.X.Offset == 0) or not (l_element_0.Size.Y.Offset == 0)) and (not l_element_0.Parent or not l_element_0.Parent:FindFirstChildWhichIsA("UIGridLayout") or false));
        local l_l_element_0_Attribute_0 = l_element_0:GetAttribute("OriginalSize");
        if not l_l_element_0_Attribute_0 then
            l_element_0:SetAttribute("OriginalSize", l_element_0.Size);
            l_l_element_0_Attribute_0 = l_element_0.Size;
        end;
        local l_l_element_0_Attribute_1 = l_element_0:GetAttribute("OriginalScrollBarThickness");
        if not l_l_element_0_Attribute_1 then
            l_element_0:SetAttribute("OriginalScrollBarThickness", l_element_0.ScrollBarThickness);
            l_l_element_0_Attribute_1 = l_element_0.ScrollBarThickness;
        end;
        table.insert(v113, l_l_element_0_Attribute_0);
        table.insert(v113, l_l_element_0_Attribute_1);
        table.insert(v115, "OriginalSize");
        table.insert(v115, "OriginalScrollBarThickness");
    elseif l_element_0:IsA("ImageLabel") or l_element_0:IsA("ImageButton") then
        table.insert(v113, (not (l_element_0.Size.X.Offset == 0) or not (l_element_0.Size.Y.Offset == 0)) and (not l_element_0.Parent or not l_element_0.Parent:FindFirstChildWhichIsA("UIGridLayout") or false));
        local l_l_element_0_Attribute_2 = l_element_0:GetAttribute("OriginalSize");
        if not l_l_element_0_Attribute_2 then
            l_element_0:SetAttribute("OriginalSize", l_element_0.Size);
            l_l_element_0_Attribute_2 = l_element_0.Size;
        end;
        table.insert(v113, l_l_element_0_Attribute_2);
        if l_element_0.ScaleType == Enum.ScaleType.Slice then
            local l_l_element_0_Attribute_3 = l_element_0:GetAttribute("OriginalSliceScale");
            if not l_l_element_0_Attribute_3 then
                l_element_0:SetAttribute("OriginalSliceScale", l_element_0.SliceScale);
                l_l_element_0_Attribute_3 = l_element_0.SliceScale;
            end;
            table.insert(v113, {
                type = "Slice", 
                value = l_l_element_0_Attribute_3
            });
        elseif l_element_0.ScaleType == Enum.ScaleType.Tile then
            local l_l_element_0_Attribute_4 = l_element_0:GetAttribute("OriginalTileSize");
            if not l_l_element_0_Attribute_4 then
                l_element_0:SetAttribute("OriginalTileSize", l_element_0.TileSize);
                l_l_element_0_Attribute_4 = l_element_0.TileSize;
            end;
            table.insert(v113, {
                type = "Tile", 
                value = l_l_element_0_Attribute_4
            });
        end;
        table.insert(v115, "OriginalSize");
        table.insert(v115, "OriginalSliceScale");
        table.insert(v115, "OriginalTileSize");
    elseif l_element_0:IsA("UIGridLayout") then
        local l_l_element_0_Attribute_5 = l_element_0:GetAttribute("OriginalCellPadding");
        local l_l_element_0_Attribute_6 = l_element_0:GetAttribute("OriginalCellSize");
        if not l_l_element_0_Attribute_5 then
            l_element_0:SetAttribute("OriginalCellPadding", l_element_0.CellPadding);
            l_l_element_0_Attribute_5 = l_element_0.CellPadding;
        end;
        if not l_l_element_0_Attribute_6 then
            l_element_0:SetAttribute("OriginalCellSize", l_element_0.CellSize);
            l_l_element_0_Attribute_6 = l_element_0.CellSize;
        end;
        table.insert(v113, l_l_element_0_Attribute_5);
        table.insert(v113, l_l_element_0_Attribute_6);
        table.insert(v115, "OriginalCellPadding");
        table.insert(v115, "OriginalCellSize");
    elseif l_element_0:IsA("UIListLayout") then
        local l_l_element_0_Attribute_7 = l_element_0:GetAttribute("OriginalPadding");
        if not l_l_element_0_Attribute_7 then
            l_element_0:SetAttribute("OriginalPadding", l_element_0.Padding);
            l_l_element_0_Attribute_7 = l_element_0.Padding;
        end;
        table.insert(v113, l_l_element_0_Attribute_7);
        table.insert(v115, "OriginalPadding");
    elseif l_element_0:IsA("UITextSizeConstraint") then
        local l_l_element_0_Attribute_8 = l_element_0:GetAttribute("OriginalMaxTextSize");
        if not l_l_element_0_Attribute_8 then
            l_element_0:SetAttribute("OriginalMaxTextSize", l_element_0.MaxTextSize);
            l_l_element_0_Attribute_8 = l_element_0.MaxTextSize;
        end;
        table.insert(v113, l_l_element_0_Attribute_8);
        table.insert(v115, "OriginalMaxTextSize");
    elseif l_element_0:IsA("UISizeConstraint") then
        local l_l_element_0_Attribute_9 = l_element_0:GetAttribute("OriginalMinSize");
        local l_l_element_0_Attribute_10 = l_element_0:GetAttribute("OriginalMaxSize");
        if not l_l_element_0_Attribute_9 then
            l_element_0:SetAttribute("OriginalMinSize", l_element_0.MinSize);
            l_l_element_0_Attribute_9 = l_element_0.MinSize;
        end;
        if not l_l_element_0_Attribute_10 then
            l_element_0:SetAttribute("OriginalMaxSize", l_element_0.MaxSize);
            l_l_element_0_Attribute_10 = l_element_0.MaxSize;
        end;
        table.insert(v113, l_l_element_0_Attribute_9);
        table.insert(v113, l_l_element_0_Attribute_10);
        table.insert(v115, "OriginalMinSize");
        table.insert(v115, "OriginalMaxSize");
    elseif l_element_0:IsA("UIPadding") then
        local l_l_element_0_Attribute_11 = l_element_0:GetAttribute("OriginalPaddingBottom");
        local l_l_element_0_Attribute_12 = l_element_0:GetAttribute("OriginalPaddingLeft");
        local l_l_element_0_Attribute_13 = l_element_0:GetAttribute("OriginalPaddingRight");
        local l_l_element_0_Attribute_14 = l_element_0:GetAttribute("OriginalPaddingTop");
        if not l_l_element_0_Attribute_11 then
            l_element_0:SetAttribute("OriginalPaddingBottom", l_element_0.PaddingBottom);
            l_l_element_0_Attribute_11 = l_element_0.PaddingBottom;
        end;
        if not l_l_element_0_Attribute_12 then
            l_element_0:SetAttribute("OriginalPaddingLeft", l_element_0.PaddingLeft);
            l_l_element_0_Attribute_12 = l_element_0.PaddingLeft;
        end;
        if not l_l_element_0_Attribute_13 then
            l_element_0:SetAttribute("OriginalPaddingRight", l_element_0.PaddingRight);
            l_l_element_0_Attribute_13 = l_element_0.PaddingRight;
        end;
        if not l_l_element_0_Attribute_14 then
            l_element_0:SetAttribute("OriginalPaddingTop", l_element_0.PaddingTop);
            l_l_element_0_Attribute_14 = l_element_0.PaddingTop;
        end;
        table.insert(v113, {
            PaddingBottom = l_l_element_0_Attribute_11, 
            PaddingLeft = l_l_element_0_Attribute_12, 
            PaddingRight = l_l_element_0_Attribute_13, 
            PaddingTop = l_l_element_0_Attribute_14
        });
        table.insert(v115, "OriginalPaddingBottom");
        table.insert(v115, "OriginalPaddingLeft");
        table.insert(v115, "OriginalPaddingRight");
        table.insert(v115, "OriginalPaddingTop");
    elseif l_element_0:IsA("UIStroke") or l_element_0:IsA("Path2D") then
        local l_l_element_0_Attribute_15 = l_element_0:GetAttribute("OriginalThickness");
        if not l_l_element_0_Attribute_15 then
            l_element_0:SetAttribute("OriginalThickness", l_element_0.Thickness);
            l_l_element_0_Attribute_15 = l_element_0.Thickness;
        end;
        table.insert(v113, l_l_element_0_Attribute_15);
        table.insert(v115, "OriginalThickness");
    elseif l_element_0:IsA("UICorner") then
        local l_l_element_0_Attribute_16 = l_element_0:GetAttribute("OriginalCornerRadius");
        if not l_l_element_0_Attribute_16 then
            l_element_0:SetAttribute("OriginalCornerRadius", l_element_0.CornerRadius);
            l_l_element_0_Attribute_16 = l_element_0.CornerRadius;
        end;
        table.insert(v113, l_l_element_0_Attribute_16);
        table.insert(v115, "OriginalCornerRadius");
    else
        local l_l_element_0_Attribute_17 = l_element_0:GetAttribute("OriginalSize");
        if not l_l_element_0_Attribute_17 then
            l_element_0:SetAttribute("OriginalSize", l_element_0.Size);
            l_l_element_0_Attribute_17 = l_element_0.Size;
        end;
        table.insert(v113, l_l_element_0_Attribute_17);
        table.insert(v115, "OriginalSize");
    end;
    v112._args = v113;
    return v115;
end;
v5._update = function(v134) --[[ Line: 613 ]] --[[ Name: _update ]]
    -- upvalues: v6 (copy)
    local l_reference_0 = v134.scaleReference.reference;
    local v136 = if v134.scaleReference.custom then l_reference_0.AbsoluteSize.X / l_reference_0.Size.X.Offset else (l_reference_0.AbsoluteSize / v6).X;
    v134.scaleFunction(v134.element, v136, table.unpack(v134._args));
end;
return v5;