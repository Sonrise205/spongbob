--!native
local function v2(v0, v1) --[[ Line: 11 ]] --[[ Name: newcursor ]]
    return {
        Buf = buffer.create(v0 or 8), 
        Pos = v1 or 0
    };
end;
local function v4(v3) --[[ Line: 18 ]] --[[ Name: frombuffer ]]
    return {
        Buf = v3, 
        Pos = buffer.len(v3)
    };
end;
local function v7(v5) --[[ Line: 25 ]] --[[ Name: tobuffer ]]
    local v6 = buffer.create(v5.Pos);
    buffer.copy(v6, 0, v5.Buf, 0, v5.Pos);
    return v6;
end;
local function v15(v8, v9) --[[ Line: 31 ]] --[[ Name: tryRealloc ]]
    local l_Buf_0 = v8.Buf;
    local l_Pos_0 = v8.Pos;
    local v12 = buffer.len(l_Buf_0);
    if v12 < l_Pos_0 + v9 then
        local v13 = math.ceil((math.log((v9 + l_Pos_0) / v12, 1.5)));
        local v14 = buffer.create(v12 * 1.5 ^ v13);
        buffer.copy(v14, 0, l_Buf_0, 0);
        v8.Buf = v14;
    end;
end;
local function v18(v16, v17) --[[ Line: 43 ]] --[[ Name: pushu1 ]]
    -- upvalues: v15 (copy)
    v15(v16, 1);
    buffer.writeu8(v16.Buf, v16.Pos, v17);
    v16.Pos = v16.Pos + 1;
end;
local function v20(v19) --[[ Line: 49 ]] --[[ Name: popu1 ]]
    v19.Pos = v19.Pos - 1;
    return (buffer.readu8(v19.Buf, v19.Pos));
end;
local function v23(v21, v22) --[[ Line: 54 ]] --[[ Name: pushu2 ]]
    -- upvalues: v15 (copy)
    v15(v21, 2);
    buffer.writeu16(v21.Buf, v21.Pos, v22);
    v21.Pos = v21.Pos + 2;
end;
local function v25(v24) --[[ Line: 60 ]] --[[ Name: popu2 ]]
    v24.Pos = v24.Pos - 2;
    return (buffer.readu16(v24.Buf, v24.Pos));
