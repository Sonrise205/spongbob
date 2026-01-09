local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_RunService_0 = game:GetService("RunService");
local v2 = require(l_ReplicatedStorage_0.Shared.Modules.WWSDebug);
local v3 = {
    [1] = "rbxassetid://125567321062911", 
    [2] = "rbxassetid://122230918434447", 
    [3] = "rbxassetid://88615146551062", 
    [4] = "rbxassetid://73165236219251"
};
local function _(v4) --[[ Line: 18 ]] --[[ Name: getPosition ]]
    v4 = v4 - 1;
    return Vector2.new(v4 % 8 * 128, v4 // 8 * 128);
end;
local function _(v6) --[[ Line: 27 ]] --[[ Name: attemptFixName ]]
    if v6 == "RealPioneerRock" then
        return "PioneerRock";
    else
        return v6;
    end;
end;
local v8 = {};
for _, v10 in script:WaitForChild("UnitSheets"):GetChildren() do
    if v10:IsA("ModuleScript") then
        for v11, v12 in require(v10) do
            v8[v11] = v12;
        end;
    end;
end;
v8.SetImage = function(_, v14, v15) --[[ Line: 48 ]] --[[ Name: SetImage ]]
    -- upvalues: v8 (copy), v2 (copy), v3 (copy)
    local l_v15_0 = v15;
    v15 = l_v15_0 == "RealPioneerRock" and "PioneerRock" or l_v15_0;
    l_v15_0 = v8[v15];
    if not l_v15_0 then
        v2:Warn("Failed to find SpriteSheet info for unit: " .. v15);
        return;
    else
        v14.Image = v3[l_v15_0.sheet];
        v14.ScaleType = Enum.ScaleType.Crop;
        local v17 = l_v15_0.index - 1;
        v14.ImageRectOffset = Vector2.new(v17 % 8 * 128, v17 // 8 * 128);
        v14.ImageRectSize = Vector2.new(128, 128);
        return;
    end;
end;
v8.CreateImage = function(_, v19, v20) --[[ Line: 64 ]] --[[ Name: CreateImage ]]
    -- upvalues: v2 (copy), v8 (copy), l_RunService_0 (copy), v3 (copy)
    local l_v19_0 = v19;
    v19 = l_v19_0 == "RealPioneerRock" and "PioneerRock" or l_v19_0;
    l_v19_0 = v2;
    local v22 = false;
    if v20 ~= nil then
        v22 = typeof(v20) == "table";
    end;
    l_v19_0:Assert(v22, "Props must be a table");
    l_v19_0 = v8[v19];
    if not l_v19_0 then
        if l_RunService_0:IsStudio() then
            v2:Warn("Failed to find SpriteSheet info for unit: " .. v19);
        end;
        return;
    else
        local l_ImageLabel_0 = Instance.new("ImageLabel");
        for v24, v25 in v20 do
            l_ImageLabel_0[v24] = v25;
        end;
        l_ImageLabel_0.BackgroundTransparency = 1;
        l_ImageLabel_0.Image = v3[l_v19_0.sheet];
        l_ImageLabel_0.ScaleType = Enum.ScaleType.Crop;
        local v26 = l_v19_0.index - 1;
        l_ImageLabel_0.ImageRectOffset = Vector2.new(v26 % 8 * 128, v26 // 8 * 128);
        l_ImageLabel_0.ImageRectSize = Vector2.new(128, 128);
        return l_ImageLabel_0;
    end;
end;
if l_RunService_0:IsStudio() then
    for v27, _ in v8 do
        if typeof(v8[v27]) ~= "function" then
            if not l_ReplicatedStorage_0.Models.Friendlies:FindFirstChild(v27) then
                v2:Warn("\226\154\160\239\184\143 Unit Model not found from Image name:", v27);
            else
                local _ = nil;
            end;
        end;
    end;
end;
return v8;