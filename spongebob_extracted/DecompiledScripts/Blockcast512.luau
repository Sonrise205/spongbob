--!native
local _ = require(script.Parent.Parent.Types);
local v1 = {
    Solvers = {}
};
v1.Cast = function(_, v3, v4) --[[ Line: 8 ]] --[[ Name: Cast ]]
    -- upvalues: v1 (copy)
    local v5 = v1.Solvers[v3.Instance.ClassName]:ToDirection(v3);
    local l__LastCFrameBlockCast_0 = v3.CastData._LastCFrameBlockCast;
    local v7 = workspace:Blockcast((l__LastCFrameBlockCast_0 or v3.Instance.WorldCFrame) * v3.CastData.CFrame, v3.CastData.Size, v5, v4);
    task.defer(function() --[[ Line: 20 ]]
        -- upvalues: l__LastCFrameBlockCast_0 (ref), v3 (copy)
        l__LastCFrameBlockCast_0 = v3.Instance.WorldCFrame;
    end);
    return v7, v5;
end;
return v1;