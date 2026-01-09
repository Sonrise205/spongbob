local l_GuiService_0 = game:GetService("GuiService");
local l_Players_0 = game:GetService("Players");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v3 = require(l_ReplicatedStorage_0.Packages.Knit);
local v4 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local _ = require(l_ReplicatedStorage_0.Packages.TableUtil);
local v6 = require(l_ReplicatedStorage_0.Shared.Modules.Timer);
local v7 = require(l_ReplicatedStorage_0.Shared.Data.Variables);
local v8 = nil;
local v9 = nil;
local v10 = nil;
return {
    primaryMenu = false, 
    Init = function(v11, v12, v13) --[[ Line: 36 ]] --[[ Name: Init ]]
        -- upvalues: v8 (ref), v3 (copy), v9 (ref), v10 (ref), v4 (copy)
        v8 = v3.GetController("UIController");
        v9 = v3.GetService("GameService");
        v10 = v3.GetController("DeviceTypeController");
        v11.currentMode = v13;
        v11.ui = v12;
        v11.main = v12.Main;
        v11.button = v11.main.Inner.Button;
        v11.buttonContent = v11.button.Content;
        v11.dumpster = v4.new();
    end, 
    Start = function(v14) --[[ Line: 51 ]] --[[ Name: Start ]]
        -- upvalues: v9 (ref), l_Players_0 (copy), v8 (ref)
        v9.SkipCutsceneVoteCount:Observe(function(v15) --[[ Line: 52 ]]
            -- upvalues: v14 (copy), l_Players_0 (ref)
            v15 = v15 or 0;
            v14.button.Content.Title.Text = ("Skip Cutscene (%*/%*)"):format(v15, #l_Players_0:GetPlayers());
        end);
        v8:HandleButton(v14.button, function() --[[ Line: 57 ]]
            -- upvalues: v9 (ref)
            v9:VoteSkipCutscene();
        end);
    end, 
    Open = function(v16, v17, v18) --[[ Line: 64 ]] --[[ Name: Open ]]
        -- upvalues: v8 (ref), v10 (ref), l_GuiService_0 (copy), v7 (copy), v6 (copy)
        v8:Toggle(script.Name, true);
        v16.buttonContent.Countdown.Visible = true;
        if v10:IsConsole() then
            l_GuiService_0.SelectedObject = v16.button;
        end;
        local v19 = workspace:GetServerTimeNow() - v18;
        local v20 = math.round(v7.CUTSCENES.DURATIONS[v17] - v19);
        v16.buttonContent.Countdown.Text = ("%*s"):format(v20);
        v16.dumpster:Add(v6.Simple(1, function() --[[ Line: 78 ]]
            -- upvalues: v20 (ref), v16 (copy)
            v20 = v20 - 1;
            v16.buttonContent.Countdown.Text = ("%*s"):format(v20);
            if v20 < 1 then
                v16.dumpster:Destroy();
            end;
        end));
    end
};