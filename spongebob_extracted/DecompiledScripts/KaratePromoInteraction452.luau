local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_SocialService_0 = game:GetService("SocialService");
local v2 = require(l_ReplicatedStorage_0.Packages.Knit);
local v3 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v4 = require(l_ReplicatedStorage_0.Packages.Component);
local v5 = require(l_ReplicatedStorage_0.Shared.Modules.ZonePlus);
local v6 = require(l_ReplicatedStorage_0.Shared.Modules.WWSDebug);
local _ = require(l_ReplicatedStorage_0.Shared.Data.Variables);
local v8 = v2.GetController("UIController");
local _ = v2.GetController("DataController");
local _ = v2.GetController("PlaceTeleportController");
local v11 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local _ = require(l_ReplicatedStorage_0.Shared.Util.DateTimeUtil);
local v13 = require(l_ReplicatedStorage_0.Shared.TowerOfKarate.Constants);
local v14 = nil;
local v15 = {};
for _, v17 in script:GetChildren() do
    v15[v17.Name] = require(v17);
end;
local v21 = v4.new({
    Tag = script.Name, 
    Ancestors = {
        workspace
    }, 
    Extensions = {
        {
            ShouldConstruct = function(v18) --[[ Line: 32 ]] --[[ Name: ShouldConstruct ]]
                -- upvalues: v6 (copy), v15 (copy)
                local l_Attribute_0 = v18.Instance:GetAttribute("Dialogue");
                if not l_Attribute_0 then
                    v6:Warn("DialogueZone:", v18.Instance:GetFullName(), "is missing a Dialogue attribute");
                    return false;
                else
                    local v20 = v15[l_Attribute_0];
                    if l_Attribute_0 ~= "Trading" and not v20 then
                        v6:Warn("DialogueZone:", v18.Instance:GetFullName(), "is missing a Dialogue script");
                        return false;
                    else
                        return true;
                    end;
                end;
            end
        }
    }
});
v21.Construct = function(v22) --[[ Line: 60 ]] --[[ Name: Construct ]]
    -- upvalues: v3 (copy)
    v22.dumpster = v3.new();
end;
v21.Start = function(v23) --[[ Line: 64 ]] --[[ Name: Start ]]
    -- upvalues: v14 (ref), v8 (copy), v15 (copy), v5 (copy), v11 (copy), v13 (copy), l_SocialService_0 (copy)
    if not v14 then
        v14 = v8:GetModuleAsync("Dialog"):expect();
    end;
    local v24 = v15[v23.Instance:GetAttribute("Dialogue")];
    local v25 = v5.new(v23.Instance);
    v23.dumpster:Add(v25);
    v25.localPlayerEntered:Connect(function() --[[ Line: 76 ]]
        -- upvalues: v11 (ref), v13 (ref), l_SocialService_0 (ref), v14 (ref), v24 (copy)
        local v26, _ = v11:VerifyTowerOfKarateReleased();
        if not v26 then
            local v28 = DateTime.fromUnixTimestamp(v13.TOK_RELEASE_TIME):ToLocalTime();
            local l_Hour_0 = v28.Hour;
            local v30 = l_Hour_0 >= 12;
            if l_Hour_0 > 12 then
                l_Hour_0 = l_Hour_0 - 12;
            end;
            local v31 = ("Karate Island is coming soon! Releases @%* (%*/%*/%*)"):format(("%*:%* %*"):format(l_Hour_0, v28.Minute, v30 and "PM" or "AM"), v28.Month, v28.Day, v28.Year);
            local v32 = {
                {
                    Text = "Ok!"
                }
            };
            local v33 = {
                {
                    Text = "RSVP for Release", 
                    callback = function() --[[ Line: 105 ]] --[[ Name: callback ]]
                        -- upvalues: l_SocialService_0 (ref)
                        l_SocialService_0:GetEventRsvpStatusAsync(1.800346210796307E18);
                    end
                }, 
                {
                    Text = "Exit"
                }
            };
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 115 ]]
                -- upvalues: l_SocialService_0 (ref)
                return l_SocialService_0:GetEventRsvpStatusAsync("1800346210796306867");
            end);
            local v36 = nil;
            v36 = if l_status_0 and l_result_0 == Enum.RsvpStatus.None then v33 else v32;
            v14:Prompt("MasterUdon", {
                Dialog = v31, 
                Options = v36
            });
            return;
        else
            v14:Prompt("MasterUdon", v24.Props);
            return;
        end;
    end);
    v25.localPlayerExited:Connect(function() --[[ Line: 136 ]]
        -- upvalues: v8 (ref)
        v8:Toggle("Dialog", false);
    end);
end;
v21.Stop = function(v37) --[[ Line: 141 ]] --[[ Name: Stop ]]
    v37.dumpster:Destroy();
end;
return v21;