local l_ReplicatedFirst_0 = game:GetService("ReplicatedFirst");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v2 = require(l_ReplicatedStorage_0.Packages.Knit);
local _ = require(l_ReplicatedStorage_0.Packages.Dumpster);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v5 = require(l_ReplicatedFirst_0.PlaceIds);
local v6 = nil;
local v7 = nil;
local v8 = nil;
return {
    primaryMenu = true, 
    Init = function(v9, v10) --[[ Line: 30 ]] --[[ Name: Init ]]
        -- upvalues: v6 (ref), v2 (copy), v7 (ref), v8 (ref)
        v6 = v2.GetController("DataController");
        v7 = v2.GetService("TowerKarateService");
        v8 = v2.GetController("UIController");
        v9.ui = v10;
        v9.main = v10.Main.Window;
    end, 
    Start = function(v11) --[[ Line: 40 ]] --[[ Name: Start ]]
        -- upvalues: v6 (ref), v2 (copy), v8 (ref)
        v6:OnChanged(v2.Player, {
            "TowerOfKarate", 
            "SeenInstructions"
        }, function(v12) --[[ Line: 41 ]]
            -- upvalues: v11 (copy)
            v11._seenInstructions = v12;
        end);
        local function v13() --[[ Line: 45 ]] --[[ Name: exit ]]
            -- upvalues: v8 (ref)
            v8:Toggle(script.Name, false);
        end;
        v8:HandleButton(v11.main.Exit, v13);
        v8:HandleButton(v11.main.Content.Play, v13);
    end, 
    Closed = function(v14) --[[ Line: 53 ]] --[[ Name: Closed ]]
        -- upvalues: v7 (ref)
        if not v14._seenInstructions then
            v7:ReportSeenInstructions();
        end;
    end, 
    OnJoin = function(_) --[[ Line: 59 ]] --[[ Name: OnJoin ]]
        -- upvalues: v5 (copy), v6 (ref), v2 (copy)
        if not v5:IsKarateLobby() then
            return false;
        else
            return (v6:Get(v2.Player, {
                "TowerOfKarate", 
                "SeenInstructions"
            }):expect() or false) ~= true;
        end;
    end
};