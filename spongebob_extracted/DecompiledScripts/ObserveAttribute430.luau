return function(v0, v1, v2) --[[ Line: 1 ]]
    v1 = string.gsub(v1, "%s+", "");
    v2(v0:GetAttribute(v1));
    return v0:GetAttributeChangedSignal(v1):Connect(function() --[[ Line: 9 ]]
        -- upvalues: v2 (copy), v0 (copy), v1 (ref)
        v2(v0:GetAttribute(v1));
    end);
end;