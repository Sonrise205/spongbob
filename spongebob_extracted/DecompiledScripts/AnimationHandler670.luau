local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v2 = require(l_ReplicatedStorage_0.Packages.RailUtil);
local v3 = require(l_ReplicatedStorage_0.Packages.Janitor);
local v4 = require(l_ReplicatedStorage_0.Shared.Util.PathUtil);
local v5 = require(l_ReplicatedStorage_0.Shared.TowerOfKarate.AnimationData);
local v6 = {};
local v7 = {};
for _, v9 in v5 do
    for v10, v11 in v9 do
        v7[v10] = v11;
    end;
end;
v6.PlayAnimation = function(v12, v13, v14, v15) --[[ Line: 45 ]] --[[ Name: PlayAnimation ]]
    -- upvalues: v2 (copy), v3 (copy)
    local v16 = v15 or {};
    local v17 = v16.props or {};
    local v18 = v16.callbacks or {};
    local v19 = v12:SupplyAnimation(v14);
    local v20 = v2.Instance.ensureAnimator(v13);
    local v21 = v3.new();
    if v16.stopPlayingTracks then
        for _, v23 in v20:GetPlayingAnimationTracks() do
            v23:Stop();
        end;
    end;
    local v24 = v20:LoadAnimation(v19);
    if v17.Priority ~= nil then
        v24.Priority = v17.Priority;
    end;
    if v17.Looped ~= nil then
        v24.Looped = v17.Looped;
    end;
    if v18.start then
        v18.start(v21);
    end;
    if v18.markers then
        for v25, v26 in v18.markers do
            v24:GetMarkerReachedSignal(v25):Connect(function(v27) --[[ Line: 81 ]]
                -- upvalues: v26 (copy), v24 (copy)
                v26(v27, v24);
            end);
        end;
    end;
    v2.Instance.playTracksAsync(v24, v17, v16.keyframeMarkerToResolveAt):andThen(function() --[[ Line: 92 ]]
        -- upvalues: v18 (copy), v21 (ref)
        if v18.finished then
            v18.finished(v21);
        end;
    end):catch(function(_) --[[ Line: 97 ]]
        -- upvalues: v18 (copy), v21 (ref)
        if v18.failed then
            v18.failed(v21);
        end;
    end);
    return v24, function() --[[ Line: 103 ]]
        -- upvalues: v24 (copy), v19 (copy), v21 (ref)
        v24:Stop();
        v24:Destroy();
        v19:Destroy();
        v21:Destroy();
        v21 = nil;
    end;
end;
v6.GetAnimationData = function(_, v30) --[[ Line: 113 ]] --[[ Name: GetAnimationData ]]
    -- upvalues: v4 (copy), v5 (copy)
    assert(v30 ~= nil, "Animation path must be provided.");
    local v31 = v4(v5, v30);
    assert(v31 ~= nil, (("Animation data not found for path: %*"):format(v30)));
    return v31;
end;
v6.SupplyAnimation = function(v32, v33) --[[ Line: 123 ]] --[[ Name: SupplyAnimation ]]
    -- upvalues: v2 (copy)
    local l_AnimationId_0 = v32:GetAnimationData(v33).AnimationId;
    if typeof(l_AnimationId_0) == "table" then
        l_AnimationId_0 = v2.Table.Shuffle(l_AnimationId_0)[1];
    end;
    local l_Animation_0 = Instance.new("Animation");
    l_Animation_0.AnimationId = l_AnimationId_0;
    return l_Animation_0;
end;
return v6;