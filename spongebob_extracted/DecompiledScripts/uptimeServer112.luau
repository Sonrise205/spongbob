local v0 = os.time();
return function() --[[ Line: 3 ]]
    -- upvalues: v0 (copy)
    local v1 = os.time() - v0;
    return ("%dd %dh %dm %ds"):format(math.floor(v1 / 86400), math.floor(v1 / 3600) % 24, math.floor(v1 / 60) % 60, math.floor(v1) % 60);
end;