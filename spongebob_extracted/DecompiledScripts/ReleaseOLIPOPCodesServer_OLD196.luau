local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.Knit);
local v2 = nil;
local v3 = nil;
v1.OnStart():andThen(function() --[[ Line: 7 ]]
    -- upvalues: v2 (ref), v1 (copy), v3 (ref)
    v2 = v1.GetService("CurrencyService");
    v3 = v1.GetService("GameService");
end);
return function() --[[ Line: 12 ]]
    local v4 = require(game.ServerStorage.Knit.Modules.MemoryStorePromises);
    local v5 = require(game.ServerStorage.Knit.Modules.OLIPOPCodes);
    local v6 = require(game.ReplicatedStorage.Packages.Promise);
    local v7 = require(game.ReplicatedStorage.Packages.TableUtil);
    local v8 = require(game.ReplicatedStorage.Shared.Util.DateTimeUtil);
    local v9 = 1;
    local v10 = 86000;
    local l_Queue_0 = game.MemoryStoreService:GetQueue((("OLIPOPCodesQueue_%*"):format(5)));
    local l_HashMap_0 = game.MemoryStoreService:GetHashMap((("OLIPOPCodesAdded_%*"):format(5)));
    if not v5[v9] then
        error("THERE ARE NO CODES FOR:", v9);
        return;
    else
        local l_v8_ForCTUnix_0 = v8:GetForCTUnix({
            year = 2025, 
            month = 8, 
            day = 8, 
            hour = 13, 
            minute = 55
        });
        local function v16() --[[ Line: 41 ]] --[[ Name: getDailyTimestamp ]]
            -- upvalues: v8 (copy)
            local _ = DateTime.now();
            local v15 = v8:GetForCT({
                Hour = 13
            }):ToUniversalTime();
            return v8:GetForCT({
                Year = v15.Year, 
                Month = v15.Month, 
                Day = v15.Day + 1, 
                Hour = 13, 
                Minute = 55
            });
        end;
        local function _(v17) --[[ Line: 57 ]] --[[ Name: calculateDayIndex ]]
            -- upvalues: l_v8_ForCTUnix_0 (copy)
            return math.floor(((v17 or DateTime.now().UnixTimestamp) - l_v8_ForCTUnix_0) / 86400) + 1;
        end;
        v9 = math.floor(((nil or DateTime.now().UnixTimestamp) - l_v8_ForCTUnix_0) / 86400) + 1;
        local l_UnixTimestamp_0 = DateTime.now().UnixTimestamp;
        v10 = v16().UnixTimestamp - l_UnixTimestamp_0;
        local v20 = {};
        local v21 = {};
        local v22 = {};
        local v23, v24 = v4.getAsync(l_HashMap_0, (("Day_%*"):format(v9))):await();
        if not v23 then
            warn("Failed to get HashMap");
            return;
        else
            v24 = v24 or {};
            local l_Message_0 = Instance.new("Message");
            l_Message_0.Text = ("Populating OLIPOP Codes for Day: %*"):format(v9);
            l_Message_0.Parent = workspace;
            local v26 = 0;
            for v27, v28 in v5[v9] do
                if v24[tostring(v27)] == true then
                    warn("Code index", v27, " already exists! (No worries here)");
                    v26 = v26 + 1;
                else
                    local v29 = v4.addAsync(l_Queue_0, v28, v10);
                    v29:andThen(function() --[[ Line: 104 ]]
                        -- upvalues: v27 (copy), v21 (copy)
                        print("Successfully added code index:", v27);
                        v21[tostring(v27)] = true;
                    end):catch(function() --[[ Line: 107 ]]
                        -- upvalues: v27 (copy), v22 (copy)
                        warn("FAILED to add code index:", v27);
                        v22[tostring(v27)] = true;
                    end);
                    table.insert(v20, v29);
                end;
            end;
            v6.all(v20):andThen(function() --[[ Line: 115 ]]
                -- upvalues: v21 (copy), v24 (ref), v22 (copy)
                for v30, _ in v21 do
                    v24[tostring(v30)] = true;
                end;
                for v32, _ in v22 do
                    v24[tostring(v32)] = false;
                end;
            end):catch(function(v34) --[[ Line: 123 ]]
                warn("FAILED!!!!", v34);
            end):finally(function() --[[ Line: 125 ]]
                -- upvalues: v7 (copy), v21 (copy), v22 (copy), l_Message_0 (ref), v9 (ref), v26 (ref), v4 (copy), l_HashMap_0 (copy), v24 (ref), v10 (ref)
                local v35 = #v7.Keys(v21);
                local v36 = #v7.Keys(v22);
                task.delay(5, function() --[[ Line: 129 ]]
                    -- upvalues: l_Message_0 (ref), v9 (ref), v35 (copy), v36 (copy), v26 (ref)
                    l_Message_0.Text = ("FINISHED POPULATING CODES FOR DAY: %*\nTOTAL SUCCESSFUL: %*\nTOTAL FAILED: %*\nTOTAL ALREADY EXISTED: %*"):format(v9, v35, v36, v26);
                    task.delay(10, function() --[[ Line: 132 ]]
                        -- upvalues: l_Message_0 (ref)
                        l_Message_0:Destroy();
                        l_Message_0 = nil;
                    end);
                end);
                if #v7.Keys(v21) < 1 and #v7.Keys(v22) < 1 then
                    return;
                else
                    local v37 = v4.setAsync(l_HashMap_0, ("Day_%*"):format(v9), v24, v10):await();
                    warn("HashUpdate Status:", v37);
                    return;
                end;
            end);
            return "Success";
        end;
    end;
end;