local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_TweenService_0 = game:GetService("TweenService");
local v2 = require(l_ReplicatedStorage_0.Packages.Knit);
local _ = require(l_ReplicatedStorage_0.Packages.Dumpster);
local _ = require(l_ReplicatedStorage_0.Packages.TableUtil);
local v5 = nil;
return {
    primaryMenu = false, 
    Init = function(v6, v7, v8) --[[ Line: 30 ]] --[[ Name: Init ]]
        -- upvalues: v5 (ref), v2 (copy), l_TweenService_0 (copy)
        v5 = v2.GetController("UIController");
        v6.currentMode = v8;
        v6.ui = v7;
        v6.dialogFrame = v7.Dialog;
        v6.dialogMain = v6.dialogFrame.Main;
        v6.dialogLabel = v6.dialogMain.DialogBox;
        v6.speakerNameLabel = v6.dialogMain.Speaker;
        v6.topBar = v7.TopBar;
        v6.bottomBar = v7.BottomBar;
        local v9 = TweenInfo.new(1.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut);
        v6.barTweens = {
            [true] = {
                l_TweenService_0:Create(v6.topBar, v9, {
                    AnchorPoint = Vector2.new(0.5, 0)
                }), 
                l_TweenService_0:Create(v6.bottomBar, v9, {
                    AnchorPoint = Vector2.new(0.5, 1)
                })
            }, 
            [false] = {
                l_TweenService_0:Create(v6.topBar, v9, {
                    AnchorPoint = Vector2.new(0.5, 1)
                }), 
                l_TweenService_0:Create(v6.bottomBar, v9, {
                    AnchorPoint = Vector2.new(0.5, 0)
                })
            }
        };
        v6.topBar.AnchorPoint = Vector2.new(0.5, 1);
        v6.bottomBar.AnchorPoint = Vector2.new(0.5, 0);
        v6.dialogFrame.Visible = false;
    end, 
    ToggleBars = function(v10, v11) --[[ Line: 65 ]] --[[ Name: ToggleBars ]]
        for _, v13 in v10.barTweens[v11] do
            v13:Play();
        end;
    end, 
    ShowDialog = function(v14, v15, v16) --[[ Line: 73 ]] --[[ Name: ShowDialog ]]
        v14.speakerNameLabel.Text = v15;
        v14.dialogLabel.Text = v16;
        v14.dialogFrame.Visible = true;
    end, 
    HideDialog = function(v17) --[[ Line: 79 ]] --[[ Name: HideDialog ]]
        v17.dialogFrame.Visible = false;
    end
};