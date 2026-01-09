local v0 = {
    Math = script:FindFirstChild("MathUtil"), 
    Vector = script:FindFirstChild("VectorUtil"), 
    Table = script:FindFirstChild("TblUtil"), 
    Debug = script:FindFirstChild("DebugUtil"), 
    Signal = script:FindFirstChild("SignalUtil"), 
    Player = script:FindFirstChild("PlayerUtil"), 
    Instance = script:FindFirstChild("InstanceUtil"), 
    Fusion = script:FindFirstChild("FusionUtil"), 
    String = script:FindFirstChild("StringUtil"), 
    Camera = script:FindFirstChild("CameraUtil"), 
    Draw = script:FindFirstChild("DrawUtil"), 
    Input = script:FindFirstChild("InputUtil")
};
local v7 = {
    __metatable = "RailUtil's Metatable is locked.", 
    __index = function(v1, v2) --[[ Line: 75 ]] --[[ Name: __index ]]
        -- upvalues: v0 (copy)
        local v3 = v0[v2];
        assert(v3, "Invalid index: " .. tostring(v2));
        rawset(v1, v2, (require(v3)));
        return v1[v2];
    end, 
    __newindex = function(_, v5, v6) --[[ Line: 81 ]] --[[ Name: __newindex ]]
        error("RailUtil is externally immutable! Attempted to change index: " .. tostring(v5) .. " to value: " .. tostring(v6));
    end
};
local v8 = {
    Math = nil, 
    Vector = nil, 
    Table = nil, 
    Debug = nil, 
    Draw = nil, 
    Signal = nil, 
    Player = nil, 
    Instance = nil, 
    Fusion = nil, 
    String = nil, 
    Camera = nil, 
    Input = nil
};
setmetatable(v8, v7);
return v8;