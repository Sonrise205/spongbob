local l_Players_0 = game:GetService("Players");
return {
    Name = "clear", 
    Aliases = {}, 
    Description = "Clear all lines above the entry line of the Cmdr window.", 
    Group = "DefaultUtil", 
    Args = {}, 
    ClientRun = function() --[[ Line: 9 ]] --[[ Name: ClientRun ]]
        -- upvalues: l_Players_0 (copy)
        local l_Cmdr_0 = l_Players_0.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("Cmdr");
        local l_Frame_0 = l_Cmdr_0:WaitForChild("Frame");
        if l_Cmdr_0 and l_Frame_0 then
            for _, v4 in pairs(l_Frame_0:GetChildren()) do
                if v4.Name == "Line" and v4:IsA("TextBox") then
                    v4:Destroy();
                end;
            end;
        end;
        return "";
    end
};