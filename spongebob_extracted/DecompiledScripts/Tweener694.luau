local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("RunService");
local l_TweenService_0 = game:GetService("TweenService");
local v3 = 0;
local v4 = Enum.RenderPriority.Camera.Value - 1;
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v6 = require(l_ReplicatedStorage_0.Packages.Dumpster);
return function(v7, v8, v9, v10, v11, v12) --[[ Line: 13 ]]
    -- upvalues: v3 (ref), v4 (copy), v6 (copy), l_TweenService_0 (copy)
    v3 = v3 + 1;
    v12 = v12 or v4;
    local v13 = v6.new();
    local v14 = v13:Construct(v7);
    v14.Value = v8;
    local v15 = l_TweenService_0:Create(v14, v9, v10);
    v15.Completed:Once(function(v16) --[[ Line: 28 ]]
        -- upvalues: v13 (ref), v11 (copy), v14 (copy)
        if v13 then
            v13:Destroy();
        end;
        if v16 == Enum.PlaybackState.Completed then
            v11(v14.Value);
        end;
    end);
    local v17 = ("TweenerId%*"):format(v3);
    v13:BindToRenderStep(v17, v12, function(v18) --[[ Line: 38 ]]
        -- upvalues: v11 (copy), v14 (copy)
        v11(v14.Value, v18);
    end);
    v13:Add(function() --[[ Line: 42 ]]
        -- upvalues: v13 (ref), v15 (ref)
        v13 = nil;
        v15:Cancel();
        v15:Destroy();
        v15 = nil;
    end);
    v15:Play();
    return v13;
end;