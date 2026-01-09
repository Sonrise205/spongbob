return function(_, v1, v2) --[[ Line: 1 ]]
    local v3 = nil;
    if typeof(v2) == "Instance" then
        if v2.Character and v2.Character:FindFirstChild("HumanoidRootPart") then
            v3 = v2.Character.HumanoidRootPart.CFrame;
        else
            return "Target player has no character.";
        end;
    elseif typeof(v2) == "Vector3" then
        v3 = CFrame.new(v2);
    end;
    for _, v5 in ipairs(v1) do
        if v5.Character and v5.Character:FindFirstChild("HumanoidRootPart") then
            if v5.Character.Humanoid.Sit then
                v5.Character.Humanoid.Jump = true;
            end;
            v5.Character.HumanoidRootPart.CFrame = v3;
        end;
    end;
    return ("Teleported %d players."):format(#v1);
end;