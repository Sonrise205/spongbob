local l_Parent_0 = script.Parent;
local l_RunService_0 = game:GetService("RunService");
local _ = require(l_Parent_0.Types);
local v3 = {};
local v4 = {
    Camera = {
        AttachToPart = true, 
        LookAtPart = true
    }, 
    Humanoid = {
        AddAccessory = true, 
        ChangeState = true, 
        EquipTool = true, 
        MoveTo = true, 
        Move = true, 
        PlayEmote = true, 
        RemoveAccessories = true, 
        TakeDamage = true, 
        UnequipTools = true
    }, 
    ParticleEmitter = {
        Emit = true, 
        Clear = true
    }, 
    Sound = {
        PlayOnce = true, 
        SetTime = true, 
        Play = true, 
        Resume = true, 
        Pause = true, 
        Stop = true
    }
};
local function _(v5, v6, v7) --[[ Line: 70 ]] --[[ Name: getValue ]]
    return v5:GetAttribute((("__moonlite_%*"):format(v6))) or v7;
end;
local function _(v9, v10, v11, v12) --[[ Line: 74 ]] --[[ Name: setValue ]]
    v9:SetAttribute(("__moonlite_%*"):format(v10), if v11 == v12 then nil else v11);
end;
local function _(v14) --[[ Line: 78 ]] --[[ Name: BoundProp ]]
    return function(v15, v16) --[[ Line: 79 ]]
        -- upvalues: v14 (copy)
        assert(v14.Get);
        return {
            Get = function() --[[ Line: 83 ]] --[[ Name: Get ]]
                -- upvalues: v14 (ref), v15 (copy), v16 (copy)
                return v14.Get(v15, v16);
            end, 
            Set = function(v17) --[[ Line: 87 ]] --[[ Name: Set ]]
                -- upvalues: v14 (ref), v15 (copy), v16 (copy)
                v14.Set(v17, v15, v16);
            end
        };
    end;
end;
local function _(v19) --[[ Line: 94 ]] --[[ Name: LazyAction ]]
    return function(v20) --[[ Line: 95 ]]
        -- upvalues: v19 (copy)
        return {
            Default = false, 
            Set = function(v21) --[[ Line: 99 ]] --[[ Name: Set ]]
                -- upvalues: v19 (ref), v20 (copy)
                if v21 then
                    v19(v20);
                end;
            end
        };
    end;
end;
local function v32(v23, v24, v25) --[[ Line: 114 ]] --[[ Name: setCameraActive ]]
    -- upvalues: l_RunService_0 (copy)
    if v25 and not v23._cameraRenderBound then
        l_RunService_0:BindToRenderStep("MoonliteRenderCamera", 1000, function() --[[ Line: 116 ]] --[[ Name: updateCamera ]]
            -- upvalues: v23 (copy), v24 (copy)
            local l__cameraAttachToPart_0 = v23._cameraAttachToPart;
            local l__cameraLookAtPart_0 = v23._cameraLookAtPart;
            if l__cameraAttachToPart_0 then
                local l_CFrame_0 = l__cameraAttachToPart_0.CFrame;
                if l__cameraLookAtPart_0 then
                    l_CFrame_0 = CFrame.new(l_CFrame_0.Position, l__cameraLookAtPart_0.Position);
                end;
                v24.CFrame = l_CFrame_0;
            end;
        end);
        v23._cameraRenderBound = true;
        local l__cameraAttachToPart_1 = v23._cameraAttachToPart;
        local l__cameraLookAtPart_1 = v23._cameraLookAtPart;
        if l__cameraAttachToPart_1 then
            local l_CFrame_1 = l__cameraAttachToPart_1.CFrame;
            if l__cameraLookAtPart_1 then
                l_CFrame_1 = CFrame.new(l_CFrame_1.Position, l__cameraLookAtPart_1.Position);
            end;
            v24.CFrame = l_CFrame_1;
        end;
        if not v23.KeepCameraType then
            v24.CameraType = Enum.CameraType.Scriptable;
            return;
        end;
    elseif not v25 and v23._cameraRenderBound then
        l_RunService_0:UnbindFromRenderStep("MoonliteRenderCamera");
        if not v23.KeepCameraType then
            v24.CameraType = Enum.CameraType.Custom;
        end;
        v23._cameraRenderBound = false;
    end;
