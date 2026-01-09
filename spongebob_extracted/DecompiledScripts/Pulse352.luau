local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_TweenService_0 = game:GetService("TweenService");
local v2 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v3 = {};
v3.__index = v3;
v3.new = function(v4, v5) --[[ Line: 26 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), v3 (copy)
    local v6 = setmetatable({
        tweens = {}, 
        textTweens = {}, 
        object = v4, 
        pulsing = false, 
        speed = v5 and v5.speed or 0.5, 
        hold = v5 and v5.hold or 0, 
        grow = v5 and v5.grow or 10, 
        limit = v5 and v5.limit, 
        originalSize = v4.Size, 
        dumpster = v2.new()
    }, v3);
    v6.dumpster:AttachTo(v4);
    v6.tweenDumpster = v6.dumpster:Extend();
    v6.dumpster:Add(function() --[[ Line: 44 ]]
        -- upvalues: v6 (copy)
        v6:_cleanTweens();
        v6.pulsing = false;
        v6.dumpster = nil;
        v6.tweenDumpster = nil;
        v6.tweens = nil;
        v6.textTweens = nil;
    end);
    return v6;
end;
v3.Start = function(v7, v8, v9) --[[ Line: 57 ]] --[[ Name: Start ]]
    if v7.pulsing then
        return;
    else
        v7.pulsing = true;
        local v10 = 1;
        local v11 = 0;
        if v8 then
            v7.speed = v8.speed or v7.speed;
            v7.hold = v8.hold or v7.hold;
            v7.grow = v8.grow or v7.grow;
            v7.limit = v8.limit or v7.limit;
        end;
        if #v7.tweens < 1 then
            v7:_createTweens();
        end;
        local function v12() --[[ Line: 80 ]] --[[ Name: tweenLoop ]]
            -- upvalues: v7 (copy), v10 (ref), v11 (ref), v9 (copy), v12 (copy)
            v7.tweenDumpster:Destroy();
            if not v7.pulsing then
                return;
            else
                local v13 = v7.tweens[v10];
                if v7.limit and v11 >= v7.limit then
                    if v9 then
                        v7:Destroy();
                        return;
                    else
                        v7:Stop();
                        return;
                    end;
                else
                    v7.tweenDumpster:Add(v13.Completed:Connect(function() --[[ Line: 100 ]]
                        -- upvalues: v7 (ref), v10 (ref), v11 (ref), v12 (ref)
                        v7.tweenDumpster:Destroy();
                        if v10 + 1 > #v7.tweens and v7.hold > 0 then
                            v10 = 1;
                            v11 = v11 + 1;
                            v7.tweenDumpster:Add(task.delay(v7.hold, function() --[[ Line: 107 ]]
                                -- upvalues: v12 (ref)
                                task.defer(v12);
                            end));
                            return;
                        else
                            if v10 + 1 > #v7.tweens then
                                v10 = 1;
                                v11 = v11 + 1;
                            else
                                v10 = v10 + 1;
                            end;
                            v12();
                            return;
                        end;
                    end));
                    v13:Play();
                    if v7.textTweens then
                        local v14 = v7.textTweens[v13];
                        if not v14 then
                            return;
                        else
                            for _, v16 in v14 do
                                v16:Play();
                            end;
                        end;
                    end;
                    return;
                end;
            end;
        end;
        v12();
        return v7;
    end;
end;
v3.Once = function(v17, v18, v19) --[[ Line: 143 ]] --[[ Name: Once ]]
    if not v18 then
        v18 = {};
    end;
    v18.limit = 1;
    v17:Start(v18, v19);
end;
v3.OnlyOnce = function(v20, v21) --[[ Line: 153 ]] --[[ Name: OnlyOnce ]]
    v20:Once(v21, true);
end;
v3.Stop = function(v22) --[[ Line: 157 ]] --[[ Name: Stop ]]
    v22.pulsing = false;
    if not v22.tweenDumpster then
        return;
    else
        v22.tweenDumpster:Destroy();
        for _, v24 in v22.tweens do
            if v24.PlaybackState == Enum.PlaybackState.Playing then
                v24:Cancel();
            end;
        end;
        v22.object.Size = v22.originalSize;
        return;
    end;
end;
v3.Destroy = function(v25) --[[ Line: 176 ]] --[[ Name: Destroy ]]
    if not v25.dumpster then
        return;
    else
        v25.dumpster:Destroy();
        return;
    end;
end;
v3._calculateSize = function(v26, v27, v28) --[[ Line: 185 ]] --[[ Name: _calculateSize ]]
    local v29 = v28 and 1 - v26.grow / 100 or 1 + v26.grow / 100;
    local v30 = v27 or v26.originalSize;
    return UDim2.new(v30.X.Scale * v29, v30.X.Offset * v29, v30.Y.Scale * v29, v30.Y.Offset * v29);
end;
v3._createTweens = function(v31) --[[ Line: 197 ]] --[[ Name: _createTweens ]]
    -- upvalues: l_TweenService_0 (copy)
    if #v31.tweens > 0 then
        v31:_cleanTweens();
    end;
    local v32 = v31:_calculateSize();
    local v33 = TweenInfo.new(v31.speed or 0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut);
    local v34 = l_TweenService_0:Create(v31.object, v33, {
        Size = v32
    });
    local v35 = l_TweenService_0:Create(v31.object, v33, {
        Size = v31.originalSize
    });
    table.insert(v31.tweens, v34);
    table.insert(v31.tweens, v35);
    local v36 = {
        [v34] = {}, 
        [v35] = {}
    };
    for _, v38 in v31.object:GetDescendants() do
        if v38:IsA("TextLabel") then
            local l_v38_Attribute_0 = v38:GetAttribute("OriginalSize");
            if not l_v38_Attribute_0 then
                l_v38_Attribute_0 = v38.Size;
                v38:SetAttribute("OriginalSize", l_v38_Attribute_0);
            end;
            local v40 = v31:_calculateSize(l_v38_Attribute_0, true);
            table.insert(v36[v34], l_TweenService_0:Create(v38, v33, {
                Size = v40
            }));
            table.insert(v36[v35], l_TweenService_0:Create(v38, v33, {
                Size = l_v38_Attribute_0
            }));
        end;
    end;
    v31.textTweens = v36;
end;
v3._cleanTweens = function(v41) --[[ Line: 238 ]] --[[ Name: _cleanTweens ]]
    for _, v43 in v41.tweens do
        v43:Cancel();
        v43:Destroy();
        v43 = nil;
    end;
    for _, v45 in v41.textTweens do
        for _, v47 in v45 do
            v47:Cancel();
            v47:Destroy();
            v47 = nil;
        end;
    end;
    table.clear(v41.tweens);
    table.clear(v41.textTweens);
end;
return v3;