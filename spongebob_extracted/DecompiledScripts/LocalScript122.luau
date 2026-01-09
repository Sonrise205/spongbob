local l_Parent_0 = script.Parent;
game:GetService("RunService").RenderStepped:Connect(function(v1) --[[ Line: 3 ]]
    -- upvalues: l_Parent_0 (copy)
    local l_l_Parent_0_0 = l_Parent_0;
    l_l_Parent_0_0.Rotation = l_l_Parent_0_0.Rotation + v1 * 60;
end);