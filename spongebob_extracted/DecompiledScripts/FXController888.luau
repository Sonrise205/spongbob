local l_Players_0 = game:GetService("Players");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Workspace_0 = game:GetService("Workspace");
local l_RunService_0 = game:GetService("RunService");
local v4 = require(l_ReplicatedStorage_0.Platformer.Constants);
local l_Utility_0 = l_ReplicatedStorage_0.Platformer.Utility;
local v6 = require(l_Utility_0.loadModules);
local v7 = require(l_Utility_0.disconnectAndClear);
local v8 = require(l_Utility_0.playSoundFromSource);
local v9 = v6(script.Parent.Actions);
local v10 = v6(script.Parent.Effects);
local l_CurrentCamera_0 = l_Workspace_0.CurrentCamera;
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_Animations_0 = l_ReplicatedStorage_0.Platformer.Animations;
local l_Sounds_0 = l_ReplicatedStorage_0.Platformer.Sounds;
local v15 = {};
v15.__index = v15;
v15.new = function(v16) --[[ Line: 29 ]] --[[ Name: new ]]
    -- upvalues: l_LocalPlayer_0 (copy), v15 (copy)
    local l_HumanoidRootPart_0 = v16:WaitForChild("HumanoidRootPart");
    if not l_HumanoidRootPart_0 then
        return;
    else
        local v18 = {
            isLocalCharacter = v16 == l_LocalPlayer_0.Character, 
            character = v16, 
            root = l_HumanoidRootPart_0, 
            animationTracks = {}, 
            connections = {}
        };
        setmetatable(v18, v15);
        v18:initialize();
        return v18;
    end;
end;
v15.initialize = function(v19) --[[ Line: 52 ]] --[[ Name: initialize ]]
    -- upvalues: v4 (copy)
    if v19.isLocalCharacter then
        v19:initializeAnimations();
    end;
    local v20 = if v19.isLocalCharacter then v4.ACTION_ATTRIBUTE else v4.REPLICATED_ACTION_ATTRIBUTE;
    table.insert(v19.connections, v19.character:GetAttributeChangedSignal(v20):Connect(function() --[[ Line: 67 ]]
        -- upvalues: v19 (copy), v20 (copy)
        local l_Attribute_0 = v19.character:GetAttribute(v20);
        v19:doActionFX(l_Attribute_0);
    end));
end;
v15.doActionFX = function(v22, v23) --[[ Line: 74 ]] --[[ Name: doActionFX ]]
    -- upvalues: v9 (copy), l_CurrentCamera_0 (copy), v4 (copy), v10 (copy), l_Sounds_0 (copy), v8 (copy)
    local v24 = v9[v23];
    if not v24 then
        return;
    else
        if v24.effect then
            local l_Magnitude_0 = (v22.root.Position - l_CurrentCamera_0.CFrame.Position).Magnitude;
            if v22.isLocalCharacter or l_Magnitude_0 < v4.EFFECTS_MAX_DISTANCE then
                local v26 = v10[v24.effect];
                if v26 then
                    v26(v22.character);
                else
                    warn((("Missing effect: %*"):format(v24.effect)));
                end;
            end;
        end;
        if v24.sound then
            local l_l_Sounds_0_FirstChild_0 = l_Sounds_0:FindFirstChild(v24.sound);
            if l_l_Sounds_0_FirstChild_0 then
                v8(l_l_Sounds_0_FirstChild_0, v22.root);
                return;
            else
                warn((("Missing sound: %*"):format(v24.sound)));
            end;
        end;
        return;
    end;
end;
v15.initializeAnimations = function(v28) --[[ Line: 105 ]] --[[ Name: initializeAnimations ]]
    -- upvalues: l_RunService_0 (copy), l_Animations_0 (copy), v4 (copy)
    local l_Animator_0 = v28.character:WaitForChild("Humanoid"):WaitForChild("Animator");
    if not v28.character:IsDescendantOf(workspace) then
        local v30 = os.clock();
        while not v28.character:IsDescendantOf(workspace) do
            if os.clock() - v30 > 5 then
                return;
            else
                task.wait();
            end;
        end;
    end;
    l_RunService_0.Stepped:Wait();
    for _, v32 in l_Animations_0:GetChildren() do
        local v33 = l_Animator_0:LoadAnimation(v32);
        v28.animationTracks[v32.Name] = v33;
    end;
    table.insert(v28.connections, v28.character:GetAttributeChangedSignal(v4.ACTION_ATTRIBUTE):Connect(function() --[[ Line: 132 ]]
        -- upvalues: v28 (copy), v4 (ref)
        local l_Attribute_1 = v28.character:GetAttribute(v4.ACTION_ATTRIBUTE);
        v28:playActionAnimation(l_Attribute_1);
    end));
end;
v15.playActionAnimation = function(v35, v36) --[[ Line: 139 ]] --[[ Name: playActionAnimation ]]
    -- upvalues: v9 (copy), v4 (copy)
    if v35.loopedActionAnimation then
        v35.loopedActionAnimation:Stop();
        v35.loopedActionAnimation = nil;
    end;
    local v37 = v9[v36];
    if not v37 then
        return;
    elseif not v37.animation then
        return;
    else
        local v38 = v35.animationTracks[v37.animation];
        if not v38 then
            warn((("Missing animation: %*"):format(v37.animation)));
            return;
        else
            v38:Play(v4.ACTION_ANIMATION_FADE_TIME);
            if v38.Looped then
                v35.loopedActionAnimation = v38;
            end;
            return;
        end;
    end;
end;
v15.destroy = function(v39) --[[ Line: 172 ]] --[[ Name: destroy ]]
    -- upvalues: v7 (copy)
    v7(v39.connections);
end;
return v15;