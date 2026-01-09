local l_ReplicatedFirst_0 = game:GetService("ReplicatedFirst");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v2 = require(l_ReplicatedStorage_0.Packages.Knit);
local v3 = require(l_ReplicatedStorage_0.Packages.Component);
local v4 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v5 = require(l_ReplicatedStorage_0.Packages.Timer);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v7 = require(l_ReplicatedStorage_0.Shared.Data.Variables);
local v8 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local v9 = require(l_ReplicatedFirst_0.PlaceIds);
local v10 = v2.GetController("UIController");
local v11 = v2.GetController("DataController");
local v12 = v2.GetService("UnitService");
local v13 = v3.new({
    Tag = script.Name, 
    Ancestors = {
        workspace
    }, 
    Extensions = {
        {
            ShouldConstruct = function() --[[ Line: 34 ]] --[[ Name: ShouldConstruct ]]
                -- upvalues: v9 (copy)
                return v9:IsLobby();
            end
        }
    }
});
v13.Construct = function(v14) --[[ Line: 43 ]] --[[ Name: Construct ]]
    -- upvalues: v4 (copy)
    v14.dump = v4.new();
    v14.offerExpired = false;
    v14.BillboardGui = v14.Instance.Hill.Title.BillboardGui;
    v14.Prompt = v14.Instance.Hill.PromptAttachment.ProximityPrompt;
    v14.dump:Add(function() --[[ Line: 52 ]]
        -- upvalues: v14 (copy)
        v14.dump = nil;
    end);
end;
v13.Start = function(v15) --[[ Line: 57 ]] --[[ Name: Start ]]
    -- upvalues: v10 (copy), v11 (copy), v2 (copy), v8 (copy), v7 (copy), v12 (copy), v5 (copy)
    local v16 = v10:GetModuleAsync("Notification"):expect();
    local v17 = v11:Get(v2.Player, "_claimedGloveMount"):expect() or false;
    v15.dump:Add(v11:OnChanged(v2.Player, "_claimedGloveMount", function(v18) --[[ Line: 62 ]]
        -- upvalues: v17 (ref), v15 (copy)
        v17 = v18;
        if v17 then
            v15.Prompt.Enabled = false;
        end;
    end));
    v15.dump:Add(v11:OnChanged(v2.Player, "Completion", function(v19) --[[ Line: 70 ]]
        -- upvalues: v8 (ref), v7 (ref), v15 (copy), v17 (ref)
        local l_v8_ClearedChapters_0, v21 = v8:GetClearedChapters(v19, "RockBottom", v7.DIFFICULTY_INDEX.Nightmare);
        v15.BillboardGui.Description.Text = ("Complete all Nightmare Chapters of Rock Bottom to Unlock! (%*/%*)"):format(l_v8_ClearedChapters_0, v21);
        local l_Prompt_0 = v15.Prompt;
        local v23 = false;
        if v21 <= l_v8_ClearedChapters_0 then
            v23 = not v17 and not v15.offerExpired;
        end;
        l_Prompt_0.Enabled = v23;
    end, true));
    local v24 = false;
    v15.dump:Connect(v15.Prompt.Triggered, function(v25) --[[ Line: 83 ]]
        -- upvalues: v24 (ref), v2 (ref), v12 (ref), v16 (copy)
        if v24 then
            return;
        elseif v25 ~= v2.Player then
            return;
        else
            v24 = true;
            v12:ClaimGloveWorldMount():andThen(function(_) --[[ Line: 94 ]]
                -- upvalues: v16 (ref)
                v16:Notify({
                    message = "Successfully claimed the Glove Balloon mount!", 
                    isPositive = true, 
                    duration = 6
                });
            end):finally(function() --[[ Line: 100 ]]
                -- upvalues: v24 (ref)
                v24 = false;
            end);
            return;
        end;
    end);
    local l_workspace_ServerTimeNow_0 = workspace:GetServerTimeNow();
    local v28 = v7.ROCK_BOTTOM_LIMITED_MOUNT_EXPIRATION - l_workspace_ServerTimeNow_0;
    local function _() --[[ Line: 109 ]] --[[ Name: updateTimer ]]
        -- upvalues: v28 (ref), v15 (copy), v8 (ref)
        if v28 < 1 then
            v15.offerExpired = true;
            v15.Prompt.Enabled = false;
            v15.BillboardGui.Countdown.Text = "TIME EXPIRED!";
            return;
        else
            v15.BillboardGui.Countdown.Text = ("TIME LEFT TO COMPLETE: %*"):format((v8:FormatTimeFromSeconds(v28)));
            return;
        end;
    end;
    if v28 < 1 then
        v15.offerExpired = true;
        v15.Prompt.Enabled = false;
        v15.BillboardGui.Countdown.Text = "TIME EXPIRED!";
    else
        v15.BillboardGui.Countdown.Text = ("TIME LEFT TO COMPLETE: %*"):format((v8:FormatTimeFromSeconds(v28)));
    end;
    if v28 < 1 then
        return;
    else
        v15.dump:Add(v5.Simple(1, function() --[[ Line: 127 ]]
            -- upvalues: v28 (ref), v15 (copy), v8 (ref)
            v28 = v28 - 1;
            if v28 < 1 then
                v15.offerExpired = true;
                v15.Prompt.Enabled = false;
                v15.BillboardGui.Countdown.Text = "TIME EXPIRED!";
            else
                v15.BillboardGui.Countdown.Text = ("TIME LEFT TO COMPLETE: %*"):format((v8:FormatTimeFromSeconds(v28)));
            end;
            if v28 < 1 then
                v15.dump:Remove("Countdown");
            end;
        end), "Countdown");
        return;
    end;
end;
v13.Stop = function(v30) --[[ Line: 137 ]] --[[ Name: Stop ]]
    if v30.dump then
        v30.dump:Destroy();
    end;
end;
return v13;