local l_Lighting_0 = game:GetService("Lighting");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_TweenService_0 = game:GetService("TweenService");
local v3 = require(l_ReplicatedStorage_0.Packages.Knit);
local _ = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v5 = require(l_ReplicatedStorage_0.Packages.Signal);
local v6 = {
    FarIntensity = 1, 
    FocusDistance = 0, 
    InFocusRadius = 5, 
    NearIntensity = 1
};
local v7 = {
    FarIntensity = 0.432, 
    FocusDistance = 0, 
    InFocusRadius = 200, 
    NearIntensity = 0.75
};
local v8 = {
    "FarIntensity", 
    "FocusDistance", 
    "InFocusRadius", 
    "NearIntensity"
};
local v9 = {};
local v10 = {
    FarIntensity = 0.75, 
    FocusDistance = 0.05, 
    InFocusRadius = 10, 
    NearIntensity = 0.75
};
local v11 = {
    FarIntensity = 0.75, 
    FocusDistance = 0.05, 
    InFocusRadius = 14, 
    NearIntensity = 0.75
};
local v12 = {
    FarIntensity = 0.75, 
    FocusDistance = 0.05, 
    InFocusRadius = 10, 
    NearIntensity = 0.75
};
local v13 = v3.CreateController({
    Name = "BlurController", 
    DEFAULT_SIZE = 18, 
    DEPTH_ON_PROPS = v6, 
    DEPTH_OFF_PROPS = v7, 
    _isLoaded = false, 
    Loaded = v5.new()
});
v13.SetBlur = function(v14, v15, v16, v17) --[[ Line: 88 ]] --[[ Name: SetBlur ]]
    if not v15 then
        v15 = v14.blur.Size < 1 and 18 or 0;
    end;
    if v17 then
        v14.blur.Size = v15;
        return;
    else
        v14:_tween(v15, v16);
        return;
    end;
end;
v13.SetDepth = function(v18, v19, v20, _) --[[ Line: 102 ]] --[[ Name: SetDepth ]]
    v18:_tween2(v19, v20);
end;
v13.GetBlur = function(v22) --[[ Line: 106 ]] --[[ Name: GetBlur ]]
    return v22.blur.Size;
end;
v13.SetUnitDepthMode = function(v23, v24) --[[ Line: 110 ]] --[[ Name: SetUnitDepthMode ]]
    if v24 then
        v23.unitDepthTween:Play();
        return;
    else
        v23.regularDepthTween:Play();
        return;
    end;
end;
v13.SetFusionDepthMode = function(v25, v26) --[[ Line: 120 ]] --[[ Name: SetFusionDepthMode ]]
    if v26 then
        v25.fusionDepthTween:Play();
        return;
    else
        v25.regularDepthTween:Play();
        return;
    end;
end;
v13.SetMVictoryDepthMode = function(v27, v28) --[[ Line: 130 ]] --[[ Name: SetMVictoryDepthMode ]]
    if v28 then
        v27.mvictoryDepthTween:Play();
        return;
    else
        v27.regularDepthTween:Play();
        return;
    end;
end;
v13._tween = function(v29, v30, v31, v32) --[[ Line: 141 ]] --[[ Name: _tween ]]
    -- upvalues: l_TweenService_0 (copy)
    local v33 = TweenInfo.new(v31 or 0.2);
    local v34 = l_TweenService_0:Create(v29.blur, v33, {
        Size = v30
    });
    v34.Completed:Once(function() --[[ Line: 145 ]]
        -- upvalues: v34 (ref), v32 (copy)
        v34:Destroy();
        v34 = nil;
        if v32 then
            v32();
        end;
    end);
    v34:Play();
end;
v13._tween2 = function(v35, v36, v37) --[[ Line: 157 ]] --[[ Name: _tween2 ]]
    -- upvalues: l_TweenService_0 (copy)
    local v38 = TweenInfo.new(v37 or 0.2);
    local v39 = if v36 then v35.DEPTH_ON_PROPS else v35.DEPTH_OFF_PROPS;
    local v40 = l_TweenService_0:Create(v35.depthOfField, v38, v39);
    v40.Completed:Once(function() --[[ Line: 164 ]]
        -- upvalues: v40 (ref), v36 (copy), v35 (copy)
        v40:Destroy();
        v40 = nil;
        if not v36 then
            v35.depthOfField.Enabled = false;
        end;
    end);
    if v36 then
        v35.depthOfField.Enabled = true;
    end;
    v40:Play();
end;
v13.KnitInit = function(_) --[[ Line: 181 ]] --[[ Name: KnitInit ]]

end;
v13.KnitStart = function(v42) --[[ Line: 185 ]] --[[ Name: KnitStart ]]
    -- upvalues: l_Lighting_0 (copy), v8 (copy), v9 (copy), l_TweenService_0 (copy), v10 (copy), v11 (copy), v12 (copy)
    local l_BlurEffect_0 = Instance.new("BlurEffect");
    l_BlurEffect_0.Name = "ScreenBlur";
    l_BlurEffect_0.Size = 0;
    l_BlurEffect_0.Parent = workspace.CurrentCamera;
    local l_DepthOfFieldEffect_0 = Instance.new("DepthOfFieldEffect");
    l_DepthOfFieldEffect_0.Name = "ScreenDepthOfField";
    l_DepthOfFieldEffect_0.FarIntensity = 0.432;
    l_DepthOfFieldEffect_0.FocusDistance = 0;
    l_DepthOfFieldEffect_0.InFocusRadius = 200;
    l_DepthOfFieldEffect_0.NearIntensity = 0.75;
    l_DepthOfFieldEffect_0.Enabled = false;
    l_DepthOfFieldEffect_0.Parent = workspace.CurrentCamera;
    v42.depthOfField = l_DepthOfFieldEffect_0;
    v42.blur = l_BlurEffect_0;
    local l_DepthOfField_0 = l_Lighting_0:WaitForChild("DepthOfField");
    for _, v47 in v8 do
        v9[v47] = l_DepthOfField_0[v47];
    end;
    local v48 = TweenInfo.new(0.4);
    v42.regularDepthTween = l_TweenService_0:Create(l_DepthOfField_0, v48, v9);
    v42.unitDepthTween = l_TweenService_0:Create(l_DepthOfField_0, v48, v10);
    v42.fusionDepthTween = l_TweenService_0:Create(l_DepthOfField_0, v48, v11);
    v42.mvictoryDepthTween = l_TweenService_0:Create(l_DepthOfField_0, v48, v12);
    v42._isLoaded = true;
    v42.Loaded:Fire();
end;
v13.IsLoaded = function(v49) --[[ Line: 220 ]] --[[ Name: IsLoaded ]]
    return v49._isLoaded;
end;
return v13;