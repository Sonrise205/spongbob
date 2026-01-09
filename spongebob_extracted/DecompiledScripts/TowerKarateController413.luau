local l_Players_0 = game:GetService("Players");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_TweenService_0 = game:GetService("TweenService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_ReplicatedFirst_0 = game:GetService("ReplicatedFirst");
local v5 = require(l_ReplicatedStorage_0.Packages.Knit);
local v6 = require(l_ReplicatedStorage_0.Packages.TableUtil);
local v7 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v8 = require(l_ReplicatedStorage_0.Packages.RailUtil);
local v9 = require(l_ReplicatedStorage_0.Shared.TowerOfKarate.GlovesData);
local _ = require(l_ReplicatedStorage_0.Packages.Janitor);
local v11 = require(l_ReplicatedStorage_0.Packages.Fusion);
local v12 = require(l_ReplicatedStorage_0.Packages.Signal);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v14 = require(l_ReplicatedFirst_0.PlaceIds);
local v15 = nil;
local v16 = nil;
local v17 = nil;
local v18 = nil;
local l_Highlight_0 = Instance.new("Highlight");
l_Highlight_0.FillColor = Color3.fromRGB(255, 0, 0);
l_Highlight_0.FillTransparency = 1;
l_Highlight_0.OutlineTransparency = 1;
local v20 = l_TweenService_0:Create(l_Highlight_0, TweenInfo.new(0.85, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true), {
    FillTransparency = 0.25
});
local l_Children_0 = l_ReplicatedStorage_0.Animations.TowerOfKarate.Player:GetChildren();
local v22 = {};
local v23 = v5.CreateController({
    Name = script.Name, 
    UseAbility = v12.new()
});
v23.KnitInit = function(_) --[[ Line: 55 ]] --[[ Name: KnitInit ]]
    -- upvalues: v15 (ref), v5 (copy), v16 (ref), v17 (ref), v18 (ref)
    v15 = v5.GetController("DataController");
    v16 = v5.GetService("TowerKarateService");
    v17 = v5.GetService("SessionService");
    v18 = v5.GetController("AudioController");
end;
v23.KnitStart = function(v25) --[[ Line: 63 ]] --[[ Name: KnitStart ]]
    -- upvalues: v16 (ref), v14 (copy), v17 (ref)
    v16.LevelInfo:Observe(function(v26) --[[ Line: 64 ]]
        -- upvalues: v25 (copy)
        if not v26 or v26 and v26.Mode ~= "TowerOfKarate" then
            return;
        else
            if not v25._started then
                v25._started = true;
                v25:Start();
            end;
            return;
        end;
    end);
    if v14:IsGame() or v14:IsKarateLobby() then
        if v14:IsKarateLobby() then
            v25:_ConnectPlayerVFX();
            return;
        else
            v17:PromiseGetMatchSettings():andThen(function(v27) --[[ Line: 79 ]]
                -- upvalues: v25 (copy)
                if v27 and v27.Mode == "TowerOfKarate" then
                    v25:_ConnectPlayerVFX();
                end;
            end);
        end;
    end;
end;
v23.Start = function(v28) --[[ Line: 88 ]] --[[ Name: Start ]]
    -- upvalues: v11 (copy), v22 (copy), v16 (ref), v8 (copy), l_Highlight_0 (copy), v20 (copy), v5 (copy), l_UserInputService_0 (copy), l_ReplicatedStorage_0 (copy), v18 (ref)
    v28.scope = v11.scoped(v11);
    v28._loadingFloor = v28.scope:Value(false);
    v28:_CreateFadeScreen();
    for _, v30 in script.PlayerAttackEffects:GetChildren() do
        if v30:IsA("ModuleScript") then
            v22[v30.Name] = require(v30);
        end;
    end;
    v16.EnemiesLeft:Observe(function(v31) --[[ Line: 99 ]]
        if not v31 then
            return;
        else
            return;
        end;
    end);
    v16.LoadingFloor:Observe(function(v32) --[[ Line: 108 ]]
        -- upvalues: v28 (copy)
        v28._loadingFloor:set(v32);
    end);
    v8.Player.forEachCharacter(function(v33, v34) --[[ Line: 112 ]]
        -- upvalues: l_Highlight_0 (ref), v20 (ref)
        l_Highlight_0.FillTransparency = 1;
        l_Highlight_0.Adornee = v33;
        l_Highlight_0.Parent = v33;
        local l_Humanoid_0 = v33:WaitForChild("Humanoid");
        local l_Health_0 = l_Humanoid_0.Health;
        v34:Add(l_Humanoid_0.HealthChanged:Connect(function(v37) --[[ Line: 120 ]]
            -- upvalues: l_Health_0 (ref), v20 (ref)
            if l_Health_0 <= v37 then
                l_Health_0 = v37;
                return;
            else
                l_Health_0 = v37;
                v20:Play();
                return;
            end;
        end));
    end, v5.Player);
    local v38 = nil;
    local function v39() --[[ Line: 133 ]] --[[ Name: preferredChanged ]]
        -- upvalues: l_UserInputService_0 (ref), v38 (ref), l_ReplicatedStorage_0 (ref), v5 (ref)
        if l_UserInputService_0.PreferredInput ~= Enum.PreferredInput.Gamepad then
            if v38 then
                v38:Destroy();
                v38 = nil;
            end;
            return;
        else
            v38 = l_ReplicatedStorage_0.GUI.MouseLockHint_Gamepad:Clone();
            v38.Enabled = true;
            v38.Parent = v5.PlayerGui;
            return;
        end;
    end;
    if l_UserInputService_0.PreferredInput ~= Enum.PreferredInput.Gamepad then
        if v38 then
            v38:Destroy();
            v38 = nil;
        end;
    else
        v38 = l_ReplicatedStorage_0.GUI.MouseLockHint_Gamepad:Clone();
        v38.Enabled = true;
        v38.Parent = v5.PlayerGui;
    end;
    l_UserInputService_0:GetPropertyChangedSignal("PreferredInput"):Connect(v39);
    l_UserInputService_0.InputBegan:Connect(function(v40, v41) --[[ Line: 152 ]]
        -- upvalues: v5 (ref)
        if v41 then
            return;
        else
            if v40.KeyCode == Enum.KeyCode.ButtonL3 then
                v5.Player:SetAttribute("MouseLockState", not (v5.Player:GetAttribute("MouseLockState") or false));
            end;
            return;
        end;
    end);
    local v42 = nil;
    v16.KarateFloor:Observe(function(v43) --[[ Line: 167 ]]
        -- upvalues: v42 (ref), v18 (ref)
        if not v43 then
            return;
        else
            local v44 = "TowerOfKarate_Regular";
            if v43 > 0 and v43 % 10 == 0 then
                v44 = "TowerOfKarate_Boss";
            end;
            if v42 == v44 then
                return;
            else
                v42 = v44;
                v18:SetMusicOverride((("Music.Game.%*"):format(v44)));
                return;
            end;
        end;
    end);
end;
v23._ConnectPlayerVFX = function(_) --[[ Line: 196 ]] --[[ Name: _ConnectPlayerVFX ]]
    -- upvalues: v8 (copy), l_Players_0 (copy), v7 (copy), v6 (copy), l_Children_0 (copy), v9 (copy), v22 (copy)
    v8.Player.forEachCharacter(function(v46, v47) --[[ Line: 197 ]]
        -- upvalues: l_Players_0 (ref), v7 (ref), v6 (ref), l_Children_0 (ref), v9 (ref), v22 (ref)
        local _ = l_Players_0:GetPlayerFromCharacter(v46);
        local l_Animator_0 = v46:WaitForChild("Humanoid"):WaitForChild("Animator");
        local l_Attribute_0 = v46:WaitForChild("KarateGloves"):GetAttribute("ReferenceName");
        local v51 = v7.new();
        v51:AttachTo(v46);
        local v52 = {};
        local function v67(v53) --[[ Line: 209 ]] --[[ Name: connectAnimationTrack ]]
            -- upvalues: v6 (ref), l_Children_0 (ref), v51 (copy), v46 (copy), l_Attribute_0 (copy), v9 (ref), v22 (ref), v52 (copy)
            local l_AnimationId_0 = v53.Animation.AnimationId;
            local v56 = v6.Find(l_Children_0, function(v55) --[[ Line: 212 ]]
                -- upvalues: l_AnimationId_0 (copy)
                return v55.AnimationId == l_AnimationId_0;
            end);
            if not v56 then
                return;
            else
                local l_Name_0 = v56.Name;
                if string.find(l_Name_0, "Slash") or string.find(l_Name_0, "Uppercut") or string.find(l_Name_0, "Hook") then
                    l_Name_0 = "Slash";
                end;
                local v58 = v51:Extend();
                local v59 = {
                    character = v46, 
                    glovesName = l_Attribute_0, 
                    glovesData = v9.getGloveData(l_Attribute_0), 
                    dumpster = v58, 
                    animationName = v56.Name
                };
                local v60 = v22[l_Name_0];
                local v61 = v60 and v60(v59);
                if not v61 then
                    return;
                else
                    local v62 = v52[l_AnimationId_0];
                    if not v62 then
                        v62 = v51:Extend();
                        v52[l_AnimationId_0] = v62;
                    end;
                    for v63, v64 in v61 do
                        v62:Add(v53:GetMarkerReachedSignal(v63):Connect(function() --[[ Line: 250 ]]
                            -- upvalues: v64 (copy)
                            v64();
                        end));
                    end;
                    local function _() --[[ Line: 255 ]] --[[ Name: cleanup ]]
                        -- upvalues: v62 (ref), v58 (copy)
                        v62:Destroy();
                        v58:Destroy();
                    end;
                    local l_Stopped_0 = v53.Stopped;
                    v62:Add(l_Stopped_0:Once(function() --[[ Line: 260 ]]
                        -- upvalues: v62 (ref), v58 (copy)
                        v62:Destroy();
                        v58:Destroy();
                    end));
                    if not v53.IsPlaying then
                        v62:Destroy();
                        v58:Destroy();
                    end;
                    return;
                end;
            end;
        end;
        v47:Add(l_Animator_0.AnimationPlayed:Connect(function(v68) --[[ Line: 269 ]]
            -- upvalues: v67 (copy)
            v67(v68);
        end));
    end);
end;
v23._CreateFadeScreen = function(v69) --[[ Line: 275 ]] --[[ Name: _CreateFadeScreen ]]
    -- upvalues: v11 (copy), v5 (copy)
    local v70 = v69.scope:Value(1);
    local l_peek_0 = v11.peek;
    v69.scope:Observer(v69._loadingFloor):onChange(function() --[[ Line: 284 ]]
        -- upvalues: v70 (copy), l_peek_0 (copy), v69 (copy)
        v70:set(l_peek_0(v69._loadingFloor) == true and 0 or 1);
    end);
    v69.scope:New("ScreenGui")({
        Name = "TowerOfKarateFadeScreen", 
        ResetOnSpawn = false, 
        IgnoreGuiInset = true, 
        Enabled = true, 
        ScreenInsets = Enum.ScreenInsets.None, 
        SafeAreaCompatibility = Enum.SafeAreaCompatibility.None, 
        ClipToDeviceSafeArea = false, 
        AutoLocalize = false, 
        DisplayOrder = 999999, 
        Parent = v5.PlayerGui, 
        [v11.Children] = {
            v69.scope:New("Frame")({
                Size = UDim2.fromScale(1, 1), 
                BackgroundColor3 = Color3.fromRGB(0, 0, 0), 
                BackgroundTransparency = v69.scope:Spring(v70, 14, 0.8)
            }), 
            v69.scope:New("TextLabel")({
                Size = UDim2.fromScale(0.8, 0.2), 
                BackgroundTransparency = 1, 
                Position = UDim2.fromScale(0.5, 0.5), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Text = "LOADING TOWER...", 
                TextScaled = true, 
                TextColor3 = Color3.new(1, 1, 1), 
                TextTransparency = v69.scope:Spring(v70, 14, 0.8), 
                FontFace = Font.new("rbxassetid://12187373592", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
            })
        }
    });
end;
return v23;