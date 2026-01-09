local l_Players_0 = game:GetService("Players");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v2 = require(l_ReplicatedStorage_0.Packages.Knit);
local v3 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v4 = require(l_ReplicatedStorage_0.Shared.Modules.Timer);
local v5 = require(l_ReplicatedStorage_0.Packages.Signal);
local v6 = require(l_ReplicatedStorage_0.Packages.WaitFor);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v8 = require(l_ReplicatedStorage_0.Shared.Modules.WWSDebug);
local v9 = nil;
local v10 = v2.CreateController({
    Name = script.Name, 
    _hideCharacters = false, 
    _characters = {}, 
    _playerFilter = nil, 
    HiddenChanged = v5.new()
});
v10.KnitInit = function(_) --[[ Line: 42 ]] --[[ Name: KnitInit ]]
    -- upvalues: v9 (ref), v2 (copy)
    v9 = v2.GetController("DataController");
end;
v10.KnitStart = function(v12) --[[ Line: 47 ]] --[[ Name: KnitStart ]]
    -- upvalues: v3 (copy), v6 (copy), v8 (copy), l_ReplicatedStorage_0 (copy), v2 (copy), v4 (copy), l_Players_0 (copy)
    local v13 = v3.new();
    local function _(v14) --[[ Line: 50 ]] --[[ Name: updateHumanoidAsync ]]
        -- upvalues: v6 (ref), v8 (ref), v13 (copy), v12 (copy)
        local v15 = v6.Child(v14, "Humanoid", 10):catch(v8.EmptyPromiseCatch);
        v13:Add(v15);
        local v16, v17 = v15:await();
        if not v16 or not v17 then
            return;
        else
            v12.humanoid = v17;
            return;
        end;
    end;
    local function _(v19) --[[ Line: 63 ]] --[[ Name: updateRootPartAsync ]]
        -- upvalues: v6 (ref), v8 (ref), v13 (copy), v12 (copy)
        local v20 = v6.Child(v19, "HumanoidRootPart", 10):catch(v8.EmptyPromiseCatch);
        v13:Add(v20);
        local v21, v22 = v20:await();
        if not v21 or not v22 then
            return;
        else
            v12.rootPart = v22;
            return;
        end;
    end;
    local function v36(v24, v25) --[[ Line: 76 ]] --[[ Name: characterAdded ]]
        -- upvalues: v12 (copy), l_ReplicatedStorage_0 (ref), v2 (ref), v13 (copy), v6 (ref), v8 (ref), v4 (ref)
        v12._characters[v24] = v25;
        if v12._hideCharacters then
            if v12._playerFilter and v12._playerFilter(v24) then
                v25.Parent = workspace:FindFirstChild("Characters") or workspace;
            else
                v25.Parent = l_ReplicatedStorage_0;
            end;
        end;
        if v24 ~= v2.Player then
            return;
        else
            v13:Destroy();
            if not v25:IsDescendantOf(workspace) then
                local v26 = v6.Custom(function() --[[ Line: 96 ]]
                    -- upvalues: v25 (copy)
                    return v25.Parent;
                end, 10):catch(v8.EmptyPromiseCatch);
                v13:Add(v26);
                local v27, v28 = v26:await();
                if not v27 or not v28 then
                    return;
                end;
            end;
            v12.character = v25;
            v13:Add(v25.AncestryChanged:Connect(function() --[[ Line: 109 ]]
                -- upvalues: v25 (copy), v12 (ref), v6 (ref), v8 (ref), v13 (ref)
                if not v25:IsDescendantOf(workspace) then
                    v12.character = nil;
                    v12.humanoid = nil;
                    v12.rootPart = nil;
                    v12.characterPosition = nil;
                    return;
                else
                    local l_v25_0 = v25;
                    local v30 = v6.Child(l_v25_0, "HumanoidRootPart", 10):catch(v8.EmptyPromiseCatch);
                    v13:Add(v30);
                    local v31, v32 = v30:await();
                    if v31 and v32 then
                        v12.rootPart = v32;
                    end;
                    l_v25_0 = v25;
                    v30 = v6.Child(l_v25_0, "Humanoid", 10):catch(v8.EmptyPromiseCatch);
                    v13:Add(v30);
                    v31, v32 = v30:await();
                    if v31 then
                        if not v32 then
                            return;
                        else
                            v12.humanoid = v32;
                        end;
                    end;
                    return;
                end;
            end), "AncestryChanged");
            local v33 = v6.Child(v25, "HumanoidRootPart", 10):catch(v8.EmptyPromiseCatch);
            v13:Add(v33);
            local v34, v35 = v33:await();
            if v34 and v35 then
                v12.rootPart = v35;
            end;
            v33 = v6.Child(v25, "Humanoid", 10):catch(v8.EmptyPromiseCatch);
            v13:Add(v33);
            v34, v35 = v33:await();
            if v34 and v35 then
                v12.humanoid = v35;
            end;
            v13:Add(v4.Simple(0.06666666666666667, function() --[[ Line: 124 ]]
                -- upvalues: v12 (ref)
                if v12.rootPart then
                    v12.characterPosition = v12.rootPart:GetPivot().Position;
                end;
            end, true));
            workspace.CurrentCamera.CameraType = Enum.CameraType.Custom;
            workspace.CurrentCamera.CameraSubject = v12.humanoid;
            return;
        end;
    end;
    local function v41(v37) --[[ Line: 134 ]] --[[ Name: playerAdded ]]
        -- upvalues: v3 (ref), v12 (copy), v36 (copy)
        local v38 = v3.new();
        v38:Add(function() --[[ Line: 137 ]]
            -- upvalues: v38 (ref), v12 (ref), v37 (copy)
            v38 = nil;
            v12._characters[v37] = nil;
        end);
        if v37.Character then
            v36(v37, v37.Character);
        end;
        local l_CharacterAdded_0 = v37.CharacterAdded;
        v38:Add(l_CharacterAdded_0:Connect(function(v40) --[[ Line: 146 ]]
            -- upvalues: v36 (ref), v37 (copy)
            v36(v37, v40);
        end));
        v38:AttachTo(v37);
    end;
    for _, v43 in l_Players_0:GetPlayers() do
        task.spawn(v41, v43);
    end;
    l_Players_0.PlayerAdded:Connect(v41);
