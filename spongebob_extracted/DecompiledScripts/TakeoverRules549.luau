local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.Knit);
local v2 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local _ = require(l_ReplicatedStorage_0.Packages.TableUtil);
local v4 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local v5 = nil;
local v6 = nil;
local v7 = nil;
local v8 = TweenInfo.new(0.5, Enum.EasingStyle.Sine);
return {
    primaryMenu = false, 
    ToggleProperties = {
        Main = {
            Close = {
                Position = UDim2.fromScale(1.05, 0.5), 
                AnchorPoint = Vector2.new(0, 0.5), 
                ToggleTweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.In)
            }
        }
    }, 
    Init = function(v9, v10, v11) --[[ Line: 40 ]] --[[ Name: Init ]]
        -- upvalues: v5 (ref), v1 (copy), v6 (ref), v7 (ref), v2 (copy)
        v5 = v1.GetController("UIController");
        v6 = v1.GetService("RobloxEventService");
        v7 = v1.GetController("DeviceTypeController");
        v9.currentMode = v11;
        v9.ui = v10;
        v9.main = v10.Main;
        v9.dumpster = v2.new();
    end, 
    Start = function(_) --[[ Line: 53 ]] --[[ Name: Start ]]
        -- upvalues: v6 (ref), v5 (ref)
        v6.ToggleRules:Connect(function(v13) --[[ Line: 54 ]]
            -- upvalues: v5 (ref)
            v5:Toggle(script.Name, v13);
        end);
    end, 
    Opening = function(v14) --[[ Line: 59 ]] --[[ Name: Opening ]]
        -- upvalues: v7 (ref), v4 (copy), v8 (copy)
        local v15 = if v7:IsSmallScreen() then UDim2.fromScale(1.03, 0.5) else UDim2.fromScale(1, 0.5);
        v14.dumpster:Add(v4:Tween(v14.main, v8, {
            Position = v15, 
            AnchorPoint = Vector2.new(1, 0.5)
        }));
    end, 
    Closing = function(v16) --[[ Line: 74 ]] --[[ Name: Closing ]]
        v16.dumpster:Destroy();
    end, 
    Closed = function(_) --[[ Line: 78 ]] --[[ Name: Closed ]]

    end
};