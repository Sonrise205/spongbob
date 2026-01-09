local l_Players_0 = game:GetService("Players");
return {
    Name = "position", 
    Aliases = {
        "pos"
    }, 
    Description = "Returns Vector3 position of you or other players. Empty string is the player has no character.", 
    Group = "DefaultDebug", 
    Args = {
        {
            Type = "player", 
            Name = "Player", 
            Description = "The player to report the position of. Omit for your own position.", 
            Default = l_Players_0.LocalPlayer
        }
    }, 
    ClientRun = function(_, v2) --[[ Line: 17 ]] --[[ Name: ClientRun ]]
        local l_Character_0 = v2.Character;
        if not l_Character_0 or not l_Character_0:FindFirstChild("HumanoidRootPart") then
            return "";
        else
            return tostring(l_Character_0.HumanoidRootPart.Position):gsub("%s", "");
        end;
    end
};