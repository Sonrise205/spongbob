local v0 = {};
local _ = require(script.Types);
local v2 = require(script.Specials);
local v3 = require(script.EaseFuncs);
local l_RunService_0 = game:GetService("RunService");
local l_HttpService_0 = game:GetService("HttpService");
if l_RunService_0:IsServer() then
    warn("Moonlite should NOT be used on the server! Rig transforms will not be replicated.");
end;
local v6 = {};
v6.__index = v6;
local v7 = {
    Instance = true, 
    boolean = true, 
    string = true, 
    ["nil"] = true
};
local v8 = {};
local function v12(v9, v10, v11) --[[ Line: 93 ]] --[[ Name: lerp ]]
    if type(v9) == "number" then
        assert(type(v10) == "number");
        return v9 + (v10 - v9) * v11;
    else
        return v9:Lerp(v10, v11);
    end;
end;
local function _(v13) --[[ Line: 102 ]] --[[ Name: toPath ]]
    return table.concat(v13.InstanceNames, ".");
end;
local function v23(v15, v16) --[[ Line: 106 ]] --[[ Name: resolveAnimPath ]]
    if not v15 then
        return nil;
    else
        local v17 = #v15.InstanceNames;
        local v18 = v16 or game;
        if pcall(function() --[[ Line: 114 ]]
            -- upvalues: v17 (copy), v15 (copy), v18 (ref)
            for v19 = 2, v17 do
                local v20 = v15.InstanceNames[v19];
                local v21 = v15.InstanceTypes[v19];
                local v22 = v18[v20];
                assert(typeof(v22) == "Instance");
                assert(v22.ClassName == v21);
                v18 = v22;
            end;
        end) then
            return v18;
        else
            warn("!! PATH RESOLVE FAILED:", table.concat(v15.InstanceNames, "."));
            return nil;
        end;
    end;
end;
local function v34(v24) --[[ Line: 135 ]] --[[ Name: resolveJoints ]]
    local v25 = {};
    for _, v27 in v24:GetDescendants() do
        if v27:IsA("Motor6D") and v27.Active then
            local l_Part1_0 = v27.Part1;
            local v29 = l_Part1_0 and l_Part1_0.Name;
            if v29 then
                v25[v29] = {
                    Name = v29, 
                    Joint = v27, 
                    Children = {}
                };
            end;
        end;
    end;
    for v30, v31 in v25 do
        local l_Part0_0 = v31.Joint.Part0;
        if l_Part0_0 then
            local v33 = v25[l_Part0_0.Name];
            if v33 then
                v33.Children[v30] = v31;
                v31.Parent = v33;
            end;
        end;
    end;
    return v25;
end;
local function v42(v35) --[[ Line: 173 ]] --[[ Name: parseEase ]]
    local l_Type_0 = v35:FindFirstChild("Type");
    local l_Params_0 = v35:FindFirstChild("Params");
    local v38 = {
        Type = assert(if l_Type_0 and l_Type_0:IsA("StringValue") then l_Type_0.Value else nil), 
        Params = {}
    };
    if l_Params_0 then
        for _, v40 in l_Params_0:GetChildren() do
            if v40:IsA("ValueBase") then
                local l_Value_0 = v40.Value;
                v38.Params[v40.Name] = l_Value_0;
            end;
        end;
    end;
    return v38;
end;
local function v46(v43) --[[ Line: 198 ]] --[[ Name: parseEaseOld ]]
    local l_Style_0 = v43:FindFirstChild("Style");
    assert(l_Style_0 and l_Style_0:IsA("StringValue"), "No style in legacy ease!");
    local l_Direction_0 = v43:FindFirstChild("Direction");
    assert(l_Direction_0 and l_Direction_0:IsA("StringValue"), "No direction in legacy ease!");
    return {
        Type = l_Style_0.Value, 
        Params = {
            Direction = l_Direction_0.Value
        }
    };
