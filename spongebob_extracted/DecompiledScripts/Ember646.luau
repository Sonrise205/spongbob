local v0 = {
    "Acceleration", 
    "Color", 
    "Drag", 
    "EmissionDirection", 
    "Enabled", 
    "FlipbookFramerate", 
    "FlipbookLayout", 
    "FlipbookMode", 
    "FlipbookStartRandom", 
    "LockedToPart", 
    "Lifetime", 
    "Orientation", 
    "Rate", 
    "Rotation", 
    "RotSpeed", 
    "Size", 
    "Speed", 
    "SpreadAngle", 
    "Squash", 
    "Texture", 
    "Transparency", 
    "ZOffset", 
    "TimeScale"
};
local v1 = {
    8, 
    16, 
    32, 
    64, 
    128, 
    256, 
    512, 
    1024
};
local v2 = {
    [Enum.NormalId.Left] = 0, 
    [Enum.NormalId.Top] = 90, 
    [Enum.NormalId.Right] = 180, 
    [Enum.NormalId.Bottom] = 270
};
local v3 = {
    [Enum.ParticleFlipbookLayout.Grid2x2] = 2, 
    [Enum.ParticleFlipbookLayout.Grid4x4] = 4, 
    [Enum.ParticleFlipbookLayout.Grid8x8] = 8
};
local v4 = {
    FlipbookDimensions = {
        By8x8 = 8, 
        By16x16 = 16, 
        By32x32 = 32, 
        By64x64 = 64, 
        By128x128 = 128, 
        By256x256 = 256, 
        By512x512 = 512, 
        By1024x1024 = 1024
    }
};
local l_RunService_0 = game:GetService("RunService");
local l_Players_0 = game:GetService("Players");
local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_CurrentCamera_0 = workspace.CurrentCamera;
local l_ScreenGui_0 = Instance.new("ScreenGui");
l_ScreenGui_0.DisplayOrder = 5;
l_ScreenGui_0.ResetOnSpawn = false;
l_ScreenGui_0.Name = "Particles";
l_ScreenGui_0.Parent = l_LocalPlayer_0.PlayerGui;
local v11 = {};
local v12 = {};
local v13 = {};
local v14 = {};
local v15 = {};
local v16 = nil;
local v17, v18 = xpcall(function() --[[ Line: 129 ]]
    game.test = true;
end, function() --[[ Line: 129 ]]
    return debug.info(2, "f");
end);
local _, v20 = xpcall(function() --[[ Line: 130 ]]
    -- upvalues: v17 (ref)
    v17 = game[nil];
end, function() --[[ Line: 130 ]]
    return debug.info(2, "f");
end);
local _ = game.GetAttribute;
local function _(v22, v23) --[[ Line: 133 ]] --[[ Name: decimalRandom ]]
    return (math.lerp(v22, v23, (math.random())));
end;
local function v38(v25, v26, v27) --[[ Line: 137 ]] --[[ Name: evalNumberSequence ]]
    local l_Keypoints_0 = v25.Keypoints;
    local v29 = #l_Keypoints_0;
    if v26 <= 0 then
        local v30 = l_Keypoints_0[1];
        return v30.Value + v27 * v30.Envelope;
    elseif v26 >= 1 then
        local v31 = l_Keypoints_0[v29];
        return v31.Value + v27 * v31.Envelope;
    else
        for v32 = 1, v29 - 1 do
            local v33 = l_Keypoints_0[v32];
            local v34 = l_Keypoints_0[v32 + 1];
            local l_Time_0 = v33.Time;
            local l_Time_1 = v34.Time;
            if l_Time_0 <= v26 and v26 < l_Time_1 then
                local v37 = (v26 - l_Time_0) / (l_Time_1 - l_Time_0);
                return math.lerp(v33.Value, v34.Value, v37) + v27 * math.lerp(v33.Envelope, v34.Envelope, v37);
            end;
        end;
        return;
    end;
