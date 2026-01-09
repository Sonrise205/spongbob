local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_TweenService_0 = game:GetService("TweenService");
local v2 = require(l_ReplicatedStorage_0.Packages.Knit);
local v3 = require(l_ReplicatedStorage_0.Packages.Component);
local v4 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local _ = require(l_ReplicatedStorage_0.Shared.Modules.WWSDebug);
local v7 = TweenInfo.new(5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, -1, true);
local v9 = v3.new({
    Tag = script.Name, 
    Ancestors = {
        workspace, 
        v2.PlayerGui
    }, 
    Extensions = {
        {
            ShouldConstruct = function(v8) --[[ Line: 30 ]] --[[ Name: ShouldConstruct ]]
                return v8.Instance:IsA("ScrollingFrame");
            end
        }
    }
});
v9.Construct = function(_) --[[ Line: 39 ]] --[[ Name: Construct ]]

end;
v9.Start = function(v11) --[[ Line: 43 ]] --[[ Name: Start ]]
    -- upvalues: v4 (copy), l_TweenService_0 (copy), v7 (copy)
    local l_Instance_0 = v11.Instance;
    v11.dump = v4.new();
    local function v17() --[[ Line: 48 ]] --[[ Name: createTweens ]]
        -- upvalues: l_Instance_0 (copy), v11 (copy), l_TweenService_0 (ref), v7 (ref)
        local v13 = l_Instance_0:GetAttribute("ScrollDirection") or "X";
        local l_AbsoluteCanvasSize_0 = l_Instance_0.AbsoluteCanvasSize;
        local l_AbsoluteWindowSize_0 = l_Instance_0.AbsoluteWindowSize;
        l_Instance_0.CanvasPosition = Vector2.new(0, 0);
        local v16 = if v13 == "X" then Vector2.new(l_AbsoluteCanvasSize_0.X - l_AbsoluteWindowSize_0.X, 0) else Vector2.new(0, l_AbsoluteCanvasSize_0.Y - l_AbsoluteWindowSize_0.Y);
        v11.tween = l_TweenService_0:Create(v11.Instance, v7, {
            CanvasPosition = v16
        });
        v11.tween:Play();
        v11.dump:Add(v11.tween);
    end;
    v17();
    v11.dump:Add(l_Instance_0:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(v17));
    v11.dump:Add(l_Instance_0:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(v17));
end;
v9.Stop = function(v18) --[[ Line: 78 ]] --[[ Name: Stop ]]
    v18.dump:Destroy();
    v18.tween:Destroy();
    v18.tween = nil;
end;
return v9;