end;
local function v51(v47) --[[ Line: 214 ]] --[[ Name: readValue ]]
    if v47:IsA("ValueBase") then
        local v48 = if tonumber(v47.Name) then assert(v47.Parent) else v47;
        local l_Value_1 = v47.Value;
        local l_EnumType_0 = v48:FindFirstChild("EnumType");
        if l_EnumType_0 and l_EnumType_0:IsA("StringValue") then
            return Enum[l_EnumType_0.Value][l_Value_1];
        elseif v48:FindFirstChild("Vector2") then
            return (Vector2.new(l_Value_1.X, l_Value_1.Y));
        elseif v48:FindFirstChild("ColorSequence") then
            return (ColorSequence.new(l_Value_1));
        elseif v48:FindFirstChild("NumberSequence") then
            return (NumberSequence.new(l_Value_1));
        else
            if v48:FindFirstChild("NumberRange") then
                l_Value_1 = NumberRange.new(l_Value_1);
            end;
            return l_Value_1;
        end;
    else
        return v47:GetAttribute("Value");
    end;
end;
local function v57(v52, v53, v54) --[[ Line: 242 ]] --[[ Name: getPropValue ]]
    -- upvalues: v2 (copy)
    if v53 then
        local v55 = v2.Get(v52._scratch, v53, v54);
        if v55 then
            local l_Get_0 = v55.Get;
            if l_Get_0 then
                return pcall(l_Get_0, v53);
            else
                return true, v55.Default;
            end;
        end;
    end;
    return pcall(function() --[[ Line: 257 ]]
        -- upvalues: v53 (copy), v54 (copy)
        return v53[v54];
    end);
end;
local function v64(v58, v59, v60, v61, v62) --[[ Line: 262 ]] --[[ Name: setPropValue ]]
    -- upvalues: v2 (copy)
    if v59 then
        local v63 = v2.Get(v58._scratch, v59, v60);
        if v63 then
            if v63.Get == nil and v62 and v61 == true then
                v61 = false;
            end;
            return pcall(v63.Set, v61);
        end;
    end;
    return pcall(function() --[[ Line: 279 ]]
        -- upvalues: v59 (copy), v60 (copy), v61 (ref)
        v59[v60] = v61;
    end);
end;
local function v81(v65) --[[ Line: 284 ]] --[[ Name: parseKeyframePack ]]
    -- upvalues: v51 (copy), v42 (copy), v46 (copy)
    local v66 = tonumber(v65.Name);
    assert(v66, "Bad frame number");
    local l_Values_0 = v65:FindFirstChild("Values");
    assert(l_Values_0, "No value folder!");
    assert(l_Values_0:FindFirstChild("0"), "No starting value!");
    local v68 = {};
    local v69 = 0;
    for _, v71 in l_Values_0:GetChildren() do
        local v72 = tonumber(v71.Name);
        if v72 then
            local l_status_0, l_result_0 = pcall(v51, v71);
            if l_status_0 then
                v68[v72] = l_result_0;
                v69 = math.max(v72, v69);
            end;
        end;
    end;
    local l_Eases_0 = v65:FindFirstChild("Eases");
    local l_Ease_0 = v65:FindFirstChild("Ease");
    local v77 = {};
    if l_Eases_0 then
        for _, v79 in l_Eases_0:GetChildren() do
            local v80 = tonumber(v79.Name);
            assert(v80, (("Bad index on ease @%*"):format((v79:GetFullName()))));
            v77[v80] = v42(v79);
        end;
    elseif l_Ease_0 then
        v77[v69] = v46(l_Ease_0);
    end;
    return {
        FrameIndex = v66, 
        FrameCount = v69, 
        Values = v68, 
        Eases = v77
    };
