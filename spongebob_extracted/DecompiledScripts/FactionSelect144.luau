local l_Lighting_0 = game:GetService("Lighting");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("RunService");
local l_TweenService_0 = game:GetService("TweenService");
local _ = game:GetService("UserInputService");
local v5 = require(l_ReplicatedStorage_0.Packages.Knit);
local _ = require(l_ReplicatedStorage_0.Packages.Dumpster);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v8 = require(l_ReplicatedStorage_0.Shared.Data.Variables);
local v9 = nil;
local v10 = nil;
local v11 = nil;
local l_ColorCorrection_0 = l_Lighting_0.ColorCorrection;
local v13 = TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut);
return {
    primaryMenu = true, 
    ToggleAll = {}, 
    Init = function(v14, v15) --[[ Line: 38 ]] --[[ Name: Init ]]
        -- upvalues: v9 (ref), v5 (copy), v10 (ref), v11 (ref), l_ColorCorrection_0 (copy), l_TweenService_0 (copy), v13 (copy)
        v9 = v5.GetController("DataController");
        v10 = v5.GetController("UIController");
        v11 = v5.GetService("FactionService");
        v14.ui = v15;
        v14.main = v15.Main;
        v14.detailsPages = {
            [1] = v14.ui.Details_GoofyGoobers, 
            [2] = v14.ui.Details_Jellyspotters, 
            [3] = v14.ui.Details_BandGeeks
        };
        v14.defaultColorCorrection = l_ColorCorrection_0.TintColor;
        v14.defaultTween = l_TweenService_0:Create(l_ColorCorrection_0, v13, {
            TintColor = v14.defaultColorCorrection
        });
    end, 
    Start = function(v16, _) --[[ Line: 59 ]] --[[ Name: Start ]]
        -- upvalues: v10 (ref), v8 (copy), l_TweenService_0 (copy), l_ColorCorrection_0 (copy), v13 (copy), v11 (ref)
        local v18 = v10:GetModuleAsync("MessagePrompt"):expect();
        local l_FACTION_COLORS_0 = v8.FACTIONS.FACTION_COLORS;
        v16.colorTweens = {};
        for _, v21 in v16.main:GetChildren() do
            if v21:IsA("GuiButton") then
                local v22 = tonumber(v21.Name);
                local v23 = v22 and v8.FACTIONS.FACTION_NAMES[v22];
                local v24 = l_TweenService_0:Create(l_ColorCorrection_0, v13, {
                    TintColor = l_FACTION_COLORS_0[v22]
                });
                table.insert(v16.colorTweens, v24);
                if v22 and v23 then
                    v10:HandleButton(v21, function() --[[ Line: 84 ]]
                        -- upvalues: v16 (copy), v22 (copy)
                        v16.main.Visible = false;
                        for _, v26 in v16.detailsPages do
                            v26.Visible = false;
                        end;
                        v16.detailsPages[v22].Visible = true;
                        v16.defaultTween:Play();
                    end, {
                        MouseEnter = function() --[[ Line: 94 ]] --[[ Name: MouseEnter ]]
                            -- upvalues: v16 (copy), v24 (copy)
                            v16.lastEnter = os.clock();
                            v16.defaultTween:Cancel();
                            v24:Play();
                        end, 
                        MouseLeave = function() --[[ Line: 100 ]] --[[ Name: MouseLeave ]]
                            -- upvalues: v16 (copy)
                            if os.clock() - (v16.lastEnter or 0) < 0.1 then
                                return;
                            else
                                v16.defaultTween:Play();
                                return;
                            end;
                        end
                    });
                end;
            end;
        end;
        for v27, v28 in v16.detailsPages do
            local v29 = v27 and v8.FACTIONS.FACTION_NAMES[v27];
            v28.Visible = false;
            local l_Buttons_0 = v28.Content.Frame.Buttons;
            v10:HandleButton(l_Buttons_0.Confirm, function() --[[ Line: 117 ]]
                -- upvalues: v18 (copy), v29 (copy), v11 (ref), v27 (copy), v10 (ref)
                v18:Prompt({
                    message = ("Are you sure you want to join the %* faction? Changing factions later on will cost you robux."):format(v29), 
                    options = {
                        {
                            text = "Yes", 
                            callback = function() --[[ Line: 123 ]] --[[ Name: callback ]]
                                -- upvalues: v11 (ref), v27 (ref), v10 (ref)
                                v11:JoinFaction(v27);
                                v10:Toggle(script.Name, false);
                            end
                        }, 
                        {
                            text = "No"
                        }
                    }
                });
            end);
            v10:HandleButton(l_Buttons_0.Decline, function() --[[ Line: 136 ]]
                -- upvalues: v28 (copy), v16 (copy)
                v28.Visible = false;
                v16.main.Visible = true;
            end);
        end;
        v16.main.Visible = true;
        v11.PromptChangeFaction:Connect(function() --[[ Line: 150 ]]
            -- upvalues: v10 (ref)
            v10:Toggle(script.Name, true);
        end);
    end, 
    Closed = function(v31) --[[ Line: 155 ]] --[[ Name: Closed ]]
        -- upvalues: l_ColorCorrection_0 (copy)
        task.defer(function() --[[ Line: 156 ]]
            -- upvalues: v31 (copy), l_ColorCorrection_0 (ref)
            for _, v33 in v31.colorTweens do
                v33:Cancel();
            end;
            l_ColorCorrection_0.TintColor = v31.defaultColorCorrection;
        end);
        for _, v35 in v31.detailsPages do
            v35.Visible = false;
        end;
        v31.main.Visible = true;
    end
};