end;
local v33 = {};
local v39 = {
    Get = function(_, v35) --[[ Line: 151 ]] --[[ Name: Get ]]
        return v35._cameraAttachToPart;
    end, 
    Set = function(v36, v37, v38) --[[ Line: 155 ]] --[[ Name: Set ]]
        -- upvalues: v32 (copy)
        if v36 then
            v38._activeCamera = v37;
            v38._cameraAttachToPart = v36;
            v32(v38, v37, true);
            return;
        else
            v38._cameraAttachToPart = nil;
            return;
        end;
    end
};
local l_v39_0 = v39 --[[ copy: 12 -> 20 ]];
v33.AttachToPart = function(v41, v42) --[[ Line: 79 ]]
    -- upvalues: l_v39_0 (copy)
    assert(l_v39_0.Get);
    return {
        Get = function() --[[ Line: 83 ]] --[[ Name: Get ]]
            -- upvalues: l_v39_0 (ref), v41 (copy), v42 (copy)
            return l_v39_0.Get(v41, v42);
        end, 
        Set = function(v43) --[[ Line: 87 ]] --[[ Name: Set ]]
            -- upvalues: l_v39_0 (ref), v41 (copy), v42 (copy)
            l_v39_0.Set(v43, v41, v42);
        end
    };
end;
v39 = {
    Get = function(_, v45) --[[ Line: 167 ]] --[[ Name: Get ]]
        return v45._cameraLookAtPart;
    end, 
    Set = function(v46, v47, v48) --[[ Line: 171 ]] --[[ Name: Set ]]
        -- upvalues: v32 (copy)
        if v46 then
            v48._activeCamera = v47;
            v48._cameraLookAtPart = v46;
            v32(v48, v47, true);
            if v48._updateCamera then
                v48._updateCamera();
                return;
            end;
        else
            v48._cameraLookAtPart = nil;
            if not v48._cameraAttachToPart then
                v32(v48, v47, false);
            end;
        end;
    end
};
local l_v39_1 = v39 --[[ copy: 12 -> 21 ]];
v33.LookAtPart = function(v50, v51) --[[ Line: 79 ]]
    -- upvalues: l_v39_1 (copy)
    assert(l_v39_1.Get);
    return {
        Get = function() --[[ Line: 83 ]] --[[ Name: Get ]]
            -- upvalues: l_v39_1 (ref), v50 (copy), v51 (copy)
            return l_v39_1.Get(v50, v51);
        end, 
        Set = function(v52) --[[ Line: 87 ]] --[[ Name: Set ]]
            -- upvalues: l_v39_1 (ref), v50 (copy), v51 (copy)
            l_v39_1.Set(v52, v50, v51);
        end
    };
end;
v3.Camera = v33;
v3.Terrain = {};
for _, v54 in Enum.Material:GetEnumItems() do
    if pcall(function() --[[ Line: 198 ]]
        -- upvalues: v54 (copy)
        workspace.Terrain:GetMaterialColor(v54);
    end) then
        local l_Terrain_0 = v3.Terrain;
        local v56 = ("MC_%*"):format(v54.Name);
        local v60 = {
            Get = function(v57) --[[ Line: 204 ]] --[[ Name: Get ]]
                -- upvalues: v54 (copy)
                return v57:GetMaterialColor(v54);
            end, 
            Set = function(v58, v59) --[[ Line: 208 ]] --[[ Name: Set ]]
                -- upvalues: v54 (copy)
                v59:SetMaterialColor(v54, v58);
            end
        };
        l_Terrain_0[v56] = function(v61, v62) --[[ Line: 79 ]]
            -- upvalues: v60 (copy)
            assert(v60.Get);
            return {
                Get = function() --[[ Line: 83 ]] --[[ Name: Get ]]
                    -- upvalues: v60 (ref), v61 (copy), v62 (copy)
                    return v60.Get(v61, v62);
                end, 
                Set = function(v63) --[[ Line: 87 ]] --[[ Name: Set ]]
                    -- upvalues: v60 (ref), v61 (copy), v62 (copy)
                    v60.Set(v63, v61, v62);
                end
            };
        end;
    end;
end;
v33 = Color3.new(1, 1, 1);
local v64 = {};
local v68 = {
    Get = function(v65) --[[ Line: 223 ]] --[[ Name: Get ]]
        return v65:GetPivot();
    end, 
    Set = function(v66, v67) --[[ Line: 227 ]] --[[ Name: Set ]]
        v67:PivotTo(v66);
    end
};
local l_v68_0 = v68 --[[ copy: 13 -> 22 ]];
v64.CFrame = function(v70, v71) --[[ Line: 79 ]]
    -- upvalues: l_v68_0 (copy)
    assert(l_v68_0.Get);
    return {
        Get = function() --[[ Line: 83 ]] --[[ Name: Get ]]
            -- upvalues: l_v68_0 (ref), v70 (copy), v71 (copy)
            return l_v68_0.Get(v70, v71);
        end, 
        Set = function(v72) --[[ Line: 87 ]] --[[ Name: Set ]]
            -- upvalues: l_v68_0 (ref), v70 (copy), v71 (copy)
            l_v68_0.Set(v72, v70, v71);
        end
    };