end;
local function v99(v82, v83) --[[ Line: 335 ]] --[[ Name: unpackKeyframes ]]
    -- upvalues: v81 (copy)
    local v84 = {};
    local v85 = {};
    local v86 = {};
    for _, v88 in v82:GetChildren() do
        local v89 = tonumber(v88.Name);
        if v89 then
            v84[v89] = v81(v88);
            table.insert(v85, v89);
        end;
    end;
    table.sort(v85);
    for v90 = 2, #v85 do
        local v91 = v84[v85[v90 - 1]];
        local v92 = v84[v85[v90]];
        v91.Next = v92;
        v92.Prev = v91;
    end;
    local v93 = v84[v85[1]];
    while v93 do
        local l_FrameIndex_0 = v93.FrameIndex;
        local v95 = nil;
        for v96 = 0, v93.FrameCount do
            local v97 = v93.Eases[v96] or v95;
            local v98 = v93.Values[v96];
            if v98 ~= nil then
                if v83 then
                    v98 = v83(v98);
                end;
                table.insert(v86, {
                    Time = l_FrameIndex_0 + v96, 
                    Value = v98, 
                    Ease = v97
                });
                if v97 then
                    v95 = v97;
                end;
            end;
        end;
        v93 = v93.Next;
    end;
    return v86;
end;
local function _(v100, v101) --[[ Line: 393 ]] --[[ Name: readValueBase ]]
    local l_v100_FirstChild_0 = v100:FindFirstChild(v101);
    assert(l_v100_FirstChild_0 and l_v100_FirstChild_0:IsA("ValueBase"));
    return l_v100_FirstChild_0.Value;
end;
local function v148(v104, v105, v106) --[[ Line: 399 ]] --[[ Name: compileItem ]]
    -- upvalues: v23 (copy), v34 (copy), v51 (copy), v99 (copy), v2 (copy)
    local v107 = table.find(v104._data.Items, v105);
    if not v107 then
        return;
    else
        local l_Path_0 = v105.Path;
        local l_ItemType_0 = l_Path_0.ItemType;
        local v110 = v105.Override or v23(l_Path_0, v104._root);
        local l_FirstChild_0 = v104._save:FindFirstChild((tostring(v107)));
        if not v110 or not l_FirstChild_0 then
            return;
        else
            assert(v110);
            assert(l_FirstChild_0);
            local l_Rig_0 = l_FirstChild_0:FindFirstChild("Rig");
            local l_MarkerTrack_0 = l_FirstChild_0:FindFirstChild("MarkerTrack");
            if l_Rig_0 and l_ItemType_0 == "Rig" then
                local v114 = v34(v110);
                for _, v116 in l_Rig_0:GetChildren() do
                    if v116.Name == "_joint" then
                        local l__hier_0 = v116:FindFirstChild("_hier");
                        local l_default_0 = v116:FindFirstChild("default");
                        local l__keyframes_0 = v116:FindFirstChild("_keyframes");
                        if l_default_0 then
                            l_default_0 = v51(l_default_0);
                        end;
                        do
                            local l_l_default_0_0 = l_default_0;
                            if l__hier_0 and l__keyframes_0 then
                                local v121 = v51(l__hier_0);
                                local v122 = v121:gmatch("[^%.]+");
                                local v123 = v114[v122()];
                                while v123 do
                                    local l_Children_0 = v123.Children;
                                    local v125 = v122();
                                    if v125 ~= nil then
                                        if l_Children_0[v125] then
                                            v123 = l_Children_0[v125];
                                        else
                                            warn((("failed to resolve joint '%*' (could not find child '%*' in %*!)"):format(v121, v125, v123.Name)));
                                            v123 = nil;
                                        end;
                                    else
                                        break;
                                    end;
                                end;
                                if v123 then
                                    local l_Joint_0 = v123.Joint;
                                    v106[l_Joint_0] = {
                                        Props = {
                                            Transform = {
                                                Default = CFrame.identity, 
                                                Static = false, 
                                                Sequence = v99(l__keyframes_0, function(v127) --[[ Line: 466 ]]
                                                    -- upvalues: l_l_default_0_0 (ref)
                                                    return v127:Inverse() * l_l_default_0_0;
                                                end)
                                            }
                                        }, 
                                        Target = l_Joint_0
                                    };
                                end;
                            end;
                        end;
                    end;
                end;
            end;
            local v128 = {};
            for _, v130 in l_FirstChild_0:GetChildren() do
                if v130:IsA("Folder") and v130 ~= l_MarkerTrack_0 and v130.Name ~= "Rig" then
                    local l_default_1 = v130:FindFirstChild("default");
                    local l_Name_0 = v130.Name;
                    if l_default_1 then
                        l_default_1 = v51(l_default_1);
                    end;
                    v128[l_Name_0] = {
                        Default = l_default_1, 
                        Static = v2.Static(v110, l_Name_0), 
                        Sequence = v99(v130)
                    };
                end;
            end;
            v106[v110] = {
                Props = v128, 
                Target = v110
            };
            if l_MarkerTrack_0 then
                local v133 = {};
                v104._markers[v110] = v133;
                for _, v135 in l_MarkerTrack_0:GetChildren() do
                    if v135:FindFirstChild("name") then
                        local v136 = assert((tonumber(v135.Name)));
                        local l_width_0 = v135:FindFirstChild("width");
                        assert(l_width_0 and l_width_0:IsA("ValueBase"));
                        local l_Value_2 = l_width_0.Value;
                        local l_name_0 = v135:FindFirstChild("name");
                        assert(l_name_0 and l_name_0:IsA("ValueBase"));
                        l_width_0 = l_name_0.Value;
                        l_name_0 = {};
                        local l_KFMarkers_0 = v135:FindFirstChild("KFMarkers");
                        if l_KFMarkers_0 then
                            for _, v142 in l_KFMarkers_0:GetChildren() do
                                if v142:IsA("ValueBase") then
                                    local l_Value_3 = v142.Value;
                                    local l_Val_0 = v142:FindFirstChild("Val");
                                    assert(l_Val_0 and l_Val_0:IsA("ValueBase"));
                                    l_name_0[l_Value_3] = l_Val_0.Value;
                                end;
                            end;
                        end;
                        local v145 = v133[v136];
                        if not v145 then
                            v145 = {
                                StartMarkers = {}, 
                                EndMarkers = {}
                            };
                            v133[v136] = v145;
                        end;
                        if l_Value_2 > 0 then
                            local v146 = math.min(v136 + l_Value_2, v104.Frames);
                            local v147 = v133[v146];
                            if not v147 then
                                v147 = {
                                    StartMarkers = {}, 
                                    EndMarkers = {}
                                };
                                v133[v146] = v147;
                            end;
                            v147.EndMarkers[l_width_0] = l_name_0;
                        end;
                        v145.StartMarkers[l_width_0] = l_name_0;
                    end;
                end;
            end;
            return;
        end;
    end;
