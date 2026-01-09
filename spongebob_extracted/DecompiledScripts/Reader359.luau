return {
    new = function(v0) --[[ Line: 5 ]] --[[ Name: new ]]
        local v1 = 0;
        return {
            readu8 = function() --[[ Line: 10 ]] --[[ Name: readu8 ]]
                -- upvalues: v0 (copy), v1 (ref)
                local v2 = buffer.readu8(v0, v1);
                v1 = v1 + 1;
                return v2;
            end, 
            readu16 = function() --[[ Line: 16 ]] --[[ Name: readu16 ]]
                -- upvalues: v0 (copy), v1 (ref)
                local v3 = buffer.readu16(v0, v1);
                v1 = v1 + 2;
                return v3;
            end, 
            readu32 = function() --[[ Line: 22 ]] --[[ Name: readu32 ]]
                -- upvalues: v0 (copy), v1 (ref)
                local v4 = buffer.readu32(v0, v1);
                v1 = v1 + 4;
                return v4;
            end, 
            readi16 = function() --[[ Line: 28 ]] --[[ Name: readi16 ]]
                -- upvalues: v0 (copy), v1 (ref)
                local v5 = buffer.readi16(v0, v1);
                v1 = v1 + 2;
                return v5;
            end, 
            readf32 = function() --[[ Line: 34 ]] --[[ Name: readf32 ]]
                -- upvalues: v0 (copy), v1 (ref)
                local v6 = buffer.readf32(v0, v1);
                v1 = v1 + 4;
                return v6;
            end, 
            readf64 = function() --[[ Line: 40 ]] --[[ Name: readf64 ]]
                -- upvalues: v0 (copy), v1 (ref)
                local v7 = buffer.readf64(v0, v1);
                v1 = v1 + 8;
                return v7;
            end, 
            readstring = function(v8) --[[ Line: 46 ]] --[[ Name: readstring ]]
                -- upvalues: v0 (copy), v1 (ref)
                local v9 = buffer.readstring(v0, v1, v8);
                v1 = v1 + v8;
                return v9;
            end
        };
    end
};