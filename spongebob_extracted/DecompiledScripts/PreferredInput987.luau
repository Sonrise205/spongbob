local l_UserInputService_0 = game:GetService("UserInputService");
local l_Touch_0 = Enum.UserInputType.Touch;
local l_Keyboard_0 = Enum.UserInputType.Keyboard;
local v3 = nil;
local v4 = {};
v3 = {
    Current = "MouseKeyboard", 
    Observe = function(v5) --[[ Line: 83 ]] --[[ Name: Observe ]]
        -- upvalues: v4 (copy), v3 (ref)
        if table.find(v4, v5) then
            error("function already subscribed", 2);
        end;
        table.insert(v4, v5);
        task.spawn(v5, v3.Current);
        return function() --[[ Line: 91 ]]
            -- upvalues: v4 (ref), v5 (copy)
            local v6 = table.find(v4, v5);
            if v6 then
                local v7 = #v4;
                local l_v4_0 = v4;
                local l_v4_1 = v4;
                local v10 = v4[v7];
                local v11 = nil;
                l_v4_0[v6] = v10;
                l_v4_1[v7] = v11;
            end;
        end;
    end
};
local function v15(v12) --[[ Line: 101 ]] --[[ Name: SetPreferred ]]
    -- upvalues: v3 (ref), v4 (copy)
    if v12 == v3.Current then
        return;
    else
        v3.Current = v12;
        for _, v14 in v4 do
            task.spawn(v14, v12);
        end;
        return;
    end;
end;
local function v17(v16) --[[ Line: 112 ]] --[[ Name: DeterminePreferred ]]
    -- upvalues: l_Touch_0 (copy), v15 (copy), l_Keyboard_0 (copy)
    if v16 == l_Touch_0 then
        v15("Touch");
        return;
    elseif v16 == l_Keyboard_0 or string.sub(v16.Name, 1, 5) == "Mouse" then
        v15("MouseKeyboard");
        return;
    else
        if string.sub(v16.Name, 1, 7) == "Gamepad" then
            v15("Gamepad");
        end;
        return;
    end;
end;
v17(l_UserInputService_0:GetLastInputType());
l_UserInputService_0.LastInputTypeChanged:Connect(v17);
return v3;