local l_GuiService_0 = game:GetService("GuiService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_TweenService_0 = game:GetService("TweenService");
local v3 = require(l_ReplicatedStorage_0.Packages.Knit);
local v4 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v5 = require(l_ReplicatedStorage_0.Packages.TableUtil);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v7 = require(l_ReplicatedStorage_0.Shared.Data.Variables);
local v8 = require(l_ReplicatedStorage_0.Shared.Modules.ColorPalette);
local v9 = require(l_ReplicatedStorage_0.Levels);
local v10 = require(l_ReplicatedStorage_0.Shared.Modules.UnitViewport);
local v11 = require(v3.Player.PlayerScripts.Knit.Modules.RewardVisuals);
local v12 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local v13 = require(l_ReplicatedStorage_0.Shared.Modules.Timer);
local v14 = require(l_ReplicatedStorage_0.Shared.Data.UnitShared);
local v15 = require(l_ReplicatedStorage_0.Shared.Modules.ColorPalette);
local v16 = require(l_ReplicatedStorage_0.Shared.Data.UnitImages);
local v17 = require(v3.Player.PlayerScripts.Knit.Modules.UIClasses.GenericTooltip);
local v18 = nil;
local v19 = nil;
local v20 = nil;
local v21 = nil;
return {
    primaryMenu = false, 
    Init = function(_, _, _) --[[ Line: 46 ]] --[[ Name: Init ]]
        -- upvalues: v18 (ref), v3 (copy), v19 (ref), v20 (ref), v11 (copy), v12 (copy), v15 (copy), v16 (copy), l_TweenService_0 (copy), v4 (copy)
    end, 
    Start = function(_) --[[ Line: 121 ]] --[[ Name: Start ]]
        -- upvalues: v21 (ref), v18 (ref), v12 (copy), v17 (copy), v19 (ref), v7 (copy), v9 (copy), v8 (copy), v5 (copy), v13 (copy), v14 (copy), v16 (copy), v15 (copy), v10 (copy)
    end, 
    Opened = function(v26) --[[ Line: 324 ]] --[[ Name: Opened ]]
        -- upvalues: v18 (ref), v4 (copy), v20 (ref), v13 (copy), v21 (ref)
        v18:Toggle("UnitsManager", false);
        v26._inputDump = v4.new();
        local v27 = v20:ObserveGamepadButtonPress(Enum.KeyCode.ButtonB, function() --[[ Line: 329 ]]
            -- upvalues: v18 (ref)
            v18:Toggle(script.Name, false);
        end);
        v26._inputDump:Add(function() --[[ Line: 333 ]]
            -- upvalues: v27 (ref), v26 (copy)
            v27();
            v27 = nil;
            v26._inputDump = nil;
        end);
        v26.hintDump = v4.new();
        v26.hintDump:Add(function() --[[ Line: 341 ]]
            -- upvalues: v26 (copy)
            v26.exitPulse:Cancel();
            v26.exitBtn.BackgroundColor3 = v26.originalButtonColor;
            v26.hintDump = nil;
        end);
        v26.hintDump:Add(task.delay(10, function() --[[ Line: 347 ]]
            -- upvalues: v26 (copy), v13 (ref)
            v26.hintDump:Add(v13.Simple(8, function() --[[ Line: 348 ]]
                -- upvalues: v26 (ref)
                v26.exitPulse:Play();
            end), true);
        end));
        v21:ToggleGameInfoBar(false);
    end, 
    Closed = function(v28) --[[ Line: 356 ]] --[[ Name: Closed ]]
        -- upvalues: l_GuiService_0 (copy), v21 (ref)
        l_GuiService_0.SelectedObject = nil;
        if v28._inputDump then
            v28._inputDump:Destroy();
        end;
        if v28.hintDump then
            v28.hintDump:Destroy();
        end;
        v21:ToggleGameInfoBar(true);
    end
};