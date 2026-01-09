local _ = require(script.Parent.Parent:WaitForChild("shared"));
return function(v1, v2) --[[ Line: 16 ]] --[[ Name: createMutableSource ]]
    local v3 = {
        _getVersion = v2, 
        _source = v1, 
        _workInProgressVersionPrimary = nil, 
        _workInProgressVersionSecondary = nil
    };
    if _G.__DEV__ then
        v3._currentPrimaryRenderer = nil;
        v3._currentSecondaryRenderer = nil;
    end;
    return v3;
end;