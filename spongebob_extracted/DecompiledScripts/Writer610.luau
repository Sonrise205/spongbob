return {
    new = function() --[[ Line: 5 ]] --[[ Name: new ]]
        local v0 = buffer.create(100);
        local v1 = 0;
        local v2 = {};
        local function _(v3) --[[ Line: 11 ]] --[[ Name: resize ]]
            -- upvalues: v0 (ref)
            if v3 <= buffer.len(v0) then
                return;
            else
                local v4 = math.ceil(v3 * 1.5);
                local v5 = buffer.create(v4);
                buffer.copy(v5, 0, v0);
                v0 = v5;
                return;
            end;
        end;
        v2.writeu8 = function(v7) --[[ Line: 24 ]] --[[ Name: writeu8 ]]
            -- upvalues: v1 (ref), v0 (ref)
            local v8 = v1 + 1;
            if v8 > buffer.len(v0) then
                local v9 = math.ceil(v8 * 1.5);
                local v10 = buffer.create(v9);
                buffer.copy(v10, 0, v0);
                v0 = v10;
            end;
            buffer.writeu8(v0, v1, v7);
            v1 = v1 + 1;
        end;
        v2.writeu16 = function(v11) --[[ Line: 30 ]] --[[ Name: writeu16 ]]
            -- upvalues: v1 (ref), v0 (ref)
            local v12 = v1 + 2;
            if v12 > buffer.len(v0) then
                local v13 = math.ceil(v12 * 1.5);
                local v14 = buffer.create(v13);
                buffer.copy(v14, 0, v0);
                v0 = v14;
            end;
            buffer.writeu16(v0, v1, v11);
            v1 = v1 + 2;
        end;
        v2.writeu32 = function(v15) --[[ Line: 36 ]] --[[ Name: writeu32 ]]
            -- upvalues: v1 (ref), v0 (ref)
            local v16 = v1 + 4;
            if v16 > buffer.len(v0) then
                local v17 = math.ceil(v16 * 1.5);
                local v18 = buffer.create(v17);
                buffer.copy(v18, 0, v0);
                v0 = v18;
            end;
            buffer.writeu32(v0, v1, v15);
            v1 = v1 + 4;
        end;
        v2.writei16 = function(v19) --[[ Line: 42 ]] --[[ Name: writei16 ]]
            -- upvalues: v1 (ref), v0 (ref)
            local v20 = v1 + 2;
            if v20 > buffer.len(v0) then
                local v21 = math.ceil(v20 * 1.5);
                local v22 = buffer.create(v21);
                buffer.copy(v22, 0, v0);
                v0 = v22;
            end;
            buffer.writei16(v0, v1, v19);
            v1 = v1 + 2;
        end;
        v2.writef32 = function(v23) --[[ Line: 48 ]] --[[ Name: writef32 ]]
            -- upvalues: v1 (ref), v0 (ref)
            local v24 = v1 + 4;
            if v24 > buffer.len(v0) then
                local v25 = math.ceil(v24 * 1.5);
                local v26 = buffer.create(v25);
                buffer.copy(v26, 0, v0);
                v0 = v26;
            end;
            buffer.writef32(v0, v1, v23);
            v1 = v1 + 4;
        end;
        v2.writef64 = function(v27) --[[ Line: 54 ]] --[[ Name: writef64 ]]
            -- upvalues: v1 (ref), v0 (ref)
            local v28 = v1 + 8;
            if v28 > buffer.len(v0) then
                local v29 = math.ceil(v28 * 1.5);
                local v30 = buffer.create(v29);
                buffer.copy(v30, 0, v0);
                v0 = v30;
            end;
            buffer.writef64(v0, v1, v27);
            v1 = v1 + 8;
        end;
        v2.writestring = function(v31) --[[ Line: 60 ]] --[[ Name: writestring ]]
            -- upvalues: v1 (ref), v0 (ref)
            local v32 = v1 + #v31;
            if v32 > buffer.len(v0) then
                local v33 = math.ceil(v32 * 1.5);
                local v34 = buffer.create(v33);
                buffer.copy(v34, 0, v0);
                v0 = v34;
            end;
            buffer.writestring(v0, v1, v31);
            v1 = v1 + #v31;
        end;
        v2.finish = function() --[[ Line: 66 ]] --[[ Name: finish ]]
            -- upvalues: v1 (ref), v0 (ref)
            local v35 = buffer.create(v1);
            buffer.copy(v35, 0, v0, 0, v1);
            return v35;
        end;
        return v2;
    end
};