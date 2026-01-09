--!native
local _ = require(script.Parent.Parent.Types);
local v1 = require(script.Parent.Parent.Settings);
local v2 = {};
v2.__index = v2;
v2.__type = ("ShapecastHitbox_%*"):format(script.Name);
v2._AdornmentInUse = {};
v2._AdornmentInReserve = {};
v2._CreateAdornment = function(_) --[[ Line: 22 ]] --[[ Name: _CreateAdornment ]]
    -- upvalues: v1 (copy)
    local l_BoxHandleAdornment_0 = Instance.new("BoxHandleAdornment");
    l_BoxHandleAdornment_0.Name = "_ShapecastHitboxDebugger";
    l_BoxHandleAdornment_0.Color3 = v1.Debug_Instance_Color;
    l_BoxHandleAdornment_0.Transparency = v1.Debug_Instance_Transparency;
    l_BoxHandleAdornment_0.Size = Vector3.new(0, 0, 0, 0);
    l_BoxHandleAdornment_0.CFrame = v1.Debug_Instance_Derender_Location;
    l_BoxHandleAdornment_0.Adornee = workspace.Terrain;
    l_BoxHandleAdornment_0.Parent = workspace.Terrain;
    return {
        Adornment = l_BoxHandleAdornment_0, 
        LastUse = 0
    };
end;
v2.GetAdornment = function(_) --[[ Line: 40 ]] --[[ Name: GetAdornment ]]
    -- upvalues: v2 (copy)
    if #v2._AdornmentInReserve <= 0 then
        local v6 = v2:_CreateAdornment();
        table.insert(v2._AdornmentInReserve, v6);
    end;
    local v7 = table.remove(v2._AdornmentInReserve, 1);
    if v7 then
        v7.Adornment.Visible = true;
        v7.LastUse = os.clock();
        table.insert(v2._AdornmentInUse, v7);
    end;
    return v7;
end;
v2.ToRender = function(_, v9, v10, _, _, v13) --[[ Line: 58 ]] --[[ Name: ToRender ]]
    -- upvalues: v1 (copy)
    v9.Adornment.Size = v10.CastData.Size;
    v9.Adornment.CFrame = (v10.CastData._LastCFrameBlockCast or v10.Instance.WorldCFrame) * v10.CastData.CFrame;
    v9.Adornment.Color3 = v13 and v1.Debug_Instance_Hit_Color or v1.Debug_Instance_Color;
    v9.Adornment.ZIndex = v13 and 999 or -1;
end;
v2.ReturnAdornment = function(_, v15) --[[ Line: 74 ]] --[[ Name: ReturnAdornment ]]
    -- upvalues: v1 (copy), v2 (copy)
    v15.Adornment.Size = Vector3.new(0, 0, 0, 0);
    v15.Adornment.Visible = false;
    v15.Adornment.CFrame = v1.Debug_Instance_Derender_Location;
    table.insert(v2._AdornmentInReserve, v15);
end;
v2.Clear = function(_) --[[ Line: 84 ]] --[[ Name: Clear ]]
    -- upvalues: v2 (copy)
    for v17 = #v2._AdornmentInReserve, 1, -1 do
        if v2._AdornmentInReserve[v17].Adornment then
            v2._AdornmentInReserve[v17].Adornment:Destroy();
        end;
        table.remove(v2._AdornmentInReserve, v17);
    end;
end;
return v2;