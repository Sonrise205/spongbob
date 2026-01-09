local _ = game:GetService("ContentProvider");
local _ = game:GetService("HttpService");
local _ = game:GetService("Players");
local l_ReplicatedFirst_0 = game:GetService("ReplicatedFirst");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("RunService");
local l_TweenService_0 = game:GetService("TweenService");
local v7 = require(l_ReplicatedStorage_0.Packages.Knit);
local v8 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v9 = require(l_ReplicatedStorage_0.Packages.Promise);
local _ = require(l_ReplicatedStorage_0.Packages.TableUtil);
local v11 = require(l_ReplicatedStorage_0.Packages.WaitFor);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v13 = require(l_ReplicatedFirst_0.PlaceIds);
local v14 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local v15 = require(l_ReplicatedStorage_0.Shared.Modules.Tweener);
local _ = require(l_ReplicatedStorage_0.Shared.Util.PathUtil);
local _ = require(l_ReplicatedStorage_0.Shared.Data.Variables);
local v18 = require(v7.Player.PlayerScripts.Knit.Modules.ClientAnimator);
local v19 = require(l_ReplicatedStorage_0.BossBattleData);
local v20 = v7.GetController("CamShakeController");
local _ = v7.GetController("CharacterController");
local v22 = v7.GetController("UIController");
local v23 = v7.GetController("AudioController");
local _ = v7.GetController("TowerController");
local _ = v7.GetController("DeviceTypeController");
local v26 = v7.GetController("BossBattleController");
local v27 = nil;
local v28 = nil;
local v29 = nil;
local v30 = nil;
local v31 = {};
v31.__index = v31;
v31.new = function(v32, v33, v34) --[[ Line: 68 ]] --[[ Name: new ]]
    -- upvalues: v19 (copy), v8 (copy), v31 (copy), v13 (copy), v28 (ref), l_ReplicatedStorage_0 (copy), v29 (ref), v30 (ref), v14 (copy)
    local v35 = setmetatable({
        timestamp = v32, 
        bossIndex = v33, 
        tierIndex = v34, 
        bossData = v19:GetBossFromIndex(v33), 
        tierData = v19:GetBossFromIndex(v33, v34), 
        dumpster = v8.new()
    }, v31);
    if not v13:IsGame() then
        return;
    else
        v28 = l_ReplicatedStorage_0.VFX.BossSummon;
        v29 = l_ReplicatedStorage_0.Models.Enemies;
        v30 = workspace:FindFirstChild("Enemies");
        local l_Map_0 = workspace:FindFirstChild("Map");
        if not l_Map_0 then
            return;
        else
            v35.map = l_Map_0;
            v35.bossSpawnPivot = l_Map_0.BossSpawn:GetPivot();
            v35.summonVFXModel = v28[tostring(v34)]:Clone();
            v35.summonVFXModel:PivotTo(v35.bossSpawnPivot);
            v35.summonVFX = {
                Summon = {}, 
                Land = {}
            };
            v14:IterateClass(v35.summonVFXModel.Land, "ParticleEmitter", function(v37) --[[ Line: 102 ]]
                -- upvalues: v35 (copy)
                table.insert(v35.summonVFX.Land, v37);
            end);
            v14:IterateClass(v35.summonVFXModel.Summon, "ParticleEmitter", function(v38) --[[ Line: 106 ]]
                -- upvalues: v35 (copy)
                table.insert(v35.summonVFX.Summon, v38);
            end);
            v35.dumpster:Add(v35.summonVFXModel);
            return v35;
        end;
    end;
