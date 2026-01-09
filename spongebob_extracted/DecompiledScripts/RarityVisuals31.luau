local v0 = {};
local v1 = {};
for _, v3 in script:GetChildren() do
    if v3:IsA("ModuleScript") then
        v1[v3.Name] = require(v3);
    end;
end;
local v4 = {
    "Color", 
    "BackgroundColor3", 
    "ImageColor3", 
    "TextColor3"
};
local v5 = Color3.new(1, 1, 1);
v0.new = function(v6, v7) --[[ Line: 19 ]] --[[ Name: new ]]
    -- upvalues: v4 (copy), v5 (copy), v1 (copy)
    if v6 and not v6:GetAttribute("PRESERVE_COLOR") then
        for _, v9 in v4 do
            if pcall(function() --[[ Line: 22 ]]
                -- upvalues: v6 (copy), v9 (copy)
                return v6[v9];
            end) then
                v6[v9] = v5;
            end;
        end;
    end;
    local l_UIGradient_0 = v6:FindFirstChildOfClass("UIGradient");
    if l_UIGradient_0 then
        l_UIGradient_0:Destroy();
    end;
    return v1[v7](v6);
end;
return v0;