end;
local function v51(v39, v40) --[[ Line: 164 ]] --[[ Name: evalColorSequence ]]
    local l_Keypoints_1 = v39.Keypoints;
    local v42 = #l_Keypoints_1;
    if v40 <= 0 then
        return l_Keypoints_1[1].Value;
    elseif v40 >= 1 then
        return l_Keypoints_1[v42].Value;
    else
        for v43 = 1, v42 - 1 do
            local v44 = l_Keypoints_1[v43];
            local v45 = l_Keypoints_1[v43 + 1];
            local l_Time_2 = v44.Time;
            local l_Time_3 = v45.Time;
            if l_Time_2 <= v40 and v40 < l_Time_3 then
                local v48 = (v40 - l_Time_2) / (l_Time_3 - l_Time_2);
                local l_Value_0 = v44.Value;
                local l_Value_1 = v45.Value;
                return Color3.new(math.lerp(l_Value_0.R, l_Value_1.R, v48), math.lerp(l_Value_0.G, l_Value_1.G, v48), (math.lerp(l_Value_0.B, l_Value_1.B, v48)));
            end;
        end;
        return;
    end;
end;
local function v62(v52) --[[ Line: 196 ]] --[[ Name: getRandomPositionInFrame ]]
    -- upvalues: l_CurrentCamera_0 (copy)
    local l_AbsoluteSize_0 = v52.AbsoluteSize;
    local l_AbsolutePosition_0 = v52.AbsolutePosition;
    local v55 = math.rad(v52.AbsoluteRotation);
    local v56 = l_AbsolutePosition_0 + l_AbsoluteSize_0 / 2;
    local v57 = math.random() * l_AbsoluteSize_0.X - l_AbsoluteSize_0.X / 2;
    local v58 = math.random() * l_AbsoluteSize_0.Y - l_AbsoluteSize_0.Y / 2;
    local v59 = v57 * math.cos(v55) - v58 * math.sin(v55);
    local v60 = v57 * math.sin(v55) + v58 * math.cos(v55);
    local v61 = (v56 + Vector2.new(v59, v60)) / l_CurrentCamera_0.ViewportSize;
    return UDim2.fromScale(v61.X, v61.Y);
end;
local function v72(v63, v64) --[[ Line: 214 ]] --[[ Name: getRandomDirectionVector ]]
    -- upvalues: l_CurrentCamera_0 (copy)
    local v65 = v64 / 2;
    local v66 = v63 - v65;
    local v67 = v63 + v65;
    local v68 = math.rad(math.random() * (v67 - v66) + v66);
    local v69 = math.cos(v68);
    local v70 = math.sin(v68);
    local v71 = Vector2.new(v69, v70) / l_CurrentCamera_0.ViewportSize;
    return UDim2.fromScale(-v71.X, -v71.Y);
end;
local function _(v73, v74, v75) --[[ Line: 229 ]] --[[ Name: getFrameFromFlipbook ]]
    v75 = math.max(1, v75 % (v74 * v74)) - 1;
    local v76 = v73 / v74;
    local v77 = v75 % v74;
    local v78 = v75 // v74;
    local v79 = v77 * v76;
    local v80 = v78 * v76;
    return Vector2.new(v79, v80), Vector2.new(v76, v76);
end;
local function v84(v82) --[[ Line: 245 ]] --[[ Name: DestroyParticleReference ]]
    -- upvalues: v15 (copy), v12 (copy)
    local v83 = table.find(v15, v82);
    if v83 then
        v82.label.Visible = false;
        v82.label.Position = UDim2.fromScale(-0.5, -0.5);
        table.remove(v15, v83);
        table.insert(v12[v82.particleEmitter], v82.label);
        table.clear(v82);
    end;