end;
v68 = {
    Get = function(v73) --[[ Line: 233 ]] --[[ Name: Get ]]
        -- upvalues: v33 (copy)
        local l_v33_0 = v33;
        return v73:GetAttribute("__moonlite_Color") or l_v33_0;
    end, 
    Set = function(v75, v76) --[[ Line: 237 ]] --[[ Name: Set ]]
        -- upvalues: v33 (copy)
        for _, v78 in v76:GetDescendants() do
            if v78:IsA("BasePart") then
                local l_Color_0 = v78.Color;
                local v80 = v78:GetAttribute("__moonlite_Color") or l_Color_0;
                if v80 ~= v75 then
                    v78:SetAttribute("__moonlite_Color", if v75 == v80 then nil else v75);
                    v78.Color = v75;
                end;
            end;
        end;
        v76:SetAttribute("__moonlite_Color", if v75 == v33 then nil else v75);
    end
};
local l_v68_1 = v68 --[[ copy: 13 -> 23 ]];
v64.Color = function(v82, v83) --[[ Line: 79 ]]
    -- upvalues: l_v68_1 (copy)
    assert(l_v68_1.Get);
    return {
        Get = function() --[[ Line: 83 ]] --[[ Name: Get ]]
            -- upvalues: l_v68_1 (ref), v82 (copy), v83 (copy)
            return l_v68_1.Get(v82, v83);
        end, 
        Set = function(v84) --[[ Line: 87 ]] --[[ Name: Set ]]
            -- upvalues: l_v68_1 (ref), v82 (copy), v83 (copy)
            l_v68_1.Set(v84, v82, v83);
        end
    };
end;
v68 = {
    Get = function(v85) --[[ Line: 254 ]] --[[ Name: Get ]]
        return v85:GetScale();
    end, 
    Set = function(v86, v87) --[[ Line: 258 ]] --[[ Name: Set ]]
        v87:ScaleTo(v86);
    end
};
local l_v68_2 = v68 --[[ copy: 13 -> 24 ]];
v64.Scale = function(v89, v90) --[[ Line: 79 ]]
    -- upvalues: l_v68_2 (copy)
    assert(l_v68_2.Get);
    return {
        Get = function() --[[ Line: 83 ]] --[[ Name: Get ]]
            -- upvalues: l_v68_2 (ref), v89 (copy), v90 (copy)
            return l_v68_2.Get(v89, v90);
        end, 
        Set = function(v91) --[[ Line: 87 ]] --[[ Name: Set ]]
            -- upvalues: l_v68_2 (ref), v89 (copy), v90 (copy)
            l_v68_2.Set(v91, v89, v90);
        end
    };
end;
v68 = {
    Get = function(v92) --[[ Line: 264 ]] --[[ Name: Get ]]
        return v92:GetAttribute("__moonlite_Reflectance") or 0;
    end, 
    Set = function(v93, v94) --[[ Line: 268 ]] --[[ Name: Set ]]
        if (v94:GetAttribute("__moonlite_Reflectance") or 0) ~= v93 then
            for _, v96 in v94:GetDescendants() do
                if v96:IsA("BasePart") then
                    local l_Reflectance_0 = v96.Reflectance;
                    local v98 = v96:GetAttribute("__moonlite_BaseReflectance") or l_Reflectance_0;
                    v96.Reflectance = v98 + (1 - v98) * v93;
                end;
            end;
            v94:SetAttribute("__moonlite_Reflectance", if v93 == 0 then nil else v93);
        end;
    end
};
local l_v68_3 = v68 --[[ copy: 13 -> 25 ]];
v64.Reflectance = function(v100, v101) --[[ Line: 79 ]]
    -- upvalues: l_v68_3 (copy)
    assert(l_v68_3.Get);
    return {
        Get = function() --[[ Line: 83 ]] --[[ Name: Get ]]
            -- upvalues: l_v68_3 (ref), v100 (copy), v101 (copy)
            return l_v68_3.Get(v100, v101);
        end, 
        Set = function(v102) --[[ Line: 87 ]] --[[ Name: Set ]]
            -- upvalues: l_v68_3 (ref), v100 (copy), v101 (copy)
            l_v68_3.Set(v102, v100, v101);
        end
    };
