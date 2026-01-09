local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_TweenService_0 = game:GetService("TweenService");
local _ = game:GetService("UserInputService");
local v3 = require(l_ReplicatedStorage_0.Packages.Knit);
local v4 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v6 = require(l_ReplicatedStorage_0.Shared.Util.GetButtons);
local v7 = require(l_ReplicatedStorage_0.Shared.Modules.Tweener);
local v8 = require(l_ReplicatedStorage_0.Shared.Modules.UnitViewport);
local v9 = require(l_ReplicatedStorage_0.Shared.Data.UnitShared);
local v10 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local v11 = require(l_ReplicatedStorage_0.Shared.Modules.Timer);
local v12 = nil;
local v13 = nil;
local v14 = nil;
return {
    primaryMenu = true, 
    ToggleAll = {}, 
    selectedOption = nil, 
    _optionButtons = {}, 
    Init = function(v15, v16) --[[ Line: 43 ]] --[[ Name: Init ]]
        -- upvalues: v12 (ref), v3 (copy), v13 (ref), v14 (ref), l_TweenService_0 (copy)
        v12 = v3.GetController("DataController");
        v13 = v3.GetController("UIController");
        v14 = v3.GetService("BarnacleService");
        v15.ui = v16;
        v15.main = v16.Main;
        v15.buttons = v15.main.Buttons;
        v15.prompt = v15.main.Prompt;
        v15.continueBtn = v15.prompt.Continue;
        v15.unitIconArea = v15.prompt.Icon;
        v15.dialogLabel = v15.continueBtn.Dialogue;
        v15.speakerLabel = v15.continueBtn.Speaker.Inner.TextLabel;
        v15.continueBtn.Active = true;
        v15.buttonsInTween = l_TweenService_0:Create(v15.buttons, TweenInfo.new(0.34, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
            Size = v15.buttons.Size
        });
    end, 
    Start = function(v17, _) --[[ Line: 64 ]] --[[ Name: Start ]]
        -- upvalues: v6 (copy), v13 (ref), v14 (ref)
        v6(v17.buttons, nil, function(v19) --[[ Line: 65 ]]
            -- upvalues: v13 (ref), v17 (copy)
            local v20 = tonumber(string.match(v19.Name, "%d+"));
            if not v20 then
                return;
            else
                v13:HandleButton(v19, function() --[[ Line: 72 ]]
                    -- upvalues: v17 (ref), v20 (copy), v13 (ref)
                    v17:ProcessOptionClick(v20);
                    v13:Toggle(script.Name, false);
                end);
                v17._optionButtons[v20] = v19;
                return;
            end;
        end);
        v14.Dialog:Connect(function(v21, v22) --[[ Line: 80 ]]
            -- upvalues: v17 (copy)
            v17:Prompt(v21, v22);
        end);
    end, 
    Closed = function(v23) --[[ Line: 85 ]] --[[ Name: Closed ]]
        if v23.promptDump then
            v23.promptDump:Destroy();
        end;
    end, 
    ProcessOptionClick = function(v24, v25) --[[ Line: 91 ]] --[[ Name: ProcessOptionClick ]]
        local v26 = v24.promptProps.Options[v25];
        if not v26 then
            return;
        else
            if v26 and v26.Callback then
                task.spawn(v26.Callback);
            end;
            return;
        end;
    end, 
    Prompt = function(v27, v28, v29) --[[ Line: 103 ]] --[[ Name: Prompt ]]
        -- upvalues: v4 (copy), v9 (copy), v10 (copy), v11 (copy), v8 (copy), v13 (ref), v7 (copy)
        if v27.promptDump then
            v27.promptDump:Destroy();
        end;
        v27.promptDump = v4.new();
        v27.promptProps = v29;
        v27.buttons.Visible = false;
        v27.buttons.Size = UDim2.fromScale(1, 0);
        local v30 = utf8.len(v29.dialog or v29.Dialog);
        v27.speakerLabel.Text = v9:GetUnitValue(v28, "FullName");
        v27.dialogLabel.Text = v29.dialog or v29.Dialog;
        v27.dialogLabel.MaxVisibleGraphemes = 0;
        local v31 = v29.dialog or v29.Dialog;
        local v32 = string.match(v31, "<timer duration=\"(%d+)\">");
        if v32 then
            v32 = tonumber(v32);
            local v33 = v10:SecondsToClock(v32);
            v27.dialogLabel.Text = string.gsub(v31, "<timer duration=\"%d+\">", v33);
            v27.promptDump:Add(v11.Simple(1, function() --[[ Line: 129 ]]
                -- upvalues: v32 (ref), v10 (ref), v27 (copy), v31 (copy)
                v32 = v32 - 1;
                local v34 = v10:SecondsToClock(v32);
                v27.dialogLabel.Text = string.gsub(v31, "<timer duration=\"%d+\">", v34);
            end));
        else
            v27.dialogLabel.Text = v31;
        end;
        v29.Options = v29.Options or {
            {
                Text = "Continue"
            }
        };
        for v35 = 1, #v27._optionButtons do
            local v36 = v27._optionButtons[v35];
            local v37 = v29.Options and v29.Options[v35];
            v36.Visible = v37 ~= nil;
            if v37 then
                v36.Content.Title.Text = v37.Text;
            end;
        end;
        v27.promptDump:Construct(v8, v27.unitIconArea, v28, {
            Size = UDim2.fromScale(1, 1), 
            Position = UDim2.fromScale(0.5, 1), 
            Animation = v29.Animation, 
            positionAttribute = "DialogOffset"
        });
        v13:Toggle(script.Name, true);
        local v39 = v7("IntValue", 0, TweenInfo.new(v30 * 0.05, Enum.EasingStyle.Linear), {
            Value = utf8.len(v27.dialogLabel.Text)
        }, function(v38) --[[ Line: 161 ]]
            -- upvalues: v27 (copy)
            v27.dialogLabel.MaxVisibleGraphemes = v38;
        end);
        v39:Add(function() --[[ Line: 165 ]]
            -- upvalues: v27 (copy)
            v27.dialogLabel.MaxVisibleGraphemes = -1;
            v27.buttonsInTween:Play();
            v27.buttons.Visible = true;
        end);
        v27.promptDump:Add(v27.continueBtn.Activated:Once(function() --[[ Line: 172 ]]
            -- upvalues: v39 (copy)
            if v39 then
                v39:Destroy();
            end;
        end));
        v27.promptDump:Add(v39);
        v27.promptDump:Add(function() --[[ Line: 181 ]]
            -- upvalues: v27 (copy), v29 (copy)
            v27.promptProps = v29;
            v27.promptDump = nil;
        end);
    end
};