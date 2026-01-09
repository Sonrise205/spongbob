local v0 = require(script.Parent.Parent.Trove);
local v1 = require(script.Parent.Parent.Signal);
local l_UserInputService_0 = game:GetService("UserInputService");
local v3 = {};
v3.__index = v3;
v3.new = function() --[[ Line: 87 ]] --[[ Name: new ]]
    -- upvalues: v3 (copy), v0 (copy), v1 (copy), l_UserInputService_0 (copy)
    local v4 = setmetatable({}, v3);
    v4._trove = v0.new();
    v4.TouchTap = v4._trove:Construct(v1.Wrap, l_UserInputService_0.TouchTap);
    v4.TouchTapInWorld = v4._trove:Construct(v1.Wrap, l_UserInputService_0.TouchTapInWorld);
    v4.TouchMoved = v4._trove:Construct(v1.Wrap, l_UserInputService_0.TouchMoved);
    v4.TouchLongPress = v4._trove:Construct(v1.Wrap, l_UserInputService_0.TouchLongPress);
    v4.TouchPan = v4._trove:Construct(v1.Wrap, l_UserInputService_0.TouchPan);
    v4.TouchPinch = v4._trove:Construct(v1.Wrap, l_UserInputService_0.TouchPinch);
    v4.TouchRotate = v4._trove:Construct(v1.Wrap, l_UserInputService_0.TouchRotate);
    v4.TouchSwipe = v4._trove:Construct(v1.Wrap, l_UserInputService_0.TouchSwipe);
    v4.TouchStarted = v4._trove:Construct(v1.Wrap, l_UserInputService_0.TouchStarted);
    v4.TouchEnded = v4._trove:Construct(v1.Wrap, l_UserInputService_0.TouchEnded);
    return v4;
end;
v3.IsTouchEnabled = function(_) --[[ Line: 109 ]] --[[ Name: IsTouchEnabled ]]
    -- upvalues: l_UserInputService_0 (copy)
    return l_UserInputService_0.TouchEnabled;
end;
v3.Destroy = function(v6) --[[ Line: 116 ]] --[[ Name: Destroy ]]
    v6._trove:Destroy();
end;
return v3;