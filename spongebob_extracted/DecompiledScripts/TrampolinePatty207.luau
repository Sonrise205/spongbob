local _ = game:GetService("Players");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v2 = require(l_ReplicatedStorage_0.Packages.Knit);
local v3 = require(l_ReplicatedStorage_0.Packages.Component);
local v4 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v5 = v3.new({
    Tag = script.Name, 
    Extensions = {}
});
v5.Construct = function(v6) --[[ Line: 16 ]] --[[ Name: Construct ]]
    -- upvalues: v4 (copy)
    v6.dump = v4.new();
end;
v5.Start = function(v7) --[[ Line: 20 ]] --[[ Name: Start ]]
    -- upvalues: v2 (copy)
    v7.dump:Add(v7.Instance.Touched:Connect(function(v8) --[[ Line: 21 ]]
        -- upvalues: v2 (ref), v7 (copy)
        local l_Character_0 = v2.Player.Character;
        if not l_Character_0 then
            warn("r1");
            return;
        elseif not v8:IsDescendantOf(l_Character_0) then
            warn("r2");
            return;
        else
            local l_Position_0 = v8.Position;
            local v11 = v7.Instance.Position + Vector3.new(0, v7.Instance.Size.Y / 2, 0);
            local v12 = math.abs(l_Position_0.Y - v11.Y);
            warn("dist from top: ", v12);
            if v12 <= 1 then
                local l_HumanoidRootPart_0 = l_Character_0:FindFirstChild("HumanoidRootPart");
                if l_HumanoidRootPart_0 then
                    l_HumanoidRootPart_0.Velocity = Vector3.new(l_HumanoidRootPart_0.Velocity.X, 50, l_HumanoidRootPart_0.Velocity.Z);
                end;
            end;
            return;
        end;
    end));
end;
v5.Stop = function(v14) --[[ Line: 59 ]] --[[ Name: Stop ]]
    v14.dump:Destroy();
end;
return v5;