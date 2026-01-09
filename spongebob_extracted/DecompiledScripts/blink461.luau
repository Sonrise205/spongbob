return {
    Name = "blink", 
    Aliases = {
        "b"
    }, 
    Description = "Teleports you to where your mouse is hovering.", 
    Group = "DefaultDebug", 
    Args = {}, 
    ClientRun = function(v0) --[[ Line: 8 ]] --[[ Name: ClientRun ]]
        local l_Mouse_0 = v0.Executor:GetMouse();
        local l_Character_0 = v0.Executor.Character;
        if not l_Character_0 then
            return "You don't have a character.";
        else
            l_Character_0:MoveTo(l_Mouse_0.Hit.p);
            return "Blinked!";
        end;
    end
};