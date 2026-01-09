local l_ReplicatedFirst_0 = game:GetService("ReplicatedFirst");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_TweenService_0 = game:GetService("TweenService");
local v3 = require(l_ReplicatedStorage_0.Packages.Knit);
local _ = require(l_ReplicatedStorage_0.Packages.Dumpster);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v6 = require(l_ReplicatedFirst_0.PlaceIds);
local v7 = TweenInfo.new(0.2, Enum.EasingStyle.Back);
local v8 = 80;
local v9 = v3.CreateController({
    Name = "FOVController", 
    DEFAULT_FOV = v8
});
v9.KnitInit = function(_) --[[ Line: 40 ]] --[[ Name: KnitInit ]]
    -- upvalues: v6 (copy), v8 (ref)
    if v6:GetDestination() == "Game" then
        v8 = 80;
        return;
    else
        v8 = 70;
        return;
    end;
end;
v9.KnitStart = function(_) --[[ Line: 48 ]] --[[ Name: KnitStart ]]

end;
v9.SetFOV = function(v12, v13, v14, v15) --[[ Line: 52 ]] --[[ Name: SetFOV ]]
    -- upvalues: v8 (ref)
    v12.previousFOV = workspace.CurrentCamera.FieldOfView;
    v12:_tween(v13 or v8, v14, v15);
end;
v9.Revert = function(v16, v17, v18) --[[ Line: 57 ]] --[[ Name: Revert ]]
    if not v16.previousFOV then
        return;
    else
        v16:_tween(v16.previousFOV, v17, v18);
        return;
    end;
end;
v9._tween = function(_, v20, v21, v22) --[[ Line: 66 ]] --[[ Name: _tween ]]
    -- upvalues: v7 (copy), l_TweenService_0 (copy)
    local v23 = v21 or v7;
    v23 = l_TweenService_0:Create(workspace.CurrentCamera, v23, {
        FieldOfView = v20
    });
    v23.Completed:Once(function() --[[ Line: 70 ]]
        -- upvalues: v23 (ref), v22 (copy)
        v23:Destroy();
        v23 = nil;
        if v22 then
            v22();
        end;
    end);
    v23:Play();
end;
return v9;