local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_TweenService_0 = game:GetService("TweenService");
local l_UserInputService_0 = game:GetService("UserInputService");
local v3 = require(l_ReplicatedStorage_0.Packages.Knit);
local v4 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v5 = require(l_ReplicatedStorage_0.Packages.Signal);
local v6 = require(l_ReplicatedStorage_0.Packages.Promise);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v8 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local v9 = nil;
local v10 = nil;
return {
    primaryMenu = true, 
    ClosingMenu = v5.new(), 
    Init = function(v11, v12, v13) --[[ Line: 38 ]] --[[ Name: Init ]]
        -- upvalues: v9 (ref), v3 (copy), v10 (ref), v4 (copy)
        v9 = v3.GetController("UIController");
        v10 = v3.GetController("DeviceTypeController");
        v11.currentMode = v13;
        v11.ui = v12;
        v11.main = v12.Main;
        v11.hero = v11.main.Hero;
        v11.heroScale = v11.hero.UIScale;
        v11.hintLabel = v11.main.Hint;
        v11.heroScale.Scale = 0.5;
        v11.hero.GroupTransparency = 1;
        v11.hintLabel.Visible = false;
        v11.dumpster = v4.new();
    end, 
    Start = function(_) --[[ Line: 58 ]] --[[ Name: Start ]]

    end, 
    Opened = function(v15) --[[ Line: 62 ]] --[[ Name: Opened ]]
        -- upvalues: l_TweenService_0 (copy), l_UserInputService_0 (copy), v10 (ref)
        l_TweenService_0:Create(v15.heroScale, TweenInfo.new(0.5, Enum.EasingStyle.Back), {
            Scale = 1
        }):Play();
        l_TweenService_0:Create(v15.hero, TweenInfo.new(0.3), {
            GroupTransparency = 0
        }):Play();
        task.wait(2);
        v15.hintLabel.Visible = true;
        v15.dumpster:Add(l_UserInputService_0.InputBegan:Connect(function(v16) --[[ Line: 73 ]]
            -- upvalues: v15 (copy)
            if v16.UserInputType == Enum.UserInputType.MouseButton1 or v16.UserInputType == Enum.UserInputType.Touch then
                v15:Close();
            end;
        end));
        v15.dumpster:Add(v10.GamepadButtonPressed:Connect(function() --[[ Line: 80 ]]
            -- upvalues: v15 (copy)
            v15:Close();
        end));
    end, 
    Closing = function(v17) --[[ Line: 85 ]] --[[ Name: Closing ]]
        v17.dumpster:Destroy();
    end, 
    Close = function(v18) --[[ Line: 91 ]] --[[ Name: Close ]]
        -- upvalues: l_TweenService_0 (copy), v8 (copy), v6 (copy), v9 (ref)
        local v19 = {};
        local v20 = l_TweenService_0:Create(v18.heroScale, TweenInfo.new(0.5), {
            Scale = 0.5
        });
        table.insert(v19, v8:PromisifyTween(v20));
        local v21 = l_TweenService_0:Create(v18.hero, TweenInfo.new(0.5), {
            GroupTransparency = 1
        });
        table.insert(v19, v8:PromisifyTween(v21));
        v18.hintLabel.Visible = false;
        v18.ClosingMenu:Fire();
        v6.allSettled(v19):andThen(function() --[[ Line: 104 ]]
            -- upvalues: v9 (ref)
            v9:Toggle(script.Name, false);
        end);
    end
};