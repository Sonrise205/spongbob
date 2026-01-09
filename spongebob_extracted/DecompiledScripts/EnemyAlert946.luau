local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_TweenService_0 = game:GetService("TweenService");
local _ = game:GetService("UserInputService");
local v3 = require(l_ReplicatedStorage_0.Packages.Knit);
local v4 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local _ = require(l_ReplicatedStorage_0.Packages.TableUtil);
local v6 = require(l_ReplicatedStorage_0.Packages.Promise);
local v7 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local v8 = nil;
local v9 = nil;
local v10 = nil;
local v11 = nil;
return {
    primaryMenu = true, 
    blur = true, 
    ToggleAll = {}, 
    Init = function(v12, v13, v14) --[[ Line: 39 ]] --[[ Name: Init ]]
        -- upvalues: v8 (ref), v3 (copy), v9 (ref), v10 (ref), v11 (ref), l_TweenService_0 (copy), v4 (copy)
        v8 = v3.GetController("UIController");
        v9 = v3.GetService("GameService");
        v10 = v3.GetController("TowerController");
        v11 = v3.GetController("AudioController");
        v12.currentMode = v14;
        v12.ui = v13;
        v12.main = v13.Main;
        v12.content = v12.main.Content;
        v12.header = v12.content.Header;
        v12.innerHeader = v12.header.Inner;
        v12.topHeader = v12.innerHeader.Top;
        v12.bottomHeader = v12.innerHeader.Bottom;
        v12.enemyFrame = v12.content.Enemy;
        v12.enemyViewport = v12.enemyFrame.ViewportFrame;
        v12.content.Rotation = 0;
        v12.enemyFrame.Visible = false;
        v12.main.BackgroundTransparency = 1;
        v12.content.Size = UDim2.fromScale(0, 0.4);
        v12.innerHeader.Position = UDim2.fromScale(0, 1);
        v12.topHeader.Position = UDim2.fromScale(-0.075, 0.35);
        v12.bottomHeader.Position = UDim2.fromScale(0.075, 0.65);
        v12.enemyFrame.Position = UDim2.fromScale(1.3, 0.5);
        local v15 = {
            [true] = {
                [1] = TweenInfo.new(0.25, Enum.EasingStyle.Quart), 
                [2] = TweenInfo.new(0.8, Enum.EasingStyle.Exponential, Enum.EasingDirection.InOut), 
                [3] = TweenInfo.new(2, Enum.EasingStyle.Circular, Enum.EasingDirection.InOut)
            }, 
            [false] = {
                [1] = TweenInfo.new(0.25, Enum.EasingStyle.Quart, Enum.EasingDirection.In), 
                [2] = TweenInfo.new(0.8, Enum.EasingStyle.Exponential, Enum.EasingDirection.InOut), 
                [3] = TweenInfo.new(2, Enum.EasingStyle.Circular, Enum.EasingDirection.InOut)
            }
        };
        v12.tweens = {
            [true] = {
                {
                    l_TweenService_0:Create(v12.main, v15[true][1], {
                        BackgroundTransparency = 0.25
                    }), 
                    l_TweenService_0:Create(v12.content, v15[true][1], {
                        Size = UDim2.fromScale(1.1, 0.4)
                    })
                }, 
                {
                    l_TweenService_0:Create(v12.content, v15[true][2], {
                        Rotation = -5, 
                        Size = UDim2.fromScale(1.1, 0.5)
                    }), 
                    l_TweenService_0:Create(v12.enemyFrame, v15[true][2], {
                        Position = UDim2.fromScale(0.9, 0.5)
                    }), 
                    l_TweenService_0:Create(v12.innerHeader, v15[true][2], {
                        Position = UDim2.fromScale(0, 0)
                    }), 
                    l_TweenService_0:Create(v12.topHeader, v15[true][3], {
                        Position = UDim2.fromScale(0, 0.35)
                    }), 
                    l_TweenService_0:Create(v12.bottomHeader, v15[true][3], {
                        Position = UDim2.fromScale(0, 0.65)
                    })
                }
            }, 
            [false] = {
                {
                    l_TweenService_0:Create(v12.content, v15[false][2], {
                        Rotation = 0, 
                        Size = UDim2.fromScale(1.1, 0.4)
                    }), 
                    l_TweenService_0:Create(v12.enemyFrame, v15[false][2], {
                        Position = UDim2.fromScale(1.3, 0.5)
                    }), 
                    l_TweenService_0:Create(v12.innerHeader, v15[false][2], {
                        Position = UDim2.fromScale(0, 1)
                    }), 
                    l_TweenService_0:Create(v12.topHeader, v15[false][3], {
                        Position = UDim2.fromScale(-0.075, 0.35)
                    }), 
                    l_TweenService_0:Create(v12.bottomHeader, v15[false][3], {
                        Position = UDim2.fromScale(0.075, 0.65)
                    })
                }, 
                {
                    l_TweenService_0:Create(v12.main, v15[false][1], {
                        BackgroundTransparency = 1
                    }), 
                    l_TweenService_0:Create(v12.content, v15[false][1], {
                        Size = UDim2.fromScale(0, 0.4)
                    })
                }
            }
        };
        v12.dumpster = v4.new();
        v12.toggle = false;
    end, 
    Start = function(v16) --[[ Line: 115 ]] --[[ Name: Start ]]
        -- upvalues: v9 (ref)
        v9.EnemyAlert:Connect(function(v17) --[[ Line: 122 ]]
            -- upvalues: v16 (copy)
            v16:Toggle(true, v17);
        end);
    end, 
    Toggle = function(v18, v19, _) --[[ Line: 131 ]] --[[ Name: Toggle ]]
        -- upvalues: v8 (ref), v10 (ref), v11 (ref), v7 (copy), v6 (copy)
        if v19 == nil then
            v19 = not v18.toggle;
        end;
        v18.toggle = v19;
        v18.dumpster:Destroy();
        if v19 then
            v8:Toggle(script.Name, true);
            v8:Toggle("BossDialog", false);
            v10:StopTowerPlacement();
            v11:FadeMusicVolume(0.3, 0.5);
            v11:PlaySound({
                name = "Cutscenes.EnemyAlert", 
                soundGroup = "Master.SFX"
            });
            local v21 = v18.tweens[true];
            local v22 = v21[1];
            local v23 = {};
            for _, v25 in v22 do
                table.insert(v23, v7:PromisifyTween(v25));
            end;
            local v26 = v6.all(v23);
            v18.dumpster:Add(v26);
            if not v26:await() then
                return;
            else
                v18.enemyFrame.Visible = true;
                for _, v28 in v21[2] do
                    v28:Play();
                end;
                v18.dumpster:Add(v6.delay(2.25):andThen(function() --[[ Line: 174 ]]
                    -- upvalues: v18 (copy)
                    v18:Toggle(false);
                end));
                return;
            end;
        else
            v11:FadeMusicVolume(1, 1);
            local v29 = v18.tweens[false];
            for _, v31 in v29[1] do
                v31:Play();
            end;
            local v32 = v6.delay(0.6);
            v18.dumpster:Add(v32);
            if not v32:await() then
                return;
            else
                v18.enemyFrame.Visible = false;
                local v33 = v29[2];
                v32 = {};
                for _, v35 in v33 do
                    table.insert(v32, v7:PromisifyTween(v35));
                end;
                local v36 = v6.all(v32);
                v18.dumpster:Add(v36);
                v36:andThen(function() --[[ Line: 213 ]]
                    -- upvalues: v8 (ref)
                    v8:Toggle(script.Name, false);
                end);
                return;
            end;
        end;
    end
};