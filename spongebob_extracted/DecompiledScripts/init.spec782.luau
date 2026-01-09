return function() --[[ Line: 1 ]]
    local v0 = require(script.Parent);
    describe("Copy (Deep)", function() --[[ Line: 4 ]]
        -- upvalues: v0 (copy)
        it("should create a deep table copy", function() --[[ Line: 5 ]]
            -- upvalues: v0 (ref)
            local v1 = {
                a = {
                    b = {
                        c = {
                            d = 32
                        }
                    }
                }
            };
            local v2 = v0.Copy(v1, true);
            expect(v1).never.to.equal(v2);
            expect(v1.a).never.to.equal(v2.a);
            expect(v2.a.b.c.d).to.equal(v1.a.b.c.d);
        end);
    end);
    describe("Copy (Shallow)", function() --[[ Line: 14 ]]
        -- upvalues: v0 (copy)
        it("should create a shallow dictionary copy", function() --[[ Line: 15 ]]
            -- upvalues: v0 (ref)
            local v3 = {
                a = {
                    b = {
                        c = {
                            d = 32
                        }
                    }
                }
            };
            local v4 = v0.Copy(v3);
            expect(v4).never.to.equal(v3);
            expect(v4.a).to.equal(v3.a);
            expect(v4.a.b.c.d).to.equal(v3.a.b.c.d);
        end);
        it("should create a shallow array copy", function() --[[ Line: 23 ]]
            -- upvalues: v0 (ref)
            local v5 = {
                10, 
                20, 
                30, 
                40
            };
            local v6 = v0.Copy(v5);
            expect(v6).never.to.equal(v5);
            for v7, v8 in ipairs(v5) do
                expect(v6[v7]).to.equal(v8);
            end;
        end);
    end);
    describe("Sync", function() --[[ Line: 33 ]]
        -- upvalues: v0 (copy)
        it("should sync tables", function() --[[ Line: 34 ]]
            -- upvalues: v0 (ref)
            local v9 = {
                a = 32, 
                b = 64, 
                c = 128, 
                e = {
                    h = 1
                }
            };
            local v10 = {
                a = 32, 
                b = 10, 
                d = 1, 
                e = {
                    h = 2, 
                    n = 2
                }, 
                f = {
                    x = 10
                }
            };
            local v11 = v0.Sync(v10, v9);
            expect(v11.a).to.equal(v9.a);
            expect(v11.b).to.equal(10);
            expect(v11.c).to.equal(v9.c);
            expect(v11.d).never.to.be.ok();
            expect(v11.e.h).to.equal(2);
            expect(v11.e.n).never.to.be.ok();
            expect(v11.f).never.to.be.ok();
        end);
    end);
    describe("Reconcile", function() --[[ Line: 48 ]]
        -- upvalues: v0 (copy)
        it("should reconcile table", function() --[[ Line: 49 ]]
            -- upvalues: v0 (ref)
            local v12 = {
                kills = 0, 
                deaths = 0, 
                xp = 10, 
                stuff = {}, 
                stuff2 = "abc", 
                stuff3 = {
                    "data"
                }
            };
            local v13 = {
                kills = 10, 
                deaths = 4, 
                stuff = {
                    "abc", 
                    "xyz"
                }, 
                extra = 5, 
                stuff2 = {
                    abc = 10
                }, 
                stuff3 = true
            };
            local v14 = v0.Reconcile(v13, v12);
            expect(v14).never.to.equal(v13);
            expect(v14).never.to.equal(v12);
            expect(v14.kills).to.equal(10);
            expect(v14.deaths).to.equal(4);
            expect(v14.xp).to.equal(10);
            expect(v14.stuff[1]).to.equal("abc");
            expect(v14.stuff[2]).to.equal("xyz");
            expect(v14.extra).to.equal(5);
            expect((type(v14.stuff2))).to.equal("table");
            expect(v14.stuff2).never.to.equal(v13.stuff2);
            expect(v14.stuff2.abc).to.equal(10);
            expect((type(v14.stuff3))).to.equal("boolean");
            expect(v14.stuff3).to.equal(true);
        end);
    end);
    describe("SwapRemove", function() --[[ Line: 70 ]]
        -- upvalues: v0 (copy)
        it("should swap remove index", function() --[[ Line: 71 ]]
            -- upvalues: v0 (ref)
            local v15 = {
                1, 
                2, 
                3, 
                4, 
                5
            };
            v0.SwapRemove(v15, 3);
            expect(#v15).to.equal(4);
            expect(v15[3]).to.equal(5);
        end);
    end);
    describe("SwapRemoveFirstValue", function() --[[ Line: 79 ]]
        -- upvalues: v0 (copy)
        it("should swap remove first value given", function() --[[ Line: 80 ]]
            -- upvalues: v0 (ref)
            local v16 = {
                "hello", 
                "world", 
                "goodbye", 
                "planet"
            };
            v0.SwapRemoveFirstValue(v16, "world");
            expect(#v16).to.equal(3);
            expect(v16[2]).to.equal("planet");
        end);
    end);
    describe("Map", function() --[[ Line: 88 ]]
        -- upvalues: v0 (copy)
        it("should map table", function() --[[ Line: 89 ]]
            -- upvalues: v0 (ref)
            local v17 = {
                {
                    FirstName = "John", 
                    LastName = "Doe"
                }, 
                {
                    FirstName = "Jane", 
                    LastName = "Smith"
                }
            };
            local v19 = v0.Map(v17, function(v18) --[[ Line: 94 ]]
                return v18.FirstName .. " " .. v18.LastName;
            end);
            expect(v19[1]).to.equal("John Doe");
            expect(v19[2]).to.equal("Jane Smith");
        end);
    end);
    describe("Filter", function() --[[ Line: 102 ]]
        -- upvalues: v0 (copy)
        it("should filter table", function() --[[ Line: 103 ]]
            -- upvalues: v0 (ref)
            local v22 = v0.Filter({
                10, 
                20, 
                30, 
                40, 
                50, 
                60, 
                70, 
                80, 
                90
            }, function(v20) --[[ Line: 105 ]]
                local v21 = false;
                if v20 >= 30 then
                    v21 = v20 <= 60;
                end;
                return v21;
            end);
            expect(#v22).to.equal(4);
            expect(v22[1]).to.equal(30);
            expect(v22[#v22]).to.equal(60);
        end);
    end);
    describe("Reduce", function() --[[ Line: 114 ]]
        -- upvalues: v0 (copy)
        it("should reduce table with numbers", function() --[[ Line: 115 ]]
            -- upvalues: v0 (ref)
            local v25 = v0.Reduce({
                1, 
                2, 
                3, 
                4, 
                5
            }, function(v23, v24) --[[ Line: 117 ]]
                return v23 + v24;
            end);
            expect(v25).to.equal(15);
        end);
        it("should reduce table", function() --[[ Line: 123 ]]
            -- upvalues: v0 (ref)
            local v26 = {
                {
                    Score = 10
                }, 
                {
                    Score = 20
                }, 
                {
                    Score = 30
                }
            };
            local v29 = v0.Reduce(v26, function(v27, v28) --[[ Line: 125 ]]
                return v27 + v28.Score;
            end, 0);
            expect(v29).to.equal(60);
        end);
        it("should reduce table with initial value", function() --[[ Line: 131 ]]
            -- upvalues: v0 (ref)
            local v30 = {
                {
                    Score = 10
                }, 
                {
                    Score = 20
                }, 
                {
                    Score = 30
                }
            };
            local v33 = v0.Reduce(v30, function(v31, v32) --[[ Line: 133 ]]
                return v31 + v32.Score;
            end, 40);
            expect(v33).to.equal(100);
        end);
        it("should reduce functions", function() --[[ Line: 139 ]]
            -- upvalues: v0 (ref)
            local v39 = v0.Reduce({
                function(v34) --[[ Line: 140 ]] --[[ Name: Square ]]
                    return v34 * v34;
                end, 
                function(v35) --[[ Line: 143 ]] --[[ Name: Double ]]
                    return v35 * 2;
                end
            }, function(v36, v37) --[[ Line: 146 ]]
                return function(v38) --[[ Line: 147 ]]
                    -- upvalues: v36 (copy), v37 (copy)
                    return v36(v37(v38));
                end;
            end)(10);
            expect(v39).to.equal(400);
        end);
    end);
    describe("Assign", function() --[[ Line: 156 ]]
        -- upvalues: v0 (copy)
        it("should assign tables", function() --[[ Line: 157 ]]
            -- upvalues: v0 (ref)
            local v40 = {
                a = 32, 
                x = 100
            };
            local v41 = {
                b = 64, 
                c = 128
            };
            local v42 = {
                a = 10, 
                c = 100, 
                d = 200
            };
            local v43 = v0.Assign(v40, v41, v42);
            expect(v43.a).to.equal(10);
            expect(v43.b).to.equal(64);
            expect(v43.c).to.equal(100);
            expect(v43.d).to.equal(200);
            expect(v43.x).to.equal(100);
        end);
    end);
    describe("Extend", function() --[[ Line: 170 ]]
        -- upvalues: v0 (copy)
        it("should extend tables", function() --[[ Line: 171 ]]
            -- upvalues: v0 (ref)
            local v44 = v0.Extend({
                "a", 
                "b", 
                "c"
            }, {
                "d", 
                "e", 
                "f"
            });
            expect(table.concat(v44)).to.equal("abcdef");
        end);
    end);
    describe("Reverse", function() --[[ Line: 179 ]]
        -- upvalues: v0 (copy)
        it("should create a table in reverse", function() --[[ Line: 180 ]]
            -- upvalues: v0 (ref)
            local v45 = v0.Reverse({
                1, 
                2, 
                3
            });
            expect(table.concat(v45)).to.equal("321");
        end);
    end);
    describe("Shuffle", function() --[[ Line: 187 ]]
        -- upvalues: v0 (copy)
        it("should shuffle a table", function() --[[ Line: 188 ]]
            -- upvalues: v0 (ref)
            local v46 = {
                1, 
                2, 
                3, 
                4, 
                5
            };
            expect(function() --[[ Line: 190 ]]
                -- upvalues: v0 (ref), v46 (copy)
                v0.Shuffle(v46);
            end).never.to.throw();
        end);
    end);
    describe("Sample", function() --[[ Line: 196 ]]
        -- upvalues: v0 (copy)
        it("should sample a table", function() --[[ Line: 197 ]]
            -- upvalues: v0 (ref)
            local v47 = v0.Sample({
                1, 
                2, 
                3, 
                4, 
                5
            }, 3);
            expect(#v47).to.equal(3);
        end);
    end);
    describe("Flat", function() --[[ Line: 204 ]]
        -- upvalues: v0 (copy)
        it("should flatten table", function() --[[ Line: 205 ]]
            -- upvalues: v0 (ref)
            local v48 = v0.Flat({
                1, 
                2, 
                3, 
                {
                    4, 
                    5, 
                    {
                        6, 
                        7
                    }
                }
            }, 3);
            expect(table.concat(v48)).to.equal("1234567");
        end);
    end);
    describe("FlatMap", function() --[[ Line: 212 ]]
        -- upvalues: v0 (copy)
        it("should map and flatten table", function() --[[ Line: 213 ]]
            -- upvalues: v0 (ref)
            local v50 = v0.FlatMap({
                1, 
                2, 
                3, 
                4, 
                5, 
                6, 
                7
            }, function(v49) --[[ Line: 215 ]]
                return {
                    v49, 
                    v49 * 2
                };
            end);
            expect(table.concat(v50)).to.equal("12243648510612714");
        end);
    end);
    describe("Keys", function() --[[ Line: 222 ]]
        -- upvalues: v0 (copy)
        it("should give all keys of table", function() --[[ Line: 223 ]]
            -- upvalues: v0 (ref)
            local v51 = {
                a = 1, 
                b = 2, 
                c = 3
            };
            local v52 = v0.Keys(v51);
            expect(#v52).to.equal(3);
            expect(table.find(v52, "a")).to.be.ok();
            expect(table.find(v52, "b")).to.be.ok();
            expect(table.find(v52, "c")).to.be.ok();
        end);
    end);
    describe("Values", function() --[[ Line: 233 ]]
        -- upvalues: v0 (copy)
        it("should give all values of table", function() --[[ Line: 234 ]]
            -- upvalues: v0 (ref)
            local v53 = {
                a = 1, 
                b = 2, 
                c = 3
            };
            local v54 = v0.Values(v53);
            expect(#v54).to.equal(3);
            expect(table.find(v54, 1)).to.be.ok();
            expect(table.find(v54, 2)).to.be.ok();
            expect(table.find(v54, 3)).to.be.ok();
        end);
    end);
    describe("Find", function() --[[ Line: 244 ]]
        -- upvalues: v0 (copy)
        it("should find item in array", function() --[[ Line: 245 ]]
            -- upvalues: v0 (ref)
            local v56, v57 = v0.Find({
                10, 
                20, 
                30
            }, function(v55) --[[ Line: 247 ]]
                return v55 == 20;
            end);
            expect(v56).to.be.ok();
            expect(v57).to.equal(2);
            expect(v56).to.equal(20);
        end);
        it("should find item in dictionary", function() --[[ Line: 255 ]]
            -- upvalues: v0 (ref)
            local v58 = {
                {
                    Score = 10
                }, 
                {
                    Score = 20
                }, 
                {
                    Score = 30
                }
            };
            local v60, v61 = v0.Find(v58, function(v59) --[[ Line: 257 ]]
                return v59.Score == 20;
            end);
            expect(v60).to.be.ok();
            expect(v61).to.equal(2);
            expect(v60.Score).to.equal(20);
        end);
    end);
    describe("Every", function() --[[ Line: 266 ]]
        -- upvalues: v0 (copy)
        it("should see every value is above 20", function() --[[ Line: 267 ]]
            -- upvalues: v0 (ref)
            local v63 = v0.Every({
                21, 
                40, 
                200
            }, function(v62) --[[ Line: 269 ]]
                return v62 > 20;
            end);
            expect(v63).to.equal(true);
        end);
        it("should see every value is not above 20", function() --[[ Line: 275 ]]
            -- upvalues: v0 (ref)
            local v65 = v0.Every({
                20, 
                40, 
                200
            }, function(v64) --[[ Line: 277 ]]
                return v64 > 20;
            end);
            expect(v65).never.to.equal(true);
        end);
    end);
    describe("Some", function() --[[ Line: 284 ]]
        -- upvalues: v0 (copy)
        it("should see some value is above 20", function() --[[ Line: 285 ]]
            -- upvalues: v0 (ref)
            local v67 = v0.Some({
                5, 
                40, 
                1
            }, function(v66) --[[ Line: 287 ]]
                return v66 > 20;
            end);
            expect(v67).to.equal(true);
        end);
        it("should see some value is not above 20", function() --[[ Line: 293 ]]
            -- upvalues: v0 (ref)
            local v69 = v0.Some({
                5, 
                15, 
                1
            }, function(v68) --[[ Line: 295 ]]
                return v68 > 20;
            end);
            expect(v69).never.to.equal(true);
        end);
    end);
    describe("Truncate", function() --[[ Line: 302 ]]
        -- upvalues: v0 (copy)
        it("should truncate an array", function() --[[ Line: 303 ]]
            -- upvalues: v0 (ref)
            local v70 = {
                1, 
                2, 
                3, 
                4, 
                5
            };
            local v71 = v0.Truncate(v70, 3);
            expect(#v71).to.equal(3);
            expect(v71[1]).to.equal(v70[1]);
            expect(v71[2]).to.equal(v70[2]);
            expect(v71[3]).to.equal(v70[3]);
        end);
        it("should truncate an array with out of bounds sizes", function() --[[ Line: 312 ]]
            -- upvalues: v0 (ref)
            local v72 = {
                1, 
                2, 
                3, 
                4, 
                5
            };
            expect(function() --[[ Line: 314 ]]
                -- upvalues: v0 (ref), v72 (copy)
                v0.Truncate(v72, -1);
            end).to.never.throw();
            expect(function() --[[ Line: 317 ]]
                -- upvalues: v0 (ref), v72 (copy)
                v0.Truncate(v72, #v72 + 1);
            end).to.never.throw();
            local v73 = v0.Truncate(v72, #v72 + 10);
            expect(#v73).to.equal(#v72);
            expect(v73).to.never.equal(v72);
        end);
    end);
    describe("Lock", function() --[[ Line: 326 ]]
        -- upvalues: v0 (copy)
        it("should lock a table", function() --[[ Line: 327 ]]
            -- upvalues: v0 (ref)
            local v74 = {
                abc = {
                    xyz = {
                        num = 32
                    }
                }
            };
            expect(function() --[[ Line: 329 ]]
                -- upvalues: v74 (copy)
                v74.abc.xyz.num = 64;
            end).never.to.throw();
            local v75 = v0.Lock(v74);
            expect(v74.abc.xyz.num).to.equal(64);
            expect(v74).to.equal(v75);
            expect(function() --[[ Line: 335 ]]
                -- upvalues: v74 (copy)
                v74.abc.xyz.num = 10;
            end).to.throw();
        end);
    end);
    describe("Zip", function() --[[ Line: 341 ]]
        -- upvalues: v0 (copy)
        it("should zip arrays together", function() --[[ Line: 342 ]]
            -- upvalues: v0 (ref)
            local v76 = {
                1, 
                2, 
                3, 
                4, 
                5
            };
            local v77 = {
                9, 
                8, 
                7, 
                6, 
                5
            };
            local v78 = {
                1, 
                1, 
                1, 
                1, 
                1
            };
            local v79 = 0;
            for v80, v81 in v0.Zip(v76, v77, v78) do
                v79 = v80;
                expect(v81[1]).to.equal(v76[v80]);
                expect(v81[2]).to.equal(v77[v80]);
                expect(v81[3]).to.equal(v78[v80]);
            end;
            expect(v79).to.equal((math.min(#v76, #v77, #v78)));
        end);
        it("should zip arrays of different lengths together", function() --[[ Line: 356 ]]
            -- upvalues: v0 (ref)
            local v82 = {
                1, 
                2, 
                3, 
                4, 
                5
            };
            local v83 = {
                9, 
                8, 
                7, 
                6
            };
            local v84 = {
                1, 
                1, 
                1
            };
            local v85 = 0;
            for v86, v87 in v0.Zip(v82, v83, v84) do
                v85 = v86;
                expect(v87[1]).to.equal(v82[v86]);
                expect(v87[2]).to.equal(v83[v86]);
                expect(v87[3]).to.equal(v84[v86]);
            end;
            expect(v85).to.equal((math.min(#v82, #v83, #v84)));
        end);
        it("should zip maps together", function() --[[ Line: 370 ]]
            -- upvalues: v0 (ref)
            local v88 = {
                a = 10, 
                b = 20, 
                c = 30
            };
            local v89 = {
                a = 100, 
                b = 200, 
                c = 300
            };
            local v90 = {
                a = 3000, 
                b = 2000, 
                c = 3000
            };
            for v91, v92 in v0.Zip(v88, v89, v90) do
                expect(v92[1]).to.equal(v88[v91]);
                expect(v92[2]).to.equal(v89[v91]);
                expect(v92[3]).to.equal(v90[v91]);
            end;
        end);
        it("should zip maps of different keys together", function() --[[ Line: 381 ]]
            -- upvalues: v0 (ref)
            local v93 = {
                a = 10, 
                b = 20, 
                c = 30, 
                d = 40
            };
            local v94 = {
                a = 100, 
                b = 200, 
                c = 300, 
                z = 10
            };
            local v95 = {
                a = 3000, 
                b = 2000, 
                c = 3000, 
                x = 0
            };
            for v96, v97 in v0.Zip(v93, v94, v95) do
                expect(v97[1]).to.equal(v93[v96]);
                expect(v97[2]).to.equal(v94[v96]);
                expect(v97[3]).to.equal(v95[v96]);
            end;
        end);
    end);
    describe("IsEmpty", function() --[[ Line: 393 ]]
        -- upvalues: v0 (copy)
        it("should detect that table is empty", function() --[[ Line: 394 ]]
            -- upvalues: v0 (ref)
            local v98 = v0.IsEmpty({});
            expect(v98).to.equal(true);
        end);
        it("should detect that array is not empty", function() --[[ Line: 400 ]]
            -- upvalues: v0 (ref)
            local v99 = v0.IsEmpty({
                10, 
                20, 
                30
            });
            expect(v99).to.equal(false);
        end);
        it("should detect that dictionary is not empty", function() --[[ Line: 406 ]]
            -- upvalues: v0 (ref)
            local v100 = {
                a = 10, 
                b = 20, 
                c = 30
            };
            local v101 = v0.IsEmpty(v100);
            expect(v101).to.equal(false);
        end);
    end);
    describe("JSON", function() --[[ Line: 413 ]]
        -- upvalues: v0 (copy)
        it("should encode json", function() --[[ Line: 414 ]]
            -- upvalues: v0 (ref)
            local v102 = {
                hello = "world"
            };
            local v103 = v0.EncodeJSON(v102);
            expect(v103).to.equal("{\"hello\":\"world\"}");
        end);
        it("should decode json", function() --[[ Line: 420 ]]
            -- upvalues: v0 (ref)
            local v104 = v0.DecodeJSON("{\"hello\":\"world\"}");
            expect(v104).to.be.a("table");
            expect(v104.hello).to.equal("world");
        end);
    end);
end;