local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.Knit);
local v2 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v3 = require(l_ReplicatedStorage_0.Packages.Component);
local l_PreferredInput_0 = require(l_ReplicatedStorage_0.Packages.Input).PreferredInput;
local v5 = require(l_ReplicatedStorage_0.Shared.Modules.WWSDebug);
local v8 = v3.new({
    Tag = script.Name, 
    Ancestors = {
        v1.Player.PlayerGui
    }, 
    Extensions = {
        {
            ShouldConstruct = function(v6) --[[ Line: 15 ]] --[[ Name: ShouldConstruct ]]
                -- upvalues: v5 (copy)
                local v7 = v6.Instance:GetAttribute("Platform") ~= nil;
                if not v7 then
                    v5:Warn("Platform attribute not found:", v6.Instance:GetFullName());
                end;
                return v7;
            end
        }
    }
});
v8.Construct = function(v9) --[[ Line: 26 ]] --[[ Name: Construct ]]
    -- upvalues: v2 (copy)
    v9.dumpster = v2.new();
    v9.platform = v9.Instance:GetAttribute("Platform");
end;
v8.Start = function(v10) --[[ Line: 31 ]] --[[ Name: Start ]]
    -- upvalues: l_PreferredInput_0 (copy)
    v10.dumpster:Add(l_PreferredInput_0.Observe(function(v11) --[[ Line: 32 ]]
        -- upvalues: v10 (copy)
        v10.Instance.Visible = v11 ~= v10.platform;
        v10.Instance:SetAttribute("PlatformHidden", v11 == v10.platform);
    end));
end;
v8.Stop = function(v12) --[[ Line: 38 ]] --[[ Name: Stop ]]
    v12.dumpster:Destroy();
end;
return v8;