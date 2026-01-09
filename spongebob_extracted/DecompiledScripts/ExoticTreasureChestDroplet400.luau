local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("Players");
local _ = require(l_ReplicatedStorage_0.Packages.DropletManager);
local v3 = require(l_ReplicatedStorage_0.Packages.Knit);
local v4 = require(l_ReplicatedStorage_0.Shared.Data.InventoryAtlas);
local v5 = nil;
return {
    Defaults = {
        Value = 1, 
        LifeTime = NumberRange.new(360, 360), 
        EjectionHorizontalVelocity = NumberRange.new(2, 5), 
        EjectionVerticalVelocity = NumberRange.new(40, 70)
    }, 
    SetupDroplet = function(v6) --[[ Line: 23 ]] --[[ Name: SetupDroplet ]]
        -- upvalues: v4 (copy)
        local l_Model_0 = Instance.new("Model");
        l_Model_0.Name = "GoldDroplet";
        local l_Part_0 = Instance.new("Part");
        l_Part_0.Size = Vector3.new(1.399999976158142, 1.399999976158142, 1.399999976158142, 0);
        l_Part_0.Material = Enum.Material.Neon;
        l_Part_0.Color = Color3.fromRGB(28, 255, 198);
        l_Part_0.Anchored = false;
        l_Part_0.CanCollide = false;
        l_Part_0.CanTouch = false;
        l_Part_0.CanQuery = false;
        l_Part_0.Massless = true;
        l_Part_0.Transparency = 0.9;
        l_Part_0.Shape = Enum.PartType.Ball;
        local l_PointLight_0 = Instance.new("PointLight");
        l_PointLight_0.Color = Color3.fromRGB(28, 255, 198);
        l_PointLight_0.Brightness = 0.4;
        l_PointLight_0.Range = 5;
        l_PointLight_0.Shadows = false;
        l_PointLight_0.Parent = l_Part_0;
        local l_BillboardGui_0 = Instance.new("BillboardGui");
        l_BillboardGui_0.Size = UDim2.fromScale(1, 1);
        l_BillboardGui_0.Adornee = l_Part_0;
        l_BillboardGui_0.Parent = l_Part_0;
        local l_ImageLabel_0 = Instance.new("ImageLabel");
        l_ImageLabel_0.Size = UDim2.fromScale(1, 1);
        l_ImageLabel_0.Image = v4:GetByItemName("ExoticTreasureChest").icon or "";
        l_ImageLabel_0.BackgroundTransparency = 1;
        l_ImageLabel_0.Parent = l_BillboardGui_0;
        l_Part_0.Parent = l_Model_0;
        l_Model_0.PrimaryPart = l_Part_0;
        v6:AttachModel(l_Model_0);
        return {
            SpinDirection = math.random() > 0.5 and 1 or -1, 
            FloatHeight = math.random() * 0.8 + 0.3
        };
    end, 
    OnRenderUpdate = function(v12, v13) --[[ Line: 74 ]] --[[ Name: OnRenderUpdate ]]
        local l_v12_SetupData_0 = v12:GetSetupData();
        local v15 = CFrame.new();
        local v16 = math.sin(v13 * 1.5) * l_v12_SetupData_0.FloatHeight * 0.4;
        v15 = v15 * CFrame.new(0, v16, 0) * CFrame.Angles(0, 0.7853981633974483 * l_v12_SetupData_0.SpinDirection * v13, 0);
        local v17 = math.sin(v13 * 3) * 0.1;
        return v15 * CFrame.new(v17, 0, 0);
    end, 
    OnClientCollect = function(_, _) --[[ Line: 96 ]] --[[ Name: OnClientCollect ]]
        -- upvalues: v5 (ref), v3 (copy)
        if not v5 then
            v5 = v3.GetController("AudioController");
        end;
    end, 
    OnServerCollect = function(_, _) --[[ Line: 102 ]] --[[ Name: OnServerCollect ]]

    end
};