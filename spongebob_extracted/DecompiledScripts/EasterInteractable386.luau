local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.Knit);
local v2 = require(l_ReplicatedStorage_0.Packages.Component);
local v3 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v5 = require(l_ReplicatedStorage_0.Shared.Data.Variables);
local v6 = v1.GetController("DataController");
local v7 = {
    ImageColor3 = Color3.fromRGB(255, 255, 255), 
    ImageTransparency = 0
};
local v8 = {
    ImageColor3 = Color3.fromRGB(95, 95, 95), 
    ImageTransparency = 0.5
};
local v9 = v2.new({
    Tag = script.Name, 
    Ancestors = {
        workspace
    }
});
v9.Construct = function(v10) --[[ Line: 39 ]] --[[ Name: Construct ]]
    -- upvalues: v3 (copy)
    v10.dump = v3.new();
    v10.BillboardGui = v10.Instance.BasketProgress.Progress.FullEgg;
    v10.shards = {};
    for _, v12 in v10.BillboardGui.Egg:GetChildren() do
        if v12:IsA("ImageLabel") then
            v10.shards[v12.Name] = v12;
        end;
    end;
    v10.dump:Add(function() --[[ Line: 55 ]]
        -- upvalues: v10 (copy)
        v10.dump = nil;
    end);
end;
v9.Start = function(v13) --[[ Line: 60 ]] --[[ Name: Start ]]
    -- upvalues: v6 (copy), v1 (copy), v5 (copy), v8 (copy), v7 (copy)
    v13.dump:Add(v6:OnChanged(v1.Player, "Inventory", function(v14) --[[ Line: 61 ]]
        -- upvalues: v5 (ref), v13 (copy), v8 (ref), v7 (ref)
        for _, v16 in v5.EGG_SHARDS do
            local v17 = v13.shards[v16];
            if v17 then
                local l_v8_0 = v8;
                if v14[v16] then
                    l_v8_0 = v7;
                end;
                for v19, v20 in l_v8_0 do
                    v17[v19] = v20;
                end;
            end;
        end;
    end, true));
end;
v9.Stop = function(v21) --[[ Line: 82 ]] --[[ Name: Stop ]]
    if v21.dump then
        v21.dump:Destroy();
    end;
end;
return v9;