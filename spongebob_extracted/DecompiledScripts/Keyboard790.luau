local v0 = require(script.Parent.Parent.Trove);
local v1 = require(script.Parent.Parent.Signal);
local l_UserInputService_0 = game:GetService("UserInputService");
local v3 = {};
v3.__index = v3;
v3.new = function() --[[ Line: 55 ]] --[[ Name: new ]]
    -- upvalues: v3 (copy), v0 (copy), v1 (copy)
    local v4 = setmetatable({}, v3);
    v4._trove = v0.new();
    v4.KeyDown = v4._trove:Construct(v1);
    v4.KeyUp = v4._trove:Construct(v1);
    v4:_setup();
    return v4;
end;
v3.IsKeyDown = function(_, v6) --[[ Line: 72 ]] --[[ Name: IsKeyDown ]]
    -- upvalues: l_UserInputService_0 (copy)
    return l_UserInputService_0:IsKeyDown(v6);
end;
v3.AreKeysDown = function(v7, v8, v9) --[[ Line: 84 ]] --[[ Name: AreKeysDown ]]
    return v7:IsKeyDown(v8) and v7:IsKeyDown(v9);
end;
v3.AreEitherKeysDown = function(v10, v11, v12) --[[ Line: 99 ]] --[[ Name: AreEitherKeysDown ]]
    return v10:IsKeyDown(v11) or v10:IsKeyDown(v12);
end;
v3._setup = function(v13) --[[ Line: 103 ]] --[[ Name: _setup ]]
    -- upvalues: l_UserInputService_0 (copy)
    v13._trove:Connect(l_UserInputService_0.InputBegan, function(v14, v15) --[[ Line: 104 ]]
        -- upvalues: v13 (copy)
        if v15 then
            return;
        else
            if v14.UserInputType == Enum.UserInputType.Keyboard then
                v13.KeyDown:Fire(v14.KeyCode);
            end;
            return;
        end;
    end);
    v13._trove:Connect(l_UserInputService_0.InputEnded, function(v16, v17) --[[ Line: 113 ]]
        -- upvalues: v13 (copy)
        if v17 then
            return;
        else
            if v16.UserInputType == Enum.UserInputType.Keyboard then
                v13.KeyUp:Fire(v16.KeyCode);
            end;
            return;
        end;
    end);
end;
v3.Destroy = function(v18) --[[ Line: 126 ]] --[[ Name: Destroy ]]
    v18._trove:Destroy();
end;
return v3;