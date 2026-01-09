local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Platformer.Utility.safePlayerAdded);
local v2 = require(script.Parent.FXController);
local function v6(v3) --[[ Line: 11 ]] --[[ Name: onCharacterAdded ]]
    -- upvalues: v2 (copy)
    local v4 = v2.new(v3);
    if not v4 then
        return;
    else
        local v5 = nil;
        v5 = v3.AncestryChanged:Connect(function() --[[ Line: 20 ]]
            -- upvalues: v3 (copy), v5 (ref), v4 (copy)
            if not v3:IsDescendantOf(game) then
                v5:Disconnect();
                v4:destroy();
            end;
        end);
        return;
    end;
end;
v1(function(v7) --[[ Line: 28 ]] --[[ Name: onPlayerAdded ]]
    -- upvalues: v6 (copy), v2 (copy)
    v7.CharacterAdded:Connect(v6);
    if v7.Character then
        local l_Character_0 = v7.Character;
        local v9 = v2.new(l_Character_0);
        if not v9 then
            return;
        else
            local v10 = nil;
            do
                local l_v10_0 = v10;
                l_v10_0 = l_Character_0.AncestryChanged:Connect(function() --[[ Line: 20 ]]
                    -- upvalues: l_Character_0 (copy), l_v10_0 (ref), v9 (copy)
                    if not l_Character_0:IsDescendantOf(game) then
                        l_v10_0:Disconnect();
                        v9:destroy();
                    end;
                end);
            end;
        end;
    end;
end);