local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.Knit);
local v2 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v3 = require(l_ReplicatedStorage_0.Packages.Component);
local v4 = require(l_ReplicatedStorage_0.Shared.Modules.ZonePlus);
local v5 = require(l_ReplicatedStorage_0.Shared.Modules.WWSDebug);
local v6 = require(l_ReplicatedStorage_0.Shared.Data.EventVariables);
local v7 = require(l_ReplicatedStorage_0.Packages.Signal);
local v8 = v1.GetController("UIController");
local v9 = v1.GetController("EventController");
local v10 = {
    "Fusions", 
    "Traits"
};
local v12 = v3.new({
    Tag = script.Name, 
    Ancestors = {
        workspace
    }, 
    Extensions = {
        {
            ShouldConstruct = function(v11) --[[ Line: 21 ]] --[[ Name: ShouldConstruct ]]
                -- upvalues: v5 (copy)
                if not (v11.Instance:GetAttribute("Menu") ~= nil) then
                    v5:Warn("MenuZone:", v11.Instance:GetFullName(), "is missing a MenuName attribute");
                    return false;
                else
                    return true;
                end;
            end
        }
    }
});
v12.MenuOpened = v7.new();
v12.Construct = function(v13) --[[ Line: 39 ]] --[[ Name: Construct ]]
    -- upvalues: v2 (copy)
    v13.dumpster = v2.new();
end;
v12.Start = function(v14) --[[ Line: 43 ]] --[[ Name: Start ]]
    -- upvalues: v4 (copy), v8 (copy), v6 (copy), v9 (copy), v12 (copy), v10 (copy)
    local l_Attribute_0 = v14.Instance:GetAttribute("Menu");
    local v16 = v4.new(v14.Instance);
    v14.dumpster:Add(v16);
    v14.ignoreExit = v14.Instance:GetAttribute("IgnoreExitSignal") or false;
    v14.dumpster:Add(v14.Instance:GetAttributeChangedSignal("IgnoreExitSignal"):Connect(function() --[[ Line: 51 ]]
        -- upvalues: v14 (copy)
        v14.ignoreExit = v14.Instance:GetAttribute("IgnoreExitSignal") or false;
    end));
    local l_Attribute_1 = v14.Instance:GetAttribute("TimeLocked");
    v14.Instance:GetAttributeChangedSignal("TimeLocked"):Connect(function() --[[ Line: 57 ]]
        -- upvalues: l_Attribute_1 (ref), v14 (copy)
        l_Attribute_1 = v14.Instance:GetAttribute("TimeLocked");
    end);
    v16.localPlayerEntered:Connect(function() --[[ Line: 61 ]]
        -- upvalues: l_Attribute_1 (ref), v14 (copy), v8 (ref), v6 (ref), l_Attribute_0 (copy), v9 (ref), v12 (ref)
        if l_Attribute_1 ~= nil and workspace:GetServerTimeNow() < l_Attribute_1 then
            return;
        elseif v14.Instance:GetAttribute("SummonTab") then
            v8:GetModuleAsync("Summon"):andThen(function(v18) --[[ Line: 70 ]]
                -- upvalues: v14 (ref)
                v18:OpenOnBanner(v14.Instance:GetAttribute("SummonTab"));
            end);
            return;
        elseif (v6.EventUIName or "") == l_Attribute_0 and not v9:IsActive() then
            warn("not enabling UI bc event ended", l_Attribute_0);
            return;
        else
            v8:Toggle(l_Attribute_0, true);
            v12.MenuOpened:Fire(l_Attribute_0);
            return;
        end;
    end);
    v16.localPlayerExited:Connect(function() --[[ Line: 85 ]]
        -- upvalues: v14 (copy), v8 (ref), l_Attribute_0 (copy), v10 (ref)
        if v14.ignoreExit then
            return;
        else
            v8:Toggle(l_Attribute_0, false);
            if table.find(v10, l_Attribute_0) then
                v8:Toggle("Units", false);
            end;
            return;
        end;
    end);
end;
v12.Stop = function(v19) --[[ Line: 98 ]] --[[ Name: Stop ]]
    v19.dumpster:Destroy();
end;
return v12;