end;
v68 = {
    Get = function(v103) --[[ Line: 286 ]] --[[ Name: Get ]]
        return v103:GetAttribute("__moonlite_Transparency") or 0;
    end, 
    Set = function(v104, v105) --[[ Line: 290 ]] --[[ Name: Set ]]
        if (v105:GetAttribute("__moonlite_Transparency") or 0) ~= v104 then
            for _, v107 in v105:GetDescendants() do
                if v107:IsA("BasePart") then
                    v107.LocalTransparencyModifier = v104;
                end;
            end;
            v105:SetAttribute("__moonlite_Transparency", if v104 == 0 then nil else v104);
        end;
    end
};
local l_v68_4 = v68 --[[ copy: 13 -> 26 ]];
v64.Transparency = function(v109, v110) --[[ Line: 79 ]]
    -- upvalues: l_v68_4 (copy)
    assert(l_v68_4.Get);
    return {
        Get = function() --[[ Line: 83 ]] --[[ Name: Get ]]
            -- upvalues: l_v68_4 (ref), v109 (copy), v110 (copy)
            return l_v68_4.Get(v109, v110);
        end, 
        Set = function(v111) --[[ Line: 87 ]] --[[ Name: Set ]]
            -- upvalues: l_v68_4 (ref), v109 (copy), v110 (copy)
            l_v68_4.Set(v111, v109, v110);
        end
    };
end;
v3.Model = v64;
v64 = {
    AddAccessory = function(v112) --[[ Line: 312 ]] --[[ Name: AddAccessory ]]
        return {
            Default = nil, 
            Set = function(v113) --[[ Line: 318 ]] --[[ Name: Set ]]
                -- upvalues: v112 (copy)
                if v113 then
                    pcall(v112.AddAccessory, v112, v113);
                end;
            end
        };
    end, 
    ChangeState = function(v114) --[[ Line: 326 ]] --[[ Name: ChangeState ]]
        return {
            Default = Enum.HumanoidStateType.None, 
            Set = function(v115) --[[ Line: 330 ]] --[[ Name: Set ]]
                -- upvalues: v114 (copy)
                v114:ChangeState(v115);
            end
        };
    end, 
    EquipTool = function(v116) --[[ Line: 336 ]] --[[ Name: EquipTool ]]
        return {
            Default = nil, 
            Set = function(v117) --[[ Line: 342 ]] --[[ Name: Set ]]
                -- upvalues: v116 (copy)
                if v117 then
                    pcall(v116.EquipTool, v116, v117);
                end;
            end
        };
    end
};
v68 = function(v118) --[[ Line: 350 ]]
    v118.Jump = true;
end;
local l_v68_5 = v68 --[[ copy: 13 -> 27 ]];
v64.Jump = function(v120) --[[ Line: 95 ]]
    -- upvalues: l_v68_5 (copy)
    return {
        Default = false, 
        Set = function(v121) --[[ Line: 99 ]] --[[ Name: Set ]]
            -- upvalues: l_v68_5 (ref), v120 (copy)
            if v121 then
                l_v68_5(v120);
            end;
        end
    };
end;
v64.MoveTo = function(v122) --[[ Line: 354 ]] --[[ Name: MoveTo ]]
    local l_v122_Attribute_0 = v122:GetAttribute("MoveToDefault");
    if typeof(l_v122_Attribute_0) ~= "Vector3" then
        local l_RootPart_0 = v122.RootPart;
        l_v122_Attribute_0 = if l_RootPart_0 then l_RootPart_0.Position else Vector3.new(0, 0, 0, 0);
        v122:SetAttribute("MoveToDefault", l_v122_Attribute_0);
    end;
    return {
        Default = l_v122_Attribute_0, 
        Set = function(v125) --[[ Line: 372 ]] --[[ Name: Set ]]
            -- upvalues: v122 (copy)
            v122:MoveTo(v125);
        end
    };
