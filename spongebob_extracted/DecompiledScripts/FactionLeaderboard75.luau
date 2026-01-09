local l_HttpService_0 = game:GetService("HttpService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v2 = require(l_ReplicatedStorage_0.Packages.Knit);
local v3 = require(l_ReplicatedStorage_0.Packages.Component);
local v4 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local _ = require(l_ReplicatedStorage_0.Shared.Data.Variables);
local v7 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local v8 = require(l_ReplicatedStorage_0.Shared.Modules.Timer);
local v9 = v2.GetService("FactionService");
local v10 = v2.GetService("SeasonPassService");
local v11 = v2.GetController("DataController");
local v12 = v3.new({
    Tag = script.Name, 
    Ancestors = {
        workspace
    }
});
v12.Construct = function(v13) --[[ Line: 36 ]] --[[ Name: Construct ]]
    -- upvalues: v4 (copy), v10 (copy), v11 (copy), v2 (copy)
    v13.dump = v4.new();
    v13.ui = v13.Instance.SurfaceGui;
    v13.factionFrames = {};
    v13.currentSeason = v10.Season:OnReady():expect();
    for _, v15 in v13.ui.Leaderboard:GetChildren() do
        if v15:IsA("Frame") and tonumber(v15.Name) then
            v13.factionFrames[tonumber(v15.Name)] = v15;
        end;
    end;
    v13.dump:Add(v11:OnChanged(v2.Player, "Faction", function(v16) --[[ Line: 52 ]]
        -- upvalues: v13 (copy)
        local v17 = true;
        if v13.currentSeason == v16.Season then
            v17 = true;
        end;
        if v16.Id == 0 then
            v17 = false;
        end;
        for _, v19 in v13.factionFrames do
            v19.Visible = v17;
        end;
        v13.ui.Leaderboard.Preview.Visible = not v17;
    end, true));
    v13.dump:Add(function() --[[ Line: 71 ]]
        -- upvalues: v13 (copy)
        v13.dump = nil;
    end);
end;
v12.Start = function(v20) --[[ Line: 76 ]] --[[ Name: Start ]]
    -- upvalues: v9 (copy), v7 (copy), l_HttpService_0 (copy), v8 (copy), v10 (copy)
    v20.dump:Add(v9.FactionsProgress:Observe(function(v21) --[[ Line: 77 ]]
        -- upvalues: v20 (copy), v7 (ref)
        if not v21 then
            return;
        else
            local v22 = {};
            for v23, v24 in v21 do
                table.insert(v22, {
                    FactionId = v23, 
                    Points = v24.Points or 0
                });
            end;
            table.sort(v22, function(v25, v26) --[[ Line: 91 ]]
                return v25.Points > v26.Points;
            end);
            for v27, v28 in v22 do
                local v29 = v20.factionFrames[v28.FactionId];
                if v29 then
                    v29.Placement.Text = "#" .. v27;
                    v29.Amount.Value.Text = v7:CommaNumber(v28.Points);
                    v29.LayoutOrder = v27;
                end;
            end;
            return;
        end;
    end));
    v20.dump:Add(v9.NextFactionUpdate:Observe(function(v30) --[[ Line: 109 ]]
        -- upvalues: l_HttpService_0 (ref), v20 (copy), v8 (ref), v7 (ref)
        local v31 = math.clamp(v30 - workspace:GetServerTimeNow(), 0, 1e999);
        local v32 = l_HttpService_0:GenerateGUID(false);
        v20.dump:Add(v8.Simple(1, function() --[[ Line: 115 ]]
            -- upvalues: v31 (ref), v20 (ref), v32 (copy), v7 (ref)
            v31 = v31 - 1;
            if v31 < 1 then
                v20.dump:Remove(v32);
                v20.ui.Header.Title.Timer.Text = "Updating...";
                return;
            else
                v20.ui.Header.Title.Timer.Text = v7:SecondsToClock(v31, true);
                return;
            end;
        end), v32);
    end));
    local v33 = math.clamp((v10.SeasonEnd:OnReady():expect() or 0) - DateTime.now().UnixTimestamp, 0, 1e999);
    v20.dump:Add(v8.Simple(1, function() --[[ Line: 133 ]]
        -- upvalues: v33 (ref), v20 (copy), v7 (ref)
        v33 = v33 - 1;
        v20.ui.SeasonEnd.Title.Text = ("SEASON ENDS IN: %*"):format((v7:FormatTimeFromSeconds(v33)));
        if v33 < 1 then
            v20.dump:Remove("SeasonCountdown");
            return;
        else
            return;
        end;
    end), "SeasonCountdown");
end;
v12.Stop = function(v34) --[[ Line: 144 ]] --[[ Name: Stop ]]
    if v34.dump then
        v34.dump:Destroy();
    end;
end;
return v12;