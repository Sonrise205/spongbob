return {
    Name = "thru", 
    Aliases = {
        "t", 
        "through"
    }, 
    Description = "Teleports you through whatever your mouse is hovering over, placing you equidistantly from the wall.", 
    Group = "DefaultDebug", 
    Args = {
        {
            Type = "number", 
            Name = "Extra distance", 
            Description = "Go through the wall an additional X studs.", 
            Default = 0
        }
    }, 
    ClientRun = function(v0, v1) --[[ Line: 15 ]] --[[ Name: ClientRun ]]
        local l_Mouse_0 = v0.Executor:GetMouse();
        local l_Character_0 = v0.Executor.Character;
        if not l_Character_0 or not l_Character_0:FindFirstChild("HumanoidRootPart") then
            return "You don't have a character.";
        else
            local l_Position_0 = l_Character_0.HumanoidRootPart.Position;
            local v5 = l_Mouse_0.Hit.p - l_Position_0;
            l_Character_0:MoveTo(v5 * 2 + v5.unit * v1 + l_Position_0);
            return "Blinked!";
        end;
    end
};