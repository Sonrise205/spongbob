local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.Signal);
local v2 = require(l_Parent_0.Symbol);
local v3 = require(script.ComponentJanitorUtil);
local v4 = require(script.ComponentAttributeUtil);
local v5 = require(script.ComponentPropertyUtil);
local v6 = require(script.ComponentFusionUtil);
local v7 = v2("IsDestroyed");
local v8 = v2("Signals");
local function v12(v9, v10) --[[ Line: 69 ]] --[[ Name: RegisterSignal ]]
    -- upvalues: v8 (copy), v1 (copy)
    local v11 = v9[v8];
    if v11[v10] then
        warn("Signal " .. v10 .. " already exists");
    else
        v11[v10] = v1.new();
    end;
    return v11[v10];
end;
local function v16(v13, v14) --[[ Line: 88 ]] --[[ Name: GetSignal ]]
    -- upvalues: v8 (copy)
    local v15 = v13[v8];
    if v15[v14] then
        return v15[v14];
    else
        error("Signal " .. v14 .. " does not exist");
        return;
    end;
end;
local function v19(v17, v18, ...) --[[ Line: 107 ]] --[[ Name: FireSignal ]]
    v17:GetSignal(v18):Fire(...);
end;
local function v23(v20, v21, v22) --[[ Line: 122 ]] --[[ Name: ConnectSignal ]]
    return v20:GetSignal(v21):Connect(v22);
end;
local function v25(v24) --[[ Line: 128 ]] --[[ Name: IsDestroyed ]]
    -- upvalues: v7 (copy)
    return v24[v7] == true;
end;
local v26 = {
    RegisterSignal = v12, 
    GetSignal = v16, 
    FireSignal = v19, 
    ConnectSignal = v23
};
return {
    ClassName = "BaseComponent", 
    Methods = v26, 
    Extensions = {
        v3, 
        v4, 
        v5, 
        v6
    }, 
    Constructing = function(v27) --[[ Line: 163 ]] --[[ Name: Constructing ]]
        -- upvalues: v8 (copy), v25 (copy)
        v27[v8] = {};
        v27:RegisterSignal("Destroyed");
        if not v27.IsDestroyed then
            v27.IsDestroyed = v25;
        end;
    end, 
    Stopped = function(v28) --[[ Line: 179 ]] --[[ Name: Stopped ]]
        -- upvalues: v7 (copy), v8 (copy)
        v28[v7] = true;
        v28[v8].Destroyed:Fire();
        for _, v30 in pairs(v28[v8]) do
            v30:Destroy();
        end;
        setmetatable(v28, nil);
    end
};