end;
local function v126(v85) --[[ Line: 259 ]] --[[ Name: RenderParticles ]]
    -- upvalues: v20 (copy), l_CurrentCamera_0 (copy), v18 (copy), l_ScreenGui_0 (copy), v15 (copy), v12 (copy), v38 (copy), v51 (copy), v4 (copy), v3 (copy)
    local v86 = v20(l_CurrentCamera_0, "ViewportSize");
    local l_X_0 = v86.X;
    local l_Y_0 = v86.Y;
    v18(l_ScreenGui_0, "Enabled", false);
    for v89, v90 in v15 do
        local l_label_0 = v90.label;
        local l_particleEmitterProperties_0 = v90.particleEmitterProperties;
        local l_aspectRatio_0 = v90.aspectRatio;
        local l_time_0 = v90.time;
        v90.time = v90.time + v85 * l_particleEmitterProperties_0.TimeScale;
        local v95 = l_time_0 / v90.lifetime;
        if v95 >= 1 then
            v18(l_label_0, "Visible", false);
            table.insert(v12[v90.particleEmitter], l_label_0);
            table.remove(v15, v89);
            table.clear(v90);
        else
            local l_seed_0 = v90.seed;
            local l_drag_0 = v90.drag;
            local l_speed_0 = v90.speed;
            local l_direction_0 = v90.direction;
            local l_rotSpeed_0 = v90.rotSpeed;
            local l_Acceleration_0 = l_particleEmitterProperties_0.Acceleration;
            local v102 = l_Acceleration_0.X / l_X_0 * l_time_0 * l_time_0 * 20;
            local v103 = l_Acceleration_0.Y / l_Y_0 * l_time_0 * l_time_0 * 20;
            local v104 = l_drag_0 and l_speed_0 * 0.5 ^ (l_time_0 / l_drag_0) or l_speed_0;
            local v105 = v90.position + UDim2.fromScale(l_direction_0.X.Scale * v104 * l_time_0 - v102, l_direction_0.Y.Scale * v104 * l_time_0 - v103);
            local l_Scale_0 = v105.X.Scale;
            local l_Scale_1 = v105.Y.Scale;
            if l_Scale_0 >= -0.1 and l_Scale_0 <= 1.1 and l_Scale_1 <= 1.1 and l_Scale_1 >= -0.1 then
                local v108 = v38(l_particleEmitterProperties_0.Transparency, v95, l_seed_0);
                if v108 ~= 1 then
                    local v109 = v38(l_particleEmitterProperties_0.Size, v95, l_seed_0) / 10;
                    local v110 = v38(l_particleEmitterProperties_0.Squash, v95, l_seed_0);
                    local v111 = v51(l_particleEmitterProperties_0.Color, v95);
                    local v112 = v20(l_label_0, "Rotation");
                    v18(l_label_0, "Position", v105);
                    v18(l_label_0, "ImageTransparency", v108);
                    v18(l_label_0, "ImageColor3", v111);
                    v18(l_label_0, "Rotation", v112 + l_rotSpeed_0 * v85);
                    v18(l_label_0, "Size", UDim2.fromScale(v109, v109));
                    v18(l_aspectRatio_0, "AspectRatio", v110 > 0 and v110 + 1 or math.max(1.0E-4, 1 + v110 / 3));
                    local l_FlipbookLayout_0 = l_particleEmitterProperties_0.FlipbookLayout;
                    if l_FlipbookLayout_0 ~= Enum.ParticleFlipbookLayout.None then
                        local l_currentFrame_0 = v90.currentFrame;
                        local v115 = l_particleEmitterProperties_0.FlipbookDimensions or v4.FlipbookDimensions.By1024x1024;
                        local v116 = v3[l_FlipbookLayout_0];
                        local l_FlipbookMode_0 = l_particleEmitterProperties_0.FlipbookMode;
                        local v118 = math.max(1, l_currentFrame_0 // 1 % (v116 * v116)) - 1;
                        local v119 = v115 / v116;
                        local v120 = v118 % v116;
                        local v121 = v118 // v116;
                        local v122 = v120 * v119;
                        local v123 = v121 * v119;
                        local v124 = Vector2.new(v122, v123);
                        local v125 = Vector2.new(v119, v119);
                        v18(l_label_0, "ImageRectOffset", v124);
                        v18(l_label_0, "ImageRectSize", v125);
                        v90.currentFrame = if l_FlipbookMode_0 == Enum.ParticleFlipbookMode.Loop then l_time_0 * v90.frameRate else if l_FlipbookMode_0 == Enum.ParticleFlipbookMode.OneShot then v95 * v116 * v116 else if l_FlipbookMode_0 == Enum.ParticleFlipbookMode.Random then math.random(v116 * v116) else v95 < 0.5 and v95 * v116 * v116 * 2 or (1 - v95) * v116 * v116 * 2;
                    end;
                end;
            end;
        end;
    end;
    v18(l_ScreenGui_0, "Enabled", true);
end;
local function v136(v127, v128) --[[ Line: 354 ]] --[[ Name: GenerateParticleReference ]]
    -- upvalues: v12 (copy), l_ScreenGui_0 (copy), v14 (copy), v3 (copy), v13 (copy)
    local v129 = table.remove(v12[v127]);
    if not v129 then
        v129 = v128:Clone();
        v129.ZIndex = v127.ZOffset * 10000;
        v129.Parent = v128.Parent or l_ScreenGui_0;
        v129.Rotation = math.lerp(v127.Rotation.Min, v127.Rotation.Max, (math.random()));
    else
        v129.Position = UDim2.fromScale(-0.5, -0.5);
    end;
    v129.Visible = true;
    local v130 = math.lerp(v127.Lifetime.Min, v127.Lifetime.Max, (math.random()));
    local v131 = math.lerp(v127.Speed.Min, v127.Speed.Max, (math.random())) * 20;
    local v132 = math.lerp(v127.RotSpeed.Min, v127.RotSpeed.Max, (math.random()));
    local v133 = math.lerp(v127.FlipbookFramerate.Min, v127.FlipbookFramerate.Max, (math.random()));
    local v134 = {
        label = v129, 
        particleEmitter = v127, 
        particleEmitterProperties = v14[v127], 
        aspectRatio = v129:FindFirstChildWhichIsA("UIAspectRatioConstraint"), 
        time = 0, 
        lifetime = v130, 
        seed = math.random() - 1, 
        speed = v131
    };
    local v135 = false;
    if v127.Drag ~= 0 then
        v135 = v127.Drag;
    end;
    v134.drag = v135;
    v134.rotSpeed = v132;
    v134.size = v128.Size;
    v134.frameRate = v133;
    if v127.FlipbookLayout ~= Enum.ParticleFlipbookLayout.None then
        v135 = v3[v127.FlipbookLayout];
        v134.currentFrame = v127.FlipbookStartRandom and math.random(v135 * v135) or 1;
    end;
    table.insert(v13[v127], v134);
    return v134;
end;
local function _(v137, v138, v139) --[[ Line: 403 ]] --[[ Name: EmitAtPosition ]]
    -- upvalues: v136 (copy), v72 (copy), v2 (copy), v15 (copy)
    local v140 = v136(v137, v138);
    local v141 = v72(v2[v137.EmissionDirection] or 90, (math.lerp(v137.SpreadAngle.X, v137.SpreadAngle.Y, (math.random()))));
    v140.position = v139;
    v140.direction = v141;
    table.insert(v15, 1, v140);
end;
local function v148(v143, v144, v145) --[[ Line: 413 ]] --[[ Name: EmitInParent ]]
    -- upvalues: v136 (copy), v72 (copy), v2 (copy), v62 (copy), v15 (copy)
    local v146 = v136(v143, v144);
    local v147 = v72((v2[v143.EmissionDirection] or 90) + v145.AbsoluteRotation, (math.lerp(v143.SpreadAngle.X, v143.SpreadAngle.Y, (math.random()))));
    v146.position = v62(v145);
    v146.direction = v147;
    table.insert(v15, v146);
end;
v4.new = function(v149, v150) --[[ Line: 425 ]] --[[ Name: new ]]
    -- upvalues: v11 (copy), l_ScreenGui_0 (copy), v12 (copy), v13 (copy), v14 (copy), v0 (copy), v4 (copy), l_UserGameSettings_0 (copy), v148 (copy), v136 (copy), v72 (copy), v2 (copy), v15 (copy), v1 (copy), v84 (copy)
    if v11[v149] then
        return v11[v149];
    else
        if v149.FlipbookLayout ~= Enum.ParticleFlipbookLayout.None then
            warn("Flipbook particle detected, make sure to set the FlipbookDimensions if its different from 1024x1024");
        end;
        local l_Folder_0 = Instance.new("Folder");
        l_Folder_0.Name = v149.Name;
        l_Folder_0.Parent = l_ScreenGui_0;
        local l_ImageLabel_0 = Instance.new("ImageLabel");
        l_ImageLabel_0.AnchorPoint = Vector2.new(0.5, 0.5);
        l_ImageLabel_0.BackgroundTransparency = 1;
        l_ImageLabel_0.Size = UDim2.fromScale(0.05, 0.05);
        l_ImageLabel_0.Position = UDim2.fromScale(-0.5, -0.5);
        l_ImageLabel_0.Image = v149.Texture;
        l_ImageLabel_0.Visible = false;
        l_ImageLabel_0.Parent = l_Folder_0;
        Instance.new("UIAspectRatioConstraint").Parent = l_ImageLabel_0;
        local v153 = nil;
        local v154 = nil;
        local v155 = nil;
        local v156 = nil;
        v12[v149] = v12[v149] or {};
        v13[v149] = v13[v149] or {};
        v14[v149] = v14[v149] or {};
        for _, v158 in v0 do
            v14[v149][v158] = v149[v158];
        end;
        v14[v149].FlipbookDimensions = v4.FlipbookDimensions.By1024x1024;
        local v159 = {
            FlipbookDimensions = function() --[[ Line: 464 ]] --[[ Name: FlipbookDimensions ]]
                -- upvalues: v14 (ref), v149 (copy), v4 (ref)
                return v14[v149].FlipbookDimensions or v4.FlipbookDimensions.By1024x1024;
            end
        };
        local v172 = {
            Enabled = function(_, v161) --[[ Line: 470 ]] --[[ Name: Enabled ]]
                -- upvalues: v149 (copy), v153 (ref), l_UserGameSettings_0 (ref), v148 (ref), l_ImageLabel_0 (copy), v156 (ref), v136 (ref), v72 (ref), v2 (ref), v15 (ref)
                v161 = v161 or v149.Enabled;
                if v161 and not v153 then
                    v153 = task.spawn(function() --[[ Line: 474 ]]
                        -- upvalues: l_UserGameSettings_0 (ref), v149 (ref), v148 (ref), l_ImageLabel_0 (ref), v156 (ref), v136 (ref), v72 (ref), v2 (ref), v15 (ref)
                        while true do
                            local l_Value_2 = l_UserGameSettings_0.SavedQualityLevel.Value;
                            local v163 = l_Value_2 == 0 and 0.5 or l_Value_2 / 10;
                            local v164 = v149.Rate * v163;
                            for _ = 1, math.max(v164, 1) do
                                if v149.Parent:IsA("GuiObject") then
                                    v148(v149, l_ImageLabel_0, v149.Parent);
                                else
                                    local l_v149_0 = v149;
                                    local l_l_ImageLabel_0_0 = l_ImageLabel_0;
                                    local v168 = v156.EmitPosition or UDim2.fromScale(0.5, 0.5);
                                    local v169 = v136(l_v149_0, l_l_ImageLabel_0_0);
                                    local v170 = v72(v2[l_v149_0.EmissionDirection] or 90, (math.lerp(l_v149_0.SpreadAngle.X, l_v149_0.SpreadAngle.Y, (math.random()))));
                                    v169.position = v168;
                                    v169.direction = v170;
                                    table.insert(v15, 1, v169);
                                end;
                                task.wait(1 / v164);
                            end;
                        end;
                    end);
                    return;
                else
                    if v153 and not v161 then
                        task.cancel(v153);
                        v153 = nil;
                    end;
                    return;
                end;
            end, 
            FlipbookDimensions = function(v171) --[[ Line: 497 ]] --[[ Name: FlipbookDimensions ]]
                -- upvalues: v1 (ref), v14 (ref), v149 (copy)
                if not table.find(v1, v171) then
                    return warn("The flipbook texture must be of pixel dimensions 8\195\1518, 16\195\15116, 32\195\15132, 64\195\15164, 128\195\151128, 256\195\151256, 512\195\151512, or 1024\195\1511024");
                else
                    v14[v149].FlipbookDimensions = v171;
                    return;
                end;
            end
        };
        v156 = setmetatable({
            EmitPosition = v150 or UDim2.fromScale(0.5, 0.5), 
            Clear = function(_) --[[ Line: 509 ]] --[[ Name: Clear ]]
                -- upvalues: v13 (ref), v149 (copy), v84 (ref)
                local v174 = v13[v149];
                for v175 = #v174, 1, -1 do
                    local v176 = table.remove(v174, v175);
                    v84(v176);
                end;
            end, 
            Emit = function(v177, v178) --[[ Line: 518 ]] --[[ Name: Emit ]]
                -- upvalues: v149 (copy), v148 (ref), l_ImageLabel_0 (copy), v136 (ref), v72 (ref), v2 (ref), v15 (ref)
                v178 = v178 or 16;
                task.spawn(function() --[[ Line: 521 ]]
                    -- upvalues: v178 (ref), v149 (ref), v148 (ref), l_ImageLabel_0 (ref), v177 (copy), v136 (ref), v72 (ref), v2 (ref), v15 (ref)
                    for _ = 1, v178 do
                        if v149.Parent:IsA("GuiObject") then
                            v148(v149, l_ImageLabel_0, v149.Parent);
                        else
                            local l_v149_1 = v149;
                            local l_l_ImageLabel_0_1 = l_ImageLabel_0;
                            local l_EmitPosition_0 = v177.EmitPosition;
                            local v183 = v136(l_v149_1, l_l_ImageLabel_0_1);
                            local v184 = v72(v2[l_v149_1.EmissionDirection] or 90, (math.lerp(l_v149_1.SpreadAngle.X, l_v149_1.SpreadAngle.Y, (math.random()))));
                            v183.position = l_EmitPosition_0;
                            v183.direction = v184;
                            table.insert(v15, 1, v183);
                        end;
                        task.wait();
                    end;
                end);
            end, 
            EmitAtPosition = function(v185, v186, v187) --[[ Line: 534 ]] --[[ Name: EmitAtPosition ]]
                -- upvalues: v149 (copy), l_ImageLabel_0 (copy), v136 (ref), v72 (ref), v2 (ref), v15 (ref)
                v186 = v186 or 16;
                v187 = v187 or v185.EmitPosition;
                task.spawn(function() --[[ Line: 538 ]]
                    -- upvalues: v186 (ref), v149 (ref), l_ImageLabel_0 (ref), v187 (ref), v136 (ref), v72 (ref), v2 (ref), v15 (ref)
                    for _ = 1, v186 do
                        local l_v149_2 = v149;
                        local l_l_ImageLabel_0_2 = l_ImageLabel_0;
                        local l_v187_0 = v187;
                        local v192 = v136(l_v149_2, l_l_ImageLabel_0_2);
                        local v193 = v72(v2[l_v149_2.EmissionDirection] or 90, (math.lerp(l_v149_2.SpreadAngle.X, l_v149_2.SpreadAngle.Y, (math.random()))));
                        v192.position = l_v187_0;
                        v192.direction = v193;
                        table.insert(v15, 1, v192);
                        task.wait();
                    end;
                end);
            end, 
            EmitInParent = function(_, v195, v196) --[[ Line: 546 ]] --[[ Name: EmitInParent ]]
                -- upvalues: v149 (copy), v148 (ref), l_ImageLabel_0 (copy)
                v195 = v195 or 16;
                v196 = v196 or v149.Parent;
                if not v196:IsA("GuiObject") then
                    return warn("The parent is not a gui object");
                else
                    task.spawn(function() --[[ Line: 554 ]]
                        -- upvalues: v195 (ref), v148 (ref), v149 (ref), l_ImageLabel_0 (ref), v196 (ref)
                        for _ = 1, v195 do
                            v148(v149, l_ImageLabel_0, v196);
                            task.wait();
                        end;
                    end);
                    return;
                end;
            end, 
            Destroy = function() --[[ Line: 562 ]] --[[ Name: Destroy ]]
                -- upvalues: v153 (ref), v154 (ref), v155 (ref), l_ImageLabel_0 (copy), l_Folder_0 (copy), v12 (ref), v149 (copy), v13 (ref), v14 (ref), v11 (ref), v172 (copy), v159 (copy), v156 (ref)
                if v153 then
                    task.cancel(v153);
                end;
                v154:Disconnect();
                v155:Disconnect();
                l_ImageLabel_0:Destroy();
                l_Folder_0:Destroy();
                v12[v149] = nil;
                v13[v149] = nil;
                v14[v149] = nil;
                v11[v149] = nil;
                table.clear(v172);
                table.clear(v159);
                table.clear(v156);
            end
        }, {
            __index = function(_, v199) --[[ Line: 584 ]] --[[ Name: __index ]]
                -- upvalues: v159 (copy), v149 (copy)
                if v159[v199] then
                    return v159[v199]();
                else
                    return v149[v199];
                end;
            end, 
            __newindex = function(_, v201, v202) --[[ Line: 592 ]] --[[ Name: __newindex ]]
                -- upvalues: v172 (copy), v14 (ref), v149 (copy)
                if v172[v201] then
                    v172[v201](v202);
                    return;
                else
                    v14[v149][v201] = v202;
                    v149[v201] = v202;
                    return;
                end;
            end
        });
        v155 = v149.Changed:Connect(function(v203) --[[ Line: 602 ]]
            -- upvalues: v149 (copy), v172 (copy), v0 (ref), v14 (ref)
            local v204 = v149[v203];
            if v172[v203] then
                v172[v203](v204);
                return;
            else
                if table.find(v0, v203) then
                    v14[v149][v203] = v204;
                end;
                return;
            end;
        end);
        v154 = v149.Destroying:Connect(v156.Destroy);
        v172.Enabled(v149.Enabled);
        v11[v149] = v156;
        return v156;
    end;
end;
v4.RenderEnabled = function(v205) --[[ Line: 621 ]] --[[ Name: RenderEnabled ]]
    -- upvalues: v16 (ref), l_ScreenGui_0 (copy), l_RunService_0 (copy), v126 (copy), v15 (copy), v84 (copy)
    if (v205 or not v16.Connected) and l_ScreenGui_0.Enabled then
        v16 = l_RunService_0.PreRender:Connect(v126);
        return;
    else
        if v16.Connected then
            v16:Disconnect();
            for _, v207 in v15 do
                v84(v207);
            end;
        end;
        return;
    end;
end;
v16 = l_RunService_0.PreRender:Connect(v126);
return v4;