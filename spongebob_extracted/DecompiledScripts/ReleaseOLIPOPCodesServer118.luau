local l_MemoryStoreService_0 = game:GetService("MemoryStoreService");
local l_ReplicatedFirst_0 = game:GetService("ReplicatedFirst");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v3 = require(l_ReplicatedStorage_0.Packages.Knit);
local v4 = nil;
local v5 = nil;
v3.OnStart():andThen(function() --[[ Line: 9 ]]
    -- upvalues: v4 (ref), v3 (copy), v5 (ref)
    v4 = v3.GetService("CurrencyService");
    v5 = v3.GetService("GameService");
end);
return function() --[[ Line: 14 ]]
    -- upvalues: l_ReplicatedFirst_0 (copy), l_MemoryStoreService_0 (copy)
    local v6 = require(game.ServerStorage.Knit.Modules.MemoryStorePromises);
    local v7 = require(game.ServerStorage.Knit.Modules.OLIPOPCodes2);
    local v8 = require(game.ReplicatedStorage.Packages.Promise);
    local _ = require(game.ReplicatedStorage.Packages.TableUtil);
    local _ = require(game.ReplicatedStorage.Shared.Util.DateTimeUtil);
    local _ = require(l_ReplicatedFirst_0.PlaceIds);
    local v12 = {};
    local v13 = {};
    for v14 = 1, 20 do
        v12[v14] = l_MemoryStoreService_0:GetQueue("CodesQueue_" .. v14);
        v13[v14] = l_MemoryStoreService_0:GetHashMap("CodesHash_" .. v14);
    end;
    local function _(v15) --[[ Line: 39 ]] --[[ Name: getShardRange ]]
        return (v15 - 1) * 500 + 1, (math.min(v15 * 500, 10000));
    end;
    for v17, v18 in v12 do
        warn("Processing Shard", v17);
        local v19 = (v17 - 1) * 500 + 1;
        local v20 = math.min(v17 * 500, 10000);
        local l_v19_0 = v19;
        local l_v20_0 = v20;
        v19 = v13[v17];
        if v19 and l_v19_0 and l_v20_0 then
            v20 = v19:GetAsync("AddedCodes") or {};
            local v23 = {};
            for v24 = l_v19_0, l_v20_0 do
                if v20[tostring(v24)] ~= true then
                    local v25 = v7[v24];
                    if v25 then
                        local v26 = v6.addAsync(v18, v25, 2592000);
                        v26:andThen(function() --[[ Line: 75 ]]
                            -- upvalues: v20 (copy), v24 (copy), v17 (copy)
                            v20[tostring(v24)] = true;
                            print("Successfully added code index", v24, "for shard", v17);
                        end):catch(function() --[[ Line: 78 ]]
                            -- upvalues: v24 (copy), v17 (copy), v20 (copy)
                            warn("Failed to add code index", v24, "for shard", v17);
                            v20[tostring(v24)] = false;
                        end);
                        table.insert(v23, v26);
                    end;
                end;
            end;
            if #v23 >= 1 then
                v8.all(v23):andThen(function() --[[ Line: 90 ]]
                    -- upvalues: v6 (copy), v19 (copy), v20 (copy), v17 (copy)
                    v6.setAsync(v19, "AddedCodes", v20, 2592000):catch(function(v27) --[[ Line: 97 ]]
                        -- upvalues: v17 (ref)
                        warn("Failed to update HashMap for shard", v17, ":", v27);
                    end);
                end):catch(function(v28) --[[ Line: 100 ]]
                    -- upvalues: v17 (copy)
                    warn("Error processing shard", v17, ":", v28);
                end):await();
            end;
        end;
    end;
    return "Success";
end;