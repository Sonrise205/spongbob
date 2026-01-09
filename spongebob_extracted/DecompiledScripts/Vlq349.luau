local _ = require(script.Parent.Buffer.Reader);
local _ = require(script.Parent.Buffer.Writer);
return {
    encode = function(v2, v3) --[[ Line: 11 ]] --[[ Name: encode ]]
        repeat
            local v4 = bit32.band(v3, 127);
            v3 = bit32.rshift(v3, 7);
            if v3 > 0 then
                v4 = bit32.bor(v4, 128);
            end;
            v2.writeu8(v4);
        until v3 == 0;
    end, 
    decode = function(v5) --[[ Line: 24 ]] --[[ Name: decode ]]
        local v6 = 0;
        local v7 = 0;
        local v8 = nil;
        repeat
            v8 = v5.readu8();
            v6 = bit32.bor(v6, (bit32.lshift(bit32.band(v8, 127), v7)));
            v7 = v7 + 7;
        until bit32.band(v8, 128) == 0;
        return v6;
    end
};