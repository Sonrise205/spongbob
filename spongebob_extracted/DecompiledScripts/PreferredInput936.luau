local l_UserInputService_0 = game:GetService("UserInputService");
local l_Touch_0 = Enum.UserInputType.Touch;
local l_Keyboard_0 = Enum.UserInputType.Keyboard;
local v3 = table.freeze({
    MouseKeyboard = "MouseKeyboard", 
    Gamepad = "Gamepad", 
    Touch = "Touch"
});
local v4 = nil;
local v5 = {};
v4 = {
    Current = v3.MouseKeyboard, 
    Enum = v3, 
    Observe = function(v6) --[[ Line: 107 ]] --[[ Name: Observe ]]
        -- upvalues: v5 (copy), v4 (ref)
        if table.find(v5, v6) then
            error("function already subscribed", 2);
        end;
        table.insert(v5, v6);
        task.spawn(v6, v4.Current);
        return function() --[[ Line: 115 ]]
            -- upvalues: v5 (ref), v6 (copy)
            local v7 = table.find(v5, v6);
            if v7 then
                local v8 = #v5;
                local l_v5_0 = v5;
                local l_v5_1 = v5;
                local v11 = v5[v8];
                local v12 = nil;
                l_v5_0[v7] = v11;
                l_v5_1[v8] = v12;
            end;
        end;
    end
};
local function v16(v13) --[[ Line: 125 ]] --[[ Name: SetPreferred ]]
    -- upvalues: v4 (ref), v5 (copy)
    if v13 == v4.Current then
        return;
    else
        v4.Current = v13;
        for _, v15 in v5 do
            task.spawn(v15, v13);
        end;
        return;
    end;
end;
local function v18(v17) --[[ Line: 136 ]] --[[ Name: DeterminePreferred ]]
    -- upvalues: l_Touch_0 (copy), v16 (copy), l_Keyboard_0 (copy)
    if v17 == l_Touch_0 then
        v16("Touch");
        return;
    elseif v17 == l_Keyboard_0 or string.sub(v17.Name, 1, 5) == "Mouse" then
        v16("MouseKeyboard");
        return;
    else
        if string.sub(v17.Name, 1, 7) == "Gamepad" then
            v16("Gamepad");
        end;
        return;
    end;
end;
v18(l_UserInputService_0:GetLastInputType());
l_UserInputService_0.LastInputTypeChanged:Connect(v18);
return v4;