local v0 = {};
v0.__index = v0;
v0._new = function(v1) --[[ Line: 129 ]] --[[ Name: _new ]]
    -- upvalues: v0 (copy)
    return (setmetatable({
        ClassName = "Option", 
        _v = v1, 
        _s = v1 ~= nil
    }, v0));
end;
v0.Some = function(v2) --[[ Line: 145 ]] --[[ Name: Some ]]
    -- upvalues: v0 (copy)
    assert(v2 ~= nil, "Option.Some() value cannot be nil");
    return v0._new(v2);
end;
v0.Wrap = function(v3) --[[ Line: 158 ]] --[[ Name: Wrap ]]
    -- upvalues: v0 (copy)
    if v3 == nil then
        return v0.None;
    else
        return v0.Some(v3);
    end;
end;
v0.Is = function(v4) --[[ Line: 171 ]] --[[ Name: Is ]]
    -- upvalues: v0 (copy)
    local v5 = false;
    if type(v4) == "table" then
        v5 = getmetatable(v4) == v0;
    end;
    return v5;
end;
v0.Assert = function(v6) --[[ Line: 179 ]] --[[ Name: Assert ]]
    -- upvalues: v0 (copy)
    assert(v0.Is(v6), "Result was not of type Option");
end;
v0.Deserialize = function(v7) --[[ Line: 189 ]] --[[ Name: Deserialize ]]
    -- upvalues: v0 (copy)
    local v8 = false;
    if type(v7) == "table" then
        v8 = v7.ClassName == "Option";
    end;
    assert(v8, "Invalid data for deserializing Option");
    return v7.Value == nil and v0.None or v0.Some(v7.Value);
end;
v0.Serialize = function(v9) --[[ Line: 198 ]] --[[ Name: Serialize ]]
    return {
        ClassName = v9.ClassName, 
        Value = v9._v
    };
end;
v0.Match = function(v10, v11) --[[ Line: 219 ]] --[[ Name: Match ]]
    local l_Some_0 = v11.Some;
    local l_None_0 = v11.None;
    assert(type(l_Some_0) == "function", "Missing 'Some' match");
    assert(type(l_None_0) == "function", "Missing 'None' match");
    if v10:IsSome() then
        return l_Some_0(v10:Unwrap());
    else
        return l_None_0();
    end;
end;
v0.IsSome = function(v14) --[[ Line: 235 ]] --[[ Name: IsSome ]]
    return v14._s;
end;
v0.IsNone = function(v15) --[[ Line: 243 ]] --[[ Name: IsNone ]]
    return not v15._s;
end;
v0.Expect = function(v16, v17) --[[ Line: 257 ]] --[[ Name: Expect ]]
    assert(v16:IsSome(), v17);
    return v16._v;
end;
v0.ExpectNone = function(v18, v19) --[[ Line: 266 ]] --[[ Name: ExpectNone ]]
    assert(v18:IsNone(), v19);
end;
v0.Unwrap = function(v20) --[[ Line: 274 ]] --[[ Name: Unwrap ]]
    return v20:Expect("Cannot unwrap option of None type");
end;
v0.UnwrapOr = function(v21, v22) --[[ Line: 283 ]] --[[ Name: UnwrapOr ]]
    if v21:IsSome() then
        return v21:Unwrap();
    else
        return v22;
    end;
end;
v0.UnwrapOrElse = function(v23, v24) --[[ Line: 297 ]] --[[ Name: UnwrapOrElse ]]
    if v23:IsSome() then
        return v23:Unwrap();
    else
        return v24();
    end;
end;
v0.And = function(v25, v26) --[[ Line: 323 ]] --[[ Name: And ]]
    -- upvalues: v0 (copy)
    if v25:IsSome() then
        return v26;
    else
        return v0.None;
    end;
end;
v0.AndThen = function(v27, v28) --[[ Line: 347 ]] --[[ Name: AndThen ]]
    -- upvalues: v0 (copy)
    if v27:IsSome() then
        local v29 = v28(v27:Unwrap());
        v0.Assert(v29);
        return v29;
    else
        return v0.None;
    end;
end;
v0.Or = function(v30, v31) --[[ Line: 362 ]] --[[ Name: Or ]]
    if v30:IsSome() then
        return v30;
    else
        return v31;
    end;
end;
v0.OrElse = function(v32, v33) --[[ Line: 376 ]] --[[ Name: OrElse ]]
    -- upvalues: v0 (copy)
    if v32:IsSome() then
        return v32;
    else
        local v34 = v33();
        v0.Assert(v34);
        return v34;
    end;
end;
v0.XOr = function(v35, v36) --[[ Line: 393 ]] --[[ Name: XOr ]]
    -- upvalues: v0 (copy)
    local v37 = v35:IsSome();
    if v37 == v36:IsSome() then
        return v0.None;
    elseif v37 then
        return v35;
    else
        return v36;
    end;
end;
v0.Filter = function(v38, v39) --[[ Line: 411 ]] --[[ Name: Filter ]]
    -- upvalues: v0 (copy)
    if v38:IsNone() or not v39(v38._v) then
        return v0.None;
    else
        return v38;
    end;
end;
v0.Contains = function(v40, v41) --[[ Line: 424 ]] --[[ Name: Contains ]]
    return v40:IsSome() and v40._v == v41;
end;
v0.__tostring = function(v42) --[[ Line: 438 ]] --[[ Name: __tostring ]]
    if v42:IsSome() then
        return "Option<" .. typeof(v42._v) .. ">";
    else
        return "Option<None>";
    end;
end;
v0.__eq = function(v43, v44) --[[ Line: 464 ]] --[[ Name: __eq ]]
    -- upvalues: v0 (copy)
    if v0.Is(v44) then
        if v43:IsSome() and v44:IsSome() then
            return v43:Unwrap() == v44:Unwrap();
        elseif v43:IsNone() and v44:IsNone() then
            return true;
        end;
    end;
    return false;
end;
v0.None = v0._new();
return v0;