end;
v10.GetCharacter = function(v44) --[[ Line: 161 ]] --[[ Name: GetCharacter ]]
    return v44.character;
end;
v10.GetPosition = function(v45) --[[ Line: 165 ]] --[[ Name: GetPosition ]]
    return v45.characterPosition;
end;
v10.GetHumanoid = function(v46) --[[ Line: 169 ]] --[[ Name: GetHumanoid ]]
    return v46.humanoid;
end;
v10.GetRootPart = function(v47) --[[ Line: 173 ]] --[[ Name: GetRootPart ]]
    return v47.rootPart;
end;
v10.CharactersHidden = function(v48) --[[ Line: 177 ]] --[[ Name: CharactersHidden ]]
    return v48._hideCharacters;
end;
v10.ToggleHideAll = function(v49, v50) --[[ Line: 181 ]] --[[ Name: ToggleHideAll ]]
    -- upvalues: l_ReplicatedStorage_0 (copy)
    v49._hideCharacters = v50;
    local l_v49_Humanoid_0 = v49:GetHumanoid();
    if l_v49_Humanoid_0 then
        l_v49_Humanoid_0:SetStateEnabled(Enum.HumanoidStateType.Dead, not v50);
    end;
    for _, v53 in v49._characters do
        v53.Parent = if v50 then l_ReplicatedStorage_0 else workspace;
    end;
    v49.HiddenChanged:Fire(v50);
end;
v10.HidePlayersWithFilter = function(v54, v55) --[[ Line: 197 ]] --[[ Name: HidePlayersWithFilter ]]
    -- upvalues: l_ReplicatedStorage_0 (copy)
    v54._playerFilter = v55;
    v54._hideCharacters = true;
    for v56, v57 in pairs(v54._characters) do
        if v55 and v55(v56) then
            v57.Parent = workspace;
        else
            v57.Parent = l_ReplicatedStorage_0;
        end;
    end;
end;
v10.HidePlayersWithFilter = function(v58, v59) --[[ Line: 214 ]] --[[ Name: HidePlayersWithFilter ]]
    -- upvalues: l_ReplicatedStorage_0 (copy)
    v58._playerFilter = v59;
    v58._hideCharacters = true;
    for v60, v61 in pairs(v58._characters) do
        if v59 and v59(v60) then
            v61.Parent = workspace;
        else
            v61.Parent = l_ReplicatedStorage_0;
        end;
    end;
end;
return v10;