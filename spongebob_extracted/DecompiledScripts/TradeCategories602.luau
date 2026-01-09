local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.Knit);
local _ = require(l_ReplicatedStorage_0.Packages.Dumpster);
local _ = require(l_ReplicatedStorage_0.Packages.TableUtil);
local v4 = require(l_ReplicatedStorage_0.Shared.Util.PathUtil);
local v5 = require(l_ReplicatedStorage_0.Shared.Data.Variables);
local v6 = nil;
local v7 = nil;
local v8 = nil;
local v9 = {
    Content = {
        BackgroundColor3 = Color3.fromRGB(80, 85, 150)
    }, 
    ["Content.UIStroke"] = {
        Color = Color3.fromRGB(255, 199, 156)
    }, 
    ["Content.Info.Title"] = {
        TextColor3 = Color3.fromRGB(255, 255, 255)
    }
};
local v10 = {
    Content = {
        BackgroundColor3 = Color3.fromRGB(19, 22, 48)
    }, 
    ["Content.UIStroke"] = {
        Color = Color3.fromRGB(19, 22, 48)
    }, 
    ["Content.Info.Title"] = {
        TextColor3 = Color3.fromRGB(80, 85, 150)
    }
};
local v11 = {
    primaryMenu = false, 
    highPriority = true
};
local function v19(v12, v13) --[[ Line: 65 ]] --[[ Name: changeButtonProps ]]
    -- upvalues: v4 (copy)
    for v14, v15 in v13 do
        local v16 = v4(v12, v14);
        if v16 then
            for v17, v18 in v15 do
                v16[v17] = v18;
            end;
        end;
    end;
end;
v11.Init = function(v20, v21, v22) --[[ Line: 79 ]] --[[ Name: Init ]]
    -- upvalues: v6 (ref), v1 (copy)
    v6 = v1.GetController("UIController");
    v20.currentMode = v22;
    v20.ui = v21;
    v20.main = v21.Main;
    v20.categoryButtons = {};
    for _, v24 in v20.main:GetChildren() do
        if v24:IsA("TextButton") then
            v20.categoryButtons[v24.Name] = v24;
        end;
    end;
    v20.category = "Units";
    v20:_updateSelected();
end;
v11.Start = function(v25) --[[ Line: 100 ]] --[[ Name: Start ]]
    -- upvalues: v7 (ref), v6 (ref), v8 (ref)
    v7 = v6:GetModuleAsync("Units"):expect();
    v8 = v6:GetModuleAsync("Items"):expect();
    for v26, v27 in v25.categoryButtons do
        v6:HandleButton(v27, function() --[[ Line: 105 ]]
            -- upvalues: v25 (copy), v26 (copy)
            v25:SetCategory(v26);
        end);
    end;
end;
v11.GetCategory = function(v28) --[[ Line: 112 ]] --[[ Name: GetCategory ]]
    return v28.category;
end;
v11.OpenCategory = function(v29) --[[ Line: 116 ]] --[[ Name: OpenCategory ]]
    -- upvalues: v6 (ref), v7 (ref), v8 (ref)
    v6:Toggle(script.Name, true);
    if v29.category == "Units" then
        v7:OpenWithState("TradingSelection");
        return;
    else
        v8:OpenForTrading();
        return;
    end;
end;
v11.SetCategory = function(v30, v31) --[[ Line: 126 ]] --[[ Name: SetCategory ]]
    -- upvalues: v1 (copy), v5 (copy)
    if not v1.Player:GetAttribute(v5.TRADING.ATTRIBUTE) then
        return;
    elseif v31 ~= "Units" and v31 ~= "Items" then
        return;
    else
        v30.category = v31;
        v30:_updateSelected();
        v30:OpenCategory();
        return;
    end;
end;
v11._updateSelected = function(v32) --[[ Line: 143 ]] --[[ Name: _updateSelected ]]
    -- upvalues: v9 (copy), v10 (copy), v19 (copy)
    for v33, v34 in v32.categoryButtons do
        local v35 = if v33 == v32.category then v9 else v10;
        v19(v34, v35);
    end;
end;
return v11;