end;
local function v28(v26, v27) --[[ Line: 65 ]] --[[ Name: pushu3 ]]
    -- upvalues: v15 (copy)
    v15(v26, 3);
    buffer.writeu8(v26.Buf, v26.Pos, v27);
    buffer.writeu16(v26.Buf, v26.Pos + 1, v27 // 256);
    v26.Pos = v26.Pos + 3;
end;
local function v30(v29) --[[ Line: 72 ]] --[[ Name: popu3 ]]
    v29.Pos = v29.Pos - 3;
    return buffer.readu8(v29.Buf, v29.Pos) + buffer.readu16(v29.Buf, v29.Pos + 1) * 256;
end;
local function v33(v31, v32) --[[ Line: 79 ]] --[[ Name: pushu4 ]]
    -- upvalues: v15 (copy)
    v15(v31, 4);
    buffer.writeu32(v31.Buf, v31.Pos, v32);
    v31.Pos = v31.Pos + 4;
end;
local function v35(v34) --[[ Line: 85 ]] --[[ Name: popu4 ]]
    v34.Pos = v34.Pos - 4;
    return (buffer.readu32(v34.Buf, v34.Pos));
end;
local function v38(v36, v37) --[[ Line: 90 ]] --[[ Name: pushu5 ]]
    -- upvalues: v15 (copy)
    v15(v36, 5);
    buffer.writeu8(v36.Buf, v36.Pos, v37);
    buffer.writeu32(v36.Buf, v36.Pos + 1, v37 // 256);
    v36.Pos = v36.Pos + 5;
end;
local function v40(v39) --[[ Line: 97 ]] --[[ Name: popu5 ]]
    v39.Pos = v39.Pos - 5;
    return buffer.readu8(v39.Buf, v39.Pos) + buffer.readu32(v39.Buf, v39.Pos + 1) * 256;
end;
local function v43(v41, v42) --[[ Line: 104 ]] --[[ Name: pushu6 ]]
    -- upvalues: v15 (copy)
    v15(v41, 6);
    buffer.writeu16(v41.Buf, v41.Pos, v42);
    buffer.writeu32(v41.Buf, v41.Pos + 2, v42 // 65536);
    v41.Pos = v41.Pos + 6;
end;
local function v45(v44) --[[ Line: 111 ]] --[[ Name: popu6 ]]
    v44.Pos = v44.Pos - 6;
    return buffer.readu16(v44.Buf, v44.Pos) + buffer.readu32(v44.Buf, v44.Pos + 2) * 65536;
end;
local function v48(v46, v47) --[[ Line: 118 ]] --[[ Name: pushu7 ]]
    -- upvalues: v15 (copy)
    v15(v46, 7);
    buffer.writeu8(v46.Buf, v46.Pos, v47);
    buffer.writeu16(v46.Buf, v46.Pos + 1, v47 // 256);
    buffer.writeu32(v46.Buf, v46.Pos + 3, v47 // 16777216);
    v46.Pos = v46.Pos + 7;
end;
local function v53(v49) --[[ Line: 126 ]] --[[ Name: popu7 ]]
    v49.Pos = v49.Pos - 7;
    local v50 = buffer.readu8(v49.Buf, v49.Pos);
    local v51 = buffer.readu16(v49.Buf, v49.Pos + 1);
    local v52 = buffer.readu32(v49.Buf, v49.Pos + 3);
    return v50 + v51 * 256 + v52 * 16777216;
end;
local function v56(v54, v55) --[[ Line: 134 ]] --[[ Name: pushu8 ]]
    -- upvalues: v15 (copy)
    v15(v54, 8);
    buffer.writeu32(v54.Buf, v54.Pos, v55);
    buffer.writeu32(v54.Buf, v54.Pos + 4, v55 // 4294967296);
    v54.Pos = v54.Pos + 8;
end;
local function v58(v57) --[[ Line: 141 ]] --[[ Name: popu8 ]]
    v57.Pos = v57.Pos - 8;
    return buffer.readu32(v57.Buf, v57.Pos) + buffer.readu32(v57.Buf, v57.Pos + 4) * 4294967296;
end;
local function v61(v59, v60) --[[ Line: 148 ]] --[[ Name: pushi1 ]]
    -- upvalues: v15 (copy)
    v15(v59, 1);
    buffer.writei8(v59.Buf, v59.Pos, v60);
    v59.Pos = v59.Pos + 1;
end;
local function v63(v62) --[[ Line: 154 ]] --[[ Name: popi1 ]]
    v62.Pos = v62.Pos - 1;
    return (buffer.readi8(v62.Buf, v62.Pos));
end;
local function v66(v64, v65) --[[ Line: 159 ]] --[[ Name: pushi2 ]]
    -- upvalues: v15 (copy)
    v15(v64, 2);
    buffer.writei16(v64.Buf, v64.Pos, v65);
    v64.Pos = v64.Pos + 2;
end;
local function v68(v67) --[[ Line: 165 ]] --[[ Name: popi2 ]]
    v67.Pos = v67.Pos - 2;
    return (buffer.readi16(v67.Buf, v67.Pos));
end;
local function v71(v69, v70) --[[ Line: 170 ]] --[[ Name: pushi3 ]]
    -- upvalues: v15 (copy)
    v70 = v70 % 16777216;
    if v70 < 0 then
        v70 = v70 + 16777216;
    end;
    v15(v69, 3);
    buffer.writeu8(v69.Buf, v69.Pos, v70);
    buffer.writeu16(v69.Buf, v69.Pos + 1, v70 // 256);
    v69.Pos = v69.Pos + 3;
end;
local function v74(v72) --[[ Line: 179 ]] --[[ Name: popi3 ]]
    v72.Pos = v72.Pos - 3;
    local v73 = buffer.readu8(v72.Buf, v72.Pos) + buffer.readu16(v72.Buf, v72.Pos + 1) * 256;
    if v73 > 65535 then
        return v73 - 16777216;
    else
        return v73;
    end;
end;
local function v77(v75, v76) --[[ Line: 187 ]] --[[ Name: pushi4 ]]
    -- upvalues: v15 (copy)
    v15(v75, 4);
    buffer.writei32(v75.Buf, v75.Pos, v76);
    v75.Pos = v75.Pos + 4;
end;
local function v79(v78) --[[ Line: 193 ]] --[[ Name: popi4 ]]
    v78.Pos = v78.Pos - 4;
    return (buffer.readi32(v78.Buf, v78.Pos));
end;
local function v82(v80, v81) --[[ Line: 198 ]] --[[ Name: pushi5 ]]
    -- upvalues: v15 (copy)
    v81 = v81 % 1099511627776;
    if v81 < 0 then
        v81 = v81 + 1099511627776;
    end;
    v15(v80, 5);
    buffer.writei8(v80.Buf, v80.Pos, v81);
    buffer.writei32(v80.Buf, v80.Pos + 1, v81 // 256);
    v80.Pos = v80.Pos + 5;
end;
local function v85(v83) --[[ Line: 207 ]] --[[ Name: popi5 ]]
    v83.Pos = v83.Pos - 5;
    local v84 = buffer.readi8(v83.Buf, v83.Pos) + buffer.readi32(v83.Buf, v83.Pos + 1) * 256;
    if v84 > 4294967295 then
        return v84 - 1099511627776;
    else
        return v84;
    end;
end;
local function v88(v86, v87) --[[ Line: 215 ]] --[[ Name: pushi6 ]]
    -- upvalues: v15 (copy)
    v87 = v87 % 281474976710656;
    if v87 < 0 then
        v87 = v87 + 281474976710656;
    end;
    v15(v86, 6);
    buffer.writei16(v86.Buf, v86.Pos, v87);
    buffer.writei32(v86.Buf, v86.Pos + 2, v87 // 65536);
    v86.Pos = v86.Pos + 6;
end;
local function v91(v89) --[[ Line: 224 ]] --[[ Name: popi6 ]]
    v89.Pos = v89.Pos - 6;
    local v90 = buffer.readi16(v89.Buf, v89.Pos) + buffer.readi32(v89.Buf, v89.Pos + 2) * 65536;
    if v90 > 1099511627775 then
        return v90 - 281474976710656;
    else
        return v90;
    end;
end;
local function v94(v92, v93) --[[ Line: 232 ]] --[[ Name: pushi7 ]]
    -- upvalues: v15 (copy)
    v93 = v93 % 7.205759403792794E16;
    if v93 < 0 then
        v93 = v93 + 7.205759403792794E16;
    end;
    v15(v92, 7);
    buffer.writei8(v92.Buf, v92.Pos, v93);
    buffer.writei16(v92.Buf, v92.Pos + 1, v93 // 256);
    buffer.writei32(v92.Buf, v92.Pos + 3, v93 // 16777216);
    v92.Pos = v92.Pos + 7;
end;
local function v100(v95) --[[ Line: 242 ]] --[[ Name: popi7 ]]
    v95.Pos = v95.Pos - 7;
    local v96 = buffer.readi8(v95.Buf, v95.Pos);
    local v97 = buffer.readi16(v95.Buf, v95.Pos + 1);
    local v98 = buffer.readi32(v95.Buf, v95.Pos + 3);
    local v99 = v96 + v97 * 256 + v98 * 16777216;
    if v99 > 281474976710655 then
        return v99 - 7.205759403792794E16;
    else
        return v99;
    end;
end;
local function v103(v101, v102) --[[ Line: 251 ]] --[[ Name: pushi8 ]]
    -- upvalues: v15 (copy)
    v102 = v102 % 1.8446744073709552E19;
    if v102 < 0 then
        v102 = 1.8446744073709552E19 - v102;
    end;
    v15(v101, 8);
    buffer.writei32(v101.Buf, v101.Pos, v102);
    buffer.writei32(v101.Buf, v101.Pos + 4, v102 // 4294967296);
    v101.Pos = v101.Pos + 8;
end;
local function v106(v104) --[[ Line: 260 ]] --[[ Name: popi8 ]]
    v104.Pos = v104.Pos - 8;
    local v105 = buffer.readi32(v104.Buf, v104.Pos) + buffer.readi32(v104.Buf, v104.Pos + 4) * 4294967296;
    if v105 > 7.205759403792794E16 then
        return v105 - 1.8446744073709552E19;
    else
        return v105;
    end;
end;
local function v109(v107, v108) --[[ Line: 268 ]] --[[ Name: pushf4 ]]
    -- upvalues: v15 (copy)
    v15(v107, 4);
    buffer.writef32(v107.Buf, v107.Pos, v108);
    v107.Pos = v107.Pos + 4;
end;
local function v111(v110) --[[ Line: 274 ]] --[[ Name: popf4 ]]
    v110.Pos = v110.Pos - 4;
    return (buffer.readf32(v110.Buf, v110.Pos));
end;
local function v114(v112, v113) --[[ Line: 279 ]] --[[ Name: pushf8 ]]
    -- upvalues: v15 (copy)
    v15(v112, 8);
    buffer.writef64(v112.Buf, v112.Pos, v113);
    v112.Pos = v112.Pos + 8;
end;
local function v116(v115) --[[ Line: 285 ]] --[[ Name: popf8 ]]
    v115.Pos = v115.Pos - 8;
    return (buffer.readf64(v115.Buf, v115.Pos));
end;
local function v127(v117, v118, v119, v120, v121, v122, v123, v124, v125) --[[ Line: 290 ]] --[[ Name: pushbool ]]
    -- upvalues: v15 (copy)
    local v126 = (v118 and 1 or 0) + (v119 and 2 or 0) + (v120 and 4 or 0) + (v121 and 8 or 0) + (v122 and 16 or 0) + (v123 and 32 or 0) + (v124 and 64 or 0) + (v125 and 128 or 0);
    v15(v117, 1);
    buffer.writeu8(v117.Buf, v117.Pos, v126);
    v117.Pos = v117.Pos + 1;
end;
local function v130(v128) --[[ Line: 303 ]] --[[ Name: popbool ]]
    v128.Pos = v128.Pos - 1;
    local v129 = buffer.readu8(v128.Buf, v128.Pos);
    return v129 % 2 >= 1, v129 % 4 >= 2, v129 % 8 >= 4, v129 % 16 >= 8, v129 % 32 >= 16, v129 % 64 >= 32, v129 % 128 >= 64, v129 % 256 >= 128;
end;
local function v149(v131, v132) --[[ Line: 316 ]] --[[ Name: pushvlq ]]
    -- upvalues: v15 (copy)
    local v133 = v132 // 1 % 128;
    local v134 = v132 // 128 % 128;
    local v135 = v132 // 16384 % 128;
    local v136 = v132 // 2097152 % 128;
    local v137 = v132 // 268435456 % 128;
    local v138 = v132 // 34359738368 % 128;
    local v139 = v132 // 4398046511104 % 128;
    local v140 = v132 // 562949953421312 % 128;
    if v140 ~= 0 then
        local v141 = v133 * 7.205759403792794E16 + v134 * 281474976710656 + v135 * 1099511627776 + v136 * 4294967296 + v137 * 16777216 + v138 * 65536 + v139 * 256 + v140 + 128;
        v15(v131, 8);
        buffer.writeu32(v131.Buf, v131.Pos, v141);
        buffer.writeu32(v131.Buf, v131.Pos + 4, v141 // 4294967296);
        v131.Pos = v131.Pos + 8;
        return;
    elseif v139 ~= 0 then
        local v142 = v133 * 281474976710656 + v134 * 1099511627776 + v135 * 4294967296 + v136 * 16777216 + v137 * 65536 + v138 * 256 + v139 + 128;
        v15(v131, 7);
        buffer.writeu8(v131.Buf, v131.Pos, v142);
        buffer.writeu16(v131.Buf, v131.Pos + 1, v142 // 256);
        buffer.writeu32(v131.Buf, v131.Pos + 3, v142 // 16777216);
        v131.Pos = v131.Pos + 7;
        return;
    elseif v138 ~= 0 then
        local v143 = v133 * 1099511627776 + v134 * 4294967296 + v135 * 16777216 + v136 * 65536 + v137 * 256 + v138 + 128;
        v15(v131, 6);
        buffer.writeu16(v131.Buf, v131.Pos, v143);
        buffer.writeu32(v131.Buf, v131.Pos + 2, v143 // 65536);
        v131.Pos = v131.Pos + 6;
        return;
    elseif v137 ~= 0 then
        local v144 = v133 * 4294967296 + v134 * 16777216 + v135 * 65536 + v136 * 256 + v137 + 128;
        v15(v131, 5);
        buffer.writeu8(v131.Buf, v131.Pos, v144);
        buffer.writeu32(v131.Buf, v131.Pos + 1, v144 // 256);
        v131.Pos = v131.Pos + 5;
        return;
    elseif v136 ~= 0 then
        local v145 = v133 * 16777216 + v134 * 65536 + v135 * 256 + v136 + 128;
        v15(v131, 4);
        buffer.writeu32(v131.Buf, v131.Pos, v145);
        v131.Pos = v131.Pos + 4;
        return;
    elseif v135 ~= 0 then
        local v146 = v133 * 65536 + v134 * 256 + v135 + 128;
        v15(v131, 3);
        buffer.writeu8(v131.Buf, v131.Pos, v146);
        buffer.writeu16(v131.Buf, v131.Pos + 1, v146 // 256);
        v131.Pos = v131.Pos + 3;
        return;
    elseif v134 ~= 0 then
        local v147 = v133 * 256 + v134 + 128;
        v15(v131, 2);
        buffer.writeu16(v131.Buf, v131.Pos, v147);
        v131.Pos = v131.Pos + 2;
        return;
    else
        local v148 = v133 + 128;
        v15(v131, 1);
        buffer.writeu8(v131.Buf, v131.Pos, v148);
        v131.Pos = v131.Pos + 1;
        return;
    end;
end;
local function v153(v150) --[[ Line: 345 ]] --[[ Name: popvlq ]]
    v150.Pos = v150.Pos - 1;
    local v151 = buffer.readu8(v150.Buf, v150.Pos);
    if v151 >= 128 then
        return v151 - 128;
    else
        local l_v151_0 = v151;
        v150.Pos = v150.Pos - 1;
        v151 = buffer.readu8(v150.Buf, v150.Pos);
        if v151 >= 128 then
            return l_v151_0 + (v151 - 128) * 128;
        else
            l_v151_0 = l_v151_0 + v151 * 128;
            v150.Pos = v150.Pos - 1;
            v151 = buffer.readu8(v150.Buf, v150.Pos);
            if v151 >= 128 then
                return l_v151_0 + (v151 - 128) * 16384;
            else
                l_v151_0 = l_v151_0 + v151 * 16384;
                v150.Pos = v150.Pos - 1;
                v151 = buffer.readu8(v150.Buf, v150.Pos);
                if v151 >= 128 then
                    return l_v151_0 + (v151 - 128) * 2097152;
                else
                    l_v151_0 = l_v151_0 + v151 * 2097152;
                    v150.Pos = v150.Pos - 1;
                    v151 = buffer.readu8(v150.Buf, v150.Pos);
                    if v151 >= 128 then
                        return l_v151_0 + (v151 - 128) * 268435456;
                    else
                        l_v151_0 = l_v151_0 + v151 * 268435456;
                        v150.Pos = v150.Pos - 1;
                        v151 = buffer.readu8(v150.Buf, v150.Pos);
                        if v151 >= 128 then
                            return l_v151_0 + (v151 - 128) * 34359738368;
                        else
                            l_v151_0 = l_v151_0 + v151 * 34359738368;
                            v150.Pos = v150.Pos - 1;
                            v151 = buffer.readu8(v150.Buf, v150.Pos);
                            if v151 >= 128 then
                                return l_v151_0 + (v151 - 128) * 4398046511104;
                            else
                                l_v151_0 = l_v151_0 + v151 * 4398046511104;
                                v150.Pos = v150.Pos - 1;
                                v151 = buffer.readu8(v150.Buf, v150.Pos);
                                if v151 >= 128 then
                                    return l_v151_0 + (v151 - 128) * 562949953421312;
                                else
                                    l_v151_0 = l_v151_0 + v151 * 562949953421312;
                                    error((("Not a valid vlq: %* = %*"):format(l_v151_0, (buffer.tostring(v150.Buf)))));
                                    return;
                                end;
                            end;
                        end;
                    end;
                end;
            end;
        end;
    end;
end;
local function v158(v154, v155, v156) --[[ Line: 397 ]] --[[ Name: pushstr ]]
    -- upvalues: v15 (copy), v149 (copy)
    local v157 = v156 or #v155;
    v15(v154, v157);
    buffer.writestring(v154.Buf, v154.Pos, v155);
    v154.Pos = v154.Pos + v157;
    if not v156 then
        v149(v154, v157);
    end;
end;
local function v162(v159, v160) --[[ Line: 408 ]] --[[ Name: popstr ]]
    -- upvalues: v153 (copy)
    local v161 = v160 or v153(v159);
    v159.Pos = v159.Pos - v161;
    return buffer.readstring(v159.Buf, v159.Pos, v161);
end;
local function v167(v163, v164, v165) --[[ Line: 414 ]] --[[ Name: pushbuf ]]
    -- upvalues: v15 (copy), v149 (copy)
    local v166 = v165 or buffer.len(v164);
    v15(v163, v166);
    buffer.copy(v163.Buf, v163.Pos, v164, 0, v166);
    v163.Pos = v163.Pos + v166;
    if not v165 then
        v149(v163, v166);
    end;
end;
local function v172(v168, v169) --[[ Line: 425 ]] --[[ Name: popbuf ]]
    -- upvalues: v153 (copy)
    local v170 = v169 or v153(v168);
    v168.Pos = v168.Pos - v170;
    local v171 = buffer.create(v170);
    buffer.copy(v171, 0, v168.Buf, v168.Pos, v170);
    return v171;
end;
local v180 = {
    print = function(v173) --[[ Line: 433 ]] --[[ Name: printcursor ]]
        local v174 = {
            string.byte(buffer.tostring(v173.Buf), 1, -1)
        };
        local v175 = 7;
        for v176 = 1, v173.Pos do
            local v177 = v174[v176];
            v175 = v175 + ((v177 == 0 and 1 or math.ceil((math.log10(1 + v177)))) + 1);
        end;
        local v178 = v174[v173.Pos + 1];
        if v178 then
            v175 = v175 + (v178 == 0 and 1 or math.ceil((math.log10(1 + v178)))) // 2;
        end;
        if #v174 == 0 or v173.Pos == buffer.len(v173.Buf) then
            table.insert(v174, " ");
        end;
        print((("Pos: %* / %*\nBuf: { %* }\n%*^"):format(v173.Pos, buffer.len(v173.Buf), table.concat(v174, " "), (string.rep(" ", v175)))));
    end, 
    cursor = v2, 
    frombuffer = v4, 
    tobuffer = v7, 
    T = function(v179) --[[ Line: 467 ]] --[[ Name: T ]]
        return v179;
    end
};
local v181 = {
    ser = v127, 
    des = v130
};
v180.boolean = function() --[[ Line: 475 ]] --[[ Name: boolean ]]
    -- upvalues: v181 (copy)
    return v181;
end;
local v182 = {};
v180.uint = function(v183) --[[ Line: 480 ]] --[[ Name: uint ]]
    -- upvalues: v182 (copy), v18 (copy), v20 (copy), v23 (copy), v25 (copy), v28 (copy), v30 (copy), v33 (copy), v35 (copy), v38 (copy), v40 (copy), v43 (copy), v45 (copy), v48 (copy), v53 (copy), v56 (copy), v58 (copy)
    if v182[v183] then
        return v182[v183];
    else
        local v184 = nil;
        local v185 = nil;
        if v183 == 1 then
            v184 = v18;
            v185 = v20;
        elseif v183 == 2 then
            v184 = v23;
            v185 = v25;
        elseif v183 == 3 then
            v184 = v28;
            v185 = v30;
        elseif v183 == 4 then
            v184 = v33;
            v185 = v35;
        elseif v183 == 5 then
            v184 = v38;
            v185 = v40;
        elseif v183 == 6 then
            v184 = v43;
            v185 = v45;
        elseif v183 == 7 then
            v184 = v48;
            v185 = v53;
        elseif v183 == 8 then
            v184 = v56;
            v185 = v58;
        else
            error((("uint bytes must be integer between [1, 8], got %*"):format(v183)));
        end;
        local v186 = {
            ser = v184, 
            des = v185
        };
        v182[v183] = v186;
        return v186;
    end;
end;
local v187 = {};
v180.int = function(v188) --[[ Line: 516 ]] --[[ Name: int ]]
    -- upvalues: v187 (copy), v61 (copy), v63 (copy), v66 (copy), v68 (copy), v71 (copy), v74 (copy), v77 (copy), v79 (copy), v82 (copy), v85 (copy), v88 (copy), v91 (copy), v94 (copy), v100 (copy), v103 (copy), v106 (copy)
    if v187[v188] then
        return v187[v188];
    else
        local v189 = nil;
        local v190 = nil;
        if v188 == 1 then
            v189 = v61;
            v190 = v63;
        elseif v188 == 2 then
            v189 = v66;
            v190 = v68;
        elseif v188 == 3 then
            v189 = v71;
            v190 = v74;
        elseif v188 == 4 then
            v189 = v77;
            v190 = v79;
        elseif v188 == 5 then
            v189 = v82;
            v190 = v85;
        elseif v188 == 6 then
            v189 = v88;
            v190 = v91;
        elseif v188 == 7 then
            v189 = v94;
            v190 = v100;
        elseif v188 == 8 then
            v189 = v103;
            v190 = v106;
        else
            error((("int bytes must be integer between [1, 8], got %*"):format(v188)));
        end;
        local v191 = {
            ser = v189, 
            des = v190
        };
        v187[v188] = v191;
        return v191;
    end;
end;
local v192 = {};
v180.number = function(v193) --[[ Line: 552 ]] --[[ Name: num ]]
    -- upvalues: v192 (copy), v109 (copy), v111 (copy), v114 (copy), v116 (copy), v187 (copy)
    if v192[v193] then
        return v192[v193];
    else
        local v194 = nil;
        local v195 = nil;
        if v193 == 4 then
            v194 = v109;
            v195 = v111;
        elseif v193 == 8 then
            v194 = v114;
            v195 = v116;
        else
            error((("number bytes must be integer 4 or 8, got %*"):format(v193)));
        end;
        local v196 = {
            ser = v194, 
            des = v195
        };
        v187[v193] = v196;
        return v196;
    end;
end;
local v197 = {
    ser = v158, 
    des = v162
};
local v198 = {};
local v207 = {
    __call = function(_, v200) --[[ Line: 581 ]] --[[ Name: __call ]]
        -- upvalues: v197 (copy), v198 (copy), v15 (copy), v149 (copy), v162 (copy)
        if not v200 then
            return v197;
        elseif v198[v200] then
            return v198[v200];
        else
            local v206 = {
                ser = function(v201, v202) --[[ Line: 591 ]] --[[ Name: ser ]]
                    -- upvalues: v200 (copy), v15 (ref), v149 (ref)
                    local l_v200_0 = v200;
                    local v204 = l_v200_0 or #v202;
                    v15(v201, v204);
                    buffer.writestring(v201.Buf, v201.Pos, v202);
                    v201.Pos = v201.Pos + v204;
                    if not l_v200_0 then
                        v149(v201, v204);
                    end;
                end, 
                des = function(v205) --[[ Line: 595 ]] --[[ Name: des ]]
                    -- upvalues: v162 (ref), v200 (copy)
                    return v162(v205, v200);
                end
            };
            v198[v200] = v206;
            return v206;
        end;
    end
};
local v228 = {
    convert = function(v208, v209, v210) --[[ Line: 604 ]] --[[ Name: convert ]]
        local v211 = {};
        for v212 = 1, #v209 do
            v211[string.byte(v209, v212)] = v212 - 1;
        end;
        local v213 = {};
        for v214 = 1, #v210 do
            v213[v214 - 1] = string.byte(v210, v214);
        end;
        local v215 = {};
        for v216 = 1, #v208 do
            table.insert(v215, v211[string.byte(v208, v216)]);
        end;
        local v217 = {};
        local v218 = #v209;
        local v219 = #v210;
        local v220 = nil;
        local v221 = nil;
        while #v215 > 0 do
            v220 = 0;
            for v222 = 1, #v215 do
                v221 = v215[v222] + v220 * v218;
                v215[v222] = math.floor(v221 / v219);
                v220 = v221 % v219;
            end;
            while #v215 > 0 and v215[1] == 0 do
                table.remove(v215, 1);
            end;
            table.insert(v217, 1, (string.char(v213[v220])));
        end;
        return table.concat(v217);
    end, 
    alphabet = function(v223) --[[ Line: 642 ]] --[[ Name: alphabet ]]
        local v224 = {};
        local v225 = table.create(#v223);
        for v226 = 1, #v223 do
            local v227 = string.sub(v223, v226, v226);
            if not v224[v227] then
                v224[v227] = true;
                table.insert(v225, v227);
            end;
        end;
        table.sort(v225);
        return table.concat(v225);
    end, 
    binary = "01", 
    octal = "01234567", 
    decimal = "0123456789", 
    duodecimal = "0123456789AB", 
    hexadecimal = "0123456789ABCDEF"
};
local v229 = table.create(256);
for v230 = 0, 255 do
    v229[v230 + 1] = string.char(v230);
end;
v228.utf8 = table.concat(v229);
v228.lower = "abcdefghijklmnopqrstuvwxyz";
v228.upper = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
v228.letters = v228.lower .. v228.upper;
v228.punctuation = " .,?!:;'\"-_";
v228.english = v228.letters .. v228.punctuation;
v228.filepath = v228.letters .. ":/";
v228.datastore = " !#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[]^_`abcdefghijklmnopqrstuvwxyz{|}~";
v180.string = setmetatable(v228, v207);
local v231 = {};
v180.opt = function(v232) --[[ Line: 677 ]] --[[ Name: opt ]]
    -- upvalues: v231 (copy), v15 (copy)
    if v231[v232] then
        return v231[v232];
    else
        local v236 = {
            ser = function(v233, v234) --[[ Line: 683 ]] --[[ Name: ser ]]
                -- upvalues: v15 (ref), v232 (copy)
                if v234 == nil then
                    v15(v233, 1);
                    buffer.writeu8(v233.Buf, v233.Pos, 0);
                    v233.Pos = v233.Pos + 1;
                    return;
                else
                    v232.ser(v233, v234);
                    v15(v233, 1);
                    buffer.writeu8(v233.Buf, v233.Pos, 1);
                    v233.Pos = v233.Pos + 1;
                    return;
                end;
            end, 
            des = function(v235) --[[ Line: 692 ]] --[[ Name: des ]]
                -- upvalues: v232 (copy)
                v235.Pos = v235.Pos - 1;
                if buffer.readu8(v235.Buf, v235.Pos) == 1 then
                    return v232.des(v235);
                else
                    return nil;
                end;
            end
        };
        v231[v232] = v236;
        return v236;
    end;
end;
local v237 = {
    ser = v167, 
    des = v172
};
local v238 = {};
v180.buffer = function(v239) --[[ Line: 709 ]] --[[ Name: buffer ]]
    -- upvalues: v237 (copy), v238 (copy), v167 (copy), v153 (copy)
    if not v239 then
        return v237;
    elseif v238[v239] then
        return v238[v239];
    else
        local v245 = {
            ser = function(v240, v241) --[[ Line: 719 ]] --[[ Name: ser ]]
                -- upvalues: v167 (ref), v239 (copy)
                v167(v240, v241, v239);
            end, 
            des = function(v242) --[[ Line: 723 ]] --[[ Name: des ]]
                -- upvalues: v239 (copy), v153 (ref)
                local v243 = v239 or v153(v242);
                v242.Pos = v242.Pos - v243;
                local v244 = buffer.create(v243);
                buffer.copy(v244, 0, v242.Buf, v242.Pos, v243);
                return v244;
            end
        };
        v238[v239] = v245;
        return v245;
    end;
end;
local v246 = {
    ser = v149, 
    des = v153
};
v180.vlq = function() --[[ Line: 735 ]] --[[ Name: vlq ]]
    -- upvalues: v246 (copy)
    return v246;
end;
local v247 = {};
v180.array = function(v248, v249) --[[ Line: 740 ]] --[[ Name: array ]]
    -- upvalues: v247 (copy), v149 (copy), v153 (copy)
    local v250 = v247[v248];
    local v251 = v249 or 0;
    if v250 then
        if v250[v251] then
            return v250[v251];
        end;
    else
        v250 = {};
        v247[v248] = v250;
    end;
    local l_ser_0 = v248.ser;
    local l_des_0 = v248.des;
    local v268 = {
        ser = v249 and function(v254, v255) --[[ Line: 755 ]]
            -- upvalues: l_ser_0 (copy), v249 (copy)
            local l_l_ser_0_0 = l_ser_0;
            for v257 = 1, v249 do
                l_l_ser_0_0(v254, v255[v257]);
            end;
        end or function(v258, v259) --[[ Line: 760 ]]
            -- upvalues: l_ser_0 (copy), v149 (ref)
            local l_l_ser_0_1 = l_ser_0;
            for _, v262 in v259 do
                l_l_ser_0_1(v258, v262);
            end;
            v149(v258, #v259);
        end, 
        des = function(v263) --[[ Line: 768 ]] --[[ Name: des ]]
            -- upvalues: l_des_0 (copy), v249 (copy), v153 (ref)
            local l_l_des_0_0 = l_des_0;
            local v265 = v249 or v153(v263);
            local v266 = table.create(v265);
            for v267 = v265, 1, -1 do
                v266[v267] = l_l_des_0_0(v263);
            end;
            return v266;
        end
    };
    v250[v251] = v268;
    return v268;
end;
v180.tuple = function(...) --[[ Line: 784 ]] --[[ Name: tuple ]]
    local v269 = {
        ...
    };
    local v270 = #v269;
    if v270 == 1 then
        return v269[1];
    else
        return {
            ser = function(v271, ...) --[[ Line: 792 ]] --[[ Name: ser ]]
                -- upvalues: v269 (copy)
                for v272, v273 in {
                    ...
                } do
                    v269[v272].ser(v271, v273);
                end;
            end, 
            des = function(v274) --[[ Line: 798 ]] --[[ Name: des ]]
                -- upvalues: v270 (copy), v269 (copy)
                local v275 = table.create(v270);
                for v276 = v270, 1, -1 do
                    v275[v276] = v269[v276].des(v274);
                end;
                return table.unpack(v275);
            end
        };
    end;
end;
v180.record = function(v277) --[[ Line: 810 ]] --[[ Name: record ]]
    -- upvalues: v181 (copy), v15 (copy)
    local v278 = {};
    local v279 = {};
    for v280, v281 in v277 do
        if type(v280) == "string" then
            if v281 == v181 then
                table.insert(v278, v280);
            else
                table.insert(v279, v280);
            end;
        end;
    end;
    table.sort(v279);
    table.insert(v279, v277[true]);
    table.insert(v279, v277[false]);
    local v282 = #v278;
    if v282 > 0 then
        table.sort(v278);
    end;
    return {
        ser = v282 == 0 and function(v283, v284) --[[ Line: 833 ]]
            -- upvalues: v279 (copy), v277 (copy)
            for _, v286 in v279 do
                v277[v286].ser(v283, v284[v286]);
            end;
        end or function(v287, v288) --[[ Line: 839 ]]
            -- upvalues: v282 (copy), v278 (copy), v15 (ref), v279 (copy), v277 (copy)
            for v289 = 0, v282 // 8 do
                local v290 = 1 + v289 * 8;
                local v291 = v288[v278[v290 + 0]];
                local v292 = v288[v278[v290 + 1]];
                local v293 = v288[v278[v290 + 2]];
                local v294 = v288[v278[v290 + 3]];
                local v295 = v288[v278[v290 + 4]];
                local v296 = v288[v278[v290 + 5]];
                local v297 = v288[v278[v290 + 6]];
                local v298 = v288[v278[v290 + 7]];
                local v299 = (v291 and 1 or 0) + (v292 and 2 or 0) + (v293 and 4 or 0) + (v294 and 8 or 0) + (v295 and 16 or 0) + (v296 and 32 or 0) + (v297 and 64 or 0) + (v298 and 128 or 0);
                v15(v287, 1);
                buffer.writeu8(v287.Buf, v287.Pos, v299);
                v287.Pos = v287.Pos + 1;
            end;
            for _, v301 in v279 do
                v277[v301].ser(v287, v288[v301]);
            end;
        end, 
        des = v282 == 0 and function(v302) --[[ Line: 861 ]]
            -- upvalues: v279 (copy), v277 (copy)
            local v303 = {};
            for v304 = #v279, 1, -1 do
                local v305 = v279[v304];
                v303[v305] = v277[v305].des(v302);
            end;
            return v303;
        end or function(v306) --[[ Line: 869 ]]
            -- upvalues: v279 (copy), v277 (copy), v282 (copy), v278 (copy)
            local v307 = {};
            for v308 = #v279, 1, -1 do
                local v309 = v279[v308];
                v307[v309] = v277[v309].des(v306);
            end;
            local v310 = v282 // 8 * 8 + 1;
            local v311 = v282 % 8;
            v306.Pos = v306.Pos - 1;
            local v312 = buffer.readu8(v306.Buf, v306.Pos);
            local v313 = v312 % 2 >= 1;
            local v314 = v312 % 4 >= 2;
            local v315 = v312 % 8 >= 4;
            local v316 = v312 % 16 >= 8;
            local v317 = v312 % 32 >= 16;
            local v318 = v312 % 64 >= 32;
            local v319 = v312 % 128 >= 64;
            local v320 = v312 % 256 >= 128;
            if v311 == 1 then
                v307[v278[v310 + 0]] = v313;
            elseif v311 == 2 then
                v307[v278[v310 + 0]] = v313;
                v307[v278[v310 + 1]] = v314;
            elseif v311 == 3 then
                v307[v278[v310 + 0]] = v313;
                v307[v278[v310 + 1]] = v314;
                v307[v278[v310 + 2]] = v315;
            elseif v311 == 4 then
                v307[v278[v310 + 0]] = v313;
                v307[v278[v310 + 1]] = v314;
                v307[v278[v310 + 2]] = v315;
                v307[v278[v310 + 3]] = v316;
            elseif v311 == 5 then
                v307[v278[v310 + 0]] = v313;
                v307[v278[v310 + 1]] = v314;
                v307[v278[v310 + 2]] = v315;
                v307[v278[v310 + 3]] = v316;
                v307[v278[v310 + 4]] = v317;
            elseif v311 == 6 then
                v307[v278[v310 + 0]] = v313;
                v307[v278[v310 + 1]] = v314;
                v307[v278[v310 + 2]] = v315;
                v307[v278[v310 + 3]] = v316;
                v307[v278[v310 + 4]] = v317;
                v307[v278[v310 + 5]] = v318;
            elseif v311 == 7 then
                v307[v278[v310 + 0]] = v313;
                v307[v278[v310 + 1]] = v314;
                v307[v278[v310 + 2]] = v315;
                v307[v278[v310 + 3]] = v316;
                v307[v278[v310 + 4]] = v317;
                v307[v278[v310 + 5]] = v318;
                v307[v278[v310 + 6]] = v319;
            else
                v307[v278[v310 + 0]] = v313;
                v307[v278[v310 + 1]] = v314;
                v307[v278[v310 + 2]] = v315;
                v307[v278[v310 + 3]] = v316;
                v307[v278[v310 + 4]] = v317;
                v307[v278[v310 + 5]] = v318;
                v307[v278[v310 + 6]] = v319;
                v307[v278[v310 + 7]] = v320;
            end;
            for v321 = v282 // 8 - 1, 0, -1 do
                v313 = 1 + v321 * 8;
                v314 = v278[v313 + 0];
                v315 = v278[v313 + 1];
                v316 = v278[v313 + 2];
                v317 = v278[v313 + 3];
                v318 = v278[v313 + 4];
                v319 = v278[v313 + 5];
                v320 = v278[v313 + 6];
                v312 = v278[v313 + 7];
                v306.Pos = v306.Pos - 1;
                local v322 = buffer.readu8(v306.Buf, v306.Pos);
                local v323 = v322 % 2 >= 1;
                local v324 = v322 % 4 >= 2;
                local v325 = v322 % 8 >= 4;
                local v326 = v322 % 16 >= 8;
                local v327 = v322 % 32 >= 16;
                local v328 = v322 % 64 >= 32;
                local v329 = v322 % 128 >= 64;
                local v330 = v322 % 256 >= 128;
                v307[v314] = v323;
                v307[v315] = v324;
                v307[v316] = v325;
                v307[v317] = v326;
                v307[v318] = v327;
                v307[v319] = v328;
                v307[v320] = v329;
                v307[v312] = v330;
            end;
            return v307;
        end
    };
end;
v180.map = function(v331, v332) --[[ Line: 948 ]] --[[ Name: map ]]
    -- upvalues: v149 (copy), v153 (copy)
    return {
        ser = function(v333, v334) --[[ Line: 950 ]] --[[ Name: ser ]]
            -- upvalues: v332 (copy), v331 (copy), v149 (ref)
            local v335 = 0;
            for v336, v337 in v334 do
                v332.ser(v333, v337);
                v331.ser(v333, v336);
                v335 = v335 + 1;
            end;
            v149(v333, v335);
        end, 
        des = function(v338) --[[ Line: 960 ]] --[[ Name: des ]]
            -- upvalues: v153 (ref), v331 (copy), v332 (copy)
            local v339 = {};
            for _ = 1, v153(v338) do
                v339[v331.des(v338)] = v332.des(v338);
            end;
            return v339;
        end
    };
end;
v180.literal = function(...) --[[ Line: 976 ]] --[[ Name: literal ]]
    -- upvalues: v15 (copy)
    local v341 = {
        ...
    };
    local v342 = {};
    for v343, v344 in v341 do
        v342[v344] = v343 - 1;
    end;
    return {
        ser = function(v345, v346) --[[ Line: 985 ]] --[[ Name: ser ]]
            -- upvalues: v342 (copy), v15 (ref)
            local v347 = v342[v346];
            v15(v345, 1);
            buffer.writeu8(v345.Buf, v345.Pos, v347);
            v345.Pos = v345.Pos + 1;
        end, 
        des = function(v348) --[[ Line: 989 ]] --[[ Name: des ]]
            -- upvalues: v341 (copy)
            local l_v341_0 = v341;
            v348.Pos = v348.Pos - 1;
            return l_v341_0[buffer.readu8(v348.Buf, v348.Pos) + 1];
        end
    };
end;
v180.table = function(v350) --[[ Line: 996 ]] --[[ Name: tableserdes ]]
    -- upvalues: v15 (copy), v149 (copy), v153 (copy)
    local v351 = {};
    for v352, _ in v350 do
        table.insert(v351, v352);
    end;
    return {
        ser = function(v354, v355) --[[ Line: 1004 ]] --[[ Name: ser ]]
            -- upvalues: v350 (copy), v351 (copy), v15 (ref), v149 (ref)
            local v356 = 0;
            for v357, v358 in v355 do
                local v359 = typeof(v358);
                local v360 = v350[v359];
                if v360 then
                    local v361 = typeof(v357);
                    local v362 = v350[v361];
                    if v362 then
                        v360.ser(v354, v358);
                        local v363 = (table.find(v351, v359) or error("")) - 1;
                        v15(v354, 1);
                        buffer.writeu8(v354.Buf, v354.Pos, v363);
                        v354.Pos = v354.Pos + 1;
                        v362.ser(v354, v357);
                        local v364 = (table.find(v351, v361) or error("")) - 1;
                        v15(v354, 1);
                        buffer.writeu8(v354.Buf, v354.Pos, v364);
                        v354.Pos = v354.Pos + 1;
                        v356 = v356 + 1;
                    end;
                end;
            end;
            v149(v354, v356);
        end, 
        des = function(v365) --[[ Line: 1033 ]] --[[ Name: des ]]
            -- upvalues: v153 (ref), v351 (copy), v350 (copy)
            local v366 = {};
            for _ = 1, v153(v365) do
                v365.Pos = v365.Pos - 1;
                local v368 = v350[v351[buffer.readu8(v365.Buf, v365.Pos) + 1]].des(v365);
                v365.Pos = v365.Pos - 1;
                v366[v368] = v350[v351[buffer.readu8(v365.Buf, v365.Pos) + 1]].des(v365);
            end;
            return v366;
        end
    };
end;
local v390 = {
    ser = function(v369, v370) --[[ Line: 1056 ]] --[[ Name: ser ]]
        -- upvalues: v15 (copy)
        local l_Back_0 = v370.Back;
        local l_Bottom_0 = v370.Bottom;
        local l_Front_0 = v370.Front;
        local l_Left_0 = v370.Left;
        local l_Right_0 = v370.Right;
        local l_Top_0 = v370.Top;
        local v377 = (l_Back_0 and 1 or 0) + (l_Bottom_0 and 2 or 0) + (l_Front_0 and 4 or 0) + (l_Left_0 and 8 or 0) + (l_Right_0 and 16 or 0) + (l_Top_0 and 32 or 0) + 0 + 0;
        v15(v369, 1);
        buffer.writeu8(v369.Buf, v369.Pos, v377);
        v369.Pos = v369.Pos + 1;
        l_Back_0 = v370.X;
        l_Bottom_0 = v370.Y;
        l_Front_0 = v370.Z;
        l_Left_0 = (l_Back_0 and 1 or 0) + (l_Bottom_0 and 2 or 0) + (l_Front_0 and 4 or 0) + 0 + 0 + 0 + 0 + 0;
        v15(v369, 1);
        buffer.writeu8(v369.Buf, v369.Pos, l_Left_0);
        v369.Pos = v369.Pos + 1;
    end, 
    des = function(v378) --[[ Line: 1061 ]] --[[ Name: des ]]
        v378.Pos = v378.Pos - 1;
        local v379 = buffer.readu8(v378.Buf, v378.Pos);
        local v380 = v379 % 2 >= 1;
        local v381 = v379 % 4 >= 2;
        local v382 = v379 % 8 >= 4;
        local v383 = v379 % 16 >= 8;
        v383 = v379 % 32 >= 16;
        v383 = v379 % 64 >= 32;
        v383 = v379 % 128 >= 64;
        v383 = v379 % 256 >= 128;
        v378.Pos = v378.Pos - 1;
        local v384 = buffer.readu8(v378.Buf, v378.Pos);
        v379 = v384 % 2 >= 1;
        v383 = v384 % 4 >= 2;
        local v385 = v384 % 8 >= 4;
        local v386 = v384 % 16 >= 8;
        local v387 = v384 % 32 >= 16;
        local v388 = v384 % 64 >= 32;
        local v389 = v384 % 128 >= 64;
        v389 = v384 % 256 >= 128;
        return Axes.new(v380 and Enum.Axis.X, v381 and Enum.Axis.Y, v382 and Enum.Axis.Z, v379 and Enum.NormalId.Back, v383 and Enum.NormalId.Bottom, v385 and Enum.NormalId.Front, v386 and Enum.NormalId.Left, v387 and Enum.NormalId.Right, v388 and Enum.NormalId.Top);
    end
};
v180.Axes = function() --[[ Line: 1077 ]] --[[ Name: Axes ]]
    -- upvalues: v390 (copy)
    return v390;
end;
local v396 = {
    ser = function(v391, v392) --[[ Line: 1082 ]] --[[ Name: ser ]]
        -- upvalues: v15 (copy)
        local l_Number_0 = v392.Number;
        v15(v391, 2);
        buffer.writeu16(v391.Buf, v391.Pos, l_Number_0);
        v391.Pos = v391.Pos + 2;
    end, 
    des = function(v394) --[[ Line: 1086 ]] --[[ Name: des ]]
        v394.Pos = v394.Pos - 2;
        local v395 = buffer.readu16(v394.Buf, v394.Pos);
        return BrickColor.new(v395);
    end
};
v180.BrickColor = function() --[[ Line: 1091 ]] --[[ Name: BrickColor ]]
    -- upvalues: v396 (copy)
    return v396;
end;
local v397 = {};
local function v410(v398) --[[ Line: 1096 ]] --[[ Name: enumitem ]]
    -- upvalues: v397 (copy), v149 (copy), v153 (copy)
    if v397[v398] then
        return v397[v398];
    else
        local l_v398_EnumItems_0 = v398:GetEnumItems();
        table.sort(l_v398_EnumItems_0, function(v400, v401) --[[ Line: 1102 ]]
            return v400.Value < v401.Value;
        end);
        local v402 = {};
        local v403 = table.create(#l_v398_EnumItems_0);
        for v404, v405 in l_v398_EnumItems_0 do
            v402[v405] = v404;
            v403[v404] = v405;
        end;
        local v409 = {
            ser = function(v406, v407) --[[ Line: 1112 ]] --[[ Name: ser ]]
                -- upvalues: v149 (ref), v402 (copy)
                v149(v406, v402[v407]);
            end, 
            des = function(v408) --[[ Line: 1116 ]] --[[ Name: des ]]
                -- upvalues: v153 (ref), v403 (copy)
                return v403[v153(v408)];
            end
        };
        v397[v398] = v409;
        return v409;
    end;
end;
v180.EnumItem = v410;
local v425 = {
    ser = function(v411, v412) --[[ Line: 1128 ]] --[[ Name: ser ]]
        -- upvalues: v15 (copy), v149 (copy), v410 (copy)
        local v413 = (v412.IncludeOffSale and 1 or 0) + 0 + 0 + 0 + 0 + 0 + 0 + 0;
        v15(v411, 1);
        buffer.writeu8(v411.Buf, v411.Pos, v413);
        v411.Pos = v411.Pos + 1;
        local l_Limit_0 = v412.Limit;
        v15(v411, 1);
        buffer.writeu8(v411.Buf, v411.Pos, l_Limit_0);
        v411.Pos = v411.Pos + 1;
        l_Limit_0 = v412.MinPrice;
        v15(v411, 4);
        buffer.writeu32(v411.Buf, v411.Pos, l_Limit_0);
        v411.Pos = v411.Pos + 4;
        l_Limit_0 = v412.MaxPrice;
        v15(v411, 4);
        buffer.writeu32(v411.Buf, v411.Pos, l_Limit_0);
        v411.Pos = v411.Pos + 4;
        l_Limit_0 = v412.CreatorName;
        v413 = #l_Limit_0;
        v15(v411, v413);
        buffer.writestring(v411.Buf, v411.Pos, l_Limit_0);
        v411.Pos = v411.Pos + v413;
        v149(v411, v413);
        l_Limit_0 = v412.SearchKeyword;
        v413 = #l_Limit_0;
        v15(v411, v413);
        buffer.writestring(v411.Buf, v411.Pos, l_Limit_0);
        v411.Pos = v411.Pos + v413;
        v149(v411, v413);
        v410(Enum.CatalogSortType).ser(v411, v412.SortType);
        v410(Enum.CatalogSortAggregation).ser(v411, v412.SortAggregation);
        v410(Enum.CatalogCategoryFilter).ser(v411, v412.CategoryFilter);
        v410(Enum.SalesTypeFilter).ser(v411, v412.SalesTypeFilter);
        for _, v416 in v412.AssetTypes do
            v410(Enum.AssetType).ser(v411, v416);
        end;
        v149(v411, #v412.AssetTypes);
    end, 
    des = function(v417) --[[ Line: 1145 ]] --[[ Name: des ]]
        -- upvalues: v153 (copy), v410 (copy)
        local v418 = CatalogSearchParams.new();
        local v419 = v153(v417);
        local v420 = table.create(v419);
        for v421 = v419, 1, -1 do
            v420[v421] = v410(Enum.AssetType).des(v417);
        end;
        v418.AssetTypes = v420;
        v418.SalesTypesFilter = v410(Enum.SalesTypeFilter).des(v417);
        v418.CategoryFilter = v410(Enum.CatalogCategoryFilter).des(v417);
        v418.SortAggregation = v410(Enum.CatalogSortAggregation).des(v417);
        v418.SortType = v410(Enum.CatalogSortType).des(v417);
        local v422 = v153(v417);
        v417.Pos = v417.Pos - v422;
        v418.SearchKeyword = buffer.readstring(v417.Buf, v417.Pos, v422);
        v422 = v153(v417);
        v417.Pos = v417.Pos - v422;
        v418.CreatorName = buffer.readstring(v417.Buf, v417.Pos, v422);
        v417.Pos = v417.Pos - 4;
        v418.MaxPrice = buffer.readu32(v417.Buf, v417.Pos);
        v417.Pos = v417.Pos - 4;
        v418.MinPrice = buffer.readu32(v417.Buf, v417.Pos);
        v417.Pos = v417.Pos - 1;
        v418.Limit = buffer.readu8(v417.Buf, v417.Pos);
        v417.Pos = v417.Pos - 1;
        v422 = buffer.readu8(v417.Buf, v417.Pos);
        local v423 = v422 % 2 >= 1;
        local v424 = v422 % 4 >= 2;
        v424 = v422 % 8 >= 4;
        v424 = v422 % 16 >= 8;
        v424 = v422 % 32 >= 16;
        v424 = v422 % 64 >= 32;
        v424 = v422 % 128 >= 64;
        v424 = v422 % 256 >= 128;
        v418.IncludeOffSale = v423;
    end
};
v180.CatalogueSearchParams = function() --[[ Line: 1166 ]] --[[ Name: CatalogueSearchParams ]]
    -- upvalues: v425 (copy)
    return v425;
end;
local function v426() --[[ Line: 1170 ]] --[[ Name: cframeLookupEntries ]]
    return {
        CFrame.Angles(0, 0, 0), 
        CFrame.Angles(1.5707963267948966, 0, 0), 
        CFrame.Angles(0, 3.141592653589793, 3.141592653589793), 
        CFrame.Angles(-1.5707963267948966, 0, 0), 
        CFrame.Angles(0, 3.141592653589793, 1.5707963267948966), 
        CFrame.Angles(0, 1.5707963267948966, 1.5707963267948966), 
        CFrame.Angles(0, 0, 1.5707963267948966), 
        CFrame.Angles(0, -1.5707963267948966, 1.5707963267948966), 
        CFrame.Angles(-1.5707963267948966, -1.5707963267948966, 0), 
        CFrame.Angles(0, -1.5707963267948966, 0), 
        CFrame.Angles(1.5707963267948966, -1.5707963267948966, 0), 
        CFrame.Angles(0, 1.5707963267948966, 3.141592653589793), 
        CFrame.Angles(0, -1.5707963267948966, 3.141592653589793), 
        CFrame.Angles(0, 3.141592653589793, 0), 
        CFrame.Angles(-1.5707963267948966, -3.141592653589793, 0), 
        CFrame.Angles(0, 0, 3.141592653589793), 
        CFrame.Angles(1.5707963267948966, 3.141592653589793, 0), 
        CFrame.Angles(0, 0, -1.5707963267948966), 
        CFrame.Angles(0, -1.5707963267948966, -1.5707963267948966), 
        CFrame.Angles(0, -3.141592653589793, -1.5707963267948966), 
        CFrame.Angles(0, 1.5707963267948966, -1.5707963267948966), 
        CFrame.Angles(1.5707963267948966, 1.5707963267948966, 0), 
        CFrame.Angles(0, 1.5707963267948966, 0), 
        CFrame.Angles(-1.5707963267948966, 1.5707963267948966, 0)
    };
end;
local function v431(v427) --[[ Line: 1199 ]] --[[ Name: cframeSpecialCaseLookup ]]
    local v428 = {};
    for v429, v430 in v427 do
        v428[Vector3.new(v430:ToOrientation())] = v429;
    end;
    return v428;
end;
local v432 = nil;
local v433 = nil;
local function v440(v434, v435) --[[ Line: 1211 ]] --[[ Name: rotser ]]
    -- upvalues: v432 (ref), v426 (copy), v433 (ref), v431 (copy), v15 (copy)
    v432 = v432 or v426();
    v433 = v433 or v431(v432);
    local v436 = v433[Vector3.new(v435:ToOrientation())];
    if v436 then
        v15(v434, 1);
        buffer.writeu8(v434.Buf, v434.Pos, v436);
        v434.Pos = v434.Pos + 1;
        return;
    else
        local v437, v438 = v435:ToAxisAngle();
        v437 = v437 * math.sin(v438 / 2);
        local v439 = (v437.Z + 1) * 32767.5;
        v15(v434, 2);
        buffer.writeu16(v434.Buf, v434.Pos, v439);
        v434.Pos = v434.Pos + 2;
        v439 = (v437.Y + 1) * 32767.5;
        v15(v434, 2);
        buffer.writeu16(v434.Buf, v434.Pos, v439);
        v434.Pos = v434.Pos + 2;
        v439 = (v437.X + 1) * 32767.5;
        v15(v434, 2);
        buffer.writeu16(v434.Buf, v434.Pos, v439);
        v434.Pos = v434.Pos + 2;
        v15(v434, 1);
        buffer.writeu8(v434.Buf, v434.Pos, 0);
        v434.Pos = v434.Pos + 1;
        return;
    end;
end;
local function v447(v441) --[[ Line: 1229 ]] --[[ Name: rotdes ]]
    -- upvalues: v432 (ref)
    v441.Pos = v441.Pos - 1;
    local v442 = buffer.readu8(v441.Buf, v441.Pos);
    if v442 ~= 0 then
        return v432[v442];
    else
        v441.Pos = v441.Pos - 2;
        local v443 = buffer.readu16(v441.Buf, v441.Pos) * 3.0518043793392844E-5 - 1;
        v441.Pos = v441.Pos - 2;
        local v444 = buffer.readu16(v441.Buf, v441.Pos) * 3.0518043793392844E-5 - 1;
        v441.Pos = v441.Pos - 2;
        local v445 = buffer.readu16(v441.Buf, v441.Pos) * 3.0518043793392844E-5 - 1;
        local v446 = math.sqrt(1 - v443 * v443 - v444 * v444 - v445 * v445);
        return CFrame.new(0, 0, 0, v443, v444, v445, v446);
    end;
end;
local v448 = {
    ser = v440, 
    des = v447
};
v180.rotation = function() --[[ Line: 1246 ]] --[[ Name: rotation ]]
    -- upvalues: v448 (copy)
    return v448;
end;
local v449 = {};
local function v461(v450) --[[ Line: 1251 ]] --[[ Name: cframe ]]
    -- upvalues: v449 (copy), v440 (copy), v447 (copy)
    if v449[v450] then
        return v449[v450];
    else
        local l_ser_1 = v450.ser;
        local l_des_1 = v450.des;
        local v460 = {
            ser = function(v453, v454) --[[ Line: 1259 ]] --[[ Name: ser ]]
                -- upvalues: v440 (ref), l_ser_1 (copy)
                v440(v453, v454);
                local l_Position_0 = v454.Position;
                l_ser_1(v453, l_Position_0.Z);
                l_ser_1(v453, l_Position_0.Y);
                l_ser_1(v453, l_Position_0.X);
            end, 
            des = function(v456) --[[ Line: 1268 ]] --[[ Name: des ]]
                -- upvalues: l_des_1 (copy), v447 (ref)
                local v457 = l_des_1(v456);
                local v458 = l_des_1(v456);
                local v459 = l_des_1(v456);
                return v447(v456) + Vector3.new(v457, v458, v459);
            end
        };
        v449[v450] = v460;
        return v460;
    end;
end;
v180.CFrame = v461;
local function v465(v462, v463) --[[ Line: 1279 ]] --[[ Name: pushcolor3 ]]
    -- upvalues: v15 (copy)
    local v464 = v463.B * 255;
    v15(v462, 1);
    buffer.writeu8(v462.Buf, v462.Pos, v464);
    v462.Pos = v462.Pos + 1;
    v464 = v463.G * 255;
    v15(v462, 1);
    buffer.writeu8(v462.Buf, v462.Pos, v464);
    v462.Pos = v462.Pos + 1;
    v464 = v463.R * 255;
    v15(v462, 1);
    buffer.writeu8(v462.Buf, v462.Pos, v464);
    v462.Pos = v462.Pos + 1;
end;
local function v470(v466) --[[ Line: 1284 ]] --[[ Name: popcolor3 ]]
    local l_fromRGB_0 = Color3.fromRGB;
    v466.Pos = v466.Pos - 1;
    local v468 = buffer.readu8(v466.Buf, v466.Pos);
    v466.Pos = v466.Pos - 1;
    local v469 = buffer.readu8(v466.Buf, v466.Pos);
    v466.Pos = v466.Pos - 1;
    return l_fromRGB_0(v468, v469, (buffer.readu8(v466.Buf, v466.Pos)));
end;
local v471 = {
    ser = v465, 
    des = v470
};
v180.Color3 = function() --[[ Line: 1291 ]] --[[ Name: Color3 ]]
    -- upvalues: v471 (copy)
    return v471;
end;
local v478 = {
    ser = function(v472, v473) --[[ Line: 1295 ]] --[[ Name: pushcolorsequencekeypoint ]]
        -- upvalues: v15 (copy)
        local l_Value_0 = v473.Value;
        local v475 = l_Value_0.B * 255;
        v15(v472, 1);
        buffer.writeu8(v472.Buf, v472.Pos, v475);
        v472.Pos = v472.Pos + 1;
        v475 = l_Value_0.G * 255;
        v15(v472, 1);
        buffer.writeu8(v472.Buf, v472.Pos, v475);
        v472.Pos = v472.Pos + 1;
        v475 = l_Value_0.R * 255;
        v15(v472, 1);
        buffer.writeu8(v472.Buf, v472.Pos, v475);
        v472.Pos = v472.Pos + 1;
        l_Value_0 = v473.Time * 255;
        v15(v472, 1);
        buffer.writeu8(v472.Buf, v472.Pos, l_Value_0);
        v472.Pos = v472.Pos + 1;
    end, 
    des = function(v476) --[[ Line: 1299 ]] --[[ Name: popcolorsequencekeypoint ]]
        -- upvalues: v470 (copy)
        local l_new_0 = ColorSequenceKeypoint.new;
        v476.Pos = v476.Pos - 1;
        return l_new_0(buffer.readu8(v476.Buf, v476.Pos) / 255, v470(v476));
    end
};
v180.ColorSequenceKeypoint = function() --[[ Line: 1309 ]] --[[ Name: ColorSequenceKeypoint ]]
    -- upvalues: v478 (copy)
    return v478;
end;
local v490 = {
    ser = function(v479, v480) --[[ Line: 1314 ]] --[[ Name: ser ]]
        -- upvalues: v15 (copy), v149 (copy)
        for _, v482 in v480.Keypoints do
            local l_Value_1 = v482.Value;
            local v484 = l_Value_1.B * 255;
            v15(v479, 1);
            buffer.writeu8(v479.Buf, v479.Pos, v484);
            v479.Pos = v479.Pos + 1;
            v484 = l_Value_1.G * 255;
            v15(v479, 1);
            buffer.writeu8(v479.Buf, v479.Pos, v484);
            v479.Pos = v479.Pos + 1;
            v484 = l_Value_1.R * 255;
            v15(v479, 1);
            buffer.writeu8(v479.Buf, v479.Pos, v484);
            v479.Pos = v479.Pos + 1;
            l_Value_1 = v482.Time * 255;
            v15(v479, 1);
            buffer.writeu8(v479.Buf, v479.Pos, l_Value_1);
            v479.Pos = v479.Pos + 1;
        end;
        v149(v479, #v480.Keypoints);
    end, 
    des = function(v485) --[[ Line: 1321 ]] --[[ Name: des ]]
        -- upvalues: v153 (copy), v470 (copy)
        local v486 = v153(v485);
        local v487 = table.create(v486);
        for v488 = v486, 1, -1 do
            local l_new_1 = ColorSequenceKeypoint.new;
            v485.Pos = v485.Pos - 1;
            v487[v488] = l_new_1(buffer.readu8(v485.Buf, v485.Pos) / 255, v470(v485));
        end;
        return ColorSequence.new(v487);
    end
};
v180.ColorSequence = function() --[[ Line: 1330 ]] --[[ Name: ColorSequence ]]
    -- upvalues: v490 (copy)
    return v490;
end;
local v496 = {
    ser = function(v491, v492) --[[ Line: 1335 ]] --[[ Name: ser ]]
        -- upvalues: v15 (copy)
        local l_UnixTimestampMillis_0 = v492.UnixTimestampMillis;
        v15(v491, 6);
        buffer.writeu16(v491.Buf, v491.Pos, l_UnixTimestampMillis_0);
        buffer.writeu32(v491.Buf, v491.Pos + 2, l_UnixTimestampMillis_0 // 65536);
        v491.Pos = v491.Pos + 6;
    end, 
    des = function(v494) --[[ Line: 1338 ]] --[[ Name: des ]]
        local l_fromUnixTimestampMillis_0 = DateTime.fromUnixTimestampMillis;
        v494.Pos = v494.Pos - 6;
        return l_fromUnixTimestampMillis_0(buffer.readu16(v494.Buf, v494.Pos) + buffer.readu32(v494.Buf, v494.Pos + 2) * 65536);
    end
};
v180.DateTime = function() --[[ Line: 1342 ]] --[[ Name: DateTime ]]
    -- upvalues: v496 (copy)
    return v496;
end;
local v515 = {
    ser = function(v497, v498) --[[ Line: 1347 ]] --[[ Name: ser ]]
        -- upvalues: v15 (copy)
        local l_Back_1 = v498.Back;
        local l_Bottom_1 = v498.Bottom;
        local l_Front_1 = v498.Front;
        local l_Left_1 = v498.Left;
        local l_Right_1 = v498.Right;
        local l_Top_1 = v498.Top;
        local v505 = (l_Back_1 and 1 or 0) + (l_Bottom_1 and 2 or 0) + (l_Front_1 and 4 or 0) + (l_Left_1 and 8 or 0) + (l_Right_1 and 16 or 0) + (l_Top_1 and 32 or 0) + 0 + 0;
        v15(v497, 1);
        buffer.writeu8(v497.Buf, v497.Pos, v505);
        v497.Pos = v497.Pos + 1;
    end, 
    des = function(v506) --[[ Line: 1351 ]] --[[ Name: des ]]
        v506.Pos = v506.Pos - 1;
        local v507 = buffer.readu8(v506.Buf, v506.Pos);
        local v508 = v507 % 2 >= 1;
        local v509 = v507 % 4 >= 2;
        local v510 = v507 % 8 >= 4;
        local v511 = v507 % 16 >= 8;
        local v512 = v507 % 32 >= 16;
        local v513 = v507 % 64 >= 32;
        local v514 = v507 % 128 >= 64;
        v514 = v507 % 256 >= 128;
        return Faces.new(v508 and Enum.NormalId.Back, v509 and Enum.NormalId.Bottom, v510 and Enum.NormalId.Front, v511 and Enum.NormalId.Left, v512 and Enum.NormalId.Right, v513 and Enum.NormalId.Top);
    end
};
v180.Faces = function() --[[ Line: 1363 ]] --[[ Name: Faces ]]
    -- upvalues: v515 (copy)
    return v515;
end;
local v522 = {
    ser = function(v516, v517) --[[ Line: 1368 ]] --[[ Name: ser ]]
        -- upvalues: v410 (copy), v15 (copy)
        v410(Enum.KeyInterpolationMode).ser(v516, v517.Interpolation);
        local l_Value_2 = v517.Value;
        v15(v516, 4);
        buffer.writef32(v516.Buf, v516.Pos, l_Value_2);
        v516.Pos = v516.Pos + 4;
        l_Value_2 = v517.Time;
        v15(v516, 4);
        buffer.writef32(v516.Buf, v516.Pos, l_Value_2);
        v516.Pos = v516.Pos + 4;
    end, 
    des = function(v519) --[[ Line: 1374 ]] --[[ Name: des ]]
        -- upvalues: v410 (copy)
        local l_new_2 = FloatCurveKey.new;
        v519.Pos = v519.Pos - 4;
        local v521 = buffer.readf32(v519.Buf, v519.Pos);
        v519.Pos = v519.Pos - 4;
        return l_new_2(v521, buffer.readf32(v519.Buf, v519.Pos), (v410(Enum.KeyInterpolationMode).des(v519)));
    end
};
v180.FloatCurveKey = function() --[[ Line: 1382 ]] --[[ Name: FloatCurveKey ]]
    -- upvalues: v522 (copy)
    return v522;
end;
local v534 = {
    ser = function(v523, v524) --[[ Line: 1387 ]] --[[ Name: ser ]]
        -- upvalues: v15 (copy), v149 (copy), v410 (copy)
        local v525 = string.match(v524.Family, "rbxasset://fonts/families/(.+).json") or error((("Invalid font family %*"):format(v524.Family)));
        local v526 = #v525;
        v15(v523, v526);
        buffer.writestring(v523.Buf, v523.Pos, v525);
        v523.Pos = v523.Pos + v526;
        v149(v523, v526);
        local v527 = (v524.Bold and 1 or 0) + 0 + 0 + 0 + 0 + 0 + 0 + 0;
        v15(v523, 1);
        buffer.writeu8(v523.Buf, v523.Pos, v527);
        v523.Pos = v523.Pos + 1;
        v410(Enum.FontWeight).ser(v523, v524.Weight);
        v410(Enum.FontStyle).ser(v523, v524.Style);
    end, 
    des = function(v528) --[[ Line: 1395 ]] --[[ Name: des ]]
        -- upvalues: v410 (copy), v153 (copy)
        local v529 = v410(Enum.FontStyle).des(v528);
        local v530 = v410(Enum.FontWeight).des(v528);
        v528.Pos = v528.Pos - 1;
        local v531 = buffer.readu8(v528.Buf, v528.Pos);
        local v532 = v531 % 2 >= 1;
        local v533 = v531 % 4 >= 2;
        v533 = v531 % 8 >= 4;
        v533 = v531 % 16 >= 8;
        v533 = v531 % 32 >= 16;
        v533 = v531 % 64 >= 32;
        v533 = v531 % 128 >= 64;
        v533 = v531 % 256 >= 128;
        v533 = v153(v528);
        v528.Pos = v528.Pos - v533;
        v531 = buffer.readstring(v528.Buf, v528.Pos, v533);
        v533 = Font.new(("rbxasset://fonts/families/%*.json"):format(v531), v530, v529);
        v533.Bold = v532;
        return v533;
    end
};
v180.Font = function() --[[ Line: 1405 ]] --[[ Name: Font ]]
    -- upvalues: v534 (copy)
    return v534;
end;
local v535 = {};
v180.NumberRange = function(v536) --[[ Line: 1410 ]] --[[ Name: numberrange ]]
    -- upvalues: v535 (copy)
    if v535[v536] then
        return v535[v536];
    else
        local l_ser_2 = v536.ser;
        local l_des_2 = v536.des;
        local v542 = {
            ser = function(v539, v540) --[[ Line: 1418 ]] --[[ Name: ser ]]
                -- upvalues: l_ser_2 (copy)
                l_ser_2(v539, v540.Max);
                l_ser_2(v539, v540.Min);
            end, 
            des = function(v541) --[[ Line: 1423 ]] --[[ Name: des ]]
                -- upvalues: l_des_2 (copy)
                return NumberRange.new(l_des_2(v541), l_des_2(v541));
            end
        };
        v535[v536] = v542;
        return v542;
    end;
end;
local v543 = {};
local function v555(v544) --[[ Line: 1433 ]] --[[ Name: numbersequencekeypoint ]]
    -- upvalues: v543 (copy), v15 (copy)
    if v543[v544] then
        return v543[v544];
    else
        local l_ser_3 = v544.ser;
        local l_des_3 = v544.des;
        local v554 = {
            ser = function(v547, v548) --[[ Line: 1441 ]] --[[ Name: ser ]]
                -- upvalues: l_ser_3 (copy), v15 (ref)
                l_ser_3(v547, v548.Value);
                l_ser_3(v547, v548.Envelope);
                local v549 = v548.Time * 255;
                v15(v547, 8);
                buffer.writeu32(v547.Buf, v547.Pos, v549);
                buffer.writeu32(v547.Buf, v547.Pos + 4, v549 // 4294967296);
                v547.Pos = v547.Pos + 8;
            end, 
            des = function(v550) --[[ Line: 1447 ]] --[[ Name: des ]]
                -- upvalues: l_des_3 (copy)
                v550.Pos = v550.Pos - 8;
                local v551 = (buffer.readu32(v550.Buf, v550.Pos) + buffer.readu32(v550.Buf, v550.Pos + 4) * 4294967296) / 255;
                local v552 = l_des_3(v550);
                local v553 = l_des_3(v550);
                return NumberSequenceKeypoint.new(v551, v553, v552);
            end
        };
        v543[v544] = v554;
        return v554;
    end;
end;
v180.NumberSequenceKeypoint = v555;
local v556 = {};
v180.NumberSequence = function(v557) --[[ Line: 1460 ]] --[[ Name: numbersequence ]]
    -- upvalues: v556 (copy), v555 (copy), v149 (copy), v153 (copy)
    if v556[v557] then
        return v556[v557];
    else
        local l_ser_4 = v555(v557).ser;
        local l_des_4 = v555(v557).des;
        local v568 = {
            ser = function(v560, v561) --[[ Line: 1468 ]] --[[ Name: ser ]]
                -- upvalues: l_ser_4 (copy), v149 (ref)
                for _, v563 in v561.Keypoints do
                    l_ser_4(v560, v563);
                end;
                v149(v560, #v561.Keypoints);
            end, 
            des = function(v564) --[[ Line: 1475 ]] --[[ Name: des ]]
                -- upvalues: v153 (ref), l_des_4 (copy)
                local v565 = v153(v564);
                local v566 = table.create(v565);
                for v567 = v565, 1, -1 do
                    v566[v567] = l_des_4(v564);
                end;
                return NumberSequence.new(v566);
            end
        };
        v556[v557] = v568;
        return v568;
    end;
end;
local v580 = {
    ser = function(v569, v570) --[[ Line: 1492 ]] --[[ Name: ser ]]
        -- upvalues: v15 (copy), v410 (copy), v149 (copy)
        local l_BruteForceAllSlow_0 = v570.BruteForceAllSlow;
        local l_RespectCanCollide_0 = v570.RespectCanCollide;
        local v573 = (l_BruteForceAllSlow_0 and 1 or 0) + (l_RespectCanCollide_0 and 2 or 0) + 0 + 0 + 0 + 0 + 0 + 0;
        v15(v569, 1);
        buffer.writeu8(v569.Buf, v569.Pos, v573);
        v569.Pos = v569.Pos + 1;
        l_BruteForceAllSlow_0 = v570.MaxParts;
        v15(v569, 2);
        buffer.writeu16(v569.Buf, v569.Pos, l_BruteForceAllSlow_0);
        v569.Pos = v569.Pos + 2;
        v410(Enum.RaycastFilterType).ser(v569, v570.FilterType);
        l_BruteForceAllSlow_0 = v570.CollisionGroup;
        l_RespectCanCollide_0 = #l_BruteForceAllSlow_0;
        v15(v569, l_RespectCanCollide_0);
        buffer.writestring(v569.Buf, v569.Pos, l_BruteForceAllSlow_0);
        v569.Pos = v569.Pos + l_RespectCanCollide_0;
        v149(v569, l_RespectCanCollide_0);
    end, 
    des = function(v574) --[[ Line: 1499 ]] --[[ Name: des ]]
        -- upvalues: v153 (copy), v410 (copy)
        local v575 = OverlapParams.new();
        local v576 = v153(v574);
        v574.Pos = v574.Pos - v576;
        v575.CollisionGroup = buffer.readstring(v574.Buf, v574.Pos, v576);
        v575.FilterType = v410(Enum.RaycastFilterType).des(v574);
        v574.Pos = v574.Pos - 2;
        v575.MaxParts = buffer.readu16(v574.Buf, v574.Pos);
        v574.Pos = v574.Pos - 1;
        local v577 = buffer.readu8(v574.Buf, v574.Pos);
        local v578 = v577 % 2 >= 1;
        v576 = v577 % 4 >= 2;
        local v579 = v577 % 8 >= 4;
        v579 = v577 % 16 >= 8;
        v579 = v577 % 32 >= 16;
        v579 = v577 % 64 >= 32;
        v579 = v577 % 128 >= 64;
        v579 = v577 % 256 >= 128;
        v575.BruteForceAllSlow = v578;
        v575.RespectCanCollide = v576;
        return v575;
    end
};
v180.OverlapParams = function() --[[ Line: 1508 ]] --[[ Name: OverlapParams ]]
    -- upvalues: v580 (copy)
    return v580;
end;
local v594 = {
    ser = function(v581, v582) --[[ Line: 1513 ]] --[[ Name: ser ]]
        -- upvalues: v15 (copy), v410 (copy), v149 (copy)
        local l_BruteForceAllSlow_1 = v582.BruteForceAllSlow;
        local l_RespectCanCollide_1 = v582.RespectCanCollide;
        local l_IgnoreWater_0 = v582.IgnoreWater;
        local v586 = (l_BruteForceAllSlow_1 and 1 or 0) + (l_RespectCanCollide_1 and 2 or 0) + (l_IgnoreWater_0 and 4 or 0) + 0 + 0 + 0 + 0 + 0;
        v15(v581, 1);
        buffer.writeu8(v581.Buf, v581.Pos, v586);
        v581.Pos = v581.Pos + 1;
        v410(Enum.RaycastFilterType).ser(v581, v582.FilterType);
        l_BruteForceAllSlow_1 = v582.CollisionGroup;
        l_RespectCanCollide_1 = #l_BruteForceAllSlow_1;
        v15(v581, l_RespectCanCollide_1);
        buffer.writestring(v581.Buf, v581.Pos, l_BruteForceAllSlow_1);
        v581.Pos = v581.Pos + l_RespectCanCollide_1;
        v149(v581, l_RespectCanCollide_1);
    end, 
    des = function(v587) --[[ Line: 1519 ]] --[[ Name: des ]]
        -- upvalues: v153 (copy), v410 (copy)
        local v588 = RaycastParams.new();
        local v589 = v153(v587);
        v587.Pos = v587.Pos - v589;
        v588.CollisionGroup = buffer.readstring(v587.Buf, v587.Pos, v589);
        v588.FilterType = v410(Enum.RaycastFilterType).des(v587);
        v587.Pos = v587.Pos - 1;
        local v590 = buffer.readu8(v587.Buf, v587.Pos);
        local v591 = v590 % 2 >= 1;
        v589 = v590 % 4 >= 2;
        local v592 = v590 % 8 >= 4;
        local v593 = v590 % 16 >= 8;
        v593 = v590 % 32 >= 16;
        v593 = v590 % 64 >= 32;
        v593 = v590 % 128 >= 64;
        v593 = v590 % 256 >= 128;
        v588.BruteForceAllSlow = v591;
        v588.RespectCanCollide = v589;
        v588.IgnoreWater = v592;
        return v588;
    end
};
v180.RaycastParams = function() --[[ Line: 1527 ]] --[[ Name: RaycastParams ]]
    -- upvalues: v594 (copy)
    return v594;
end;
local v595 = {};
v180.Vector3 = function(v596) --[[ Line: 1532 ]] --[[ Name: vector3 ]]
    -- upvalues: v595 (copy)
    if v595[v596] then
        return v595[v596];
    else
        local l_ser_5 = v596.ser;
        local l_des_5 = v596.des;
        local v602 = {
            ser = function(v599, v600) --[[ Line: 1540 ]] --[[ Name: ser ]]
                -- upvalues: l_ser_5 (copy)
                l_ser_5(v599, v600.Z);
                l_ser_5(v599, v600.Y);
                l_ser_5(v599, v600.X);
            end, 
            des = function(v601) --[[ Line: 1546 ]] --[[ Name: des ]]
                -- upvalues: l_des_5 (copy)
                return (Vector3.new(l_des_5(v601), l_des_5(v601), l_des_5(v601)));
            end
        };
        v595[v596] = v602;
        return v602;
    end;
end;
local v603 = {};
v180.PathWaypoint = function(v604) --[[ Line: 1557 ]] --[[ Name: pathwaypoint ]]
    -- upvalues: v603 (copy), v15 (copy), v149 (copy), v410 (copy), v162 (copy)
    if v603[v604] then
        return v603[v604];
    else
        local l_ser_6 = v604.ser;
        local l_des_6 = v604.des;
        local v612 = {
            ser = function(v607, v608) --[[ Line: 1565 ]] --[[ Name: ser ]]
                -- upvalues: v15 (ref), v149 (ref), v410 (ref), l_ser_6 (copy)
                local l_Label_0 = v608.Label;
                local v610 = #l_Label_0;
                v15(v607, v610);
                buffer.writestring(v607.Buf, v607.Pos, l_Label_0);
                v607.Pos = v607.Pos + v610;
                v149(v607, v610);
                v410(Enum.PathWaypointAction).ser(v607, v608.Action);
                l_ser_6(v607, v608.Position.Z);
                l_ser_6(v607, v608.Position.Y);
                l_ser_6(v607, v608.Position.X);
            end, 
            des = function(v611) --[[ Line: 1573 ]] --[[ Name: des ]]
                -- upvalues: l_des_6 (copy), v410 (ref), v162 (ref)
                return PathWaypoint.new(Vector3.new(l_des_6(v611), l_des_6(v611), l_des_6(v611)), v410(Enum.PathWaypointAction).des(v611), v162(v611));
            end
        };
        v603[v604] = v612;
        return v612;
    end;
end;
local v622 = {
    ser = function(v613, v614) --[[ Line: 1587 ]] --[[ Name: ser ]]
        -- upvalues: v15 (copy)
        local l_ElasticityWeight_0 = v614.ElasticityWeight;
        v15(v613, 4);
        buffer.writef32(v613.Buf, v613.Pos, l_ElasticityWeight_0);
        v613.Pos = v613.Pos + 4;
        l_ElasticityWeight_0 = v614.FrictionWeight;
        v15(v613, 4);
        buffer.writef32(v613.Buf, v613.Pos, l_ElasticityWeight_0);
        v613.Pos = v613.Pos + 4;
        l_ElasticityWeight_0 = v614.Elasticity;
        v15(v613, 4);
        buffer.writef32(v613.Buf, v613.Pos, l_ElasticityWeight_0);
        v613.Pos = v613.Pos + 4;
        l_ElasticityWeight_0 = v614.Friction;
        v15(v613, 4);
        buffer.writef32(v613.Buf, v613.Pos, l_ElasticityWeight_0);
        v613.Pos = v613.Pos + 4;
        l_ElasticityWeight_0 = v614.Density;
        v15(v613, 4);
        buffer.writef32(v613.Buf, v613.Pos, l_ElasticityWeight_0);
        v613.Pos = v613.Pos + 4;
    end, 
    des = function(v616) --[[ Line: 1595 ]] --[[ Name: des ]]
        local l_new_3 = PhysicalProperties.new;
        v616.Pos = v616.Pos - 4;
        local v618 = buffer.readf32(v616.Buf, v616.Pos);
        v616.Pos = v616.Pos - 4;
        local v619 = buffer.readf32(v616.Buf, v616.Pos);
        v616.Pos = v616.Pos - 4;
        local v620 = buffer.readf32(v616.Buf, v616.Pos);
        v616.Pos = v616.Pos - 4;
        local v621 = buffer.readf32(v616.Buf, v616.Pos);
        v616.Pos = v616.Pos - 4;
        return l_new_3(v618, v619, v620, v621, (buffer.readf32(v616.Buf, v616.Pos)));
    end
};
v180.PhysicalProperties = function() --[[ Line: 1605 ]] --[[ Name: PhysicalProperties ]]
    -- upvalues: v622 (copy)
    return v622;
end;
local v623 = {};
v180.Ray = function(v624) --[[ Line: 1610 ]] --[[ Name: rayserdes ]]
    -- upvalues: v623 (copy)
    if v623[v624] then
        return v623[v624];
    else
        local l_ser_7 = v624.ser;
        local l_des_7 = v624.des;
        local v630 = {
            ser = function(v627, v628) --[[ Line: 1618 ]] --[[ Name: ser ]]
                -- upvalues: l_ser_7 (copy)
                l_ser_7(v627, v628.Direction.Z);
                l_ser_7(v627, v628.Direction.Y);
                l_ser_7(v627, v628.Direction.X);
                l_ser_7(v627, v628.Origin.Z);
                l_ser_7(v627, v628.Origin.Y);
                l_ser_7(v627, v628.Origin.X);
            end, 
            des = function(v629) --[[ Line: 1627 ]] --[[ Name: des ]]
                -- upvalues: l_des_7 (copy)
                return Ray.new(Vector3.new(l_des_7(v629), l_des_7(v629), l_des_7(v629)), (Vector3.new(l_des_7(v629), l_des_7(v629), l_des_7(v629))));
            end
        };
        v623[v624] = v630;
        return v630;
    end;
end;
local v631 = {};
v180.RaycastResult = function(v632) --[[ Line: 1647 ]] --[[ Name: RaycastResult ]]
    -- upvalues: v631 (copy), v594 (copy), v15 (copy), v410 (copy)
    if v631[v632] then
        return v594[v632];
    else
        local l_ser_8 = v632.ser;
        local l_des_8 = v632.des;
        local v640 = {
            ser = function(v635, v636) --[[ Line: 1655 ]] --[[ Name: ser ]]
                -- upvalues: v15 (ref), l_ser_8 (copy), v410 (ref)
                local l_Distance_0 = v636.Distance;
                v15(v635, 4);
                buffer.writef32(v635.Buf, v635.Pos, l_Distance_0);
                v635.Pos = v635.Pos + 4;
                l_ser_8(v635, v636.Position.Z);
                l_ser_8(v635, v636.Position.Y);
                l_ser_8(v635, v636.Position.X);
                l_ser_8(v635, v636.Normal.Z);
                l_ser_8(v635, v636.Normal.Y);
                l_ser_8(v635, v636.Normal.X);
                v410(Enum.Material).ser(v635, v636.Material);
            end, 
            des = function(v638) --[[ Line: 1666 ]] --[[ Name: des ]]
                -- upvalues: v410 (ref), l_des_8 (copy)
                local v639 = {
                    Material = v410(Enum.Material).des(v638), 
                    Normal = Vector3.new(l_des_8(v638), l_des_8(v638), l_des_8(v638)), 
                    Position = Vector3.new(l_des_8(v638), l_des_8(v638), l_des_8(v638))
                };
                v638.Pos = v638.Pos - 4;
                v639.Distance = buffer.readf32(v638.Buf, v638.Pos);
                v639.Instance = nil;
                return v639;
            end
        };
        v631[v632] = v640;
        return v640;
    end;
end;
local v641 = {};
v180.Vector2 = function(v642) --[[ Line: 1682 ]] --[[ Name: Vector2 ]]
    -- upvalues: v641 (copy)
    if v641[v642] then
        return v641[v642];
    else
        local l_ser_9 = v642.ser;
        local l_des_9 = v642.des;
        local v648 = {
            ser = function(v645, v646) --[[ Line: 1690 ]] --[[ Name: ser ]]
                -- upvalues: l_ser_9 (copy)
                l_ser_9(v645, v646.Y);
                l_ser_9(v645, v646.X);
            end, 
            des = function(v647) --[[ Line: 1695 ]] --[[ Name: des ]]
                -- upvalues: l_des_9 (copy)
                return Vector2.new(l_des_9(v647), l_des_9(v647));
            end
        };
        v641[v642] = v648;
        return v648;
    end;
end;
local v649 = {};
v180.Rect = function(v650) --[[ Line: 1705 ]] --[[ Name: Rect ]]
    -- upvalues: v649 (copy)
    if v649[v650] then
        return v649[v650];
    else
        local l_ser_10 = v650.ser;
        local l_des_10 = v650.des;
        local v656 = {
            ser = function(v653, v654) --[[ Line: 1713 ]] --[[ Name: ser ]]
                -- upvalues: l_ser_10 (copy)
                l_ser_10(v653, v654.Max.Y);
                l_ser_10(v653, v654.Max.X);
                l_ser_10(v653, v654.Min.Y);
                l_ser_10(v653, v654.Min.X);
            end, 
            des = function(v655) --[[ Line: 1720 ]] --[[ Name: des ]]
                -- upvalues: l_des_10 (copy)
                return Rect.new(l_des_10(v655), l_des_10(v655), l_des_10(v655), l_des_10(v655));
            end
        };
        v649[v650] = v656;
        return v656;
    end;
end;
local v657 = {};
v180.Region3 = function(v658) --[[ Line: 1729 ]] --[[ Name: Region3 ]]
    -- upvalues: v657 (copy)
    if v657[v658] then
        return v657[v658];
    else
        local l_ser_11 = v658.ser;
        local l_des_11 = v658.des;
        local v668 = {
            ser = function(v661, v662) --[[ Line: 1737 ]] --[[ Name: ser ]]
                -- upvalues: l_ser_11 (copy)
                local l_Size_0 = v662.Size;
                l_ser_11(v661, l_Size_0.Z);
                l_ser_11(v661, l_Size_0.Y);
                l_ser_11(v661, l_Size_0.X);
                local l_Position_1 = v662.CFrame.Position;
                l_ser_11(v661, l_Position_1.Z);
                l_ser_11(v661, l_Position_1.Y);
                l_ser_11(v661, l_Position_1.X);
            end, 
            des = function(v665) --[[ Line: 1748 ]] --[[ Name: des ]]
                -- upvalues: l_des_11 (copy)
                local v666 = Vector3.new(l_des_11(v665), l_des_11(v665), l_des_11(v665));
                local v667 = 0.5 * Vector3.new(l_des_11(v665), l_des_11(v665), l_des_11(v665));
                return Region3.new(v666 - v667, v666 + v667);
            end
        };
        v657[v658] = v668;
        return v668;
    end;
end;
local v679 = {
    ser = function(v669, v670) --[[ Line: 1759 ]] --[[ Name: ser ]]
        -- upvalues: v15 (copy)
        local l_Max_0 = v670.Max;
        local l_Z_0 = l_Max_0.Z;
        v15(v669, 2);
        buffer.writei16(v669.Buf, v669.Pos, l_Z_0);
        v669.Pos = v669.Pos + 2;
        l_Z_0 = l_Max_0.Y;
        v15(v669, 2);
        buffer.writei16(v669.Buf, v669.Pos, l_Z_0);
        v669.Pos = v669.Pos + 2;
        l_Z_0 = l_Max_0.X;
        v15(v669, 2);
        buffer.writei16(v669.Buf, v669.Pos, l_Z_0);
        v669.Pos = v669.Pos + 2;
        l_Z_0 = v670.Min;
        local l_Z_1 = l_Z_0.Z;
        v15(v669, 2);
        buffer.writei16(v669.Buf, v669.Pos, l_Z_1);
        v669.Pos = v669.Pos + 2;
        l_Z_1 = l_Z_0.Y;
        v15(v669, 2);
        buffer.writei16(v669.Buf, v669.Pos, l_Z_1);
        v669.Pos = v669.Pos + 2;
        l_Z_1 = l_Z_0.X;
        v15(v669, 2);
        buffer.writei16(v669.Buf, v669.Pos, l_Z_1);
        v669.Pos = v669.Pos + 2;
    end, 
    des = function(v674) --[[ Line: 1770 ]] --[[ Name: des ]]
        local l_new_4 = Vector3int16.new;
        v674.Pos = v674.Pos - 2;
        local v676 = buffer.readi16(v674.Buf, v674.Pos);
        v674.Pos = v674.Pos - 2;
        local v677 = buffer.readi16(v674.Buf, v674.Pos);
        v674.Pos = v674.Pos - 2;
        l_new_4 = l_new_4(v676, v677, (buffer.readi16(v674.Buf, v674.Pos)));
        v676 = Vector3int16.new;
        v674.Pos = v674.Pos - 2;
        v677 = buffer.readi16(v674.Buf, v674.Pos);
        v674.Pos = v674.Pos - 2;
        local v678 = buffer.readi16(v674.Buf, v674.Pos);
        v674.Pos = v674.Pos - 2;
        v676 = v676(v677, v678, (buffer.readi16(v674.Buf, v674.Pos)));
        return Region3int16.new(l_new_4, v676);
    end
};
v180.Region3int16 = function() --[[ Line: 1776 ]] --[[ Name: Region3int16 ]]
    -- upvalues: v679 (copy)
    return v679;
end;
local v680 = {};
v180.RotationCurveKey = function(v681) --[[ Line: 1781 ]] --[[ Name: RotationCurveKey ]]
    -- upvalues: v680 (copy), v461 (copy), v410 (copy), v15 (copy)
    if v680[v681] then
        return v680[v681];
    else
        local l_ser_12 = v461(v681).ser;
        local l_des_12 = v461(v681).des;
        local v689 = {
            ser = function(v684, v685) --[[ Line: 1789 ]] --[[ Name: ser ]]
                -- upvalues: v410 (ref), l_ser_12 (copy), v15 (ref)
                v410(Enum.KeyInterpolationMode).ser(v684, v685.Interpolation);
                l_ser_12(v684, v685.Value);
                local l_Time_0 = v685.Time;
                v15(v684, 4);
                buffer.writef32(v684.Buf, v684.Pos, l_Time_0);
                v684.Pos = v684.Pos + 4;
            end, 
            des = function(v687) --[[ Line: 1795 ]] --[[ Name: des ]]
                -- upvalues: l_des_12 (copy), v410 (ref)
                local l_new_5 = RotationCurveKey.new;
                v687.Pos = v687.Pos - 4;
                return l_new_5(buffer.readf32(v687.Buf, v687.Pos), l_des_12(v687), (v410(Enum.KeyInterpolationMode).des(v687)));
            end
        };
        v680[v681] = v689;
        return v689;
    end;
end;
local v703 = {
    ser = function(v690, v691) --[[ Line: 1808 ]] --[[ Name: ser ]]
        -- upvalues: v15 (copy), v149 (copy), v410 (copy)
        local l_DelayTime_0 = v691.DelayTime;
        v15(v690, 4);
        buffer.writef32(v690.Buf, v690.Pos, l_DelayTime_0);
        v690.Pos = v690.Pos + 4;
        local v693 = (v691.Reverses and 1 or 0) + 0 + 0 + 0 + 0 + 0 + 0 + 0;
        v15(v690, 1);
        buffer.writeu8(v690.Buf, v690.Pos, v693);
        v690.Pos = v690.Pos + 1;
        v149(v690, v691.RepeatCount);
        v410(Enum.EasingDirection).ser(v690, v691.EasingDirection);
        v410(Enum.EasingStyle).ser(v690, v691.EasingStyle);
        l_DelayTime_0 = v691.Time;
        v15(v690, 4);
        buffer.writef32(v690.Buf, v690.Pos, l_DelayTime_0);
        v690.Pos = v690.Pos + 4;
    end, 
    des = function(v694) --[[ Line: 1817 ]] --[[ Name: des ]]
        -- upvalues: v410 (copy), v153 (copy)
        local l_new_6 = TweenInfo.new;
        v694.Pos = v694.Pos - 4;
        local v696 = buffer.readf32(v694.Buf, v694.Pos);
        local v697 = v410(Enum.EasingStyle).des(v694);
        local v698 = v410(Enum.EasingDirection).des(v694);
        local v699 = v153(v694);
        v694.Pos = v694.Pos - 1;
        local v700 = buffer.readu8(v694.Buf, v694.Pos);
        local v701 = v700 % 2 >= 1;
        local v702 = v700 % 4 >= 2;
        v702 = v700 % 8 >= 4;
        v702 = v700 % 16 >= 8;
        v702 = v700 % 32 >= 16;
        v702 = v700 % 64 >= 32;
        v702 = v700 % 128 >= 64;
        v702 = v700 % 256 >= 128;
        v694.Pos = v694.Pos - 4;
        return l_new_6(v696, v697, v698, v699, v701, (buffer.readf32(v694.Buf, v694.Pos)));
    end
};
v180.TweenInfo = function() --[[ Line: 1828 ]] --[[ Name: TweenInfo ]]
    -- upvalues: v703 (copy)
    return v703;
end;
local v704 = {};
v180.UDim = function(v705) --[[ Line: 1833 ]] --[[ Name: UDim ]]
    -- upvalues: v704 (copy)
    if v704[v705] then
        return v704[v705];
    else
        local l_ser_13 = v705.ser;
        local l_des_13 = v705.des;
        local v711 = {
            ser = function(v708, v709) --[[ Line: 1841 ]] --[[ Name: ser ]]
                -- upvalues: l_ser_13 (copy)
                l_ser_13(v708, v709.Offset);
                l_ser_13(v708, v709.Scale);
            end, 
            des = function(v710) --[[ Line: 1846 ]] --[[ Name: des ]]
                -- upvalues: l_des_13 (copy)
                return UDim.new(l_des_13(v710), l_des_13(v710));
            end
        };
        v704[v705] = v711;
        return v711;
    end;
end;
local v712 = {};
v180.UDim2 = function(v713) --[[ Line: 1856 ]] --[[ Name: UDim2 ]]
    -- upvalues: v712 (copy)
    if v712[v713] then
        return v712[v713];
    else
        local l_ser_14 = v713.ser;
        local l_des_14 = v713.des;
        local v719 = {
            ser = function(v716, v717) --[[ Line: 1864 ]] --[[ Name: ser ]]
                -- upvalues: l_ser_14 (copy)
                l_ser_14(v716, v717.Y.Offset);
                l_ser_14(v716, v717.Y.Scale);
                l_ser_14(v716, v717.X.Offset);
                l_ser_14(v716, v717.X.Scale);
            end, 
            des = function(v718) --[[ Line: 1871 ]] --[[ Name: des ]]
                -- upvalues: l_des_14 (copy)
                return UDim2.new(l_des_14(v718), l_des_14(v718), l_des_14(v718), l_des_14(v718));
            end
        };
        v712[v713] = v719;
        return v719;
    end;
end;
local v726 = {
    ser = function(v720, v721) --[[ Line: 1881 ]] --[[ Name: ser ]]
        -- upvalues: v15 (copy)
        local l_Y_0 = v721.Y;
        v15(v720, 2);
        buffer.writei16(v720.Buf, v720.Pos, l_Y_0);
        v720.Pos = v720.Pos + 2;
        l_Y_0 = v721.X;
        v15(v720, 2);
        buffer.writei16(v720.Buf, v720.Pos, l_Y_0);
        v720.Pos = v720.Pos + 2;
    end, 
    des = function(v723) --[[ Line: 1886 ]] --[[ Name: des ]]
        local l_new_7 = Vector2int16.new;
        v723.Pos = v723.Pos - 2;
        local v725 = buffer.readi16(v723.Buf, v723.Pos);
        v723.Pos = v723.Pos - 2;
        return l_new_7(v725, (buffer.readi16(v723.Buf, v723.Pos)));
    end
};
v180.Vector2int16 = function() --[[ Line: 1890 ]] --[[ Name: Vector2int16 ]]
    -- upvalues: v726 (copy)
    return v726;
end;
local v734 = {
    ser = function(v727, v728) --[[ Line: 1895 ]] --[[ Name: ser ]]
        -- upvalues: v15 (copy)
        local l_Z_2 = v728.Z;
        v15(v727, 2);
        buffer.writei16(v727.Buf, v727.Pos, l_Z_2);
        v727.Pos = v727.Pos + 2;
        l_Z_2 = v728.Y;
        v15(v727, 2);
        buffer.writei16(v727.Buf, v727.Pos, l_Z_2);
        v727.Pos = v727.Pos + 2;
        l_Z_2 = v728.X;
        v15(v727, 2);
        buffer.writei16(v727.Buf, v727.Pos, l_Z_2);
        v727.Pos = v727.Pos + 2;
    end, 
    des = function(v730) --[[ Line: 1901 ]] --[[ Name: des ]]
        local l_new_8 = Vector3int16.new;
        v730.Pos = v730.Pos - 2;
        local v732 = buffer.readi16(v730.Buf, v730.Pos);
        v730.Pos = v730.Pos - 2;
        local v733 = buffer.readi16(v730.Buf, v730.Pos);
        v730.Pos = v730.Pos - 2;
        return l_new_8(v732, v733, (buffer.readi16(v730.Buf, v730.Pos)));
    end
};
v180.Vector3int16 = function() --[[ Line: 1905 ]] --[[ Name: Vector3int16 ]]
    -- upvalues: v734 (copy)
    return v734;
end;
return v180;