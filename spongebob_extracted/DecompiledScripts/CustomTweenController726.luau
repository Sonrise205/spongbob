local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_TweenService_0 = game:GetService("TweenService");
local v2 = require(l_ReplicatedStorage_0.Packages.Knit);
local _ = require(l_ReplicatedStorage_0.Packages.Dumpster);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v5 = require(l_ReplicatedStorage_0.Shared.Modules.WWSDebug);
local v6 = nil;
local v7 = {};
local v8 = v2.CreateController({
    Name = script.Name, 
    Client = {}
});
v8.KnitInit = function(_) --[[ Line: 38 ]] --[[ Name: KnitInit ]]
    -- upvalues: v6 (ref), v2 (copy)
    v6 = v2.GetService("CustomTweenService");
end;
v8.KnitStart = function(_) --[[ Line: 43 ]] --[[ Name: KnitStart ]]
    -- upvalues: v6 (ref), v7 (copy), v5 (copy), l_TweenService_0 (copy)
    v6.Play:Connect(function(v11, v12, v13, v14, v15, v16) --[[ Line: 44 ]]
        -- upvalues: v7 (ref), v5 (ref), l_TweenService_0 (ref)
        if v7[v11] then
            v5:Warn("Tween with id already exists:", v11);
            return;
        else
            local v17 = workspace:GetServerTimeNow() - v12;
            if v16 > 0 and v16 < v17 then
                v5:Warn("Latency threshold exceeded:", v17);
                return;
            else
                local v18 = v14.Time - v17;
                local l_DelayTime_0 = v14.DelayTime;
                if v18 < 0 or l_DelayTime_0 > 0 and l_DelayTime_0 - v17 < 0 then
                    return;
                else
                    local v20 = TweenInfo.new(v18, v14.EasingStyle, v14.EasingDirection, v14.RepeatCount, v14.Reverses, l_DelayTime_0 - v17);
                    local v21 = l_TweenService_0:Create(v13, v20, v15);
                    v7[v11] = v21;
                    v21.Completed:Once(function() --[[ Line: 82 ]]
                        -- upvalues: v7 (ref), v11 (copy), v21 (copy)
                        v7[v11] = nil;
                        v21:Destroy();
                    end);
                    v21:Play();
                    return;
                end;
            end;
        end;
    end);
    v6.Cancel:Connect(function(v22) --[[ Line: 90 ]]
        -- upvalues: v7 (ref)
        local v23 = v7[v22];
        if not v23 then
            return;
        else
            v23:Cancel();
            return;
        end;
    end);
end;
return v8;