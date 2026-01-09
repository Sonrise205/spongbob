local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_RunService_0 = game:GetService("RunService");
local v2 = require(l_ReplicatedStorage_0.Packages.Knit);
local _ = require(l_ReplicatedStorage_0.Packages.Dumpster);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local l_CmdrClient_0 = require(l_ReplicatedStorage_0:WaitForChild("CmdrClient"));
local v6 = require(l_ReplicatedStorage_0.Shared.Modules.ObserveAttribute);
local v7 = nil;
local v8 = nil;
local v9 = {
    Enum.KeyCode.F2, 
    Enum.KeyCode.F4, 
    Enum.KeyCode.BackSlash
};
local v10 = v2.CreateController({
    Name = script.Name
});
v10.KnitInit = function(_) --[[ Line: 38 ]] --[[ Name: KnitInit ]]
    -- upvalues: v7 (ref), v2 (copy), v8 (ref)
    v7 = v2.GetController("DataController");
    v8 = v2.GetService("AdminService");
end;
v10.KnitStart = function(_) --[[ Line: 44 ]] --[[ Name: KnitStart ]]
    -- upvalues: l_CmdrClient_0 (copy), v9 (copy), l_ReplicatedStorage_0 (copy), l_RunService_0 (copy), v6 (copy), v2 (copy), v8 (ref)
    l_CmdrClient_0:SetActivationKeys(v9);
    l_CmdrClient_0:SetPlaceName("WWS");
    local _ = require(l_ReplicatedStorage_0:WaitForChild("CmdrClient"));
    local v14 = false;
    if not l_RunService_0:IsStudio() then
        v6(v2.Player, "IS_ADMIN", function(v15) --[[ Line: 53 ]]
            -- upvalues: v14 (ref), l_CmdrClient_0 (ref)
            v14 = v15;
            l_CmdrClient_0:SetEnabled(v15 or false);
            if not v15 then
                l_CmdrClient_0:Hide();
            end;
        end);
    else
        v14 = true;
        l_CmdrClient_0:SetEnabled(true);
    end;
    v8.ToggleConsole:Connect(function() --[[ Line: 66 ]]
        -- upvalues: v14 (ref), l_CmdrClient_0 (ref)
        if not v14 then
            return;
        else
            l_CmdrClient_0:Toggle();
            return;
        end;
    end);
end;
v10.Toggle = function(_, v17) --[[ Line: 76 ]] --[[ Name: Toggle ]]
    -- upvalues: l_CmdrClient_0 (copy)
    if v17 == nil then
        l_CmdrClient_0:Toggle();
        return;
    elseif v17 then
        l_CmdrClient_0:Show();
        return;
    else
        l_CmdrClient_0:Hide();
        return;
    end;
end;
return v10;