end;
local function v171(v149) --[[ Line: 564 ]] --[[ Name: getInterpolator ]]
    -- upvalues: v7 (copy), v12 (copy)
    if typeof(v149) == "ColorSequence" then
        return function(v150, v151, v152) --[[ Line: 566 ]]
            local l_Value_4 = v150.Keypoints[1].Value;
            local l_Value_5 = v151.Keypoints[1].Value;
            local v155;
            if type(l_Value_4) == "number" then
                assert(type(l_Value_5) == "number");
                v155 = l_Value_4 + (l_Value_5 - l_Value_4) * v152;
            else
                v155 = l_Value_4:Lerp(l_Value_5, v152);
            end;
            return ColorSequence.new(v155);
        end;
    elseif typeof(v149) == "NumberSequence" then
        return function(v156, v157, v158) --[[ Line: 571 ]]
            local l_Value_6 = v156.Keypoints[1].Value;
            local l_Value_7 = v157.Keypoints[1].Value;
            local v161;
            if type(l_Value_6) == "number" then
                assert(type(l_Value_7) == "number");
                v161 = l_Value_6 + (l_Value_7 - l_Value_6) * v158;
            else
                v161 = l_Value_6:Lerp(l_Value_7, v158);
            end;
            return NumberSequence.new(v161);
        end;
    elseif typeof(v149) == "NumberRange" then
        return function(v162, v163, v164) --[[ Line: 576 ]]
            local l_Min_0 = v162.Min;
            local l_Min_1 = v163.Min;
            local v167;
            if type(l_Min_0) == "number" then
                assert(type(l_Min_1) == "number");
                v167 = l_Min_0 + (l_Min_1 - l_Min_0) * v164;
            else
                v167 = l_Min_0:Lerp(l_Min_1, v164);
            end;
            return NumberRange.new(v167);
        end;
    elseif v7[typeof(v149)] then
        return function(v168, v169, v170) --[[ Line: 581 ]]
            if v170 >= 1 then
                return v169;
            else
                return v168;
            end;
        end;
    else
        return v12;
    end;
