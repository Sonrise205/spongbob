local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Players_0 = game:GetService("Players");
local v2 = require(l_ReplicatedStorage_0.Packages.RailUtil);
local v3 = require(l_ReplicatedStorage_0.Packages.Promise);
local v4 = require(l_ReplicatedStorage_0.Packages.Janitor);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
return {
    findFirstAncestorWithTag = function(v6, v7, v8) --[[ Line: 25 ]] --[[ Name: findFirstAncestorWithTag ]]
        local l_Parent_0 = v6.Parent;
        local v10 = 0;
        while true do
            if l_Parent_0 and not l_Parent_0:HasTag(v7) then
                v10 = v10 + 1;
                if v8 and v8 <= v10 then
                    return nil;
                else
                    l_Parent_0 = l_Parent_0.Parent;
                end;
            else
                return l_Parent_0;
            end;
        end;
    end, 
    isWithinXYZDistance = function(v11, v12, v13) --[[ Line: 51 ]] --[[ Name: isWithinXYZDistance ]]
        local v14 = math.abs(v11.X - v12.X);
        local v15 = math.abs(v11.Y - v12.Y);
        local v16 = math.abs(v11.Z - v12.Z);
        local v17 = false;
        if v14 <= v13.X then
            v17 = false;
            if v15 <= v13.Y then
                v17 = v16 <= v13.Z;
            end;
        end;
        return v17;
    end, 
    getXZDistance = function(v18, v19) --[[ Line: 58 ]] --[[ Name: getXZDistance ]]
        local v20 = v18.X - v19.X;
        local v21 = v18.Z - v19.Z;
        return (math.sqrt(v20 * v20 + v21 * v21));
    end, 
    formatPrice = function(v22) --[[ Line: 65 ]] --[[ Name: formatPrice ]]
        -- upvalues: v2 (copy)
        if v22 < 100000 then
            return "$" .. v2.String.formatNumberWithCommas(v22);
        else
            return "$" .. v2.String.truncateNumberWithSuffix(v22, {
                MaxDecimals = 2, 
                AddSpace = false
            });
        end;
    end, 
    isPartWithinOtherPartBounds = function(v23, v24) --[[ Line: 76 ]] --[[ Name: isPartWithinOtherPartBounds ]]
        local l_CFrame_0 = v23.CFrame;
        local l_Size_0 = v23.Size;
        local l_CFrame_1 = v24.CFrame;
        local l_Size_1 = v24.Size;
        local v29 = l_CFrame_0.Position - l_Size_0 / 2;
        local v30 = l_CFrame_0.Position + l_Size_0 / 2;
        local v31 = l_CFrame_1.Position - l_Size_1 / 2;
        local v32 = l_CFrame_1.Position + l_Size_1 / 2;
        local v33 = false;
        if v29.X >= v31.X then
            v33 = false;
            if v30.X <= v32.X then
                v33 = false;
                if v29.Y >= v31.Y then
                    v33 = false;
                    if v30.Y <= v32.Y then
                        v33 = false;
                        if v29.Z >= v31.Z then
                            v33 = v30.Z <= v32.Z;
                        end;
                    end;
                end;
            end;
        end;
        return v33;
    end, 
    playAnimAsync = function(v34, v35, v36, v37) --[[ Line: 109 ]] --[[ Name: playAnimAsync ]]
        -- upvalues: v4 (copy), v3 (copy), v2 (copy)
        local v38 = v37 or {};
        local v39 = if typeof(v36) == "table" then v36 else {};
        local v40 = v4.new();
        return v3.new(function(v41, _) --[[ Line: 127 ]]
            -- upvalues: v2 (ref), v34 (copy), v35 (copy), v39 (copy), v38 (copy), v40 (copy), v3 (ref)
            local v43 = v2.Instance.ensureAnimator(v34):LoadAnimation(v35);
            if v39.Looped ~= nil then
                v43.Looped = v39.Looped;
            end;
            v43:Play(v39.FadeTime, v39.Weight, v39.Speed);
            if v38.onStart then
                v38.onStart();
            end;
            v40:LinkToInstance(v43);
            v40:AddPromise(v3.fromEvent(v43.Stopped):andThen(function() --[[ Line: 143 ]]
                -- upvalues: v38 (ref)
                if v38.onStop then
                    v38.onStop();
                end;
            end));
            v40:AddPromise(v3.fromEvent(v43.Ended):andThen(function() --[[ Line: 149 ]]
                -- upvalues: v38 (ref), v43 (copy)
                if v38.onEnd then
                    v38.onEnd();
                end;
                v43:Destroy();
            end));
            if v38.markers then
                for v44, v45 in v38.markers do
                    v40:Add(v43:GetMarkerReachedSignal(v44):Connect(v45));
                end;
            end;
            v41(v43);
        end);
    end, 
    getCharactersWithinRange = function(v46, v47, v48) --[[ Line: 167 ]] --[[ Name: getCharactersWithinRange ]]
        -- upvalues: l_Players_0 (copy)
        local v49 = v48 or {};
        local v50 = {};
        local v51 = if typeof(v46) == "Vector3" then v46 else v46:GetPivot().Position;
        for _, v53 in (l_Players_0:GetPlayers()) do
            if not table.find(v49, v53) then
                local l_Character_0 = v53.Character;
                if l_Character_0 and l_Character_0:FindFirstChild("HumanoidRootPart") and (l_Character_0.HumanoidRootPart.Position - v51).Magnitude <= v47 then
                    table.insert(v50, l_Character_0);
                end;
            end;
        end;
        return v50;
    end, 
    getClosestPointOnPart = function(v55, v56) --[[ Line: 191 ]] --[[ Name: getClosestPointOnPart ]]
        local v57 = v55.CFrame:PointToObjectSpace(v56);
        local v58 = v55.Size * 0.5;
        return v55.CFrame:PointToWorldSpace((Vector3.new(math.clamp(v57.x, -v58.x, v58.x), math.clamp(v57.y, -v58.y, v58.y), (math.clamp(v57.z, -v58.z, v58.z)))));
    end, 
    setModelLocalTransparencyModifier = function(v59, v60) --[[ Line: 206 ]] --[[ Name: setModelLocalTransparencyModifier ]]
        for _, v62 in v59:GetDescendants() do
            if v62:IsA("BasePart") or v62:IsA("Decal") then
                v62.LocalTransparencyModifier = v60;
            end;
        end;
    end, 
    getModelMass = function(v63) --[[ Line: 214 ]] --[[ Name: getModelMass ]]
        local v64 = 0;
        for _, v66 in v63:GetDescendants() do
            if v66:IsA("BasePart") then
                v64 = v64 + v66:GetMass();
            end;
        end;
        return v64;
    end, 
    getProbabilityLuck = function(v67) --[[ Line: 225 ]] --[[ Name: getProbabilityLuck ]]
        return (v67 - 1) / v67;
    end
};