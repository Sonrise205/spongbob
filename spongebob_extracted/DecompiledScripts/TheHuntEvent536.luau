local l_ReplicatedFirst_0 = game:GetService("ReplicatedFirst");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v2 = require(l_ReplicatedStorage_0.Packages.Knit);
local v3 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v5 = require(v2.Player.PlayerScripts.Knit.Modules.ClientAnimator);
local v6 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local v7 = require(l_ReplicatedFirst_0.PlaceIds);
local v8 = nil;
local v9 = nil;
local v10 = nil;
local v11 = nil;
local v12 = nil;
local v13 = nil;
return {
    primaryMenu = true, 
    blur = true, 
    ToggleAll = {}, 
    animatedModels = {}, 
    dumpster = v3.new(), 
    Init = function(v14, v15, v16) --[[ Line: 45 ]] --[[ Name: Init ]]
        -- upvalues: v8 (ref), v2 (copy), v9 (ref), v10 (ref), v11 (ref), v12 (ref)
        v14.destination = v16;
        v8 = v2.GetController("DataController");
        v9 = v2.GetController("UIController");
        v10 = v2.GetController("EventController");
        v11 = v2.GetController("FastTravelController");
        v12 = v2.GetController("PlaceTeleportController");
        v14.ui = v15;
        v14.main = v15.Main;
        v14.windowFrame = v14.main.Window;
        v14.exitBtn = v14.windowFrame.Exit;
        v14.teleportBtn = v14.windowFrame.Content.Bin.Overview.Teleport.Confirm;
        v14.timerBar = v14.windowFrame.TimerBar;
        v14.titleFrame = v14.windowFrame.Title;
        for _, v18 in v14.main.BonusReward.BossContainer.ViewportFrame.WorldModel:GetChildren() do
            if v18:IsA("Model") then
                table.insert(v14.animatedModels, v18);
            end;
        end;
    end, 
    Start = function(v19, _) --[[ Line: 72 ]] --[[ Name: Start ]]
        -- upvalues: v13 (ref), v9 (ref), v7 (copy), v12 (ref), v11 (ref), v10 (ref), v6 (copy)
        if v19.destination == "Trading" then
            v13 = v9:GetModuleAsync("MessagePrompt"):expect();
        end;
        v9:HandleButton(v19.exitBtn, function() --[[ Line: 77 ]]
            -- upvalues: v9 (ref)
            v9:Toggle(script.Name, false);
        end);
        v9:HandleButton(v19.teleportBtn, function() --[[ Line: 81 ]]
            -- upvalues: v19 (copy), v13 (ref), v7 (ref), v12 (ref), v9 (ref), v11 (ref)
            if v19.destination == "Trading" then
                v13:Prompt({
                    message = v7:GetDestinationPrompt("Lobby"), 
                    options = {
                        {
                            text = "Yes", 
                            callback = function() --[[ Line: 88 ]] --[[ Name: callback ]]
                                -- upvalues: v12 (ref)
                                v12:Teleport("Lobby");
                            end
                        }, 
                        {
                            text = "No"
                        }
                    }
                });
                return;
            else
                v9:Toggle(script.Name, false);
                v11:Travel("TheHunt");
                return;
            end;
        end);
        local l_v10_Timestamps_0, v22 = v10:GetTimestamps();
        if l_v10_Timestamps_0 and v22 then
            local v23 = DateTime.fromUnixTimestamp(l_v10_Timestamps_0.UnixTimestamp):FormatLocalTime("MMMM DD", "en-us");
            local v24 = DateTime.fromUnixTimestamp(v22):FormatLocalTime("MMMM DD", "en-us");
            v19.titleFrame.TitleContainer.Title.Title.Text = ("%* - %*"):format(string.upper(v23), (string.upper(v24)));
        end;
        v10:ObserveTimeLeft(function(v25, _, v27) --[[ Line: 113 ]]
            -- upvalues: v19 (copy), v6 (ref), v22 (copy), l_v10_Timestamps_0 (copy)
            v19.timerBar.Bar.Title.Text = v27 and "Event Begins In" or "Event Ends In";
            v19.timerBar.Bar.Timer.Text = v6:FormatTimeFromSeconds(v25 or 0);
            local v28 = math.clamp(1 - v25 / (v22 - l_v10_Timestamps_0.UnixTimestamp), 0, 1);
            v19.timerBar.Bar.Fill.Size = UDim2.fromScale(v28, 1);
        end);
    end, 
    Opening = function(v29) --[[ Line: 125 ]] --[[ Name: Opening ]]
        -- upvalues: v5 (copy)
        for _, v31 in v29.animatedModels do
            local v32 = v31:GetAttribute("Animation") or v31.Name;
            local v33 = v5.new(v32, v31, "Friendlies");
            v33:Play("Idle");
            v29.dumpster:Add(v33);
        end;
    end, 
    Closing = function(v34) --[[ Line: 134 ]] --[[ Name: Closing ]]
        v34.dumpster:Clean();
    end
};