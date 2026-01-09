local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_UserInputService_0 = game:GetService("UserInputService");
local v2 = require(l_ReplicatedStorage_0.Packages.Knit);
local _ = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v4 = require(l_ReplicatedStorage_0.Packages.Shake);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local l_Value_0 = Enum.RenderPriority.Last.Value;
local v7 = {
    Amplitude = 1, 
    Frequency = 1, 
    FadeInTime = 1, 
    FadeOutTime = 1, 
    SustainTime = 0, 
    Sustain = false, 
    PositionInfluence = Vector3.new(1, 1, 1, 0), 
    RotationInfluence = Vector3.new(1, 1, 1, 0)
};
local v8 = nil;
local v9 = v2.CreateController({
    Name = "CamShakeController", 
    Client = {}, 
    CurrentPreset = "", 
    Presets = {
        Sustain = {
            RotationInfluence = Vector3.new(0.02500000037252903, 0.02500000037252903, 0.02500000037252903, 0), 
            FadeInTime = 0.25, 
            FadeOutTime = 1, 
            Frequency = 0.12, 
            Amplitude = 0.6, 
            Sustain = true
        }, 
        SustainLight = {
            RotationInfluence = Vector3.new(0.02500000037252903, 0.02500000037252903, 0.02500000037252903, 0), 
            FadeInTime = 0.25, 
            FadeOutTime = 1, 
            Frequency = 0.2, 
            Amplitude = 0.3, 
            Sustain = true
        }, 
        GeneralShake = {
            RotationInfluence = Vector3.new(0.05000000074505806, 0.05000000074505806, 0.05000000074505806, 0), 
            FadeInTime = 0.1, 
            FadeOutTime = 0.8, 
            Frequency = 0.15, 
            Amplitude = 1.3
        }, 
        BigShake = {
            RotationInfluence = Vector3.new(0.20000000298023224, 0.20000000298023224, 0.20000000298023224, 0), 
            FadeInTime = 0, 
            FadeOutTime = 0.8, 
            Frequency = 0.2, 
            Amplitude = 2
        }, 
        SummonSustain = {
            RotationInfluence = Vector3.new(0.05000000074505806, 0.05000000074505806, 0.05000000074505806, 0), 
            FadeInTime = 1.5, 
            FadeOutTime = 0, 
            Frequency = 0.12, 
            Amplitude = 0.4, 
            Sustain = true
        }, 
        SummonShake = {
            RotationInfluence = Vector3.new(0.07000000029802322, 0.07000000029802322, 0.07000000029802322, 0), 
            FadeInTime = 0, 
            FadeOutTime = 0.6, 
            Frequency = 0.15, 
            Amplitude = 1.6
        }, 
        SummonWumboShake = {
            RotationInfluence = Vector3.new(0.30000001192092896, 0.30000001192092896, 0.30000001192092896, 0), 
            FadeInTime = 0, 
            FadeOutTime = 1, 
            Frequency = 0.15, 
            Amplitude = 5
        }, 
        Fusion = {
            RotationInfluence = Vector3.new(0.10000000149011612, 0.10000000149011612, 0.10000000149011612, 0), 
            FadeInTime = 0, 
            FadeOutTime = 0.5, 
            Frequency = 0.2, 
            Amplitude = 1.2
        }, 
        VDayGiftShake = {
            RotationInfluence = Vector3.new(0.20000000298023224, 0.20000000298023224, 0.20000000298023224, 0), 
            FadeInTime = 0, 
            FadeOutTime = 0.7, 
            Frequency = 0.15, 
            Amplitude = 3
        }, 
        MermalairCapsuleShake = {
            RotationInfluence = Vector3.new(0.20000000298023224, 0.20000000298023224, 0.20000000298023224, 0), 
            FadeInTime = 0, 
            FadeOutTime = 0.8, 
            Frequency = 0.2, 
            Amplitude = 2
        }, 
        CaveSustain = {
            RotationInfluence = Vector3.new(0.02500000037252903, 0.02500000037252903, 0.02500000037252903, 0), 
            FadeInTime = 2, 
            FadeOutTime = 2, 
            Frequency = 0.12, 
            Amplitude = 0.6, 
            Sustain = true
        }, 
        MiddleAgesFireBurst = {
            RotationInfluence = Vector3.new(0.20000000298023224, 0.20000000298023224, 0.20000000298023224, 0), 
            FadeInTime = 0.1, 
            FadeOutTime = 1, 
            Frequency = 0.2, 
            Amplitude = 2
        }, 
        MiddleAgesFireBurst2 = {
            RotationInfluence = Vector3.new(0.15000000596046448, 0.15000000596046448, 0.15000000596046448, 0), 
            FadeInTime = 0.1, 
            FadeOutTime = 1, 
            Frequency = 0.2, 
            Amplitude = 1
        }, 
        MiddleAgesBridgeFire = {
            RotationInfluence = Vector3.new(0.05000000074505806, 0.05000000074505806, 0.05000000074505806, 0), 
            FadeInTime = 0, 
            FadeOutTime = 0.8, 
            Frequency = 0.2, 
            Amplitude = 0.8
        }, 
        KarenCrateShake = {
            RotationInfluence = Vector3.new(0.05000000074505806, 0.05000000074505806, 0.05000000074505806, 0), 
            FadeInTime = 0, 
            FadeOutTime = 0.25, 
            Frequency = 0.15, 
            Amplitude = 1
        }, 
        CraftingShake = {
            RotationInfluence = Vector3.new(0.014999999664723873, 0.014999999664723873, 0.014999999664723873, 0), 
            FadeInTime = 0.1, 
            FadeOutTime = 0.8, 
            Frequency = 0.15, 
            Amplitude = 0.4
        }
    }
});
v9.KnitStart = function(v10) --[[ Line: 176 ]] --[[ Name: KnitStart ]]
    -- upvalues: v4 (copy), l_UserInputService_0 (copy)
    v10.Shaker = v4.new();