end;
v31.Play = function(v39) --[[ Line: 116 ]] --[[ Name: Play ]]
    -- upvalues: v23 (copy), v26 (copy), l_TweenService_0 (copy), v11 (copy), v30 (ref), v29 (ref), v18 (copy), v15 (copy), v14 (copy), v20 (copy)
    local l_CurrentCamera_0 = workspace.CurrentCamera;
    v23:FadeMusicVolume(0.5, 1);
    local v41 = v26:StopIdleLoop();
    local l_FieldOfView_0 = l_CurrentCamera_0.FieldOfView;
    v39.dumpster:Add(function() --[[ Line: 124 ]]
        -- upvalues: v23 (ref)
        v23:FadeMusicVolume(1, 0.5);
    end);
    local v43 = l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(3.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
        CFrame = l_CurrentCamera_0.CFrame * CFrame.new(0, 0, -20), 
        FieldOfView = 110
    });
    local v44 = v23:PlaySound({
        name = "Cutscenes.BassDrop", 
        soundGroup = "Master.SFX.VFX"
    });
    v39.dumpster:Add(v44);
    v43:Play();
    v39:_addTweenToDumpster(v43);
    local v45 = v11.Custom(function() --[[ Line: 151 ]]
        -- upvalues: v30 (ref)
        return v30:GetChildren()[1];
    end):expect();
    local l_VisualModel_0 = v45.VisualModel;
    local l_Scale_0 = v29:FindFirstChild(v39.bossData.Name):GetScale();
    local v48 = l_VisualModel_0:GetScale() / l_Scale_0;
    v39.summonVFXModel:ScaleTo(v39.summonVFXModel:GetScale() * v48);
    v39.summonVFXModel.Parent = v45;
    local l_l_VisualModel_0_ExtentsSize_0 = l_VisualModel_0:GetExtentsSize();
    local v50 = math.max(l_l_VisualModel_0_ExtentsSize_0.X, l_l_VisualModel_0_ExtentsSize_0.Z);
    local l_Weld_0 = v45.PrimaryPart.Weld;
    l_Weld_0.C1 = CFrame.new(0, -l_l_VisualModel_0_ExtentsSize_0.Y * 2, 0);
    v18.new(v39.bossData.Name, l_VisualModel_0, "Enemies"):Play("Summon", {
        props = {
            speed = 0.5
        }
    });
    v39.dumpster:Add(v15("CFrameValue", l_Weld_0.C1, TweenInfo.new(0.6, Enum.EasingStyle.Quint, Enum.EasingDirection.In), {
        Value = CFrame.new()
    }, function(v52) --[[ Line: 184 ]]
        -- upvalues: l_Weld_0 (copy)
        l_Weld_0.C1 = v52;
    end));
    if not v39:_delay(0.6) then
        return false;
    else
        v43:Cancel();
        v14:ToggleEmitters(v39.summonVFX.Land, true);
        v14:ToggleEmitters(v39.summonVFX.Summon, true, true);
        local v53 = v23:PlaySound({
            name = "Cutscenes.Explosion", 
            soundGroup = "Master.SFX.VFX"
        });
        v39.dumpster:Add(v53);
        v20:Shake("BigShake");
        local v54 = os.clock();
        local v55 = math.min(80, v50 + 15);
        local v56 = nil;
        v56 = (CFrame.lookAt(l_CurrentCamera_0.CFrame.Position, v39.bossSpawnPivot.Position).Rotation + v39.bossSpawnPivot.Position) * CFrame.new(0, 0, v55);
        v56 = l_CurrentCamera_0.CFrame.Rotation + v56.Position;
        v39.dumpster:Add(v15("CFrameValue", l_CurrentCamera_0.CFrame, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
            Value = v56
        }, function(v57) --[[ Line: 226 ]]
            -- upvalues: v20 (ref), l_CurrentCamera_0 (copy)
            v20:SetOriginalPivot(v57);
            if not v20:IsShaking() then
                l_CurrentCamera_0.CFrame = v57;
            end;
        end));
        l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
            FieldOfView = l_FieldOfView_0
        }):Play();
        if not v39:_waitForShakeStop() then
            return false;
        else
            local v58 = os.clock() - v54;
            if v58 < 0.3 and not v39:_delay(0.3 - v58) then
                return false;
            else
                local l_Position_0 = v39.bossSpawnPivot.Position;
                v58 = v39.bossSpawnPivot.Y + math.max(30, l_l_VisualModel_0_ExtentsSize_0.Y * 1.75);
                local v60 = (-1.5707963267948966 - v41 % 3.141592653589793) % 3.141592653589793;
                local v61 = v41 + 3.141592653589793 + v60;
                v39.dumpster:Add(v15("NumberValue", v41, TweenInfo.new(2, Enum.EasingStyle.Quad), {
                    Value = v61
                }, function(v62, v63) --[[ Line: 280 ]]
                    -- upvalues: v39 (copy), v55 (copy), v58 (copy), l_Position_0 (copy), l_CurrentCamera_0 (copy)
                    v62 = v62 % 6.283185307179586;
                    local v64 = v39.bossSpawnPivot.X + math.cos(v62) * v55;
                    local v65 = v39.bossSpawnPivot.Z + math.sin(v62) * v55;
                    local v66 = Vector3.new(v64, v58, v65);
                    local v67 = CFrame.lookAt(v66, l_Position_0);
                    if not v63 then
                        l_CurrentCamera_0.CFrame = v67;
                        return;
                    else
                        l_CurrentCamera_0.CFrame = l_CurrentCamera_0.CFrame:Lerp(v67, v63 * 10);
                        return;
                    end;
                end));
                if not v39:_delay(2) then
                    return false;
                else
                    v14:ToggleEmitters(v39.summonVFX.Summon, false);
                    v26:StartIdleLoop();
                    v39:_cleanup(true);
                    return true;
                end;
            end;
        end;
    end;
end;
v31.Skip = function(v68) --[[ Line: 312 ]] --[[ Name: Skip ]]
    v68:_cleanup();
end;
v31._cleanup = function(v69) --[[ Line: 318 ]] --[[ Name: _cleanup ]]
    v69.dumpster:Destroy();
    table.clear(v69);
    setmetatable(v69, nil);
end;
v31._delay = function(v70, v71) --[[ Line: 324 ]] --[[ Name: _delay ]]
    -- upvalues: v9 (copy)
    local v72 = v9.delay(v71);
    v70.dumpster:Add(v72);
    return v72:await();
end;
v31._addTweenToDumpster = function(v73, v74) --[[ Line: 331 ]] --[[ Name: _addTweenToDumpster ]]
    v73.dumpster:Add(function() --[[ Line: 332 ]]
        -- upvalues: v74 (copy)
        v74:Cancel();
        v74:Destroy();
    end);
end;
v31._stopShake = function(v75) --[[ Line: 338 ]] --[[ Name: _stopShake ]]
    -- upvalues: v20 (copy)
    v20:Stop();
    return v75:_waitForShakeStop();
end;
v31._waitForShakeStop = function(v76) --[[ Line: 344 ]] --[[ Name: _waitForShakeStop ]]
    -- upvalues: v9 (copy), v20 (copy)
    local v78 = v9.new(function(v77) --[[ Line: 345 ]]
        -- upvalues: v20 (ref)
        v20:BindToEnd(v77);
    end);
    v76.dumpster:Add(v78);
    return v78:await();
end;
v7.OnStart():andThen(function() --[[ Line: 354 ]]
    -- upvalues: v13 (copy), v27 (ref), v22 (copy)
    if not v13:IsGame() then
        return;
    else
        v27 = v22:GetModuleAsync("Sting"):expect();
        return;
    end;
end);
return v31;