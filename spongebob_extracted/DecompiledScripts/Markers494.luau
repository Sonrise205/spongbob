local _ = require(script.Parent.NetWireTypes);
local v1 = require(script.Parent.Shared);
local l_Parent_0 = script.Parent.Parent;
local v3 = require(l_Parent_0.Symbol);
local v4 = v3("SIGNAL_MARKER");
local v5 = v3("UNRELIABLE_SIGNAL_MARKER");
local v6 = v3("PROPERTY_MARKER");
local v10 = {
    __index = function(_, v8) --[[ Line: 45 ]] --[[ Name: __index ]]
        error("Attempted to access an uninitialized NetWire object with key: " .. tostring(v8) .. ". Ensure you have initialized the NetWire object prior to accessing this.");
    end, 
    __tostring = function(v9) --[[ Line: 52 ]] --[[ Name: __tostring ]]
        -- upvalues: v4 (copy), v5 (copy), v6 (copy)
        if v9[1] == v4 then
            return "NetWire.EventMarker";
        elseif v9[1] == v5 then
            return "NetWire.UnreliableEventMarker";
        elseif v9[1] == v6 then
            return "NetWire.PropertyMarker";
        else
            return "NetWire.UnknownMarker";
        end;
    end
};
return {
    createEvent = function(v11, v12) --[[ Line: 86 ]] --[[ Name: createEvent ]]
        -- upvalues: v1 (copy), v4 (copy), v10 (copy)
        v1.validateContext(true, "createEvent");
        return (setmetatable({
            v4, 
            v11, 
            v12
        }, v10));
    end, 
    createUnreliableEvent = function(v13, v14) --[[ Line: 108 ]] --[[ Name: createUnreliableEvent ]]
        -- upvalues: v1 (copy), v5 (copy), v10 (copy)
        v1.validateContext(true, "createUnreliableEvent");
        return (setmetatable({
            v5, 
            v13, 
            v14
        }, v10));
    end, 
    createProperty = function(v15, v16, v17) --[[ Line: 135 ]] --[[ Name: createProperty ]]
        -- upvalues: v1 (copy), v6 (copy), v10 (copy)
        v1.validateContext(true, "createProperty");
        return (setmetatable({
            v6, 
            v15, 
            v16, 
            v17
        }, v10));
    end, 
    _SIGNAL_MARKER = v4, 
    _UNRELIABLE_SIGNAL_MARKER = v5, 
    _PROPERTY_MARKER = v6
};