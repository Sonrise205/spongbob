local l_ReplicatedFirst_0 = game:GetService("ReplicatedFirst");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_TweenService_0 = game:GetService("TweenService");
local v3 = require(l_ReplicatedStorage_0.Packages.Knit);
local _ = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v5 = require(l_ReplicatedStorage_0.Packages.BezierTweens);
local v6 = require(l_ReplicatedStorage_0.Packages.InstanceCache);
local v7 = require(l_ReplicatedFirst_0.PlaceIds);
local v8 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v10 = nil;
local v11 = nil;
local v12 = nil;
local v13 = nil;
local v14 = nil;
local v15 = ColorSequence.new(Color3.fromHex("#f7be2e"), Color3.fromHex("#eae78b"));
local v16 = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromHex("#1841f7")), 
    ColorSequenceKeypoint.new(0.564, Color3.fromHex("#37c5fe")), 
    ColorSequenceKeypoint.new(1, Color3.fromHex("#b5f3ff"))
});
local v17 = v3.CreateController({
    Name = script.Name
});
v17.KnitInit = function(_) --[[ Line: 49 ]] --[[ Name: KnitInit ]]
    -- upvalues: v10 (ref), v3 (copy), v11 (ref), v12 (ref), v13 (ref)
    v10 = v3.GetController("DataController");
    v11 = v3.GetService("EnemyService");
    v12 = v3.GetService("GameService");
    v13 = v3.GetController("CharacterController");
end;
v17.KnitStart = function(v19) --[[ Line: 58 ]] --[[ Name: KnitStart ]]
    -- upvalues: v7 (copy), v14 (ref), l_ReplicatedStorage_0 (copy), v6 (copy), v12 (ref), v13 (ref), v8 (copy), v16 (copy), v15 (copy), l_TweenService_0 (copy), v5 (copy), v11 (ref)
    if v7:GetDestination() ~= "Game" then
        return;
    else
        v14 = l_ReplicatedStorage_0.DamageVisual.Indicator.Amount.UIGradient.Color;
        local l_DamageVisual_0 = l_ReplicatedStorage_0.DamageVisual;
        local l_Folder_0 = Instance.new("Folder");
        l_Folder_0.Name = "DamageCache";
        l_Folder_0.Parent = workspace;
        local v22 = v6.new(l_DamageVisual_0, 150, l_Folder_0);
        local v23 = 1;
        v12.GameSpeed:Observe(function(v24) --[[ Line: 74 ]]
            -- upvalues: v23 (ref)
            v23 = v24[1];
        end);
        v12.LevelInfo:Observe(function(v25) --[[ Line: 78 ]]
            -- upvalues: v19 (copy)
            if v25 then
                v19.gamemode = v25.Mode;
            end;
        end);
        local function v39(v26, v27, v28, v29) --[[ Line: 84 ]] --[[ Name: showDamageCounter ]]
            -- upvalues: v13 (ref), v8 (ref), v22 (copy), v14 (ref), v16 (ref), v15 (ref), v19 (copy), v23 (ref), l_TweenService_0 (ref), v5 (ref)
            if v13:GetCharacter() then
                local l_v13_Position_0 = v13:GetPosition();
                if v8:Get2DDistance(l_v13_Position_0, v26) > 50 then
                    return;
                end;
            end;
            if #v22.InUse + 1 > 150 then
                return;
            else
                local l_v22_Instance_0 = v22:GetInstance();
                l_v22_Instance_0.Indicator.Amount.Text = math.round(v27);
                l_v22_Instance_0.Indicator.Amount.UIScale.Scale = 1.1;
                local l_v14_0 = v14;
                if v28 then
                    l_v14_0 = v16;
                elseif v29 then
                    l_v14_0 = v15;
                end;
                l_v22_Instance_0.Indicator.Amount.UIGradient.Color = l_v14_0;
                if v29 then
                    l_v22_Instance_0.Indicator.Amount.UIScale.Scale = 1.4;
                end;
                local v33 = nil;
                local v34 = nil;
                local v35 = nil;
                if v19.gamemode == "BossBattle" then
                    v33 = math.random(5, 15);
                    v34 = math.random(5, 15);
                    v35 = math.random(5, 15);
                    v26 = v26 + Vector3.new(math.random(-5, 5), math.random(-5, 5), math.random(-5, 5));
                else
                    v33 = math.random(1, 10);
                    v34 = math.random(10, 16);
                    v35 = math.random(1, 10);
                end;
                l_v22_Instance_0.Position = v26;
                l_v22_Instance_0.Parent = workspace.CurrentCamera;
                local v36 = 1.25 / v23;
                local v37 = l_TweenService_0:Create(l_v22_Instance_0.Indicator.Amount.UIScale, TweenInfo.new(v36, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
                    Scale = 0
                });
                local v38 = v5.Create(l_v22_Instance_0, {
                    Waypoints = {
                        v26, 
                        v26 + Vector3.new(0, 1, 0, 0) * v34, 
                        v26 + Vector3.new(math.random(-v33, v33), 0, math.random(-v35, v35))
                    }, 
                    Time = v36, 
                    EasingStyle = Enum.EasingStyle.Quad, 
                    EasingDirection = Enum.EasingDirection.InOut
                });
                v38.Completed:Once(function() --[[ Line: 159 ]]
                    -- upvalues: v38 (ref), v37 (ref), v22 (ref), l_v22_Instance_0 (ref)
                    v38:Cancel();
                    v38 = nil;
                    v37:Cancel();
                    v37:Destroy();
                    v37 = nil;
                    v22:ReturnInstance(l_v22_Instance_0);
                    l_v22_Instance_0 = nil;
                end);
                v37:Play();
                v38:Play();
                return;
            end;
        end;
        v11.EnemyDamaged:Connect(function(v40) --[[ Line: 175 ]]
            -- upvalues: v39 (copy)
            for _, v42 in v40 do
                v39(table.unpack(v42));
            end;
        end);
        return;
    end;
end;
return v17;