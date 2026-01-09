local l_GuiService_0 = game:GetService("GuiService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v2 = require(l_ReplicatedStorage_0.Packages.Knit);
local _ = require(l_ReplicatedStorage_0.Packages.Dumpster);
local _ = require(l_ReplicatedStorage_0.Packages.TableUtil);
local v5 = nil;
local v6 = nil;
local v7 = nil;
local v8 = nil;
local v9 = nil;
return {
    primaryMenu = true, 
    blur = true, 
    Init = function(v10, v11, v12) --[[ Line: 36 ]] --[[ Name: Init ]]
        -- upvalues: v5 (ref), v2 (copy), v6 (ref), v7 (ref), v8 (ref)
        v5 = v2.GetController("UIController");
        v6 = v2.GetController("DataController");
        v7 = v2.GetService("RewardService");
        v8 = v2.GetController("DeviceTypeController");
        v10.currentMode = v12;
        v10.ui = v11;
        v10.main = v11.Main;
        v10.claimButton = v10.main.Claim;
        v10.exitButton = v10.main.Exit;
        v10._isClaimed = false;
    end, 
    Start = function(v13) --[[ Line: 53 ]] --[[ Name: Start ]]
        -- upvalues: v9 (ref), v5 (ref), v6 (ref), v2 (copy), v7 (ref)
        v9 = v5:GetModuleAsync("Notification"):expect();
        v5:HandleButton(v13.exitButton, function() --[[ Line: 56 ]]
            -- upvalues: v5 (ref)
            v5:Toggle(script.Name, false);
        end);
        v6:OnChanged(v2.Player, "ClaimedLikeReward", function(v14) --[[ Line: 60 ]]
            -- upvalues: v13 (copy)
            v13._isClaimed = v14;
            v13.claimButton.Content.Claimed.Visible = v14;
            v13.claimButton.Content.Title.Text = v14 and "Claimed" or "CLAIM";
        end, true);
        v5:HandleButton(v13.claimButton, function() --[[ Line: 67 ]]
            -- upvalues: v13 (copy), v9 (ref), v2 (ref), v7 (ref)
            if v13._isClaimed then
                v9:Notify({
                    message = "You've already claimed your reward!", 
                    duration = 3, 
                    isPositive = false
                });
                return;
            elseif not v2.Player:GetAttribute("IS_IN_GROUP") then
                v9:Notify({
                    message = "You must be in the community/group on Roblox to claim your reward!", 
                    duration = 5, 
                    isPositive = false
                });
                return;
            else
                v7:ClaimLikeReward():andThen(function(v15) --[[ Line: 89 ]]
                    -- upvalues: v9 (ref)
                    if not v15 then
                        v9:Notify({
                            message = "Failed to claim your reward. Try again later.", 
                            duration = 5, 
                            isPositive = false
                        });
                    end;
                end);
                return;
            end;
        end);
    end, 
    Opened = function(v16) --[[ Line: 101 ]] --[[ Name: Opened ]]
        -- upvalues: v8 (ref), l_GuiService_0 (copy)
        if v8:IsConsole() then
            task.delay(0.2, function() --[[ Line: 103 ]]
                -- upvalues: l_GuiService_0 (ref), v16 (copy)
                l_GuiService_0.SelectedObject = v16.claimButton;
            end);
        end;
    end, 
    Closed = function(_) --[[ Line: 109 ]] --[[ Name: Closed ]]

    end
};