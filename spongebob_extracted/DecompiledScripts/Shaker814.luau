local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_TweenService_0 = game:GetService("TweenService");
local v2 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local l_Quad_0 = Enum.EasingStyle.Quad;
local l_Out_0 = Enum.EasingDirection.Out;
local v6 = {};
v6.__index = v6;
v6.new = function(v7, v8) --[[ Line: 28 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), v6 (copy), l_Out_0 (copy), l_TweenService_0 (copy)
    local v9 = setmetatable({
        object = v7, 
        speed = v8 and v8.speed or 0.25, 
        rotation = v8 and v8.rotation or 8, 
        tweens = {}, 
        shaking = false, 
        hold = v8 and v8.hold or 0, 
        limit = v8 and v8.limit, 
        dumpster = v2.new()
    }, v6);
    v9.dumpster:AttachTo(v7);
    v9.tweenDumpster = v9.dumpster:Extend();
    local v10 = TweenInfo.new(v9.speed or 0.25, Enum.EasingStyle.Linear, l_Out_0);
    v9.returnTween = l_TweenService_0:Create(v9.object, v10, {
        Rotation = v9.object.Rotation
    });
    v9.dumpster:Add(function() --[[ Line: 46 ]]
        -- upvalues: v9 (copy)
        v9:_cleanTweens(false);
        v9.shaking = false;
        v9.tweens = nil;
        v9.dumpster = nil;
        v9.tweenDumpster = nil;
        if v9.returnTween.PlaybackState == Enum.PlaybackState.Playing then
            v9.returnTween.Completed:Once(function() --[[ Line: 55 ]]
                -- upvalues: v9 (ref)
                v9.returnTween:Destroy();
                v9.returnTween = nil;
            end);
            return;
        else
            v9.returnTween:Destroy();
            v9.returnTween = nil;
            return;
        end;
    end);
    return v9;
end;
v6.Start = function(v11, v12, v13) --[[ Line: 69 ]] --[[ Name: Start ]]
    if v11.shaking then
        return;
    else
        v11.shaking = true;
        local v14 = 1;
        local v15 = 0;
        if v12 then
            v11.speed = v12.speed or v11.speed;
            v11.hold = v12.hold or v11.hold;
            v11.rotation = v12.rotation or v11.rotation;
            v11.limit = v12.limit or v11.limit;
        end;
        if #v11.tweens < 1 then
            v11:_createTweens();
        end;
        local function v16() --[[ Line: 92 ]] --[[ Name: tweenLoop ]]
            -- upvalues: v11 (copy), v14 (ref), v15 (ref), v13 (copy), v16 (copy)
            v11.tweenDumpster:Destroy();
            if not v11.shaking then
                return;
            else
                local v17 = v11.tweens[v14];
                if v11.limit and v15 >= v11.limit then
                    if v13 then
                        v11:Destroy();
                        return;
                    else
                        v11:Stop();
                        return;
                    end;
                else
                    v11.tweenDumpster:Add(v17.Completed:Connect(function() --[[ Line: 112 ]]
                        -- upvalues: v11 (ref), v14 (ref), v15 (ref), v16 (ref)
                        v11.tweenDumpster:Destroy();
                        if v14 + 1 > #v11.tweens and v11.hold > 0 then
                            v14 = 1;
                            v15 = v15 + 1;
                            v11.tweenDumpster:Add(v11.returnTween.Completed:Connect(function() --[[ Line: 120 ]]
                                -- upvalues: v11 (ref), v16 (ref)
                                v11.tweenDumpster:Destroy();
                                v11.tweenDumpster:Add(task.delay(v11.hold, function() --[[ Line: 122 ]]
                                    -- upvalues: v16 (ref)
                                    task.defer(v16);
                                end));
                            end));
                            v11.returnTween:Play();
                            return;
                        else
                            if v14 + 1 > #v11.tweens then
                                v14 = 1;
                                v15 = v15 + 1;
                            else
                                v14 = v14 + 1;
                            end;
                            v16();
                            return;
                        end;
                    end));
                    v17:Play();
                    return;
                end;
            end;
        end;
        v16();
        return;
    end;
end;
v6.Once = function(v18, v19, v20) --[[ Line: 148 ]] --[[ Name: Once ]]
    if not v19 then
        v19 = {};
    end;
    v19.limit = 1;
    v18:Start(v19, v20);
end;
v6.OnlyOnce = function(v21, v22) --[[ Line: 158 ]] --[[ Name: OnlyOnce ]]
    v21:Once(v22, true);
end;
v6.Stop = function(v23) --[[ Line: 162 ]] --[[ Name: Stop ]]
    v23.shaking = false;
    if not v23.tweenDumpster then
        return;
    else
        v23.tweenDumpster:Destroy();
        for _, v25 in v23.tweens do
            if v25.PlaybackState == Enum.PlaybackState.Playing then
                v25:Cancel();
            end;
        end;
        if v23.returnTween then
            v23.returnTween:Play();
        end;
        return;
    end;
end;
v6.Destroy = function(v26) --[[ Line: 183 ]] --[[ Name: Destroy ]]
    if not v26.dumpster then
        return;
    else
        v26:Stop();
        v26.dumpster:Destroy();
        return;
    end;
end;
v6._createTweens = function(v27) --[[ Line: 192 ]] --[[ Name: _createTweens ]]
    -- upvalues: l_Quad_0 (copy), l_Out_0 (copy), l_TweenService_0 (copy)
    if #v27.tweens > 0 then
        v27:_cleanTweens(true);
    end;
    local v28 = TweenInfo.new(v27.speed, l_Quad_0, l_Out_0);
    table.insert(v27.tweens, l_TweenService_0:Create(v27.object, v28, {
        Rotation = v27.rotation
    }));
    table.insert(v27.tweens, l_TweenService_0:Create(v27.object, v28, {
        Rotation = -v27.rotation
    }));
end;
v6._cleanTweens = function(v29, v30) --[[ Line: 205 ]] --[[ Name: _cleanTweens ]]
    if v29.returnTween and v30 then
        v29.returnTween:Cancel();
    end;
    for _, v32 in v29.tweens do
        v32:Cancel();
        v32:Destroy();
    end;
    table.clear(v29.tweens);
end;
return v6;