end;
local function v193(v172, v173) --[[ Line: 593 ]] --[[ Name: compileFrames ]]
    -- upvalues: v171 (copy), v3 (copy)
    local l__buffer_0 = v172._buffer;
    for v175, v176 in v173 do
        local v177 = {};
        l__buffer_0[v175] = v177;
        for v178, v179 in v176.Props do
            if v179.Sequence[1] then
                local v180 = nil;
                local v181 = 0;
                local l_Default_0 = v179.Default;
                local v183 = v171(v179.Sequence[1].Value);
                for _, v185 in v179.Sequence do
                    if not v177[v185.Time] then
                        v177[v185.Time] = {};
                    end;
                    local v186 = v185.Time - v181;
                    v177[v185.Time][v178] = v185.Value;
                    if v186 <= 1 then
                        l_Default_0 = v185.Value;
                        v180 = v185.Ease;
                        v181 = v185.Time;
                    else
                        if not v179.Static then
                            local v187 = v3.Get(v180);
                            for v188 = 0, v186 do
                                local v189 = v187(v188 / v186);
                                local v190 = v181 + v188;
                                if not v177[v190] then
                                    v177[v190] = {};
                                end;
                                v177[v190][v178] = v183(l_Default_0, v185.Value, v189);
                            end;
                        end;
                        v180 = v185.Ease;
                        l_Default_0 = v185.Value;
                        v181 = v185.Time;
                    end;
                end;
                if not v179.Static and v181 < v172.Frames then
                    local v191 = v177[v181][v178];
                    for v192 = v181, v172.FrameRate do
                        if not v177[v192] then
                            v177[v192] = {};
                        end;
                        v177[v192][v178] = v191;
                    end;
                end;
            end;
        end;
    end;
end;
local function v198(v194) --[[ Line: 660 ]] --[[ Name: compileRouting ]]
    -- upvalues: v148 (copy), v193 (copy)
    table.clear(v194._buffer);
    table.clear(v194._elements);
    table.clear(v194._markers);
    local v195 = {};
    for _, v197 in v194._data.Items do
        v148(v194, v197, v195);
    end;
    v193(v194, v195);
    v194._compiled = true;
end;
local function v205(v199) --[[ Line: 675 ]] --[[ Name: restoreTrack ]]
    -- upvalues: v8 (copy), v64 (copy)
    local v200 = v8[v199];
    if not v200 then
        return;
    else
        if v199.RestoreDefaults then
            for v201, v202 in v200 do
                for v203, v204 in v202 do
                    v64(v199, v201, v203, v204);
                end;
            end;
        end;
        v8[v199] = nil;
        return;
    end;
end;
local function v221(v206, v207) --[[ Line: 693 ]] --[[ Name: stepTrack ]]
    -- upvalues: v64 (copy)
    local v208 = math.floor(v206.TimePosition * v206.FrameRate);
    v207 = math.min(v207, 1 / v206.FrameRate);
    if v206.Frames < v208 then
        if v206.Looped then
            v208 = 0;
            v206.TimePosition = 0;
        else
            v206._completed:Fire(Enum.PlaybackState.Completed);
            return true;
        end;
    end;
    for v209, v210 in v206._buffer do
        if v206._locks[v209] == nil then
            local v211 = v210[v208];
            if v211 then
                for v212, v213 in v211 do
                    v64(v206, v209, v212, v213);
                end;
            end;
        end;
    end;
    for v214, v215 in v206._markers do
        local v216 = v215[v208];
        if v216 then
            for v217, v218 in v216.StartMarkers do
                if v206._markerSignals[v217] then
                    v206._markerSignals[v217]:Fire(v214, v218);
                end;
            end;
            for v219, v220 in v216.EndMarkers do
                if v206._endMarkerSignals[v219] then
                    v206._endMarkerSignals[v219]:Fire(v214, v220);
                end;
            end;
        end;
    end;
    if v206.isPaused then
        return false;
    else
        v206.TimePosition = v206.TimePosition + v207;
        return false;
    end;
