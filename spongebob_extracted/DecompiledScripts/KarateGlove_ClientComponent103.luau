local l_Players_0 = game:GetService("Players");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("Debris");
local l_UserInputService_0 = game:GetService("UserInputService");
local v4 = require(l_ReplicatedStorage_0.Packages.Knit);
local v5 = require(l_ReplicatedStorage_0.Packages.RailComponent);
local v6 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v7 = require(l_ReplicatedStorage_0.Packages.RemoteComponent);
local v8 = require(l_ReplicatedStorage_0.Packages.BaseComponent);
local _ = require(l_ReplicatedStorage_0.Packages.RailUtil);
local v10 = require(l_ReplicatedStorage_0.Shared.Data.TowerOfKarate.GlovesData);
local v12 = v5.new({
    Tag = "KarateGloves", 
    Ancestors = {
        workspace
    }, 
    Extensions = {
        v8, 
        v7, 
        {
            ShouldConstruct = function(v11) --[[ Line: 27 ]] --[[ Name: ShouldConstruct ]]
                -- upvalues: v4 (copy)
                return v11:GetOwner() == v4.Player;
            end
        }
    }
});
v12.RemoteNamespace = "KarateGlove_Comm";
v12.Construct = function(v13) --[[ Line: 46 ]] --[[ Name: Construct ]]
    -- upvalues: v10 (copy), v6 (copy)
    v13._gearName = v13:GetAttribute("ReferenceName");
    v13._gearData = v10.getGloveData(v13._gearName);
    v13.dump = v6.new();
end;
v12.GetOwner = function(v14) --[[ Line: 53 ]] --[[ Name: GetOwner ]]
    -- upvalues: l_Players_0 (copy)
    return l_Players_0:GetPlayerFromCharacter(v14.Instance.Parent);
end;
v12.Start = function(v15) --[[ Line: 57 ]] --[[ Name: Start ]]
    -- upvalues: l_UserInputService_0 (copy)
    v15.dump:Add(l_UserInputService_0.InputBegan:Connect(function(v16, v17) --[[ Line: 58 ]]
        -- upvalues: v15 (copy)
        if v17 then
            return;
        else
            if v16.UserInputType == Enum.UserInputType.MouseButton1 then
                v15.Server:Attack();
            end;
            return;
        end;
    end));
end;
v12.Stop = function(v18) --[[ Line: 69 ]] --[[ Name: Stop ]]
    v18.dump:Destroy();
end;
return v12;