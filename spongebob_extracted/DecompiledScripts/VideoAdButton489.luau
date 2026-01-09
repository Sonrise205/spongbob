local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_AdService_0 = game:GetService("AdService");
local l_Players_0 = game:GetService("Players");
local v3 = require(l_ReplicatedStorage_0.Packages.Component);
local v4 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v5 = require(l_ReplicatedStorage_0.Packages.Promise);
local v6 = require(l_ReplicatedStorage_0.Packages.Signal);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v8 = require(l_ReplicatedStorage_0.Packages.Knit);
local l_PlayerGui_0 = l_Players_0.LocalPlayer:WaitForChild("PlayerGui");
local v10 = false;
local function _(v11) --[[ Line: 23 ]] --[[ Name: IsIneligible ]]
    local v12 = true;
    if v11 ~= Enum.AdAvailabilityResult.ExperienceIneligible then
        v12 = true;
        if v11 ~= Enum.AdAvailabilityResult.PublisherIneligible then
            v12 = true;
            if v11 ~= Enum.AdAvailabilityResult.DeviceIneligible then
                v12 = v11 == Enum.AdAvailabilityResult.PlayerIneligible;
            end;
        end;
    end;
    return v12;
end;
local v14 = v3.new({
    Tag = "VideoAdButton", 
    Ancestors = {
        l_PlayerGui_0
    }
});
v14.FinishedWatchingAd = v6.new();
v14.Construct = function(v15) --[[ Line: 38 ]] --[[ Name: Construct ]]
    -- upvalues: v4 (copy)
    v15.Dumpster = v4.new();
end;
v14.Start = function(v16) --[[ Line: 42 ]] --[[ Name: Start ]]
    -- upvalues: v8 (copy), v10 (ref)
    v16.Instance.Visible = false;
    local v17 = if v16.Instance.Name == "VideoAdButton" then v16.Instance else v16.Instance:FindFirstChild("VideoAdButton", true);
    if not v17 then
        warn("[VideoAdButton]: 'VideoAdButton' not found in hierarchy. Instance:", v16.Instance);
        return;
    elseif not v16.Instance:GetAttribute("AdReference") then
        warn("[VideoAdButton]: 'AdReference' attribute not set on instance:", v16.Instance);
        return;
    else
        local v18 = v8.GetService("VideoAdService");
        v8.GetController("UIController"):HandleButton(v17, function() --[[ Line: 57 ]]
            -- upvalues: v10 (ref), v16 (copy), v18 (copy)
            if v10 then
                return;
            else
                v10 = true;
                v16.Instance.Visible = false;
                v16.Dumpster:AddPromise(v18:TryWatchVideoAd(v16.Instance:GetAttribute("AdReference")):andThen(function(v19) --[[ Line: 61 ]]
                    -- upvalues: v16 (ref)
                    if v19 == Enum.ShowAdResult.ShowCompleted then
                        v16.FinishedWatchingAd:Fire();
                        return;
                    else
                        warn("Ad playback failure. Result:", v19);
                        v16:_promiseCheckForAds();
                        return;
                    end;
                end):finally(function() --[[ Line: 68 ]]
                    -- upvalues: v10 (ref)
                    v10 = false;
                end):catch(warn));
                return;
            end;
        end);
        v16.Dumpster:Add(v16.FinishedWatchingAd:Connect(function() --[[ Line: 75 ]]
            -- upvalues: v16 (copy)
            v16:_promiseCheckForAds();
        end));
        v16:_promiseCheckForAds();
        return;
    end;
end;
v14.Stop = function(v20) --[[ Line: 81 ]] --[[ Name: Stop ]]
    v20.Dumpster:Destroy();
end;
v14._promiseCheckForAds = function(v21) --[[ Line: 86 ]] --[[ Name: _promiseCheckForAds ]]
    -- upvalues: v5 (copy), l_AdService_0 (copy)
    local v27 = v5.new(function(v22, v23, _) --[[ Line: 87 ]]
        -- upvalues: v21 (copy), l_AdService_0 (ref), v5 (ref)
        v21.Instance.Visible = false;
        local l_AdAvailabilityResult_0 = l_AdService_0:GetAdAvailabilityNowAsync(Enum.AdFormat.RewardedVideo).AdAvailabilityResult;
        local v26 = true;
        if l_AdAvailabilityResult_0 ~= Enum.AdAvailabilityResult.ExperienceIneligible then
            v26 = true;
            if l_AdAvailabilityResult_0 ~= Enum.AdAvailabilityResult.PublisherIneligible then
                v26 = true;
                if l_AdAvailabilityResult_0 ~= Enum.AdAvailabilityResult.DeviceIneligible then
                    v26 = l_AdAvailabilityResult_0 == Enum.AdAvailabilityResult.PlayerIneligible;
                end;
            end;
        end;
        if v26 then
            v23("Ineligible for ads.");
        end;
        if l_AdAvailabilityResult_0 == Enum.AdAvailabilityResult.IsAvailable then
            v21.Instance.Visible = true;
            v22(true);
            return;
        else
            return v5.delay(1):andThen(function() --[[ Line: 99 ]]
                -- upvalues: v21 (ref)
                return v21:_promiseCheckForAds();
            end);
        end;
    end);
    return v21.Dumpster:AddPromise(v27);
end;
return v14;