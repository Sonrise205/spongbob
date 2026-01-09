local _ = game:GetService("Players");
local _ = game:GetService("ReplicatedFirst");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("Debris");
local _ = game:GetService("RunService");
local _ = game:GetService("ServerStorage");
local l_TeleportService_0 = game:GetService("TeleportService");
local _ = game:GetService("TweenService");
local v8 = require(l_ReplicatedStorage_0.Packages.Knit);
local _ = require(l_ReplicatedStorage_0.Packages.Timer);
local v10 = require(l_ReplicatedStorage_0.Packages.RailComponent);
local v11 = require(l_ReplicatedStorage_0.Packages.BaseComponent);
local _ = require(l_ReplicatedStorage_0.Packages.RailUtil);
local _ = require(l_ReplicatedStorage_0.Shared.Data.Variables);
local v14 = require(l_ReplicatedStorage_0.Shared.Util.DateTimeUtil);
local _ = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local _ = require(l_ReplicatedStorage_0.Shared.Modules.ZonePlus);
local v17 = require(l_ReplicatedStorage_0.Shared.Modules.ZonePlus);
local v18 = v10.new({
    Tag = "SBBTeleportPrompt", 
    Ancestors = {
        workspace
    }, 
    Extensions = {
        v11
    }
});
v18.Start = function(v19) --[[ Line: 37 ]] --[[ Name: Start ]]
    -- upvalues: v14 (copy), v17 (copy), v8 (copy), l_TeleportService_0 (copy)
    local l_v14_ForCTUnix_0 = v14:GetForCTUnix({
        Year = 2025, 
        Month = 12, 
        Day = 13, 
        Hour = 9
    });
    local l_v14_ForCTUnix_1 = v14:GetForCTUnix({
        Year = 2025, 
        Month = 12, 
        Day = 14, 
        Hour = 13
    });
    local l_workspace_ServerTimeNow_0 = workspace:GetServerTimeNow();
    if l_v14_ForCTUnix_1 <= l_workspace_ServerTimeNow_0 then
        return;
    else
        local v23 = v19.Instance:WaitForChild("Zone", 10);
        if not v23 then
            return;
        else
            local v24 = v17.new(v23);
            local v25 = v8.GetController("UIController"):GetModuleAsync("MessagePrompt"):expect();
            v24.localPlayerEntered:Connect(function() --[[ Line: 69 ]]
                -- upvalues: l_workspace_ServerTimeNow_0 (ref), l_v14_ForCTUnix_0 (copy), l_v14_ForCTUnix_1 (copy), v25 (copy), l_TeleportService_0 (ref), v8 (ref)
                l_workspace_ServerTimeNow_0 = workspace:GetServerTimeNow();
                if l_workspace_ServerTimeNow_0 < l_v14_ForCTUnix_0 or l_v14_ForCTUnix_1 <= l_workspace_ServerTimeNow_0 then
                    return;
                else
                    v25:Prompt({
                        message = "Would you like to teleport to Survive Bikini Bottom?", 
                        options = {
                            {
                                text = "Yes", 
                                callback = function() --[[ Line: 81 ]] --[[ Name: callback ]]
                                    -- upvalues: l_TeleportService_0 (ref), v8 (ref)
                                    l_TeleportService_0:Teleport(111471464387284, v8.Player);
                                end
                            }, 
                            {
                                text = "No"
                            }
                        }
                    });
                    return;
                end;
            end);
            return;
        end;
    end;
end;
v18.Stop = function(_) --[[ Line: 93 ]] --[[ Name: Stop ]]

end;
return v18;