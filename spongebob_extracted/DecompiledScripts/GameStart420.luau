local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_TweenService_0 = game:GetService("TweenService");
local v2 = require(l_ReplicatedStorage_0.Packages.Knit);
local v3 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v4 = require(l_ReplicatedStorage_0.Packages.Promise);
local v5 = require(l_ReplicatedStorage_0.Shared.Modules.WWSDebug);
local v6 = require(l_ReplicatedStorage_0.Shared.Modules.ColorPalette);
local v7 = require(l_ReplicatedStorage_0.Shared.Data.Variables);
local v8 = require(l_ReplicatedStorage_0.Levels);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v10 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local v11 = nil;
local v12 = nil;
local v13 = nil;
return {
    primaryMenu = false, 
    toggle = false, 
    Init = function(v14, v15, v16) --[[ Line: 52 ]] --[[ Name: Init ]]
        -- upvalues: v11 (ref), v2 (copy), v12 (ref), l_TweenService_0 (copy), v3 (copy)
        v11 = v2.GetController("UIController");
        v12 = v2.GetService("GameService");
        v14.currentMode = v16;
        v14.ui = v15;
        v14.main = v15.Main;
        v14.sink = v14.main.Sink;
        v14.canvas = v14.main.Canvas;
        v14.glow = v15.Main.Glow;
        v14.mainListLayout = v14.canvas.UIListLayout;
        v14.line = v14.canvas.Line.Inner;
        v14.title = v14.canvas.Title;
        v14.titleContainer = v14.title.TitleContainer;
        v14.titleListLayout = v14.titleContainer.UIListLayout;
        v14.letterTemplate = v14.titleContainer.LetterTemplate:Clone();
        v14.difficulty = v14.canvas.Difficulty;
        v14.chapter = v14.canvas.Chapter;
        v14.conditionsCanvas = v14.main.Conditions;
        v14.conditionsBG = v14.conditionsCanvas.BG;
        v14.conditionsContainer = v14.conditionsCanvas.Inner;
        v14.conditionTemplate = v14.conditionsContainer.Template:Clone();
        v14.defaultDisplayOrder = v14.ui.DisplayOrder;
        v14.conditionsBG.BackgroundTransparency = 1;
        v14.titleContainer.LetterTemplate:Destroy();
        v14.conditionsContainer.Template:Destroy();
        v14.glow.ImageTransparency = 1;
        v14.main.BackgroundTransparency = 1;
        v14.canvas.GroupTransparency = 1;
        v14.mainListLayout.Padding = UDim.new(0, 0);
        v14.line.Size = UDim2.fromScale(0, 1);
        v14.conditionsContainer.Position = UDim2.fromScale(0.5, 1.5);
        v14.conditionsCanvas.GroupTransparency = 1;
        v14.conditionsCanvas.Visible = false;
        v14.conditionTweens = {
            [true] = {
                l_TweenService_0:Create(v14.conditionsCanvas, TweenInfo.new(1.5), {
                    GroupTransparency = 0
                }), 
                l_TweenService_0:Create(v14.conditionsContainer, TweenInfo.new(1.5), {
                    Position = UDim2.fromScale(0.5, 1)
                })
            }, 
            [false] = {
                l_TweenService_0:Create(v14.conditionsCanvas, TweenInfo.new(0.5), {
                    GroupTransparency = 1
                }), 
                l_TweenService_0:Create(v14.conditionsContainer, TweenInfo.new(0.5), {
                    Position = UDim2.fromScale(0.5, 1.5)
                })
            }
        };
        v14.conditionBGTweens = {
            [true] = l_TweenService_0:Create(v14.conditionsBG, TweenInfo.new(1.5), {
                BackgroundTransparency = 0.65
            }), 
            [false] = l_TweenService_0:Create(v14.conditionsBG, TweenInfo.new(0.5), {
                BackgroundTransparency = 1
            })
        };
        v14.tweens = {
            [true] = {
                l_TweenService_0:Create(v14.main, TweenInfo.new(1.5), {
                    BackgroundTransparency = 0.25
                }), 
                l_TweenService_0:Create(v14.canvas, TweenInfo.new(1.5), {
                    GroupTransparency = 0
                }), 
                l_TweenService_0:Create(v14.mainListLayout, TweenInfo.new(1.5), {
                    Padding = UDim.new(-0.019, 0)
                }), 
                l_TweenService_0:Create(v14.line, TweenInfo.new(1.5), {
                    Size = UDim2.fromScale(1, 1)
                }), 
                l_TweenService_0:Create(v14.glow, TweenInfo.new(2), {
                    ImageTransparency = 0.6
                })
            }, 
            [false] = {
                l_TweenService_0:Create(v14.main, TweenInfo.new(1.5), {
                    BackgroundTransparency = 1
                }), 
                l_TweenService_0:Create(v14.canvas, TweenInfo.new(1.5), {
                    GroupTransparency = 1
                }), 
                l_TweenService_0:Create(v14.mainListLayout, TweenInfo.new(1.5), {
                    Padding = UDim.new(0, 0)
                }), 
                l_TweenService_0:Create(v14.line, TweenInfo.new(1.5), {
                    Size = UDim2.fromScale(0, 1)
                }), 
                l_TweenService_0:Create(v14.glow, TweenInfo.new(2), {
                    ImageTransparency = 1
                })
            }
        };
        v14.dumpster = v3.new();
    end, 
    Start = function(v17) --[[ Line: 125 ]] --[[ Name: Start ]]
        -- upvalues: v13 (ref), v11 (ref), v12 (ref)
        v13 = v11:GetModuleAsync("HUD"):expect();
        v12.GameStart:Connect(function(v18) --[[ Line: 128 ]]
            -- upvalues: v17 (copy)
            v17:Toggle(true, v18);
        end);
    end, 
    Closed = function(v19) --[[ Line: 133 ]] --[[ Name: Closed ]]
        -- upvalues: v10 (copy)
        v19.dumpster:Destroy();
        v19.conditionsCanvas.Visible = false;
        v10:IterateClass(v19.conditionsContainer, "Frame", function(v20) --[[ Line: 138 ]]
            v20:Destroy();
        end);
    end, 
    Toggle = function(v21, v22, v23, v24) --[[ Line: 143 ]] --[[ Name: Toggle ]]
        -- upvalues: v13 (ref), v11 (ref), v7 (copy), v8 (copy), v6 (copy), v10 (copy), l_TweenService_0 (copy), v4 (copy), v5 (copy)
        if v22 == nil then
            v22 = not v21.toggle;
        end;
        v21.toggle = v22;
        v24 = v24 or {};
        v21.dumpster:Destroy();
        if v22 then
            v21.ui.DisplayOrder = v21.defaultDisplayOrder;
            v13:ToggleUnitsBar(false, 0.75);
            v11:Toggle(script.Name, true);
            v21.sink.Visible = true;
            local v25 = v23.Mode == "Endless";
            local v26 = v24.holdTime or 2;
            local v27 = if v25 then #v7.DIFFICULTY_NAMES else v23.Difficulty;
            local v28 = v7.DIFFICULTY_NAMES[v27];
            local l_Stage_0 = v23.Stage;
            local l_Act_0 = v23.Act;
            local l_v8_WorldDataByWorldOrder_0 = v8:GetWorldDataByWorldOrder(v23.Mode, l_Stage_0);
            local l_WorldName_0 = l_v8_WorldDataByWorldOrder_0.WorldName;
            local l_DisplayName_0 = l_v8_WorldDataByWorldOrder_0.DisplayName;
            local l_v8_ChapterData_0 = v8:GetChapterData(v23.Mode, l_WorldName_0, l_Act_0);
            v21.difficulty.Visible = not v25;
            v21.difficulty.Text = v23.Mode == "Event" and "Event" or v28;
            v21.difficulty.UIGradient.Color = v6.Gradient[v28] or v6.Gradient.Green;
            v21.chapter.Text = v25 and "Endless" or l_v8_ChapterData_0.DisplayName;
            local l_UIGradient_0 = v21.chapter:FindFirstChild("UIGradient");
            if v25 and not l_UIGradient_0 then
                v21.difficulty.UIGradient:Clone().Parent = v21.chapter;
            elseif not v25 and l_UIGradient_0 then
                l_UIGradient_0:Destroy();
            end;
            local v36 = table.clone(v21.tweens[true]);
            local l_Conditions_0 = v23.Conditions;
            if l_Conditions_0 then
                v21.conditionsCanvas.Visible = true;
                for _, v39 in v21.conditionTweens[true] do
                    table.insert(v36, v39);
                end;
                for _, v41 in l_Conditions_0 do
                    local v42 = nil;
                    local v43 = nil;
                    local v44 = nil;
                    if typeof(v41) == "table" then
                        v42 = v41.name;
                        if v41.tier then
                            v44 = v41.tier;
                            v43 = ("%*_%*"):format(v42, v44);
                        else
                            v43 = v42;
                        end;
                    else
                        v42 = v41;
                        v43 = v41;
                    end;
                    local l_v10_ConditionData_0, v46 = v10:GetConditionData(v42);
                    if l_v10_ConditionData_0 then
                        local v47 = v21.conditionTemplate:Clone();
                        v47.Name = v43;
                        v47.Icon.UIGradient.Color = l_v10_ConditionData_0.colors;
                        v47.Icon.Icon.Image = l_v10_ConditionData_0.icon;
                        v47.Visible = true;
                        local l_richDescription_0 = l_v10_ConditionData_0.richDescription;
                        if v46 and v46.tiers and v44 then
                            local v49 = v46.tiers[v44];
                            l_richDescription_0 = string.gsub(l_richDescription_0, "~modifier~", v49.modifier);
                        end;
                        v47.Description.Text = l_richDescription_0;
                        v47.Icon.Tier.Visible = v44 ~= nil;
                        if v44 then
                            v47.Icon.Tier.Text = v10:IntToRoman(v44);
                        end;
                        v47.Parent = v21.conditionsContainer;
                    end;
                end;
            end;
            for _, v51 in v21.titleContainer:GetChildren() do
                if v51:IsA("Frame") then
                    v51:Destroy();
                end;
            end;
            local v52 = {};
            for _, v54 in string.split(l_DisplayName_0, "") do
                local v55 = v21.letterTemplate:Clone();
                v55.Name = v54;
                v55.Label.Text = v54;
                v55.Visible = true;
                v55.Label.Position = UDim2.fromScale(0, -1);
                v55.Parent = v21.titleContainer;
                table.insert(v52, v55.Label);
            end;
            for _, v57 in v36 do
                v57:Play();
            end;
            local v58 = {};
            for v59, v60 in v52 do
                local v61 = l_TweenService_0:Create(v60, TweenInfo.new(1 * 1.025 ^ v59, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
                    Position = UDim2.fromScale(0, 0)
                });
                v61.Completed:Once(function() --[[ Line: 276 ]]
                    -- upvalues: v61 (copy)
                    v61:Destroy();
                end);
                v21:_addTweenToDumpster(v61, true);
                table.insert(v58, v61);
            end;
            local v64 = v4.each(v58, function(v62, v63) --[[ Line: 285 ]]
                -- upvalues: v4 (ref)
                if v63 == 1 then
                    return v62:Play();
                else
                    return v4.delay(0.03333333333333333):andThen(function() --[[ Line: 289 ]]
                        -- upvalues: v62 (copy)
                        return v62:Play();
                    end);
                end;
            end);
            v21.dumpster:Add(v64);
            v21.dumpster:Add(task.delay(0.5, function() --[[ Line: 297 ]]
                -- upvalues: v21 (copy)
                v21.sink.Activated:Connect(function() --[[ Line: 298 ]]
                    -- upvalues: v21 (ref)
                    v21:Toggle(false);
                end);
            end));
            v64:andThen(function() --[[ Line: 303 ]]
                -- upvalues: v21 (copy), v4 (ref), v26 (copy)
                v21.dumpster:Add(v4.delay(v26):andThen(function() --[[ Line: 304 ]]
                    -- upvalues: v21 (ref)
                    v21:Toggle(false);
                end));
            end, v5.EmptyPromiseCatch);
            return;
        else
            v21.sink.Visible = false;
            local v65 = {};
            if v21.conditionsCanvas.Visible then
                v21.conditionBGTweens[true]:Play();
                table.insert(v65, v4.new(function(v66) --[[ Line: 320 ]]
                    -- upvalues: v10 (ref), v21 (copy), v13 (ref), v4 (ref), v5 (ref)
                    task.wait(2);
                    local v67 = {
                        v10:PromisifyTween(v21.conditionBGTweens[false])
                    };
                    for _, v69 in v21.conditionTweens[false] do
                        table.insert(v67, v10:PromisifyTween(v69));
                    end;
                    v21.ui.DisplayOrder = -1;
                    v13:ToggleUnitsBar(true, 1);
                    v4.all(v67):andThen(v66):catch(v5.EmptyPromiseCatch);
                end));
            else
                v13:ToggleUnitsBar(true, 1);
            end;
            for _, v71 in v21.tweens[false] do
                table.insert(v65, v10:PromisifyTween(v71));
            end;
            local v72 = {};
            for _, v74 in v21.titleContainer:GetChildren() do
                if v74:IsA("Frame") then
                    table.insert(v72, v74.Label);
                end;
            end;
            for v75 = #v72, 1, -1 do
                local v76 = v72[v75];
                local v77 = l_TweenService_0:Create(v76, TweenInfo.new(1 * 1.025 ^ v75, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
                    Position = UDim2.fromScale(0, -1)
                });
                v77.Completed:Once(function() --[[ Line: 365 ]]
                    -- upvalues: v77 (copy)
                    v77:Destroy();
                end);
                v21:_addTweenToDumpster(v77, true);
                table.insert(v65, v10:PromisifyTween(v77));
            end;
            v4.all(v65):andThen(function() --[[ Line: 373 ]]
                -- upvalues: v11 (ref)
                v11:Toggle(script.Name, false);
            end, v5.EmptyPromiseCatch);
            return;
        end;
    end, 
    _addTweenToDumpster = function(v78, v79, v80) --[[ Line: 382 ]] --[[ Name: _addTweenToDumpster ]]
        v78.dumpster:Add(function() --[[ Line: 383 ]]
            -- upvalues: v79 (copy), v80 (copy)
            v79:Cancel();
            if v80 then
                v79:Destroy();
            end;
        end);
    end
};