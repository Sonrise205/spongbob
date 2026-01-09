local l_Workspace_0 = game:GetService("Workspace");
return function(v1) --[[ Line: 8 ]] --[[ Name: calculateVelocityForHeight ]]
    -- upvalues: l_Workspace_0 (copy)
    return (math.sqrt(2 * l_Workspace_0.Gravity * v1));
end;