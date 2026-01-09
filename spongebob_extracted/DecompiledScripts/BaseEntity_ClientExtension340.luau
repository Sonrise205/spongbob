local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_RunService_0 = game:GetService("RunService");
local v2 = require(l_ReplicatedStorage_0.Packages.BaseComponent);
local _ = require(l_ReplicatedStorage_0.Shared.Data.Variables);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local _ = l_RunService_0:IsStudio() and true;
local v6 = {
    Methods = {}, 
    Extensions = {
        v2
    }
};
v6.Methods._SetEntityAnimation = function(v7, v8) --[[ Line: 36 ]] --[[ Name: _SetEntityAnimation ]]
    local l__visualModel_0 = v7._visualModel;
    if l__visualModel_0 and v8 then
        l__visualModel_0:SetAttribute("AnimationId", v8);
    end;
end;
v6.Methods.SetEntityState = function(v10, v11) --[[ Line: 48 ]] --[[ Name: SetEntityState ]]
    v10:SetAttribute("EntityState", v11);
end;
v6.Methods.IsAlive = function(v12) --[[ Line: 52 ]] --[[ Name: IsAlive ]]
    return v12:GetAttribute("IsAlive") == true;
end;
v6.Constructing = function(v13) --[[ Line: 60 ]] --[[ Name: Constructing ]]
    v13._visualModel = v13.Instance:WaitForChild("VisualModel");
    v13._visualModel:SetAttribute("AnimationId", "");
    v13._primaryPart = v13.Instance.PrimaryPart;
end;
v6.Constructed = function(_) --[[ Line: 66 ]] --[[ Name: Constructed ]]

end;
v6.Started = function(_) --[[ Line: 68 ]] --[[ Name: Started ]]

end;
v6.Stopped = function(_) --[[ Line: 70 ]] --[[ Name: Stopped ]]

end;
return v6;