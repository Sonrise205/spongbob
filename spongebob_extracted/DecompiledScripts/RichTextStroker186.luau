local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v2 = {};
v2.__index = v2;
local function _(v3) --[[ Line: 18 ]] --[[ Name: removeStroke ]]
    v3 = string.gsub(v3, "<stroke[^>]+>", "");
    return string.gsub(v3, "</stroke>", "");
end;
local function _(v5) --[[ Line: 23 ]] --[[ Name: toHex ]]
    return string.format("#%02X%02X%02X", v5.R * 255, v5.G * 255, v5.B * 255);
end;
v2.new = function(v7) --[[ Line: 29 ]] --[[ Name: new ]]
    -- upvalues: v1 (copy), v2 (copy)
    local l_UIStroke_0 = v7:FindFirstChildOfClass("UIStroke");
    local v9 = false;
    if v7.RichText == true then
        v9 = l_UIStroke_0 and l_UIStroke_0.ApplyStrokeMode ~= Enum.ApplyStrokeMode.Border;
    end;
    if not v9 then
        return;
    else
        local v10 = setmetatable({
            dumpster = v1.new()
        }, v2);
        local function v17() --[[ Line: 41 ]] --[[ Name: doUpdateStroke ]]
            -- upvalues: v7 (copy), l_UIStroke_0 (copy)
            local l_Text_0 = v7.Text;
            l_Text_0 = string.gsub(l_Text_0, "<stroke[^>]+>", "");
            local v12 = string.gsub(l_Text_0, "</stroke>", "");
            l_Text_0 = string.lower(l_UIStroke_0.LineJoinMode.Name);
            local l_Thickness_0 = l_UIStroke_0.Thickness;
            local l_Transparency_0 = l_UIStroke_0.Transparency;
            local l_Color_0 = l_UIStroke_0.Color;
            local v16 = ("%*%*</stroke>"):format(("<stroke color=\"%*\" joins=\"%*\" thickness=\"%*\" transparency=\"%*\">"):format(string.format("#%02X%02X%02X", l_Color_0.R * 255, l_Color_0.G * 255, l_Color_0.B * 255), l_Text_0, l_Thickness_0, l_Transparency_0), v12);
            if v16 == v12 then
                return;
            else
                v7.Text = v16;
                return;
            end;
        end;
        v10.dumpster:Add(l_UIStroke_0:GetPropertyChangedSignal("Color"):Connect(v17));
        v10.dumpster:Add(l_UIStroke_0:GetPropertyChangedSignal("LineJoinMode"):Connect(v17));
        v10.dumpster:Add(l_UIStroke_0:GetPropertyChangedSignal("Thickness"):Connect(v17));
        v10.dumpster:Add(l_UIStroke_0:GetPropertyChangedSignal("Transparency"):Connect(v17));
        v10.dumpster:Add(v7:GetPropertyChangedSignal("Text"):Connect(v17));
        local l_Text_1 = v7.Text;
        l_Text_1 = string.gsub(l_Text_1, "<stroke[^>]+>", "");
        local v19 = string.gsub(l_Text_1, "</stroke>", "");
        l_Text_1 = string.lower(l_UIStroke_0.LineJoinMode.Name);
        local l_Thickness_1 = l_UIStroke_0.Thickness;
        local l_Transparency_1 = l_UIStroke_0.Transparency;
        local l_Color_1 = l_UIStroke_0.Color;
        local v23 = ("%*%*</stroke>"):format(("<stroke color=\"%*\" joins=\"%*\" thickness=\"%*\" transparency=\"%*\">"):format(string.format("#%02X%02X%02X", l_Color_1.R * 255, l_Color_1.G * 255, l_Color_1.B * 255), l_Text_1, l_Thickness_1, l_Transparency_1), v19);
        if v23 == v19 then
            return v10;
        else
            v7.Text = v23;
            return v10;
        end;
    end;
end;
v2.Destroy = function(v24) --[[ Line: 73 ]] --[[ Name: Destroy ]]
    v24.dumpster:Destroy();
end;
return v2;