local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_RunService_0 = game:GetService("RunService");
local v2 = require(l_ReplicatedStorage_0.Shared.Modules.WWSDebug);
local v3 = {
    [1] = "rbxassetid://125510465862431"
};
local function _(v4) --[[ Line: 15 ]] --[[ Name: getPosition ]]
    v4 = v4 - 1;
    return Vector2.new(v4 % 8 * 128, v4 // 8 * 128);
end;
local v6 = {
    BunnyWunny = {
        index = 1, 
        sheet = 1
    }, 
    Butcher = {
        index = 2, 
        sheet = 1
    }, 
    Cecil = {
        index = 3, 
        sheet = 1
    }, 
    CursedJellyfish = {
        index = 4, 
        sheet = 1
    }, 
    SirUrchin = {
        index = 5, 
        sheet = 1
    }, 
    Fluffy = {
        index = 6, 
        sheet = 1
    }, 
    FriendNoName = {
        index = 7, 
        sheet = 1
    }, 
    Gary = {
        index = 8, 
        sheet = 1
    }, 
    KampKaren = {
        index = 9, 
        sheet = 1
    }, 
    LarryLuciano = {
        index = 10, 
        sheet = 1
    }, 
    LeSpatula = {
        index = 11, 
        sheet = 1
    }, 
    MrStinky = {
        index = 12, 
        sheet = 1
    }, 
    Ouchie = {
        index = 13, 
        sheet = 1
    }, 
    Rocky = {
        index = 14, 
        sheet = 1
    }, 
    PottyTheParrot = {
        index = 15, 
        sheet = 1
    }, 
    Rex = {
        index = 16, 
        sheet = 1
    }, 
    Spot = {
        index = 17, 
        sheet = 1
    }, 
    SwashbucklerGary = {
        index = 18, 
        sheet = 1
    }
};
v6.SetImage = function(_, v8, v9) --[[ Line: 46 ]] --[[ Name: SetImage ]]
    -- upvalues: v6 (copy), v2 (copy), v3 (copy)
    local v10 = v6[v9];
    if not v10 then
        v2:Warn("Failed to find SpriteSheet info for pet: " .. v9);
        return;
    else
        v8.Image = v3[v10.sheet];
        v8.ScaleType = Enum.ScaleType.Crop;
        local v11 = v10.index - 1;
        v8.ImageRectOffset = Vector2.new(v11 % 8 * 128, v11 // 8 * 128);
        v8.ImageRectSize = Vector2.new(128, 128);
        return;
    end;
end;
v6.CreateImage = function(_, v13, v14) --[[ Line: 60 ]] --[[ Name: CreateImage ]]
    -- upvalues: v2 (copy), v6 (copy), l_RunService_0 (copy), v3 (copy)
    local l_v2_0 = v2;
    local v16 = false;
    if v14 ~= nil then
        v16 = typeof(v14) == "table";
    end;
    l_v2_0:Assert(v16, "Props must be a table");
    l_v2_0 = v6[v13];
    if not l_v2_0 then
        if l_RunService_0:IsStudio() then
            v2:Warn("Failed to find SpriteSheet info for pet: " .. v13);
        end;
        return;
    else
        local l_ImageLabel_0 = Instance.new("ImageLabel");
        for v18, v19 in v14 do
            l_ImageLabel_0[v18] = v19;
        end;
        l_ImageLabel_0.BackgroundTransparency = 1;
        l_ImageLabel_0.Image = v3[l_v2_0.sheet];
        l_ImageLabel_0.ScaleType = Enum.ScaleType.Crop;
        local v20 = l_v2_0.index - 1;
        l_ImageLabel_0.ImageRectOffset = Vector2.new(v20 % 8 * 128, v20 // 8 * 128);
        l_ImageLabel_0.ImageRectSize = Vector2.new(128, 128);
        return l_ImageLabel_0;
    end;
end;
if l_RunService_0:IsStudio() then
    for v21, _ in v6 do
        if typeof(v6[v21]) ~= "function" then
            if not l_ReplicatedStorage_0.Models.Pets:FindFirstChild(v21) then
                v2:Warn("Failed to find pet image: ", v21);
            else
                local _ = nil;
            end;
        end;
    end;
end;
return v6;