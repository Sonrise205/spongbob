local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.Knit);
local v2 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v3 = require(l_ReplicatedStorage_0.Packages.Component);
local v4 = require(l_ReplicatedStorage_0.Shared.Modules.RarityVisuals);
local v5 = require(l_ReplicatedStorage_0.Shared.Modules.WWSDebug);
local v8 = v3.new({
    Tag = script.Name, 
    Ancestors = {
        workspace, 
        v1.PlayerGui
    }, 
    Extensions = {
        {
            ShouldConstruct = function(v6) --[[ Line: 16 ]] --[[ Name: ShouldConstruct ]]
                -- upvalues: v5 (copy)
                if not v6.Instance:IsA("GuiObject") then
                    v5:Warn(v6.Instance:GetFullName(), "is not a GuiObject");
                    return false;
                else
                    local v7 = v6.Instance:GetAttribute("Rarity") ~= nil;
                    if not v7 then
                        v5:Warn(v6.Instance:GetFullName(), "is missing Rarity attribute");
                    end;
                    return v7;
                end;
            end
        }
    }
});
v8.Construct = function(v9) --[[ Line: 33 ]] --[[ Name: Construct ]]
    -- upvalues: v2 (copy)
    v9.dumpster = v2.new();
end;
v8.Start = function(v10) --[[ Line: 37 ]] --[[ Name: Start ]]
    -- upvalues: v4 (copy)
    local function v12() --[[ Line: 38 ]] --[[ Name: renderRarity ]]
        -- upvalues: v10 (copy), v4 (ref)
        if v10.dumpster:Get("Visual") then
            v10.dumpster:Remove("Visual");
        end;
        local l_Attribute_0 = v10.Instance:GetAttribute("Rarity");
        v10.dumpster:Add(v4.new(v10.Instance, l_Attribute_0), "Visual");
    end;
    v12();
    v10.dumpster:Add(v10.Instance:GetAttributeChangedSignal("Rarity"):Connect(v12));
end;
v8.Stop = function(v13) --[[ Line: 51 ]] --[[ Name: Stop ]]
    v13.dumpster:Destroy();
end;
return v8;