end;
v64.Move = function(v126) --[[ Line: 378 ]] --[[ Name: Move ]]
    local l_v126_Attribute_0 = v126:GetAttribute("MoveDefault");
    if typeof(l_v126_Attribute_0) ~= "Vector3" then
        local l_RootPart_1 = v126.RootPart;
        l_v126_Attribute_0 = if l_RootPart_1 then l_RootPart_1.CFrame.LookVector else Vector3.new(0, 0, 0, 0);
        v126:SetAttribute("MoveDefault", l_v126_Attribute_0);
    end;
    return {
        Default = l_v126_Attribute_0, 
        Set = function(v129) --[[ Line: 396 ]] --[[ Name: Set ]]
            -- upvalues: v126 (copy)
            v126:Move(v129);
        end
    };
end;
v64.PlayEmote = function(v130) --[[ Line: 402 ]] --[[ Name: PlayEmote ]]
    return {
        Default = "", 
        Set = function(v131) --[[ Line: 406 ]] --[[ Name: Set ]]
            -- upvalues: v130 (copy)
            v130:PlayEmote(v131);
        end
    };
end;
v68 = function(v132) --[[ Line: 412 ]]
    v132:RemoveAccessories();
end;
local l_v68_6 = v68 --[[ copy: 13 -> 28 ]];
v64.RemoveAccessories = function(v134) --[[ Line: 95 ]]
    -- upvalues: l_v68_6 (copy)
    return {
        Default = false, 
        Set = function(v135) --[[ Line: 99 ]] --[[ Name: Set ]]
            -- upvalues: l_v68_6 (ref), v134 (copy)
            if v135 then
                l_v68_6(v134);
            end;
        end
    };
end;
v64.Sit = function(v136) --[[ Line: 416 ]] --[[ Name: Sit ]]
    return {
        Set = function(v137) --[[ Line: 418 ]] --[[ Name: Set ]]
            -- upvalues: v136 (copy)
            v136.Sit = v137;
        end
    };
end;
v64.TakeDamage = function(v138) --[[ Line: 424 ]] --[[ Name: TakeDamage ]]
    return {
        Set = function(v139) --[[ Line: 426 ]] --[[ Name: Set ]]
            -- upvalues: v138 (copy)
            v138:TakeDamage(v139);
        end
    };
end;
v68 = function(v140) --[[ Line: 432 ]]
    v140:UnequipTools();
end;
local l_v68_7 = v68 --[[ copy: 13 -> 29 ]];
v64.UnequipTools = function(v142) --[[ Line: 95 ]]
    -- upvalues: l_v68_7 (copy)
    return {
        Default = false, 
        Set = function(v143) --[[ Line: 99 ]] --[[ Name: Set ]]
            -- upvalues: l_v68_7 (ref), v142 (copy)
            if v143 then
                l_v68_7(v142);
            end;
        end
    };
end;
v3.Humanoid = v64;
v64 = {};
v68 = function(v144) --[[ Line: 442 ]]
    v144:Clear();
end;
local l_v68_8 = v68 --[[ copy: 13 -> 30 ]];
v64.Clear = function(v146) --[[ Line: 95 ]]
    -- upvalues: l_v68_8 (copy)
    return {
        Default = false, 
        Set = function(v147) --[[ Line: 99 ]] --[[ Name: Set ]]
            -- upvalues: l_v68_8 (ref), v146 (copy)
            if v147 then
                l_v68_8(v146);
            end;
        end
    };
end;
v64.Emit = function(v148) --[[ Line: 446 ]] --[[ Name: Emit ]]
    local l_v148_Attribute_0 = v148:GetAttribute("EmitCount");
    if type(l_v148_Attribute_0) ~= "number" then
        l_v148_Attribute_0 = 0;
    end;
    return {
        Default = l_v148_Attribute_0, 
        Set = function(v150) --[[ Line: 456 ]] --[[ Name: Set ]]
            -- upvalues: v148 (copy)
            if v150 > 0 then
                v148:Emit(v150);
            end;
        end
    };
end;
v3.ParticleEmitter = v64;
v64 = {};
v68 = function(v151) --[[ Line: 470 ]]
    local v152 = v151:Clone();
    v152.Parent = v151.Parent;
    v152.PlayOnRemove = true;
    v152:Destroy();
end;
local l_v68_9 = v68 --[[ copy: 13 -> 31 ]];
v64.PlayOnce = function(v154) --[[ Line: 95 ]]
    -- upvalues: l_v68_9 (copy)
    return {
        Default = false, 
        Set = function(v155) --[[ Line: 99 ]] --[[ Name: Set ]]
            -- upvalues: l_v68_9 (ref), v154 (copy)
            if v155 then
                l_v68_9(v154);
            end;
        end
    };
