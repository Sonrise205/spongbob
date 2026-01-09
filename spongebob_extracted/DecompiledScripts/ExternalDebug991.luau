local l_Parent_0 = script.Parent;
local _ = require(l_Parent_0.Types);
local v2 = nil;
return {
    setDebugger = function(v3) --[[ Line: 26 ]] --[[ Name: setDebugger ]]
        -- upvalues: v2 (ref)
        local l_v2_0 = v2;
        if l_v2_0 ~= nil then
            l_v2_0.stopDebugging();
        end;
        v2 = v3;
        if v3 ~= nil then
            v3.startDebugging();
        end;
        return l_v2_0;
    end, 
    trackScope = function(v5) --[[ Line: 46 ]] --[[ Name: trackScope ]]
        -- upvalues: v2 (ref)
        if v2 == nil then
            return;
        else
            v2.trackScope(v5);
            return;
        end;
    end, 
    untrackScope = function(v6) --[[ Line: 61 ]] --[[ Name: untrackScope ]]
        -- upvalues: v2 (ref)
        if v2 == nil then
            return;
        else
            v2.trackScope(v6);
            return;
        end;
    end
};