end;
v0.CreatePlayer = function(v222, v223) --[[ Line: 750 ]] --[[ Name: CreatePlayer ]]
    -- upvalues: l_HttpService_0 (copy), v6 (copy), v198 (copy)
    local v224 = l_HttpService_0:JSONDecode(v222.Value);
    local l_BindableEvent_0 = Instance.new("BindableEvent");
    local l_BindableEvent_1 = Instance.new("BindableEvent");
    local l_BindableEvent_2 = Instance.new("BindableEvent");
    local v228 = setmetatable({
        Completed = l_BindableEvent_0.Event, 
        Paused = l_BindableEvent_1.Event, 
        Resumed = l_BindableEvent_2.Event, 
        Looped = v224.Information.Looped, 
        Frames = v224.Information.Length, 
        FrameRate = v224.Information.FPS or 60, 
        RestoreDefaults = true, 
        TimePosition = 0, 
        isPaused = false, 
        _save = v222, 
        _data = v224, 
        _compiled = false, 
        _completed = l_BindableEvent_0, 
        _paused = l_BindableEvent_1, 
        _resumed = l_BindableEvent_2, 
        _markers = {}, 
        _markerSignals = {}, 
        _endMarkerSignals = {}, 
        _locks = {}, 
        _elements = {}, 
        _buffer = {}, 
        _scratch = {}, 
        _root = v223
    }, v6);
    v198(v228);
    return v228;
end;
v6.Destroy = function(v229) --[[ Line: 792 ]] --[[ Name: Destroy ]]
    for _, v231 in v229._markerSignals do
        v231:Destroy();
    end;
    for _, v233 in v229._endMarkerSignals do
        v233:Destroy();
    end;
    v229._completed:Destroy();
    v229._paused:Destroy();
    v229._resumed:Destroy();
    table.clear(v229._markerSignals);
    table.clear(v229._endMarkerSignals);
end;
v6.IsPlaying = function(v234) --[[ Line: 809 ]] --[[ Name: IsPlaying ]]
    -- upvalues: v8 (copy)
    return v8[v234] ~= nil;
end;
v6.GetTimeLength = function(v235) --[[ Line: 813 ]] --[[ Name: GetTimeLength ]]
    return v235.Frames / v235.FrameRate;
end;
v6.GetMarkerReachedSignal = function(v236, v237) --[[ Line: 817 ]] --[[ Name: GetMarkerReachedSignal ]]
    if not v236._markerSignals[v237] then
        v236._markerSignals[v237] = Instance.new("BindableEvent");
    end;
    return v236._markerSignals[v237].Event;
end;
v6.GetMarkerEndedSignal = function(v238, v239) --[[ Line: 825 ]] --[[ Name: GetMarkerEndedSignal ]]
    if not v238._endMarkerSignals[v239] then
        v238._endMarkerSignals[v239] = Instance.new("BindableEvent");
    end;
    return v238._endMarkerSignals[v239].Event;
end;
v6.GetSetting = function(v240, v241) --[[ Line: 833 ]] --[[ Name: GetSetting ]]
    return v240._scratch[v241];
end;
v6.SetSetting = function(v242, v243, v244) --[[ Line: 837 ]] --[[ Name: SetSetting ]]
    v242._scratch[v243] = v244;
end;
v6.GetElements = function(v245) --[[ Line: 841 ]] --[[ Name: GetElements ]]
    return table.clone(v245._elements);