end;
v64.SetTime = function(v156) --[[ Line: 477 ]] --[[ Name: SetTime ]]
    return {
        Default = 0, 
        Set = function(v157) --[[ Line: 481 ]] --[[ Name: Set ]]
            -- upvalues: v156 (copy)
            v156.TimePosition = v157;
        end
    };
end;
v68 = function(v158) --[[ Line: 487 ]]
    v158:Play();
end;
local l_v68_10 = v68 --[[ copy: 13 -> 32 ]];
v64.Play = function(v160) --[[ Line: 95 ]]
    -- upvalues: l_v68_10 (copy)
    return {
        Default = false, 
        Set = function(v161) --[[ Line: 99 ]] --[[ Name: Set ]]
            -- upvalues: l_v68_10 (ref), v160 (copy)
            if v161 then
                l_v68_10(v160);
            end;
        end
    };
end;
v68 = function(v162) --[[ Line: 491 ]]
    v162:Resume();
end;
local l_v68_11 = v68 --[[ copy: 13 -> 33 ]];
v64.Resume = function(v164) --[[ Line: 95 ]]
    -- upvalues: l_v68_11 (copy)
    return {
        Default = false, 
        Set = function(v165) --[[ Line: 99 ]] --[[ Name: Set ]]
            -- upvalues: l_v68_11 (ref), v164 (copy)
            if v165 then
                l_v68_11(v164);
            end;
        end
    };
end;
v68 = function(v166) --[[ Line: 495 ]]
    v166:Pause();
end;
local l_v68_12 = v68 --[[ copy: 13 -> 34 ]];
v64.Pause = function(v168) --[[ Line: 95 ]]
    -- upvalues: l_v68_12 (copy)
    return {
        Default = false, 
        Set = function(v169) --[[ Line: 99 ]] --[[ Name: Set ]]
            -- upvalues: l_v68_12 (ref), v168 (copy)
            if v169 then
                l_v68_12(v168);
            end;
        end
    };
end;
v68 = function(v170) --[[ Line: 499 ]]
    v170:Stop();
end;
local l_v68_13 = v68 --[[ copy: 13 -> 35 ]];
v64.Stop = function(v172) --[[ Line: 95 ]]
    -- upvalues: l_v68_13 (copy)
    return {
        Default = false, 
        Set = function(v173) --[[ Line: 99 ]] --[[ Name: Set ]]
            -- upvalues: l_v68_13 (ref), v172 (copy)
            if v173 then
                l_v68_13(v172);
            end;
        end
    };
end;
v3.Sound = v64;
v64 = {};
v39 = {};
v68 = {};
local v185 = {
    __index = function(v174, v175) --[[ Line: 523 ]] --[[ Name: __index ]]
        -- upvalues: v39 (copy), v3 (copy)
        local l__target_0 = v174._target;
        local l_ClassName_0 = l__target_0.ClassName;
        local v178 = v39[l_ClassName_0];
        if v178 == nil then
            v178 = {};
            for v179, v180 in v3 do
                if l__target_0:IsA(v179) then
                    for v181, v182 in v180 do
                        v178[v181] = v182;
                    end;
                end;
            end;
            v39[l_ClassName_0] = v178;
        end;
        local v183 = v178[v175];
        local v184 = nil;
        if v183 then
            v184 = v183(l__target_0, v174._work);
            rawset(v174, v175, v184);
        end;
        return v184;
    end
};
return {
    Get = function(v186, v187, v188) --[[ Line: 561 ]] --[[ Name: get ]]
        -- upvalues: v68 (copy), v185 (copy)
        local v189 = v68[v187];
        if not v189 then
            v189 = setmetatable({
                _target = v187, 
                _work = v186
            }, v185);
            v187.Destroying:Connect(function() --[[ Line: 571 ]]
                -- upvalues: v68 (ref), v187 (copy), v189 (ref)
                if v68[v187] == v189 then
                    v68[v187] = nil;
                end;
            end);
            v68[v187] = assert(v189);
        end;
        return v189[v188];
    end, 
    Static = function(v190, v191) --[[ Line: 585 ]] --[[ Name: static ]]
        -- upvalues: v64 (copy), v4 (copy)
        local l_ClassName_1 = v190.ClassName;
        if not v64[l_ClassName_1] then
            local v193 = {};
            for v194, v195 in pairs(v4) do
                if v190:IsA(v194) then
                    for v196, v197 in v195 do
                        v193[v196] = v197;
                    end;
                end;
            end;
            v64[l_ClassName_1] = v193;
        end;
        return v64[l_ClassName_1][v191] == true;
    end, 
    Index = v3
};