end;
v9.Shake = function(v11, v12, v13, v14) --[[ Line: 200 ]] --[[ Name: Shake ]]
    -- upvalues: v8 (ref), v4 (copy), l_Value_0 (copy)
    if not v11:_applyPreset(v12) then
        warn((("Invalid camera shake preset: \"%*\""):format(v12)));
        return;
    else
        v13 = v13 or {};
        if v13.overrides then
            for v15, v16 in v13.overrides do
                v11.Shaker[v15] = v16;
            end;
        end;
        v8 = nil;
        if v11:IsShaking() then
            v11:Stop(true);
        end;
        v11.Shaker:Start();
        v11.originalPivot = v13.originalPivot;
        v11.Shaker:BindToRenderStep(v4.NextRenderName(), l_Value_0, function(v17, v18, v19) --[[ Line: 226 ]]
            -- upvalues: v11 (copy), v13 (ref), v14 (copy), v8 (ref)
            if v11.originalPivot then
                workspace.CurrentCamera.CFrame = v11.originalPivot * CFrame.new(v17) * CFrame.Angles(v18.X, v18.Y, v18.Z);
            else
                local l_CurrentCamera_0 = workspace.CurrentCamera;
                l_CurrentCamera_0.CFrame = l_CurrentCamera_0.CFrame * (CFrame.new(v17) * CFrame.Angles(v18.X, v18.Y, v18.Z));
            end;
            if v19 then
                if v13.preserveCFrameOnFinished then
                    workspace.CurrentCamera.CFrame = v11.originalPivot;
                end;
                v11.originalPivot = nil;
                if v14 then
                    v14();
                end;
                if v8 then
                    v8();
                    v8 = nil;
                end;
            end;
        end);
        return;
    end;
end;
v9.Stop = function(v21, v22) --[[ Line: 252 ]] --[[ Name: Stop ]]
    local v23 = v21:_getCurrentPreset();
    if not v22 and v23.Sustain then
        v21.Shaker:StopSustain();
        return;
    else
        v21.Shaker:Stop();
        return;
    end;
end;
v9.IsShaking = function(v24) --[[ Line: 263 ]] --[[ Name: IsShaking ]]
    return v24.Shaker:IsShaking();
end;
v9.BindToEnd = function(_, v26) --[[ Line: 267 ]] --[[ Name: BindToEnd ]]
    -- upvalues: v8 (ref)
    v8 = v26;
end;
v9.SetOriginalPivot = function(v27, v28) --[[ Line: 271 ]] --[[ Name: SetOriginalPivot ]]
    if not v27:IsShaking() then
        return;
    else
        v27.originalPivot = v28;
        return;
    end;
end;
v9.GetPreset = function(v29, v30) --[[ Line: 279 ]] --[[ Name: GetPreset ]]
    return v29.Presets[v30];
end;
v9._applyPreset = function(v31, v32) --[[ Line: 284 ]] --[[ Name: _applyPreset ]]
    -- upvalues: v7 (copy)
    local v33 = v31.Presets[v32];
    if not v33 then
        return;
    else
        for v34, v35 in v33 do
            v31.Shaker[v34] = v35;
        end;
        for v36, v37 in v7 do
            if v33[v36] == nil then
                v31.Shaker[v36] = v37;
            end;
        end;
        v31.CurrentPreset = v32;
        return true;
    end;
end;
v9._getCurrentPreset = function(v38) --[[ Line: 305 ]] --[[ Name: _getCurrentPreset ]]
    return v38.Presets[v38.CurrentPreset];
end;
return v9;