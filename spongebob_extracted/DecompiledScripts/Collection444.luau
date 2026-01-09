local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.Knit);
local v2 = require(l_ReplicatedStorage_0.Packages.TableUtil);
local _ = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local v4 = v1.GetController("DataController");
local v5 = {
    collectedItems = {}, 
    itemSlots = {}
};
local v6 = {
    KampSquidward = true, 
    KampMrsPuff = true, 
    KampSandy = true, 
    KampPatrick = true, 
    KampSpongebob = true, 
    KampMrKrabs = true, 
    KampPearl = true, 
    JellyfishNet = true, 
    AcornSubmersible = true, 
    Dorudon = true, 
    FriendNoName = true, 
    KampKaren = true
};
v5.Init = function(v7, v8, _) --[[ Line: 29 ]] --[[ Name: Init ]]
    v7.frame = v8;
    v7.list = v8.List;
end;
v5.Start = function(v10) --[[ Line: 34 ]] --[[ Name: Start ]]
    -- upvalues: v4 (copy), v1 (copy), v6 (copy)
    local function v14(v11) --[[ Line: 35 ]] --[[ Name: logFrames ]]
        -- upvalues: v10 (copy)
        for _, v13 in v11:GetChildren() do
            if v13:IsA("GuiButton") then
                v10.itemSlots[v13.Name] = v13;
            end;
        end;
    end;
    v14(v10.list.SharedBin.Mounts.Bin);
    v14(v10.list.SharedBin.Pets.Bin);
    v14(v10.list.Units.Bin);
    v4:OnChanged(v1.Player, "Units", function(v15) --[[ Line: 49 ]]
        -- upvalues: v6 (ref), v10 (copy)
        for v16, _ in v6 do
            if v15[v16] then
                v10:_addToCollection(v16);
            end;
        end;
    end, true);
    v4:OnChanged(v1.Player, "Pets", function(v18) --[[ Line: 57 ]]
        -- upvalues: v6 (ref), v10 (copy)
        for v19, _ in v6 do
            if v18[v19] then
                v10:_addToCollection(v19);
            end;
        end;
    end, true);
    v4:OnChanged(v1.Player, "Inventory", function(v21) --[[ Line: 65 ]]
        -- upvalues: v6 (ref), v10 (copy)
        for v22, _ in v6 do
            if v21[v22] then
                v10:_addToCollection(v22);
            end;
        end;
    end, true);
    v4:OnChanged(v1.Player, "KampKoralIndex", function(v24) --[[ Line: 73 ]]
        -- upvalues: v6 (ref), v10 (copy)
        for v25, _ in v6 do
            if v24[v25] then
                v10:_addToCollection(v25);
            end;
        end;
    end, true);
end;
v5._addToCollection = function(v27, v28) --[[ Line: 82 ]] --[[ Name: _addToCollection ]]
    -- upvalues: v2 (copy), v6 (copy)
    if v27.collectedItems[v28] then
        return;
    else
        v27.collectedItems[v28] = true;
        v27.itemSlots[v28].Content.UnitIcon.ImageColor3 = Color3.new(1, 1, 1);
        v27.frame.Title.Amount.Text = ("%*/%*"):format(#v2.Keys(v27.collectedItems), #v2.Keys(v6));
        return;
    end;
end;
return v5;