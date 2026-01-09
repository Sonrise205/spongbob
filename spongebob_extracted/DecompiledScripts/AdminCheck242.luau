local l_RunService_0 = game:GetService("RunService");
return function(v1) --[[ Line: 4 ]]
    -- upvalues: l_RunService_0 (copy)
    v1:RegisterHook("BeforeRun", function(v2) --[[ Line: 5 ]]
        -- upvalues: l_RunService_0 (ref)
        if not l_RunService_0:IsStudio() and not v2.Executor:GetAttribute("IS_ADMIN") then
            return "You do not have permission to run commands.";
        else
            return;
        end;
    end);
end;