local v0 = require(script.Parent.Buffer.Reader);
local v1 = require(script.Parent.Buffer.Writer);
local v2 = require(script.Parent.Vlq);
return function(v3) --[[ Line: 5 ]]
    -- upvalues: v1 (copy), v2 (copy), v0 (copy)
    local function v8(v4) --[[ Line: 6 ]] --[[ Name: check ]]
        -- upvalues: v1 (ref), v2 (ref), v0 (ref)
        local v5 = v1.new();
        v2.encode(v5, v4);
        local v6 = v5.finish();
        assert(math.max(math.ceil((math.log(v4 + 1, 128))), 1) == buffer.len(v6), "buffer length didn't match expected bytes");
        local v7 = v0.new(v6);
        assert(v2.decode(v7) == v4, "lengths don't match");
    end;
    v3.test("check different lengths", function() --[[ Line: 22 ]]
        -- upvalues: v8 (copy)
        v8(0);
        v8(60);
        v8(127);
        v8(128);
        v8(240);
        v8(523);
        v8(3218932);
    end);
end;