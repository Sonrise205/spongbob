local l_Players_0 = game:GetService("Players");
return {
    Name = "hover", 
    Description = "Returns the name of the player you are hovering over.", 
    Group = "DefaultUtil", 
    Args = {}, 
    ClientRun = function() --[[ Line: 9 ]] --[[ Name: ClientRun ]]
        -- upvalues: l_Players_0 (copy)
        local l_Target_0 = l_Players_0.LocalPlayer:GetMouse().Target;
        if not l_Target_0 then
            return "";
        else
            local l_l_Players_0_PlayerFromCharacter_0 = l_Players_0:GetPlayerFromCharacter(l_Target_0:FindFirstAncestorOfClass("Model"));
            return l_l_Players_0_PlayerFromCharacter_0 and l_l_Players_0_PlayerFromCharacter_0.Name or "";
        end;
    end
};