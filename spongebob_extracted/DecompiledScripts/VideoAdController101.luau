local l_ReplicatedFirst_0 = game:GetService("ReplicatedFirst");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_AdService_0 = game:GetService("AdService");
local v3 = require(l_ReplicatedStorage_0.Packages.Promise);
local v4 = require(l_ReplicatedStorage_0.Packages.Signal);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v6 = require(l_ReplicatedStorage_0.Packages.Knit);
local v7 = require(l_ReplicatedFirst_0.PlaceIds);
local v8 = false;
local v9 = nil;
local function _(v10) --[[ Line: 24 ]] --[[ Name: IsIneligible ]]
    local v11 = true;
    if v10 ~= Enum.AdAvailabilityResult.ExperienceIneligible then
        v11 = true;
        if v10 ~= Enum.AdAvailabilityResult.PublisherIneligible then
            v11 = true;
            if v10 ~= Enum.AdAvailabilityResult.DeviceIneligible then
                v11 = v10 == Enum.AdAvailabilityResult.PlayerIneligible;
            end;
        end;
    end;
    return v11;
end;
local v13 = v6.CreateController({
    Name = "VideoAdController"
});
v13.FinishedWatchingAd = v4.new();
v13.KnitInit = function(_) --[[ Line: 38 ]] --[[ Name: KnitInit ]]

end;
v13.KnitStart = function(_) --[[ Line: 41 ]] --[[ Name: KnitStart ]]
    -- upvalues: v7 (copy), v6 (copy), v9 (ref)
    if not v7:IsHUB() then
        return;
    else
        v9 = v6.GetController("UIController"):GetModuleAsync("Notification"):expect();
        return;
    end;
end;
v13.PromiseIsVideoAvailable = function(_) --[[ Line: 51 ]] --[[ Name: PromiseIsVideoAvailable ]]
    -- upvalues: v3 (copy), l_AdService_0 (copy)
    return v3.new(function(v17, _, _) --[[ Line: 52 ]]
        -- upvalues: l_AdService_0 (ref)
        local l_AdAvailabilityResult_0 = l_AdService_0:GetAdAvailabilityNowAsync(Enum.AdFormat.RewardedVideo).AdAvailabilityResult;
        local v21 = true;
        if l_AdAvailabilityResult_0 ~= Enum.AdAvailabilityResult.ExperienceIneligible then
            v21 = true;
            if l_AdAvailabilityResult_0 ~= Enum.AdAvailabilityResult.PublisherIneligible then
                v21 = true;
                if l_AdAvailabilityResult_0 ~= Enum.AdAvailabilityResult.DeviceIneligible then
                    v21 = l_AdAvailabilityResult_0 == Enum.AdAvailabilityResult.PlayerIneligible;
                end;
            end;
        end;
        if v21 then
            warn("Ineligible for video ads. Result:", l_AdAvailabilityResult_0);
            v17(false, "Ineligible for video ads. Result: " .. tostring(l_AdAvailabilityResult_0));
        end;
        if l_AdAvailabilityResult_0 == Enum.AdAvailabilityResult.IsAvailable then
            v17(true, "Available for video ads.");
            return;
        else
            v17(false, "Eligible, but ad result is: " .. tostring(l_AdAvailabilityResult_0));
            return;
        end;
    end):catch(warn);
end;
v13.PromiseCanWatchAds = function(v22) --[[ Line: 67 ]] --[[ Name: PromiseCanWatchAds ]]
    -- upvalues: v3 (copy)
    return v3.try(function() --[[ Line: 68 ]]
        -- upvalues: v22 (copy)
        return v22:PromiseIsVideoAvailable():expect();
    end):catch(warn);
end;
v13.PromiseWatchVideoAd = function(v23, v24) --[[ Line: 74 ]] --[[ Name: PromiseWatchVideoAd ]]
    -- upvalues: v8 (ref), v3 (copy), v9 (ref), v6 (copy)
    if v8 then
        return v3.reject("Already processing a video ad request.");
    elseif not v23:PromiseCanWatchAds():expect() then
        v9:Notify({
            message = "You cannot watch ads at this time.", 
            isPositive = false, 
            duration = 2
        });
        return v3.reject("Cannot watch ads at this time.");
    else
        v8 = true;
        return v6.GetService("VideoAdService"):TryWatchVideoAd(v24):andThen(function(v25) --[[ Line: 91 ]]
            -- upvalues: v23 (copy)
            if v25 == Enum.ShowAdResult.ShowCompleted then
                v23.FinishedWatchingAd:Fire();
                return;
            else
                warn("Ad playback failure. Result:", v25);
                v23:PromiseCanWatchAds();
                return;
            end;
        end):timeout(40):finally(function() --[[ Line: 98 ]]
            -- upvalues: v8 (ref)
            v8 = false;
        end);
    end;
end;
return v13;