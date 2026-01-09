local l_MarketplaceService_0 = game:GetService("MarketplaceService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v2 = require(l_ReplicatedStorage_0.Packages.Promise);
local v3 = {};
return function(v4, v5) --[[ Line: 14 ]]
    -- upvalues: v2 (copy), v3 (copy), l_MarketplaceService_0 (copy)
    v5 = v5 or Enum.InfoType.Asset;
    local v6 = v5 == "Subscription" and "GetSubscriptionProductInfoAsync" or "GetProductInfo";
    if v5 ~= "Subscription" and (not v4 or typeof(v4) ~= "number") then
        return v2.reject("Invalid asset ID");
    else
        local function v8() --[[ Line: 26 ]] --[[ Name: promiseInfo ]]
            -- upvalues: v3 (ref), v4 (copy), v2 (ref), l_MarketplaceService_0 (ref), v6 (copy), v5 (ref)
            if v3[v4] then
                return v2.resolve(v3[v4]);
            else
                return v2.try(function() --[[ Line: 31 ]]
                    -- upvalues: l_MarketplaceService_0 (ref), v6 (ref), v4 (ref), v5 (ref)
                    local v7 = l_MarketplaceService_0[v6](l_MarketplaceService_0, v4, v5);
                    assert(next(v7) ~= nil, "No info returned for asset ID: " .. v4);
                    return v7;
                end);
            end;
        end;
        local v9 = debug.traceback();
        return v2.retryWithDelay(v8, 15, 1):tap(function(v10) --[[ Line: 42 ]]
            -- upvalues: v3 (ref), v4 (copy)
            v3[v4] = v10;
        end):catch(function() --[[ Line: 45 ]]
            -- upvalues: v4 (copy), v5 (ref), v9 (copy)
            warn((("Failed to get Asset Info for ID: %* - InfoType: %*\nCalled at:\n%*\n"):format(v4, v5, v9)));
        end);
    end;
end;