end;
v6.LockElement = function(v246, v247, v248) --[[ Line: 845 ]] --[[ Name: LockElement ]]
    if not v246._locks[v247] then
        v246._locks[v247] = {};
    end;
    if v248 then
        v246._locks[v247][v248 or "Default"] = true;
    end;
    return true;
end;
v6.UnlockElement = function(v249, v250, v251) --[[ Line: 857 ]] --[[ Name: UnlockElement ]]
    local v252 = v249._locks[v250];
    if v252 then
        v252[v251 or "Default"] = nil;
        if not next(v252) then
            v249._locks[v250] = nil;
        end;
    end;
    return true;
end;
v6.IsElementLocked = function(v253, v254) --[[ Line: 871 ]] --[[ Name: IsElementLocked ]]
    return v253._locks[v254] ~= nil;
end;
v6.ReplaceElementByPath = function(v255, v256, v257) --[[ Line: 875 ]] --[[ Name: ReplaceElementByPath ]]
    -- upvalues: v198 (copy)
    for _, v259 in v255._data.Items do
        local l_Path_1 = v259.Path;
        local v261 = table.concat(l_Path_1.InstanceNames, ".");
        if v256:lower() == v261:lower() and (l_Path_1.ItemType == "Rig" or v257:IsA(l_Path_1.ItemType)) then
            v259.Override = v257;
            v198(v255);
            return true;
        end;
    end;
    return false;
end;
v6.FindElement = function(v262, v263) --[[ Line: 895 ]] --[[ Name: FindElement ]]
    for _, v265 in v262._elements do
        if v265 and v265.Name == v263 then
            return v265;
        end;
    end;
    return nil;
end;
v6.FindElementOfType = function(v266, v267) --[[ Line: 905 ]] --[[ Name: FindElementOfType ]]
    for _, v269 in v266._elements do
        if v269 and v269:IsA(v267) then
            return v269;
        end;
    end;
    return nil;
end;
v6.Stop = function(v270) --[[ Line: 915 ]] --[[ Name: Stop ]]
    -- upvalues: v205 (copy)
    v270.TimePosition = 0;
    v270.isPaused = false;
    task.spawn(v205, v270);
    v270._completed:Fire(Enum.PlaybackState.Cancelled);
end;
v6.Reset = function(v271) --[[ Line: 922 ]] --[[ Name: Reset ]]
    -- upvalues: v221 (copy)
    v271.TimePosition = 0;
    v271.isPaused = false;
    v221(v271, 0);
    return true;
end;
v6.Play = function(v272) --[[ Line: 930 ]] --[[ Name: Play ]]
    -- upvalues: v8 (copy), v57 (copy)
    if v8[v272] then
        return;
    else
        if v272.TimePosition >= v272:GetTimeLength() then
            v272.TimePosition = 0;
        end;
        v272.isPaused = false;
        local v273 = {};
        for v274, v275 in v272._buffer do
            if v275[0] then
                local v276 = {};
                v273[v274] = v276;
                for v277 in v275[0] do
                    local v278, v279 = v57(v272, v274, v277);
                    if v278 then
                        v276[v277] = v279;
                    end;
                end;
            end;
        end;
        v8[v272] = v273;
        v272._completed:Fire(Enum.PlaybackState.Playing);
        return;
    end;
end;
v6.Pause = function(v280) --[[ Line: 962 ]] --[[ Name: Pause ]]
    v280.isPaused = true;
    v280._paused:Fire(v280.TimePosition);
end;
v6.Resume = function(v281) --[[ Line: 967 ]] --[[ Name: Resume ]]
    v281.isPaused = false;
    v281._resumed:Fire(v281.TimePosition);
end;
l_RunService_0:BindToRenderStep("__UPDATE_MOONLITE_TRACKS", Enum.RenderPriority.Camera.Value + 1, function(v282) --[[ Line: 972 ]]
    -- upvalues: v8 (copy), v221 (copy), v205 (copy)
    for v283 in v8 do
        if v221(v283, v282) then
            v205(v283);
        end;
    end;
end);
return v0;