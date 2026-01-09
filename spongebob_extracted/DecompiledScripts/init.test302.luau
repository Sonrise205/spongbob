local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(script.Parent);
local v2 = require(l_ReplicatedStorage_0.DevPackages.RemotePacketSizeCounter);
local function v3(v4) --[[ Line: 6 ]] --[[ Name: deepCopy ]]
    -- upvalues: v3 (copy)
    if typeof(v4) ~= "table" then
        return v4;
    else
        local v5 = {};
        for v6, v7 in v4 do
            if type(v7) == "table" then
                v5[v6] = v3(v7);
            else
                v5[v6] = v7;
            end;
        end;
        return v5;
    end;
end;
local function v8(v9, v10) --[[ Line: 24 ]] --[[ Name: deepEqual ]]
    -- upvalues: v8 (copy)
    if type(v9) ~= "table" or type(v10) ~= "table" then
        return v9 == v10;
    else
        for v11, v12 in v9 do
            if not v8(v10[v11], v12) then
                return false;
            end;
        end;
        for v13, v14 in v10 do
            if not v8(v9[v13], v14) then
                return false;
            end;
        end;
        return true;
    end;
end;
local function _(v15, v16, v17) --[[ Line: 44 ]] --[[ Name: assertDeepEqual ]]
    -- upvalues: v8 (copy)
    assert(v8(v15, v16), v17);
end;
local function v19(v20) --[[ Line: 48 ]] --[[ Name: freezeIfTable ]]
    -- upvalues: v19 (copy)
    if typeof(v20) == "table" then
        if not table.isfrozen(v20) then
            table.freeze(v20);
        end;
        for _, v22 in v20 do
            v19(v22);
        end;
    end;
end;
local function v29(v23, v24, v25, v26) --[[ Line: 60 ]] --[[ Name: checkInner ]]
    -- upvalues: v19 (copy), v1 (copy), v3 (copy), v8 (copy)
    if v25 then
        v19(v23);
        v19(v24);
    end;
    local v27 = v1.diffImmutable(v23, v24);
    assert(v27 ~= nil, "diff was nil");
    local v28 = if v25 then v1.applyImmutable(v23, v27) else v1.applyMutable(v23, v27);
    if not v25 and typeof(v23) == "table" and typeof(v24) == "table" then
        assert(v23 == v28, "old is not equal to applied");
    end;
    if v26 then
        print("Applied =", v28);
    end;
    if typeof(v24) == "CFrame" then
        assert(v24:FuzzyEq(v28));
        return;
    else
        if typeof(v24) == "table" then
            v24 = v3(v24);
        end;
        assert(v8(v28, v24), "applied not equal");
        return;
    end;
end;
local function _(v30, v31, v32) --[[ Line: 94 ]] --[[ Name: check ]]
    -- upvalues: v29 (copy), v3 (copy)
    v29(v3(v30), v3(v31), true, v32);
    v29(v3(v30), v3(v31), false, v32);
end;
local function v46(v34, v35, v36) --[[ Line: 99 ]] --[[ Name: checkMutable ]]
    -- upvalues: v3 (copy), v19 (copy), v1 (copy), v8 (copy)
    local v37 = v3(v34);
    v19(v35);
    local v38, v39 = v1.diffMutable(v34, v35);
    assert(v38 ~= nil, "diff was nil");
    local v40 = v1.applyImmutable(v37, v38);
    if v36 then
        print("Applied =", v40);
    end;
    assert(v8(v39, v35), "newOld and new not equal");
    assert(v8(v40, v35), "applied not equal");
    if typeof(v35) == "table" then
        assert(v34 ~= v35, "old and new are the same table");
        local function v41(v42, v43) --[[ Line: 121 ]] --[[ Name: checkForSameTable ]]
            -- upvalues: v41 (copy)
            for v44, v45 in v43 do
                if type(v45) == "table" then
                    assert(v42[v44] ~= v45, "old and new have a same table");
                    v41(v42[v44], v45);
                end;
            end;
        end;
        v41(v39, v35);
    end;
