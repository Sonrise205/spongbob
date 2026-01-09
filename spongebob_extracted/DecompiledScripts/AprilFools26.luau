local _ = game:GetService("ReplicatedFirst");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("UserInputService");
local v3 = require(l_ReplicatedStorage_0.Packages.Knit);
local v4 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v6 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local v7 = require(l_ReplicatedStorage_0.Shared.Data.EventVariables);
local v8 = nil;
local v9 = nil;
local v10 = nil;
local v11 = nil;
local v12 = nil;
return {
    primaryMenu = true, 
    blur = true, 
    ToggleAll = {}, 
    animatedModels = {}, 
    dumpster = v4.new(), 
    Init = function(v13, v14, v15) --[[ Line: 46 ]] --[[ Name: Init ]]
        -- upvalues: v8 (ref), v3 (copy), v9 (ref), v10 (ref), v11 (ref)
        v13.destination = v15;
        v8 = v3.GetController("UIController");
        v9 = v3.GetController("EventController");
        v10 = v3.GetController("DataController");
        v11 = v3.GetService("AprilFoolsService");
        v13.ui = v14;
        v13.main = v14.Main;
        v13.windowFrame = v13.main.Window;
        v13.exitBtn = v13.windowFrame.Exit;
        v13.timerBar = v13.windowFrame.TimerBar;
        v13.titleFrame = v13.windowFrame.Title;
        local l_Overview_0 = v13.windowFrame.Content.Bin.Overview;
        v13.startButton = l_Overview_0.Details.Confirm;
        v13.taskFrame = l_Overview_0.Task;
        v13.taskClaimButton = v13.taskFrame.Claim;
        local l_NotCompleted_0 = v13.taskClaimButton.NotCompleted;
        v13.taskProgressBar = l_NotCompleted_0.Fill;
        v13.taskProgressLabel = l_NotCompleted_0.Amount;
        v13.questData = nil;
    end, 
    Start = function(v18, _) --[[ Line: 73 ]] --[[ Name: Start ]]
        -- upvalues: v12 (ref), v8 (ref), v9 (ref), v6 (copy), v11 (ref), v7 (copy), v10 (ref), v3 (copy)
        v12 = v8:GetModuleAsync("Notification"):expect();
        v8:HandleButton(v18.exitBtn, function() --[[ Line: 76 ]]
            -- upvalues: v8 (ref)
            v8:Toggle(script.Name, false);
        end);
        local l_v9_Timestamps_0, v21 = v9:GetTimestamps();
        if l_v9_Timestamps_0 and v21 then
            local v22 = DateTime.fromUnixTimestamp(l_v9_Timestamps_0.UnixTimestamp):FormatLocalTime("MMMM DD", "en-us");
            local v23 = DateTime.fromUnixTimestamp(v21.UnixTimestamp):FormatLocalTime("MMMM DD", "en-us");
            v18.titleFrame.TitleContainer.Title.Title.Text = ("%* - %*"):format(string.upper(v22), (string.upper(v23)));
        end;
        v9:ObserveTimeLeft(function(v24, _, v26) --[[ Line: 88 ]]
            -- upvalues: v18 (copy), v6 (ref), v21 (copy), l_v9_Timestamps_0 (copy)
            v18.timerBar.Bar.Title.Text = v26 and "Event Begins In" or "Event Ends In";
            v18.timerBar.Bar.Timer.Text = v6:FormatTimeFromSeconds(v24 or 0);
            local v27 = math.clamp(1 - v24 / (v21.UnixTimestamp - l_v9_Timestamps_0.UnixTimestamp), 0, 1);
            v18.timerBar.Bar.Fill.Size = UDim2.fromScale(v27, 1);
        end);
        v8:HandleButton(v18.startButton, function() --[[ Line: 99 ]]
            -- upvalues: v18 (copy), v11 (ref), v12 (ref)
            if not v18.questData or v18.questData.started then
                return;
            else
                v11:StartQuest():andThen(function(v28) --[[ Line: 104 ]]
                    -- upvalues: v12 (ref)
                    if v28 then
                        v12:Notify({
                            message = "Quest Started: You received the Pioneer Rock unit!", 
                            duration = 5, 
                            isPositive = true
                        });
                    end;
                end);
                return;
            end;
        end);
        v8:HandleButton(v18.taskClaimButton, function() --[[ Line: 115 ]]
            -- upvalues: v18 (copy), v11 (ref), v12 (ref)
            if not v18.questData or not v18.questData.finished then
                return;
            else
                v11:Claim():andThen(function(v29) --[[ Line: 120 ]]
                    -- upvalues: v12 (ref)
                    if v29 then
                        v12:Notify({
                            message = "You received the Pioneer Rock mount!", 
                            duration = 5, 
                            isPositive = true
                        });
                    end;
                end);
                return;
            end;
        end);
        local l_requiredTakedowns_0 = v7.AprilFools25.requiredTakedowns;
        local function v33(v31) --[[ Line: 133 ]] --[[ Name: updateUI ]]
            -- upvalues: v18 (copy), v9 (ref), l_requiredTakedowns_0 (copy), v6 (ref)
            local v32 = "Unit Takedowns";
            if v31.claimed or v31.finished then
                v32 = "Pioneer Rock Mount";
            end;
            v18.startButton.Visible = not v31.started and v9:IsActive();
            v18.taskFrame.Visible = v31.started;
            v18.taskFrame.Info.Text = v32;
            v18.taskClaimButton.Claimed.Visible = v31.claimed;
            v18.taskClaimButton.Content.Visible = v31.started and not v31.claimed and v31.finished;
            v18.taskClaimButton.NotCompleted.Visible = not v31.finished;
            if not v31.claimed then
                v18.taskProgressBar.Size = UDim2.new(v31.progress / l_requiredTakedowns_0, 0, 1, 0);
                v18.taskProgressLabel.Text = ("%* / %*"):format(v6:CommaNumber(v31.progress), (v6:CommaNumber(l_requiredTakedowns_0)));
            end;
        end;
        v10:OnChanged(v3.Player, "AprilFools25", function(v34) --[[ Line: 152 ]]
            -- upvalues: v33 (copy), v18 (copy)
            v33(v34);
            v18.questData = v34;
        end, true);
        v9.EventStarted:Connect(function() --[[ Line: 157 ]]
            -- upvalues: v18 (copy), v33 (copy)
            if not v18.questData then
                return;
            else
                v33(v18.questData);
                return;
            end;
        end);
        v9.EventEnded:Connect(function() --[[ Line: 165 ]]
            -- upvalues: v8 (ref), v18 (copy), v12 (ref)
            if v8:GetToggleState(script.Name) then
                v18.startButton.Visible = false;
                v8:Toggle(script.Name, false);
                v12:Notify({
                    message = "The event has ended!", 
                    duration = 5, 
                    isPositive = false
                });
            end;
        end);
    end, 
    Closing = function(v35) --[[ Line: 188 ]] --[[ Name: Closing ]]
        v35.dumpster:Destroy();
    end, 
    CanOpen = function(_) --[[ Line: 192 ]] --[[ Name: CanOpen ]]
        -- upvalues: v9 (ref)
        return v9:IsActive();
    end
};