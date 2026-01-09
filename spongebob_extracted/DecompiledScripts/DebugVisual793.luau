local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_RunService_0 = game:GetService("RunService");
local _ = require(l_ReplicatedStorage_0.Packages.Knit);
local v3 = require(l_ReplicatedStorage_0.Packages.Component);
local v4 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v6 = require(l_ReplicatedStorage_0.Shared.Modules.ObserveAttribute);
local v7 = v3.new({
    Tag = script.Name, 
    Ancestors = {
        workspace
    }
});
v7.Construct = function(v8) --[[ Line: 33 ]] --[[ Name: Construct ]]
    -- upvalues: v4 (copy)
    v8.dump = v4.new();
    v8.dump:Add(function() --[[ Line: 37 ]]
        -- upvalues: v8 (copy)
        v8.dump = nil;
    end);
end;
v7.Start = function(v9) --[[ Line: 42 ]] --[[ Name: Start ]]
    -- upvalues: v6 (copy), l_ReplicatedStorage_0 (copy), l_RunService_0 (copy)
    v9.dump:Add(v6(l_ReplicatedStorage_0, "DEBUG_VISUAL", function(v10) --[[ Line: 43 ]]
        -- upvalues: l_RunService_0 (ref), v9 (copy)
        v10 = v10 or false;
        if not l_RunService_0:IsStudio() and game.GameId == 6594435384 then
            v10 = false;
        end;
        if v9.Instance:IsA("BasePart") then
            v9.Instance.Transparency = v10 and 0.5 or 1;
        end;
        for _, v12 in v9.Instance:GetDescendants() do
            if v12:IsA("BasePart") then
                v12.Transparency = v10 and 0.5 or 1;
            end;
        end;
    end));
end;
v7.Stop = function(v13) --[[ Line: 67 ]] --[[ Name: Stop ]]
    if v13.dump then
        v13.dump:Destroy();
    end;
end;
return v7;