end;
return function(v47) --[[ Line: 134 ]]
    -- upvalues: v29 (copy), v3 (copy), v1 (copy), v2 (copy), v8 (copy), v46 (copy)
    local l_assertEqual_0 = v47.assertEqual;
    v47.test("number to bool", function() --[[ Line: 137 ]]
        -- upvalues: v29 (ref), v3 (ref)
        v29(v3(100), v3(true), true, nil);
        v29(v3(100), v3(true), false, nil);
    end);
    v47.test("vector types", function() --[[ Line: 141 ]]
        -- upvalues: v29 (ref), v3 (ref)
        local v49, v50 = Vector2.new(2.5, 30.1);
        v29(v3(nil), v3(v49), true, v50);
        v29(v3(nil), v3(v49), false, v50);
        v29(v3(nil), v3((Vector3.new(2.5, 30.100000381469727, 204.3000030517578, 0))), true, nil);
        v29(v3(nil), v3((Vector3.new(2.5, 30.100000381469727, 204.3000030517578, 0))), false, nil);
        v49, v50 = Vector2int16.new(3.4, 9.2);
        v29(v3(nil), v3(v49), true, v50);
        v29(v3(nil), v3(v49), false, v50);
        v49, v50 = Vector3int16.new(3.4, 9.2, 30.3);
        v29(v3(nil), v3(v49), true, v50);
        v29(v3(nil), v3(v49), false, v50);
    end);
    v47.test("cframe", function() --[[ Line: 148 ]]
        -- upvalues: v29 (ref), v3 (ref)
        local l_identity_0 = CFrame.identity;
        v29(v3(nil), v3(l_identity_0), true, nil);
        v29(v3(nil), v3(l_identity_0), false, nil);
        local v52;
        l_identity_0, v52 = CFrame.lookAt(Vector3.new(20, 40, 3290, 0), (Vector3.new(1, 2, 3, 0)));
        v29(v3(nil), v3(l_identity_0), true, v52);
        v29(v3(nil), v3(l_identity_0), false, v52);
    end);
    v47.test("number to empty string", function() --[[ Line: 153 ]]
        -- upvalues: v29 (ref), v3 (ref)
        v29(v3(100), v3(""), true, nil);
        v29(v3(100), v3(""), false, nil);
    end);
    v47.test("number to number", function() --[[ Line: 157 ]]
        -- upvalues: v29 (ref), v3 (ref)
        v29(v3(100), v3(120), true, nil);
        v29(v3(100), v3(120), false, nil);
    end);
    v47.test("bool to array", function() --[[ Line: 161 ]]
        -- upvalues: v29 (ref), v3 (ref)
        local v53 = {
            1, 
            2, 
            3
        };
        v29(v3(true), v3(v53), true, nil);
        v29(v3(true), v3(v53), false, nil);
    end);
    v47.test("bool to dictionary", function() --[[ Line: 167 ]]
        -- upvalues: v29 (ref), v3 (ref)
        local v54 = {
            coins = 3
        };
        v29(v3(true), v3(v54), true, nil);
        v29(v3(true), v3(v54), false, nil);
    end);
    v47.test("dictionary to bool", function() --[[ Line: 173 ]]
        -- upvalues: v29 (ref), v3 (ref)
        local v55 = {
            coins = 3
        };
        v29(v3(v55), v3(true), true, nil);
        v29(v3(v55), v3(true), false, nil);
    end);
    v47.test("array to bool", function() --[[ Line: 177 ]]
        -- upvalues: v29 (ref), v3 (ref)
        local v56 = {
            1, 
            2, 
            3
        };
        v29(v3(v56), v3(false), true, nil);
        v29(v3(v56), v3(false), false, nil);
    end);
    v47.test("bool to empty table", function() --[[ Line: 181 ]]
        -- upvalues: v29 (ref), v3 (ref)
        local v57 = {};
        v29(v3(false), v3(v57), true, nil);
        v29(v3(false), v3(v57), false, nil);
    end);
    v47.test("non-table to table with arrays/dictionaries", function() --[[ Line: 185 ]]
        -- upvalues: v29 (ref), v3 (ref)
        local v58 = {
            "a", 
            2, 
            {}, 
            {
                "a", 
                "b", 
                "c"
            }, 
            {
                a = "1", 
                b = "2", 
                c = "3"
            }
        };
        v29(v3(false), v3(v58), true, nil);
        v29(v3(false), v3(v58), false, nil);
        v58 = {
            one = "a", 
            two = 2, 
            three = {}, 
            four = {
                "a", 
                "b", 
                "c"
            }, 
            five = {
                a = "1", 
                b = "2", 
                c = "3"
            }
        };
        v29(v3(false), v3(v58), true, nil);
        v29(v3(false), v3(v58), false, nil);
    end);
    v47.nested("dictionary", function() --[[ Line: 190 ]]
        -- upvalues: v47 (copy), v29 (ref), v3 (ref), v1 (ref), l_assertEqual_0 (copy)
        v47.test("to empty", function() --[[ Line: 191 ]]
            -- upvalues: v29 (ref), v3 (ref)
            local v59 = {
                a = "one", 
                b = "two", 
                c = "three"
            };
            local v60 = {};
            v29(v3(v59), v3(v60), true, nil);
            v29(v3(v59), v3(v60), false, nil);
        end);
        v47.test("no changes", function() --[[ Line: 195 ]]
            -- upvalues: v1 (ref), l_assertEqual_0 (ref)
            local v61 = v1.diffImmutable({
                foo = true
            }, {
                foo = true
            });
            l_assertEqual_0(v61, nil);
        end);
        v47.test("removal", function() --[[ Line: 201 ]]
            -- upvalues: v29 (ref), v3 (ref)
            local v62 = {
                remove = "remove"
            };
            local v63 = {};
            v29(v3(v62), v3(v63), true, nil);
            v29(v3(v62), v3(v63), false, nil);
        end);
        v47.test("addition", function() --[[ Line: 205 ]]
            -- upvalues: v29 (ref), v3 (ref)
            local v64 = {};
            local v65 = {
                addition = true
            };
            v29(v3(v64), v3(v65), true, nil);
            v29(v3(v64), v3(v65), false, nil);
        end);
        v47.test("change", function() --[[ Line: 209 ]]
            -- upvalues: v29 (ref), v3 (ref)
            local v66 = {
                change = 5
            };
            local v67 = {
                change = 10
            };
            v29(v3(v66), v3(v67), true, nil);
            v29(v3(v66), v3(v67), false, nil);
        end);
        v47.test("removal + addition + change", function() --[[ Line: 213 ]]
            -- upvalues: v29 (ref), v3 (ref)
            local v68 = {
                remove = "remove", 
                change = 5, 
                noChange = true
            };
            local v69 = {
                change = 10, 
                addition = true, 
                noChange = true
            };
            v29(v3(v68), v3(v69), true, nil);
            v29(v3(v68), v3(v69), false, nil);
        end);
        v47.test("nested dictionary", function() --[[ Line: 220 ]]
            -- upvalues: v29 (ref), v3 (ref)
            local v70 = {
                nested = {
                    noChange = true, 
                    change = 5, 
                    remove = true
                }
            };
            local v71 = {
                nested = {
                    noChange = true, 
                    change = 10
                }
            };
            v29(v3(v70), v3(v71), true, nil);
            v29(v3(v70), v3(v71), false, nil);
        end);
        v47.test("nested dictionary no removals", function() --[[ Line: 227 ]]
            -- upvalues: v29 (ref), v3 (ref)
            local v72 = {
                stats = {
                    deaths = 5, 
                    kills = 0
                }
            };
            local v73 = {
                stats = {
                    deaths = 5, 
                    kills = 1
                }
            };
            v29(v3(v72), v3(v73), true, nil);
            v29(v3(v72), v3(v73), false, nil);
        end);
        v47.test("nested array", function() --[[ Line: 244 ]]
            -- upvalues: v29 (ref), v3 (ref)
            local v74 = {
                nested = {
                    1, 
                    2, 
                    3
                }
            };
            local v75 = {
                nested = {
                    2, 
                    1
                }
            };
            v29(v3(v74), v3(v75), true, nil);
            v29(v3(v74), v3(v75), false, nil);
        end);
    end);
    v47.nested("array", function() --[[ Line: 252 ]]
        -- upvalues: v47 (copy), v29 (ref), v3 (ref), v1 (ref), l_assertEqual_0 (copy)
        v47.test("to empty", function() --[[ Line: 253 ]]
            -- upvalues: v29 (ref), v3 (ref)
            local v76 = {
                "one", 
                "two", 
                "three"
            };
            local v77 = {};
            v29(v3(v76), v3(v77), true, nil);
            v29(v3(v76), v3(v77), false, nil);
        end);
        v47.test("no changes", function() --[[ Line: 257 ]]
            -- upvalues: v1 (ref), l_assertEqual_0 (ref)
            local v78 = v1.diffImmutable({
                "one", 
                "two", 
                "three"
            }, {
                "one", 
                "two", 
                "three"
            });
            l_assertEqual_0(v78, nil);
        end);
        v47.test("removal", function() --[[ Line: 263 ]]
            -- upvalues: v29 (ref), v3 (ref)
            local v79 = {
                "one", 
                "two", 
                "three"
            };
            local v80 = {
                "one", 
                "two"
            };
            v29(v3(v79), v3(v80), true, nil);
            v29(v3(v79), v3(v80), false, nil);
        end);
        v47.test("addition", function() --[[ Line: 267 ]]
            -- upvalues: v29 (ref), v3 (ref)
            local v81 = {
                "one", 
                "two"
            };
            local v82 = {
                "one", 
                "two", 
                "three"
            };
            v29(v3(v81), v3(v82), true, nil);
            v29(v3(v81), v3(v82), false, nil);
        end);
        v47.test("change", function() --[[ Line: 271 ]]
            -- upvalues: v29 (ref), v3 (ref)
            local v83 = {
                "same", 
                "change"
            };
            local v84 = {
                "same", 
                "different"
            };
            v29(v3(v83), v3(v84), true, nil);
            v29(v3(v83), v3(v84), false, nil);
        end);
        v47.test("addition + change", function() --[[ Line: 275 ]]
            -- upvalues: v29 (ref), v3 (ref)
            local v85 = {
                "same", 
                "change"
            };
            local v86 = {
                "same", 
                "different", 
                "addition"
            };
            v29(v3(v85), v3(v86), true, nil);
            v29(v3(v85), v3(v86), false, nil);
        end);
        v47.test("removal + change", function() --[[ Line: 279 ]]
            -- upvalues: v29 (ref), v3 (ref)
            local v87 = {
                "same", 
                "change", 
                "remove"
            };
            local v88 = {
                "same", 
                "different"
            };
            v29(v3(v87), v3(v88), true, nil);
            v29(v3(v87), v3(v88), false, nil);
        end);
        v47.test("array and dictionary inside array", function() --[[ Line: 283 ]]
            -- upvalues: v29 (ref), v3 (ref)
            local v89 = {
                {
                    "same", 
                    "change"
                }, 
                {
                    foo = true, 
                    noChange = true
                }, 
                {}
            };
            local v90 = {
                {
                    "same", 
                    "different", 
                    "addition"
                }, 
                {
                    foo = false, 
                    noChange = true
                }
            };
            v29(v3(v89), v3(v90), true, nil);
            v29(v3(v89), v3(v90), false, nil);
        end);
    end);
    v47.nested("array to dictionary", function() --[[ Line: 298 ]]
        -- upvalues: v47 (copy), v29 (ref), v3 (ref)
        v47.test("normal", function() --[[ Line: 299 ]]
            -- upvalues: v29 (ref), v3 (ref)
            local v91 = {
                1, 
                2, 
                3
            };
            local v92 = {
                coins = 3
            };
            v29(v3(v91), v3(v92), true, nil);
            v29(v3(v91), v3(v92), false, nil);
        end);
        v47.test("nested in array", function() --[[ Line: 306 ]]
            -- upvalues: v29 (ref), v3 (ref)
            local v93 = {
                {
                    1, 
                    2, 
                    3
                }
            };
            local v94 = {
                {
                    coins = 3
                }
            };
            v29(v3(v93), v3(v94), true, nil);
            v29(v3(v93), v3(v94), false, nil);
        end);
        v47.test("nested in dictionary", function() --[[ Line: 313 ]]
            -- upvalues: v29 (ref), v3 (ref)
            local v95 = {
                foo = {
                    1, 
                    2, 
                    3
                }
            };
            local v96 = {
                foo = {
                    coins = 3
                }
            };
            v29(v3(v95), v3(v96), true, nil);
            v29(v3(v95), v3(v96), false, nil);
        end);
    end);
    v47.nested("dictionary to array", function() --[[ Line: 321 ]]
        -- upvalues: v47 (copy), v29 (ref), v3 (ref)
        v47.test("normal", function() --[[ Line: 322 ]]
            -- upvalues: v29 (ref), v3 (ref)
            local v97 = {
                coins = 3
            };
            local v98 = {
                1, 
                2, 
                3
            };
            v29(v3(v97), v3(v98), true, nil);
            v29(v3(v97), v3(v98), false, nil);
        end);
        v47.test("nested in array", function() --[[ Line: 329 ]]
            -- upvalues: v29 (ref), v3 (ref)
            local v99 = {
                {
                    coins = 3
                }
            };
            local v100 = {
                {
                    1, 
                    2, 
                    3
                }
            };
            v29(v3(v99), v3(v100), true, nil);
            v29(v3(v99), v3(v100), false, nil);
        end);
        v47.test("nested in dictionary", function() --[[ Line: 336 ]]
            -- upvalues: v29 (ref), v3 (ref)
            local v101 = {
                foo = {
                    coins = 3
                }
            };
            local v102 = {
                foo = {
                    1, 
                    2, 
                    3
                }
            };
            v29(v3(v101), v3(v102), true, nil);
            v29(v3(v101), v3(v102), false, nil);
        end);
    end);
    v47.test("array to nil", function() --[[ Line: 344 ]]
        -- upvalues: v29 (ref), v3 (ref)
        local v103 = {
            1
        };
        v29(v3(v103), v3(nil), true, nil);
        v29(v3(v103), v3(nil), false, nil);
    end);
    v47.test("dictionary to nil", function() --[[ Line: 348 ]]
        -- upvalues: v29 (ref), v3 (ref)
        local v104 = {
            foo = true
        };
        v29(v3(v104), v3(nil), true, nil);
        v29(v3(v104), v3(nil), false, nil);
    end);
    v47.test("bug case", function() --[[ Line: 352 ]]
        -- upvalues: v29 (ref), v3 (ref)
        local v105 = {
            stats = {
                globalStats = {
                    secondsPlayed = 0
                }, 
                mechStats = {}
            }
        };
        local v106 = {
            stats = {
                globalStats = {
                    secondsPlayed = 299
                }, 
                mechStats = {}
            }
        };
        v29(v3(v105), v3(v106), true, nil);
        v29(v3(v105), v3(v106), false, nil);
    end);
    v47.test("shouldn't change unchanged table when applyImmutable", function() --[[ Line: 373 ]]
        -- upvalues: v1 (ref), v3 (ref), l_assertEqual_0 (copy)
        local v107 = {
            foo = {
                bar = true
            }, 
            baz = {}
        };
        local v108 = {
            foo = {
                bar = false
            }, 
            baz = {}
        };
        local v109 = v1.diffImmutable(v107, v108);
        local v110 = v3(v107);
        local v111 = v1.applyImmutable(v110, v109);
        local l_l_assertEqual_0_0 = l_assertEqual_0;
        local v113 = false;
        if v110 ~= v111 then
            v113 = v110.foo ~= v111.foo;
        end;
        l_l_assertEqual_0_0(v113, true);
        l_assertEqual_0(v110.baz == v111.baz, true);
    end);
    v47.test("diff size", function() --[[ Line: 396 ]]
        -- upvalues: v1 (ref), v2 (ref), l_assertEqual_0 (copy)
        local v114 = {
            "xvKqT", 
            "LpUoN", 
            "aRzYl", 
            "cQwVo", 
            "mJuTe", 
            "gYbFi", 
            "vCnLd", 
            "tXoPm", 
            "hBwGq", 
            "dJkUl", 
            "uRtYi", 
            "zNwVp", 
            "qAzLf", 
            "eKcTr", 
            "pMvJd", 
            "oBwUk", 
            "fXqLn", 
            "iGyRp", 
            "nZcVo", 
            "lKjTm", 
            "sQbFi", 
            "jWvUd", 
            "yRnLp", 
            "kXoQt", 
            "aMjYi", 
            "vPzTl", 
            "cBwUr", 
            "hXjVn", 
            "dQkPo", 
            "gZyFm", 
            "oKcTr", 
            "mJvUp", 
            "fQbLi", 
            "iGwYt", 
            "nXoPk", 
            "lRzVm", 
            "sYjTo", 
            "kWbUr", 
            "aQnXp", 
            "vZjLf", 
            "cKjTr", 
            "hPzWm", 
            "dXqBo", 
            "gRkYn", 
            "oJcUi", 
            "mWvLp", 
            "fTzYo", 
            "iQnPk", 
            "nKjVr", 
            "lZgTm"
        };
        local v115 = {};
        for _, v117 in v114 do
            v115[v117] = math.random();
        end;
        local v118 = table.clone(v115);
        v118[v114[1]] = 4;
        local v119 = v1.diffImmutable(v115, v118);
        local v120 = v2.GetDataByteSize(v119);
        local v121 = v2.GetDataByteSize(v118);
        l_assertEqual_0(v120 == 20, true);
        l_assertEqual_0(v121 == 802, true);
    end);
    v47.nested("diffMutable", function() --[[ Line: 465 ]]
        -- upvalues: v47 (copy), v3 (ref), v1 (ref), l_assertEqual_0 (copy), v8 (ref), v46 (ref)
        v47.test("no changes", function() --[[ Line: 466 ]]
            -- upvalues: v3 (ref), v1 (ref), l_assertEqual_0 (ref), v8 (ref)
            local v122 = {
                foo = true
            };
            local v123 = v3(v122);
            local v124, v125 = v1.diffImmutable(v122, {
                foo = true
            });
            l_assertEqual_0(v124, nil);
            l_assertEqual_0(v125, nil);
            assert(v8(v122, v123), nil);
        end);
        v47.test("non-tables", function() --[[ Line: 478 ]]
            -- upvalues: v46 (ref)
            v46("hello", 520);
            v46("hello", nil);
            v46(nil, false);
        end);
        v47.test("nil to table", function() --[[ Line: 484 ]]
            -- upvalues: v46 (ref)
            v46(nil, {
                a = "hello", 
                b = {
                    5, 
                    4, 
                    3, 
                    2, 
                    1
                }, 
                c = {
                    foo = "bar"
                }
            });
        end);
        v47.test("copies new tables in dictionary", function() --[[ Line: 494 ]]
            -- upvalues: v46 (ref)
            v46({
                a = true
            }, {
                a = {
                    1, 
                    2, 
                    3
                }, 
                b = {
                    true, 
                    false
                }
            });
        end);
        v47.test("copies new tables in array", function() --[[ Line: 503 ]]
            -- upvalues: v46 (ref)
            v46({
                array = {
                    1, 
                    2, 
                    3
                }
            }, {
                array = {
                    1, 
                    {
                        "hello"
                    }, 
                    3, 
                    {
                        "abc"
                    }
                }
            });
        end);
        v47.test("handles nested diffs", function() --[[ Line: 511 ]]
            -- upvalues: v46 (ref)
            v46({
                array = {
                    "a", 
                    "b", 
                    "c", 
                    1, 
                    2, 
                    3
                }, 
                dictionary = {
                    foo = "bar"
                }
            }, {
                array = {
                    "c", 
                    "b", 
                    "a"
                }, 
                dictionary = {
                    foo = "baz"
                }
            });
        end);
    end);
end;