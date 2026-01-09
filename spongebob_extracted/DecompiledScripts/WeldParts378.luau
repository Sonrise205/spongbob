return function(v0, v1) --[[ Line: 1 ]]
    if v0:FindFirstChildWhichIsA("WeldConstraint") then
        return;
    else
        local l_WeldConstraint_0 = Instance.new("WeldConstraint");
        l_WeldConstraint_0.Part0 = v0;
        l_WeldConstraint_0.Part1 = v1;
        v0.Anchored = false;
        l_WeldConstraint_0.Parent = v0;
        return l_WeldConstraint_0;
    end;
end;