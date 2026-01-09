error("This is not supposed to run!");
local v0 = {};
v0.__index = v0;
local v1 = {};
v1.__index = v1;
v0.new = function() --[[ Line: 58 ]] --[[ Name: new ]]
    return {};
end;
v0.Is = function(_) --[[ Line: 76 ]] --[[ Name: Is ]]
    return true;
end;
v0.IsActive = function(_) --[[ Line: 91 ]] --[[ Name: IsActive ]]
    return true;
end;
v0.Connect = function(_, _) --[[ Line: 112 ]] --[[ Name: Connect ]]

end;
v0.Once = function(_, _) --[[ Line: 134 ]] --[[ Name: Once ]]

end;
v0.Wait = function(_) --[[ Line: 155 ]] --[[ Name: Wait ]]

end;
v0.Fire = function(_, ...) --[[ Line: 174 ]] --[[ Name: Fire ]]

end;
v0.DisconnectAll = function(_) --[[ Line: 189 ]] --[[ Name: DisconnectAll ]]

end;
v0.Destroy = function(_) --[[ Line: 203 ]] --[[ Name: Destroy ]]

end;
v1.Disconnect = function(_) --[[ Line: 219 ]] --[[ Name: Disconnect ]]

end;
return {
    new = function() --[[ Line: 226 ]] --[[ Name: new ]]
        -- upvalues: v0 (copy)
        return v0.new();
    end, 
    Is = function(_) --[[ Line: 230 ]] --[[ Name: Is ]]
        return true;
    end
};