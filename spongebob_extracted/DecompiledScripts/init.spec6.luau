return function() --[[ Line: 1 ]]
    local v0 = require(script.Parent);
    v0.TEST = true;
    local l_BindableEvent_0 = Instance.new("BindableEvent");
    v0._timeEvent = l_BindableEvent_0.Event;
    local v2 = nil;
    local v3 = 0;
    do
        local l_v3_0 = v3;
        v0._getTime = function() --[[ Line: 12 ]]
            -- upvalues: l_v3_0 (ref)
            return l_v3_0;
        end;
        v2 = function(v5) --[[ Line: 16 ]] --[[ Name: advanceTime ]]
            -- upvalues: l_v3_0 (ref), l_BindableEvent_0 (copy)
            v5 = v5 or 0.016666666666666666;
            l_v3_0 = l_v3_0 + v5;
            l_BindableEvent_0:Fire(v5);
        end;
    end;
    v3 = function(...) --[[ Line: 24 ]] --[[ Name: pack ]]
        return select("#", ...), {
            ...
        };
    end;
    describe("Promise.Status", function() --[[ Line: 30 ]]
        -- upvalues: v0 (copy)
        it("should error if indexing nil value", function() --[[ Line: 31 ]]
            -- upvalues: v0 (ref)
            expect(function() --[[ Line: 32 ]]
                -- upvalues: v0 (ref)
                local _ = v0.Status.wrong;
            end).to.throw();
        end);
    end);
    describe("Unhandled rejection signal", function() --[[ Line: 38 ]]
        -- upvalues: v0 (copy), v2 (ref)
        it("should call unhandled rejection callbacks", function() --[[ Line: 39 ]]
            -- upvalues: v0 (ref), v2 (ref)
            local v9 = v0.new(function(_, v8) --[[ Line: 40 ]]
                v8(1, 2);
            end);
            local v10 = 0;
            local function v14(v11, v12, v13) --[[ Line: 46 ]] --[[ Name: callback ]]
                -- upvalues: v10 (ref), v9 (copy)
                v10 = v10 + 1;
                expect(v11).to.equal(v9);
                expect(v12).to.equal(1);
                expect(v13).to.equal(2);
            end;
            local v15 = v0.onUnhandledRejection(v14);
            v2();
            expect(v10).to.equal(1);
            v15();
            v0.new(function(_, v17) --[[ Line: 62 ]]
                v17(3, 4);
            end);
            v2();
            expect(v10).to.equal(1);
        end);
    end);
    describe("Promise.new", function() --[[ Line: 72 ]]
        -- upvalues: v0 (copy)
        it("should instantiate with a callback", function() --[[ Line: 73 ]]
            -- upvalues: v0 (ref)
            local v18 = v0.new(function() --[[ Line: 74 ]]

            end);
            expect(v18).to.be.ok();
        end);
        it("should invoke the given callback with resolve and reject", function() --[[ Line: 79 ]]
            -- upvalues: v0 (ref)
            local v19 = 0;
            local v20 = nil;
            local v21 = nil;
            local v24 = v0.new(function(v22, v23) --[[ Line: 84 ]]
                -- upvalues: v19 (ref), v20 (ref), v21 (ref)
                v19 = v19 + 1;
                v20 = v22;
                v21 = v23;
            end);
            expect(v24).to.be.ok();
            expect(v19).to.equal(1);
            expect(v20).to.be.a("function");
            expect(v21).to.be.a("function");
            expect(v24:getStatus()).to.equal(v0.Status.Started);
        end);
        it("should resolve promises on resolve()", function() --[[ Line: 98 ]]
            -- upvalues: v0 (ref)
            local v25 = 0;
            local v27 = v0.new(function(v26) --[[ Line: 101 ]]
                -- upvalues: v25 (ref)
                v25 = v25 + 1;
                v26();
            end);
            expect(v27).to.be.ok();
            expect(v25).to.equal(1);
            expect(v27:getStatus()).to.equal(v0.Status.Resolved);
        end);
        it("should reject promises on reject()", function() --[[ Line: 111 ]]
            -- upvalues: v0 (ref)
            local v28 = 0;
            local v31 = v0.new(function(_, v30) --[[ Line: 114 ]]
                -- upvalues: v28 (ref)
                v28 = v28 + 1;
                v30();
            end);
            expect(v31).to.be.ok();
            expect(v28).to.equal(1);
            expect(v31:getStatus()).to.equal(v0.Status.Rejected);
        end);
        it("should reject on error in callback", function() --[[ Line: 124 ]]
            -- upvalues: v0 (ref)
            local v32 = 0;
            local v33 = v0.new(function() --[[ Line: 127 ]]
                -- upvalues: v32 (ref)
                v32 = v32 + 1;
                error("hahah");
            end);
            expect(v33).to.be.ok();
            expect(v32).to.equal(1);
            expect(v33:getStatus()).to.equal(v0.Status.Rejected);
            expect(tostring(v33._values[1]):find("hahah")).to.be.ok();
            expect(tostring(v33._values[1]):find("init.spec")).to.be.ok();
            expect(tostring(v33._values[1]):find("runExecutor")).to.be.ok();
        end);
        it("should work with C functions", function() --[[ Line: 142 ]]
            -- upvalues: v0 (ref)
            expect(function() --[[ Line: 143 ]]
                -- upvalues: v0 (ref)
                v0.new(tick):andThen(tick);
            end).to.never.throw();
        end);
        it("should have a nice tostring", function() --[[ Line: 148 ]]
            -- upvalues: v0 (ref)
            expect(tostring(v0.resolve()):gmatch("Promise(Resolved)")).to.be.ok();
        end);
        it("should allow yielding", function() --[[ Line: 152 ]]
            -- upvalues: v0 (ref)
            local l_BindableEvent_1 = Instance.new("BindableEvent");
            local v36 = v0.new(function(v35) --[[ Line: 154 ]]
                -- upvalues: l_BindableEvent_1 (copy)
                l_BindableEvent_1.Event:Wait();
                v35(5);
            end);
            expect(v36:getStatus()).to.equal(v0.Status.Started);
            l_BindableEvent_1:Fire();
            expect(v36:getStatus()).to.equal(v0.Status.Resolved);
            expect(v36._values[1]).to.equal(5);
        end);
        it("should preserve stack traces of resolve-chained promises", function() --[[ Line: 165 ]]
            -- upvalues: v0 (ref)
            local function _(v37) --[[ Line: 166 ]] --[[ Name: nestedCall ]]
                error(v37);
            end;
            local v40 = v0.new(function(v39) --[[ Line: 170 ]]
                -- upvalues: v0 (ref)
                v39(v0.new(function() --[[ Line: 171 ]]
                    error("sample text");
                end));
            end);
            expect(v40:getStatus()).to.equal(v0.Status.Rejected);
            local v41 = tostring(v40._values[1]);
            expect(v41:find("sample text")).to.be.ok();
            expect(v41:find("nestedCall")).to.be.ok();
            expect(v41:find("runExecutor")).to.be.ok();
            expect(v41:find("runPlanNode")).to.be.ok();
            expect(v41:find("...Rejected because it was chained to the following Promise, which encountered an error:")).to.be.ok();
        end);
        it("should report errors from Promises with _error (< v2)", function() --[[ Line: 188 ]]
            -- upvalues: v0 (ref)
            local v42 = v0.reject();
            v42._error = "Sample error";
            local v43 = v0.resolve():andThenReturn(v42);
            expect(v43:getStatus()).to.equal(v0.Status.Rejected);
            local v44 = tostring(v43._values[1]);
            expect(v44:find("Sample error")).to.be.ok();
            expect(v44:find("...Rejected because it was chained to the following Promise, which encountered an error:")).to.be.ok();
            expect(v44:find("%[No stack trace available")).to.be.ok();
        end);
        it("should allow callable tables", function() --[[ Line: 204 ]]
            -- upvalues: v0 (ref)
            local v47 = v0.new((setmetatable({}, {
                __call = function(_, v46) --[[ Line: 206 ]] --[[ Name: __call ]]
                    v46(1);
                end
            })));
            local v48 = false;
            v47:andThen((setmetatable({}, {
                __call = function(_, v50) --[[ Line: 213 ]] --[[ Name: __call ]]
                    -- upvalues: v48 (ref)
                    expect(v50).to.equal(1);
                    v48 = true;
                end
            })));
            expect(v48).to.equal(true);
        end);
        itSKIP("should close the thread after resolve", function() --[[ Line: 222 ]]
            -- upvalues: v0 (ref)
            local v51 = 0;
            v0.new(function(v52) --[[ Line: 224 ]]
                -- upvalues: v51 (ref), v0 (ref)
                v51 = v51 + 1;
                v52();
                v0.delay(1):await();
                v51 = v51 + 1;
            end);
            task.wait(1);
            expect(v51).to.equal(1);
        end);
    end);
    describe("Promise.defer", function() --[[ Line: 237 ]]
        -- upvalues: v0 (copy), v2 (ref)
        it("should execute after the time event", function() --[[ Line: 238 ]]
            -- upvalues: v0 (ref), v2 (ref)
            local v53 = 0;
            local v58 = v0.defer(function(v54, v55, v56, v57) --[[ Line: 240 ]]
                -- upvalues: v53 (ref)
                expect((type(v54))).to.equal("function");
                expect((type(v55))).to.equal("function");
                expect((type(v56))).to.equal("function");
                expect((type(v57))).to.equal("nil");
                v53 = v53 + 1;
                v54("foo");
            end);
            expect(v53).to.equal(0);
            expect(v58:getStatus()).to.equal(v0.Status.Started);
            v2();
            expect(v53).to.equal(1);
            expect(v58:getStatus()).to.equal(v0.Status.Resolved);
            v2();
            expect(v53).to.equal(1);
        end);
    end);
    describe("Promise.delay", function() --[[ Line: 263 ]]
        -- upvalues: v0 (copy), v2 (ref)
        it("should schedule promise resolution", function() --[[ Line: 264 ]]
            -- upvalues: v0 (ref), v2 (ref)
            local v59 = v0.delay(1);
            expect(v59:getStatus()).to.equal(v0.Status.Started);
            v2();
            expect(v59:getStatus()).to.equal(v0.Status.Started);
            v2(1);
            expect(v59:getStatus()).to.equal(v0.Status.Resolved);
        end);
        it("should allow for delays to be cancelled", function() --[[ Line: 276 ]]
            -- upvalues: v0 (ref), v2 (ref)
            local v60 = v0.delay(2);
            v0.delay(1):andThen(function() --[[ Line: 279 ]]
                -- upvalues: v60 (copy)
                v60:cancel();
            end);
            expect(v60:getStatus()).to.equal(v0.Status.Started);
            v2();
            expect(v60:getStatus()).to.equal(v0.Status.Started);
            v2(1);
            expect(v60:getStatus()).to.equal(v0.Status.Cancelled);
            v2(1);
        end);
    end);
    describe("Promise.resolve", function() --[[ Line: 292 ]]
        -- upvalues: v0 (copy)
        it("should immediately resolve with a value", function() --[[ Line: 293 ]]
            -- upvalues: v0 (ref)
            local v61 = v0.resolve(5, 6);
            expect(v61).to.be.ok();
            expect(v61:getStatus()).to.equal(v0.Status.Resolved);
            expect(v61._values[1]).to.equal(5);
            expect(v61._values[2]).to.equal(6);
        end);
        it("should chain onto passed promises", function() --[[ Line: 302 ]]
            -- upvalues: v0 (ref)
            local v64 = v0.resolve(v0.new(function(_, v63) --[[ Line: 303 ]]
                v63(7);
            end));
            expect(v64).to.be.ok();
            expect(v64:getStatus()).to.equal(v0.Status.Rejected);
            expect(v64._values[1]).to.equal(7);
        end);
    end);
    describe("Promise.reject", function() --[[ Line: 313 ]]
        -- upvalues: v0 (copy)
        it("should immediately reject with a value", function() --[[ Line: 314 ]]
            -- upvalues: v0 (ref)
            local v65 = v0.reject(6, 7);
            expect(v65).to.be.ok();
            expect(v65:getStatus()).to.equal(v0.Status.Rejected);
            expect(v65._values[1]).to.equal(6);
            expect(v65._values[2]).to.equal(7);
        end);
        it("should pass a promise as-is as an error", function() --[[ Line: 323 ]]
            -- upvalues: v0 (ref)
            local v67 = v0.new(function(v66) --[[ Line: 324 ]]
                v66(6);
            end);
            local v68 = v0.reject(v67);
            expect(v68).to.be.ok();
            expect(v68:getStatus()).to.equal(v0.Status.Rejected);
            expect(v68._values[1]).to.equal(v67);
        end);
    end);
    describe("Promise:andThen", function() --[[ Line: 336 ]]
        -- upvalues: v0 (copy), v3 (copy)
        it("should allow yielding", function() --[[ Line: 337 ]]
            -- upvalues: v0 (ref)
            local l_BindableEvent_2 = Instance.new("BindableEvent");
            local v70 = v0.resolve():andThen(function() --[[ Line: 339 ]]
                -- upvalues: l_BindableEvent_2 (copy)
                l_BindableEvent_2.Event:Wait();
                return 5;
            end);
            expect(v70:getStatus()).to.equal(v0.Status.Started);
            l_BindableEvent_2:Fire();
            expect(v70:getStatus()).to.equal(v0.Status.Resolved);
            expect(v70._values[1]).to.equal(5);
        end);
        it("should run andThens on a new thread", function() --[[ Line: 350 ]]
            -- upvalues: v0 (ref)
            local l_BindableEvent_3 = Instance.new("BindableEvent");
            local v72 = nil;
            local v74 = v0.new(function(v73) --[[ Line: 354 ]]
                -- upvalues: v72 (ref)
                v72 = v73;
            end);
            local v75 = v74:andThen(function() --[[ Line: 358 ]]
                -- upvalues: l_BindableEvent_3 (copy)
                l_BindableEvent_3.Event:Wait();
                return 5;
            end);
            local v76 = v74:andThen(function() --[[ Line: 363 ]]
                return "foo";
            end);
            expect(v74:getStatus()).to.equal(v0.Status.Started);
            v72();
            expect(v76:getStatus()).to.equal(v0.Status.Resolved);
            expect(v76._values[1]).to.equal("foo");
            expect(v75:getStatus()).to.equal(v0.Status.Started);
        end);
        it("should chain onto resolved promises", function() --[[ Line: 374 ]]
            -- upvalues: v0 (ref), v3 (ref)
            local v77 = nil;
            local v78 = nil;
            local v79 = 0;
            local v80 = 0;
            local v81 = v0.resolve(5);
            local v84 = v81:andThen(function(...) --[[ Line: 382 ]]
                -- upvalues: v78 (ref), v77 (ref), v3 (ref), v79 (ref)
                local v82, v83 = v3(...);
                v78 = v82;
                v77 = v83;
                v79 = v79 + 1;
            end, function() --[[ Line: 385 ]]
                -- upvalues: v80 (ref)
                v80 = v80 + 1;
            end);
            expect(v80).to.equal(0);
            expect(v79).to.equal(1);
            expect(v78).to.equal(1);
            expect(v77[1]).to.equal(5);
            expect(v81).to.be.ok();
            expect(v81:getStatus()).to.equal(v0.Status.Resolved);
            expect(v81._values[1]).to.equal(5);
            expect(v84).to.be.ok();
            expect(v84).never.to.equal(v81);
            expect(v84:getStatus()).to.equal(v0.Status.Resolved);
            expect(#v84._values).to.equal(0);
        end);
        it("should chain onto rejected promises", function() --[[ Line: 405 ]]
            -- upvalues: v0 (ref), v3 (ref)
            local v85 = nil;
            local v86 = nil;
            local v87 = 0;
            local v88 = 0;
            local v89 = v0.reject(5);
            local v92 = v89:andThen(function(...) --[[ Line: 413 ]]
                -- upvalues: v88 (ref)
                v88 = v88 + 1;
            end, function(...) --[[ Line: 415 ]]
                -- upvalues: v86 (ref), v85 (ref), v3 (ref), v87 (ref)
                local v90, v91 = v3(...);
                v86 = v90;
                v85 = v91;
                v87 = v87 + 1;
            end);
            expect(v88).to.equal(0);
            expect(v87).to.equal(1);
            expect(v86).to.equal(1);
            expect(v85[1]).to.equal(5);
            expect(v89).to.be.ok();
            expect(v89:getStatus()).to.equal(v0.Status.Rejected);
            expect(v89._values[1]).to.equal(5);
            expect(v92).to.be.ok();
            expect(v92).never.to.equal(v89);
            expect(v92:getStatus()).to.equal(v0.Status.Resolved);
            expect(#v92._values).to.equal(0);
        end);
        it("should reject on error in callback", function() --[[ Line: 436 ]]
            -- upvalues: v0 (ref)
            local v93 = 0;
            local v94 = v0.resolve(1):andThen(function() --[[ Line: 439 ]]
                -- upvalues: v93 (ref)
                v93 = v93 + 1;
                error("hahah");
            end);
            expect(v94).to.be.ok();
            expect(v93).to.equal(1);
            expect(v94:getStatus()).to.equal(v0.Status.Rejected);
            expect(tostring(v94._values[1]):find("hahah")).to.be.ok();
            expect(tostring(v94._values[1]):find("init.spec")).to.be.ok();
            expect(tostring(v94._values[1]):find("runExecutor")).to.be.ok();
        end);
        it("should chain onto asynchronously resolved promises", function() --[[ Line: 454 ]]
            -- upvalues: v0 (ref)
            local v95 = nil;
            local v96 = nil;
            local v97 = 0;
            local v98 = 0;
            local v99 = nil;
            local v101 = v0.new(function(v100) --[[ Line: 461 ]]
                -- upvalues: v99 (ref)
                v99 = v100;
            end);
            local v102 = v101:andThen(function(...) --[[ Line: 465 ]]
                -- upvalues: v95 (ref), v96 (ref), v97 (ref)
                v95 = {
                    ...
                };
                v96 = select("#", ...);
                v97 = v97 + 1;
            end, function() --[[ Line: 469 ]]
                -- upvalues: v98 (ref)
                v98 = v98 + 1;
            end);
            expect(v97).to.equal(0);
            expect(v98).to.equal(0);
            v99(6);
            expect(v98).to.equal(0);
            expect(v97).to.equal(1);
            expect(v96).to.equal(1);
            expect(v95[1]).to.equal(6);
            expect(v101).to.be.ok();
            expect(v101:getStatus()).to.equal(v0.Status.Resolved);
            expect(v101._values[1]).to.equal(6);
            expect(v102).to.be.ok();
            expect(v102).never.to.equal(v101);
            expect(v102:getStatus()).to.equal(v0.Status.Resolved);
            expect(#v102._values).to.equal(0);
        end);
        it("should chain onto asynchronously rejected promises", function() --[[ Line: 494 ]]
            -- upvalues: v0 (ref)
            local v103 = nil;
            local v104 = nil;
            local v105 = 0;
            local v106 = 0;
            local v107 = nil;
            local v110 = v0.new(function(_, v109) --[[ Line: 501 ]]
                -- upvalues: v107 (ref)
                v107 = v109;
            end);
            local v111 = v110:andThen(function() --[[ Line: 505 ]]
                -- upvalues: v106 (ref)
                v106 = v106 + 1;
            end, function(...) --[[ Line: 507 ]]
                -- upvalues: v103 (ref), v104 (ref), v105 (ref)
                v103 = {
                    ...
                };
                v104 = select("#", ...);
                v105 = v105 + 1;
            end);
            expect(v105).to.equal(0);
            expect(v106).to.equal(0);
            v107(6);
            expect(v106).to.equal(0);
            expect(v105).to.equal(1);
            expect(v104).to.equal(1);
            expect(v103[1]).to.equal(6);
            expect(v110).to.be.ok();
            expect(v110:getStatus()).to.equal(v0.Status.Rejected);
            expect(v110._values[1]).to.equal(6);
            expect(v111).to.be.ok();
            expect(v111).never.to.equal(v110);
            expect(v111:getStatus()).to.equal(v0.Status.Resolved);
            expect(#v111._values).to.equal(0);
        end);
        it("should propagate errors through multiple levels", function() --[[ Line: 534 ]]
            -- upvalues: v0 (ref)
            local v112 = nil;
            local v113 = nil;
            local v114 = nil;
            v0.new(function(_, v116) --[[ Line: 536 ]]
                v116(1, 2, 3);
            end):andThen(function() --[[ Line: 538 ]]

            end):catch(function(v117, v118, v119) --[[ Line: 538 ]]
                -- upvalues: v112 (ref), v113 (ref), v114 (ref)
                v112 = v117;
                v113 = v118;
                v114 = v119;
            end);
            expect(v112).to.equal(1);
            expect(v113).to.equal(2);
            expect(v114).to.equal(3);
        end);
        it("should not call queued callbacks from a cancelled sub-promise", function() --[[ Line: 547 ]]
            -- upvalues: v0 (ref)
            local v120 = nil;
            local v121 = 0;
            local v123 = v0.new(function(v122) --[[ Line: 551 ]]
                -- upvalues: v120 (ref)
                v120 = v122;
            end);
            v123:andThen(function() --[[ Line: 555 ]]
                -- upvalues: v121 (ref)
                v121 = v121 + 1;
            end);
            v123:andThen(function() --[[ Line: 560 ]]
                -- upvalues: v121 (ref)
                v121 = v121 + 1;
            end):cancel();
            v120("foo");
            expect(v121).to.equal(1);
        end);
    end);
    describe("Promise:cancel", function() --[[ Line: 571 ]]
        -- upvalues: v0 (copy), v2 (ref)
        it("should mark promises as cancelled and not resolve or reject them", function() --[[ Line: 572 ]]
            -- upvalues: v0 (ref)
            local v124 = 0;
            local v125 = 0;
            local v126 = v0.new(function() --[[ Line: 575 ]]

            end):andThen(function() --[[ Line: 576 ]]
                -- upvalues: v124 (ref)
                v124 = v124 + 1;
            end):finally(function() --[[ Line: 579 ]]
                -- upvalues: v125 (ref)
                v125 = v125 + 1;
            end);
            v126:cancel();
            v126:cancel();
            expect(v124).to.equal(0);
            expect(v125).to.equal(1);
            expect(v126:getStatus()).to.equal(v0.Status.Cancelled);
        end);
        it("should call the cancellation hook once", function() --[[ Line: 591 ]]
            -- upvalues: v0 (ref)
            local v127 = 0;
            local v131 = v0.new(function(_, _, v130) --[[ Line: 594 ]]
                -- upvalues: v127 (ref)
                v130(function() --[[ Line: 595 ]]
                    -- upvalues: v127 (ref)
                    v127 = v127 + 1;
                end);
            end);
            v131:cancel();
            v131:cancel();
            expect(v127).to.equal(1);
        end);
        it("should propagate cancellations", function() --[[ Line: 606 ]]
            -- upvalues: v0 (ref)
            local v132 = v0.new(function() --[[ Line: 607 ]]

            end);
            local v133 = v132:andThen();
            local v134 = v132:andThen();
            expect(v132:getStatus()).to.equal(v0.Status.Started);
            expect(v133:getStatus()).to.equal(v0.Status.Started);
            expect(v134:getStatus()).to.equal(v0.Status.Started);
            v133:cancel();
            expect(v132:getStatus()).to.equal(v0.Status.Started);
            expect(v133:getStatus()).to.equal(v0.Status.Cancelled);
            expect(v134:getStatus()).to.equal(v0.Status.Started);
            v134:cancel();
            expect(v132:getStatus()).to.equal(v0.Status.Cancelled);
            expect(v133:getStatus()).to.equal(v0.Status.Cancelled);
            expect(v134:getStatus()).to.equal(v0.Status.Cancelled);
        end);
        it("should affect downstream promises", function() --[[ Line: 629 ]]
            -- upvalues: v0 (ref)
            local v135 = v0.new(function() --[[ Line: 630 ]]

            end);
            local v136 = v135:andThen();
            v135:cancel();
            expect(v136:getStatus()).to.equal(v0.Status.Cancelled);
        end);
        it("should track consumers", function() --[[ Line: 638 ]]
            -- upvalues: v0 (ref)
            local v137 = v0.new(function() --[[ Line: 639 ]]

            end);
            local v138 = v0.resolve();
            local v139 = v138:andThen(function() --[[ Line: 641 ]]
                -- upvalues: v137 (copy)
                return v137;
            end);
            local v141 = v0.new(function(v140) --[[ Line: 644 ]]
                -- upvalues: v139 (copy)
                v140(v139);
            end);
            local v142 = v141:andThen(function() --[[ Line: 647 ]]

            end);
            expect(v139._parent).to.never.equal(v138);
            expect(v141._parent).to.never.equal(v139);
            expect(v141._consumers[v142]).to.be.ok();
            expect(v142._parent).to.equal(v141);
        end);
        it("should cancel resolved pending promises", function() --[[ Line: 655 ]]
            -- upvalues: v0 (ref)
            local v143 = v0.new(function() --[[ Line: 656 ]]

            end);
            local v145 = v0.new(function(v144) --[[ Line: 658 ]]
                -- upvalues: v143 (copy)
                v144(v143);
            end):finally(function() --[[ Line: 660 ]]

            end);
            v145:cancel();
            expect(v143._status).to.equal(v0.Status.Cancelled);
            expect(v145._status).to.equal(v0.Status.Cancelled);
        end);
        it("should close the promise thread", function() --[[ Line: 668 ]]
            -- upvalues: v0 (ref), v2 (ref)
            local v146 = 0;
            v0.new(function() --[[ Line: 670 ]]
                -- upvalues: v146 (ref), v0 (ref)
                v146 = v146 + 1;
                v0.delay(1):await();
                v146 = v146 + 1;
            end):cancel();
            v2(2);
            expect(v146).to.equal(1);
        end);
    end);
    describe("Promise:finally", function() --[[ Line: 683 ]]
        -- upvalues: v0 (copy)
        it("should be called upon resolve, reject, or cancel", function() --[[ Line: 684 ]]
            -- upvalues: v0 (ref)
            local v147 = 0;
            local function v148() --[[ Line: 687 ]] --[[ Name: finally ]]
                -- upvalues: v147 (ref)
                v147 = v147 + 1;
            end;
            v0.new(function(v149, _) --[[ Line: 692 ]]
                v149();
            end):finally(v148);
            v0.resolve():andThen(function() --[[ Line: 697 ]]

            end):finally(v148):finally(v148);
            v0.reject():finally(v148);
            v0.new(function() --[[ Line: 702 ]]

            end):finally(v148):cancel();
            expect(v147).to.equal(5);
        end);
        it("should not forward return values", function() --[[ Line: 708 ]]
            -- upvalues: v0 (ref)
            local v151 = nil;
            v0.resolve(2):finally(function() --[[ Line: 712 ]]
                return 1;
            end):andThen(function(v152) --[[ Line: 715 ]]
                -- upvalues: v151 (ref)
                v151 = v152;
            end);
            expect(v151).to.equal(2);
        end);
        it("should not consume rejections", function() --[[ Line: 722 ]]
            -- upvalues: v0 (ref)
            local v153 = false;
            local v154 = false;
            v0.reject(5):finally(function() --[[ Line: 726 ]]
                return 42;
            end):andThen(function() --[[ Line: 729 ]]
                -- upvalues: v154 (ref)
                v154 = true;
            end):catch(function(v155) --[[ Line: 732 ]]
                -- upvalues: v153 (ref)
                v153 = true;
                expect(v155).to.equal(5);
            end);
            expect(v153).to.equal(true);
            expect(v154).to.equal(false);
        end);
        it("should wait for returned promises", function() --[[ Line: 741 ]]
            -- upvalues: v0 (ref)
            local v156 = nil;
            local v158 = v0.reject("foo"):finally(function() --[[ Line: 743 ]]
                -- upvalues: v0 (ref), v156 (ref)
                return v0.new(function(v157) --[[ Line: 744 ]]
                    -- upvalues: v156 (ref)
                    v156 = v157;
                end);
            end);
            expect(v158:getStatus()).to.equal(v0.Status.Started);
            v156();
            expect(v158:getStatus()).to.equal(v0.Status.Rejected);
            local _, v160 = v158:_unwrap();
            expect(v160).to.equal("foo");
        end);
        it("should reject with a returned rejected promise's value", function() --[[ Line: 758 ]]
            -- upvalues: v0 (ref)
            local v161 = nil;
            local v164 = v0.reject("foo"):finally(function() --[[ Line: 760 ]]
                -- upvalues: v0 (ref), v161 (ref)
                return v0.new(function(_, v163) --[[ Line: 761 ]]
                    -- upvalues: v161 (ref)
                    v161 = v163;
                end);
            end);
            expect(v164:getStatus()).to.equal(v0.Status.Started);
            v161("bar");
            expect(v164:getStatus()).to.equal(v0.Status.Rejected);
            local _, v166 = v164:_unwrap();
            expect(v166).to.equal("bar");
        end);
        it("should reject when handler errors", function() --[[ Line: 775 ]]
            -- upvalues: v0 (ref)
            local v167 = {};
            local v168, v169 = v0.reject("bar"):finally(function() --[[ Line: 777 ]]
                -- upvalues: v167 (copy)
                error(v167);
            end):_unwrap();
            expect(v168).to.equal(false);
            expect(v169).to.equal(v167);
        end);
        it("should not prevent cancellation", function() --[[ Line: 787 ]]
            -- upvalues: v0 (ref)
            local v170 = v0.new(function() --[[ Line: 788 ]]

            end);
            local v171 = false;
            v170:finally(function() --[[ Line: 791 ]]
                -- upvalues: v171 (ref)
                v171 = true;
            end);
            v170:andThen(function() --[[ Line: 795 ]]

            end):cancel();
            expect(v170:getStatus()).to.equal(v0.Status.Cancelled);
            expect(v171).to.equal(true);
        end);
        it("should propagate cancellation downwards", function() --[[ Line: 803 ]]
            -- upvalues: v0 (ref)
            local v172 = false;
            local v173 = v0.new(function() --[[ Line: 806 ]]

            end);
            local v174 = v173:finally(function() --[[ Line: 808 ]]
                -- upvalues: v172 (ref)
                v172 = true;
            end);
            v173:cancel();
            expect(v173:getStatus()).to.equal(v0.Status.Cancelled);
            expect(v174:getStatus()).to.equal(v0.Status.Cancelled);
            expect(v172).to.equal(true);
            expect(false).to.equal(false);
        end);
        it("should propagate cancellation upwards", function() --[[ Line: 821 ]]
            -- upvalues: v0 (ref)
            local v175 = false;
            local v176 = v0.new(function() --[[ Line: 824 ]]

            end);
            local v177 = v176:finally(function() --[[ Line: 826 ]]
                -- upvalues: v175 (ref)
                v175 = true;
            end);
            v177:cancel();
            expect(v176:getStatus()).to.equal(v0.Status.Cancelled);
            expect(v177:getStatus()).to.equal(v0.Status.Cancelled);
            expect(v175).to.equal(true);
            expect(false).to.equal(false);
        end);
        it("should cancel returned promise if cancelled", function() --[[ Line: 839 ]]
            -- upvalues: v0 (ref)
            local v178 = v0.new(function() --[[ Line: 840 ]]

            end);
            v0.resolve():finally(function() --[[ Line: 842 ]]
                -- upvalues: v178 (copy)
                return v178;
            end):cancel();
            expect(v178:getStatus()).to.equal(v0.Status.Cancelled);
        end);
    end);
    describe("Promise.all", function() --[[ Line: 852 ]]
        -- upvalues: v0 (copy), v3 (copy)
        it("should error if given something other than a table", function() --[[ Line: 853 ]]
            -- upvalues: v0 (ref)
            expect(function() --[[ Line: 854 ]]
                -- upvalues: v0 (ref)
                v0.all(1);
            end).to.throw();
        end);
        it("should resolve instantly with an empty table if given no promises", function() --[[ Line: 859 ]]
            -- upvalues: v0 (ref)
            local v179 = v0.all({});
            local v180, v181 = v179:_unwrap();
            expect(v180).to.equal(true);
            expect(v179:getStatus()).to.equal(v0.Status.Resolved);
            expect(v181).to.be.a("table");
            expect(next(v181)).to.equal(nil);
        end);
        it("should error if given non-promise values", function() --[[ Line: 869 ]]
            -- upvalues: v0 (ref)
            expect(function() --[[ Line: 870 ]]
                -- upvalues: v0 (ref)
                v0.all({
                    {}, 
                    {}, 
                    {}
                });
            end).to.throw();
        end);
        it("should wait for all promises to be resolved and return their values", function() --[[ Line: 875 ]]
            -- upvalues: v3 (ref), v0 (ref)
            local v182 = {};
            local v183, v184 = v3(1, "A string", nil, false);
            local v185 = {};
            for v186 = 1, v183 do
                v185[v186] = v0.new(function(v187) --[[ Line: 883 ]]
                    -- upvalues: v182 (copy), v186 (copy), v184 (copy)
                    v182[v186] = {
                        v187, 
                        v184[v186]
                    };
                end);
            end;
            local v188 = v0.all(v185);
            for _, v190 in ipairs(v182) do
                expect(v188:getStatus()).to.equal(v0.Status.Started);
                v190[1](v190[2]);
            end;
            local v191, v192 = v3(v188:_unwrap());
            local v193, v194 = unpack(v192, 1, v191);
            expect(v191).to.equal(2);
            expect(v193).to.equal(true);
            expect(v194).to.be.a("table");
            expect(#v194).to.equal(#v185);
            for v195 = 1, v183 do
                expect(v194[v195]).to.equal(v184[v195]);
            end;
        end);
        it("should reject if any individual promise rejected", function() --[[ Line: 908 ]]
            -- upvalues: v0 (ref), v3 (ref)
            local v196 = nil;
            local v197 = nil;
            local v200 = v0.new(function(_, v199) --[[ Line: 912 ]]
                -- upvalues: v196 (ref)
                v196 = v199;
            end);
            local v202 = v0.new(function(v201) --[[ Line: 916 ]]
                -- upvalues: v197 (ref)
                v197 = v201;
            end);
            local v203 = v0.all({
                v200, 
                v202
            });
            expect(v203:getStatus()).to.equal(v0.Status.Started);
            v196("baz", "qux");
            v197("foo", "bar");
            local v204, v205 = v3(v203:_unwrap());
            local v206, v207, v208 = unpack(v205, 1, v204);
            expect(v204).to.equal(3);
            expect(v206).to.equal(false);
            expect(v207).to.equal("baz");
            expect(v208).to.equal("qux");
            expect(v202:getStatus()).to.equal(v0.Status.Cancelled);
        end);
        it("should not resolve if resolved after rejecting", function() --[[ Line: 937 ]]
            -- upvalues: v0 (ref), v3 (ref)
            local v209 = nil;
            local v210 = nil;
            local v213 = v0.new(function(_, v212) --[[ Line: 941 ]]
                -- upvalues: v209 (ref)
                v209 = v212;
            end);
            local v215 = v0.new(function(v214) --[[ Line: 945 ]]
                -- upvalues: v210 (ref)
                v210 = v214;
            end);
            local v216 = v0.all({
                v213, 
                v215
            });
            expect(v216:getStatus()).to.equal(v0.Status.Started);
            v209("baz", "qux");
            v210("foo", "bar");
            local v217, v218 = v3(v216:_unwrap());
            local v219, v220, v221 = unpack(v218, 1, v217);
            expect(v217).to.equal(3);
            expect(v219).to.equal(false);
            expect(v220).to.equal("baz");
            expect(v221).to.equal("qux");
        end);
        it("should only reject once", function() --[[ Line: 965 ]]
            -- upvalues: v0 (ref), v3 (ref)
            local v222 = nil;
            local v223 = nil;
            local v226 = v0.new(function(_, v225) --[[ Line: 969 ]]
                -- upvalues: v222 (ref)
                v222 = v225;
            end);
            local v229 = v0.new(function(_, v228) --[[ Line: 973 ]]
                -- upvalues: v223 (ref)
                v223 = v228;
            end);
            local v230 = v0.all({
                v226, 
                v229
            });
            expect(v230:getStatus()).to.equal(v0.Status.Started);
            v222("foo", "bar");
            expect(v230:getStatus()).to.equal(v0.Status.Rejected);
            v223("baz", "qux");
            local v231, v232 = v3(v230:_unwrap());
            local v233, v234, v235 = unpack(v232, 1, v231);
            expect(v231).to.equal(3);
            expect(v233).to.equal(false);
            expect(v234).to.equal("foo");
            expect(v235).to.equal("bar");
        end);
        it("should error if a non-array table is passed in", function() --[[ Line: 996 ]]
            -- upvalues: v0 (ref)
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 997 ]]
                -- upvalues: v0 (ref)
                v0.all(v0.new(function() --[[ Line: 998 ]]

                end));
            end);
            expect(l_status_0).to.be.ok();
            expect(l_result_0:find("Non%-promise")).to.be.ok();
        end);
        it("should cancel pending promises if one rejects", function() --[[ Line: 1005 ]]
            -- upvalues: v0 (ref)
            local v238 = v0.new(function() --[[ Line: 1006 ]]

            end);
            expect(v0.all({
                v0.resolve(), 
                v0.reject(), 
                v238
            }):getStatus()).to.equal(v0.Status.Rejected);
            expect(v238:getStatus()).to.equal(v0.Status.Cancelled);
        end);
        it("should cancel promises if it is cancelled", function() --[[ Line: 1015 ]]
            -- upvalues: v0 (ref)
            local v239 = v0.new(function() --[[ Line: 1016 ]]

            end);
            v239:andThen(function() --[[ Line: 1017 ]]

            end);
            local v240 = {
                v0.new(function() --[[ Line: 1020 ]]

                end), 
                v0.new(function() --[[ Line: 1021 ]]

                end), 
                v239
            };
            v0.all(v240):cancel();
            expect(v240[1]:getStatus()).to.equal(v0.Status.Cancelled);
            expect(v240[2]:getStatus()).to.equal(v0.Status.Cancelled);
            expect(v240[3]:getStatus()).to.equal(v0.Status.Started);
        end);
    end);
    describe("Promise.fold", function() --[[ Line: 1033 ]]
        -- upvalues: v0 (copy), v2 (ref)
        it("should return the initial value in a promise when the list is empty", function() --[[ Line: 1034 ]]
            -- upvalues: v0 (ref)
            local v241 = {};
            local v242 = v0.fold({}, function() --[[ Line: 1036 ]]
                error("should not be called");
            end, v241);
            expect(v0.is(v242)).to.equal(true);
            expect(v242:getStatus()).to.equal(v0.Status.Resolved);
            expect(v242:expect()).to.equal(v241);
        end);
        it("should accept promises in the list", function() --[[ Line: 1045 ]]
            -- upvalues: v0 (ref)
            local v243 = nil;
            local v247 = v0.fold({
                v0.new(function(v244) --[[ Line: 1048 ]]
                    -- upvalues: v243 (ref)
                    v243 = v244;
                end), 
                2, 
                3
            }, function(v245, v246) --[[ Line: 1050 ]]
                return v245 + v246;
            end, 0);
            v243(1);
            expect(v0.is(v247)).to.equal(true);
            expect(v247:getStatus()).to.equal(v0.Status.Resolved);
            expect(v247:expect()).to.equal(6);
        end);
        it("should always return a promise even if the list or reducer don't use them", function() --[[ Line: 1061 ]]
            -- upvalues: v0 (ref), v2 (ref)
            local v251 = v0.fold({
                1, 
                2, 
                3
            }, function(v248, v249, v250) --[[ Line: 1062 ]]
                -- upvalues: v0 (ref)
                if v250 == 2 then
                    return v0.delay(1):andThenReturn(v248 + v249);
                else
                    return v248 + v249;
                end;
            end, 0);
            expect(v0.is(v251)).to.equal(true);
            expect(v251:getStatus()).to.equal(v0.Status.Started);
            v2(2);
            expect(v251:getStatus()).to.equal(v0.Status.Resolved);
            expect(v251:expect()).to.equal(6);
        end);
        it("should return the first rejected promise", function() --[[ Line: 1076 ]]
            -- upvalues: v0 (ref)
            local v255 = v0.fold({
                1, 
                2, 
                3
            }, function(v252, v253, v254) --[[ Line: 1078 ]]
                -- upvalues: v0 (ref)
                if v254 == 2 then
                    return v0.reject("foo");
                else
                    return v252 + v253;
                end;
            end, 0);
            expect(v0.is(v255)).to.equal(true);
            local v256, v257 = v255:awaitStatus();
            expect(v256).to.equal(v0.Status.Rejected);
            expect(v257).to.equal("foo");
        end);
        it("should return the first canceled promise", function() --[[ Line: 1091 ]]
            -- upvalues: v0 (ref)
            local v258 = nil;
            local v262 = v0.fold({
                1, 
                2, 
                3
            }, function(v259, v260, v261) --[[ Line: 1093 ]]
                -- upvalues: v258 (ref), v0 (ref)
                if v261 == 1 then
                    return v259 + v260;
                elseif v261 == 2 then
                    v258 = v0.delay(1):andThenReturn(v259 + v260);
                    return v258;
                else
                    error("this should not run if the promise is cancelled");
                    return;
                end;
            end, 0);
            expect(v0.is(v262)).to.equal(true);
            expect(v262:getStatus()).to.equal(v0.Status.Started);
            v258:cancel();
            expect(v262:getStatus()).to.equal(v0.Status.Cancelled);
        end);
    end);
    describe("Promise.race", function() --[[ Line: 1110 ]]
        -- upvalues: v0 (copy)
        it("should resolve with the first settled value", function() --[[ Line: 1111 ]]
            -- upvalues: v0 (ref)
            local v264 = v0.race({
                v0.resolve(1), 
                v0.resolve(2)
            }):andThen(function(v263) --[[ Line: 1115 ]]
                expect(v263).to.equal(1);
            end);
            expect(v264:getStatus()).to.equal(v0.Status.Resolved);
        end);
        it("should cancel other promises", function() --[[ Line: 1122 ]]
            -- upvalues: v0 (ref)
            local v265 = v0.new(function() --[[ Line: 1123 ]]

            end);
            v265:andThen(function() --[[ Line: 1124 ]]

            end);
            local v267 = {
                v265, 
                v0.new(function() --[[ Line: 1127 ]]

                end), 
                v0.new(function(v266) --[[ Line: 1128 ]]
                    v266(2);
                end)
            };
            local v268 = v0.race(v267);
            expect(v268:getStatus()).to.equal(v0.Status.Resolved);
            expect(v268._values[1]).to.equal(2);
            expect(v267[1]:getStatus()).to.equal(v0.Status.Started);
            expect(v267[2]:getStatus()).to.equal(v0.Status.Cancelled);
            expect(v267[3]:getStatus()).to.equal(v0.Status.Resolved);
            local v269 = v0.new(function() --[[ Line: 1141 ]]

            end);
            expect(v0.race({
                v0.reject(), 
                v0.resolve(), 
                v269
            }):getStatus()).to.equal(v0.Status.Rejected);
            expect(v269:getStatus()).to.equal(v0.Status.Cancelled);
        end);
        it("should error if a non-array table is passed in", function() --[[ Line: 1150 ]]
            -- upvalues: v0 (ref)
            local l_status_1, l_result_1 = pcall(function() --[[ Line: 1151 ]]
                -- upvalues: v0 (ref)
                v0.race(v0.new(function() --[[ Line: 1152 ]]

                end));
            end);
            expect(l_status_1).to.be.ok();
            expect(l_result_1:find("Non%-promise")).to.be.ok();
        end);
        it("should cancel promises if it is cancelled", function() --[[ Line: 1159 ]]
            -- upvalues: v0 (ref)
            local v272 = v0.new(function() --[[ Line: 1160 ]]

            end);
            v272:andThen(function() --[[ Line: 1161 ]]

            end);
            local v273 = {
                v0.new(function() --[[ Line: 1164 ]]

                end), 
                v0.new(function() --[[ Line: 1165 ]]

                end), 
                v272
            };
            v0.race(v273):cancel();
            expect(v273[1]:getStatus()).to.equal(v0.Status.Cancelled);
            expect(v273[2]:getStatus()).to.equal(v0.Status.Cancelled);
            expect(v273[3]:getStatus()).to.equal(v0.Status.Started);
        end);
    end);
    describe("Promise.promisify", function() --[[ Line: 1177 ]]
        -- upvalues: v0 (copy)
        it("should wrap functions", function() --[[ Line: 1178 ]]
            -- upvalues: v0 (ref)
            local v275 = v0.promisify(function(v274) --[[ Line: 1179 ]] --[[ Name: test ]]
                return v274 + 1;
            end)(1);
            local v276, v277 = v275:_unwrap();
            expect(v276).to.equal(true);
            expect(v275:getStatus()).to.equal(v0.Status.Resolved);
            expect(v277).to.equal(2);
        end);
        it("should catch errors after a yield", function() --[[ Line: 1192 ]]
            -- upvalues: v0 (ref)
            local l_BindableEvent_4 = Instance.new("BindableEvent");
            local v279 = v0.promisify(function() --[[ Line: 1194 ]]
                -- upvalues: l_BindableEvent_4 (copy)
                l_BindableEvent_4.Event:Wait();
                error("errortext");
            end)();
            expect(v279:getStatus()).to.equal(v0.Status.Started);
            l_BindableEvent_4:Fire();
            expect(v279:getStatus()).to.equal(v0.Status.Rejected);
            expect(tostring(v279._values[1]):find("errortext")).to.be.ok();
        end);
    end);
    describe("Promise.tap", function() --[[ Line: 1208 ]]
        -- upvalues: v0 (copy)
        it("should thread through values", function() --[[ Line: 1209 ]]
            -- upvalues: v0 (ref)
            local v280 = nil;
            local v281 = nil;
            v0.resolve(1):andThen(function(v282) --[[ Line: 1213 ]]
                return v282 + 1;
            end):tap(function(v283) --[[ Line: 1216 ]]
                -- upvalues: v280 (ref)
                v280 = v283;
                return v283 + 1;
            end):andThen(function(v284) --[[ Line: 1220 ]]
                -- upvalues: v281 (ref)
                v281 = v284;
            end);
            expect(v280).to.equal(2);
            expect(v281).to.equal(2);
        end);
        it("should chain onto promises", function() --[[ Line: 1228 ]]
            -- upvalues: v0 (ref)
            local v285 = nil;
            local v286 = nil;
            local v289 = v0.resolve(1):tap(function() --[[ Line: 1232 ]]
                -- upvalues: v0 (ref), v285 (ref)
                return v0.new(function(v287) --[[ Line: 1233 ]]
                    -- upvalues: v285 (ref)
                    v285 = v287;
                end);
            end):andThen(function(v288) --[[ Line: 1237 ]]
                -- upvalues: v286 (ref)
                v286 = v288;
            end);
            expect(v289:getStatus()).to.equal(v0.Status.Started);
            expect(v286).to.never.be.ok();
            v285(1);
            expect(v289:getStatus()).to.equal(v0.Status.Resolved);
            expect(v286).to.equal(1);
        end);
    end);
    describe("Promise.try", function() --[[ Line: 1251 ]]
        -- upvalues: v0 (copy)
        it("should catch synchronous errors", function() --[[ Line: 1252 ]]
            -- upvalues: v0 (ref)
            local v290 = nil;
            v0.try(function() --[[ Line: 1254 ]]
                error("errortext");
            end):catch(function(v291) --[[ Line: 1256 ]]
                -- upvalues: v290 (ref)
                v290 = tostring(v291);
            end);
            expect(v290:find("errortext")).to.be.ok();
        end);
        it("should reject with error objects", function() --[[ Line: 1263 ]]
            -- upvalues: v0 (ref)
            local v292 = {};
            local v293, v294 = v0.try(function() --[[ Line: 1265 ]]
                -- upvalues: v292 (copy)
                error(v292);
            end):_unwrap();
            expect(v293).to.equal(false);
            expect(v294).to.equal(v292);
        end);
        it("should catch asynchronous errors", function() --[[ Line: 1273 ]]
            -- upvalues: v0 (ref)
            local l_BindableEvent_5 = Instance.new("BindableEvent");
            local v296 = v0.try(function() --[[ Line: 1275 ]]
                -- upvalues: l_BindableEvent_5 (copy)
                l_BindableEvent_5.Event:Wait();
                error("errortext");
            end);
            expect(v296:getStatus()).to.equal(v0.Status.Started);
            l_BindableEvent_5:Fire();
            expect(v296:getStatus()).to.equal(v0.Status.Rejected);
            expect(tostring(v296._values[1]):find("errortext")).to.be.ok();
        end);
    end);
    describe("Promise:andThenReturn", function() --[[ Line: 1287 ]]
        -- upvalues: v0 (copy)
        it("should return the given values", function() --[[ Line: 1288 ]]
            -- upvalues: v0 (ref)
            local v297 = nil;
            local v298 = nil;
            v0.resolve():andThenReturn(1, 2):andThen(function(v299, v300) --[[ Line: 1291 ]]
                -- upvalues: v297 (ref), v298 (ref)
                v297 = v299;
                v298 = v300;
            end);
            expect(v297).to.equal(1);
            expect(v298).to.equal(2);
        end);
    end);
    describe("Promise:andThenCall", function() --[[ Line: 1301 ]]
        -- upvalues: v0 (copy)
        it("should call the given function with arguments", function() --[[ Line: 1302 ]]
            -- upvalues: v0 (ref)
            local v301 = nil;
            local v302 = nil;
            v0.resolve():andThenCall(function(v303, v304) --[[ Line: 1304 ]]
                -- upvalues: v301 (ref), v302 (ref)
                v301 = v303;
                v302 = v304;
            end, 3, 4);
            expect(v301).to.equal(3);
            expect(v302).to.equal(4);
        end);
    end);
    describe("Promise.some", function() --[[ Line: 1314 ]]
        -- upvalues: v0 (copy)
        it("should resolve once the goal is reached", function() --[[ Line: 1315 ]]
            -- upvalues: v0 (ref)
            local v305 = v0.some({
                v0.resolve(1), 
                v0.reject(), 
                v0.resolve(2)
            }, 2);
            expect(v305:getStatus()).to.equal(v0.Status.Resolved);
            expect(v305._values[1][1]).to.equal(1);
            expect(v305._values[1][2]).to.equal(2);
        end);
        it("should error if the goal can't be reached", function() --[[ Line: 1326 ]]
            -- upvalues: v0 (ref)
            expect(v0.some({
                v0.resolve(), 
                v0.reject()
            }, 2):getStatus()).to.equal(v0.Status.Rejected);
            local v306 = nil;
            local v309 = v0.some({
                v0.resolve(), 
                v0.new(function(_, v308) --[[ Line: 1335 ]]
                    -- upvalues: v306 (ref)
                    v306 = v308;
                end)
            }, 2);
            expect(v309:getStatus()).to.equal(v0.Status.Started);
            v306("foo");
            expect(v309:getStatus()).to.equal(v0.Status.Rejected);
            expect(v309._values[1]).to.equal("foo");
        end);
        it("should cancel pending Promises once the goal is reached", function() --[[ Line: 1346 ]]
            -- upvalues: v0 (ref)
            local v310 = nil;
            local v311 = v0.new(function() --[[ Line: 1348 ]]

            end);
            local v313 = v0.new(function(v312) --[[ Line: 1349 ]]
                -- upvalues: v310 (ref)
                v310 = v312;
            end);
            local v314 = v0.some({
                v311, 
                v313, 
                v0.resolve()
            }, 2);
            expect(v314:getStatus()).to.equal(v0.Status.Started);
            expect(v311:getStatus()).to.equal(v0.Status.Started);
            expect(v313:getStatus()).to.equal(v0.Status.Started);
            v310();
            expect(v314:getStatus()).to.equal(v0.Status.Resolved);
            expect(v311:getStatus()).to.equal(v0.Status.Cancelled);
            expect(v313:getStatus()).to.equal(v0.Status.Resolved);
        end);
        it("should error if passed a non-number", function() --[[ Line: 1370 ]]
            -- upvalues: v0 (ref)
            expect(function() --[[ Line: 1371 ]]
                -- upvalues: v0 (ref)
                v0.some({}, "non-number");
            end).to.throw();
        end);
        it("should return an empty array if amount is 0", function() --[[ Line: 1376 ]]
            -- upvalues: v0 (ref)
            local v315 = v0.some({
                v0.resolve(2)
            }, 0);
            expect(v315:getStatus()).to.equal(v0.Status.Resolved);
            expect(#v315._values[1]).to.equal(0);
        end);
        it("should not return extra values", function() --[[ Line: 1385 ]]
            -- upvalues: v0 (ref)
            local v316 = v0.some({
                v0.resolve(1), 
                v0.resolve(2), 
                v0.resolve(3), 
                v0.resolve(4)
            }, 2);
            expect(v316:getStatus()).to.equal(v0.Status.Resolved);
            expect(#v316._values[1]).to.equal(2);
            expect(v316._values[1][1]).to.equal(1);
            expect(v316._values[1][2]).to.equal(2);
        end);
        it("should cancel promises if it is cancelled", function() --[[ Line: 1399 ]]
            -- upvalues: v0 (ref)
            local v317 = v0.new(function() --[[ Line: 1400 ]]

            end);
            v317:andThen(function() --[[ Line: 1401 ]]

            end);
            local v318 = {
                v0.new(function() --[[ Line: 1404 ]]

                end), 
                v0.new(function() --[[ Line: 1405 ]]

                end), 
                v317
            };
            v0.some(v318, 3):cancel();
            expect(v318[1]:getStatus()).to.equal(v0.Status.Cancelled);
            expect(v318[2]:getStatus()).to.equal(v0.Status.Cancelled);
            expect(v318[3]:getStatus()).to.equal(v0.Status.Started);
        end);
        describe("Promise.any", function() --[[ Line: 1416 ]]
            -- upvalues: v0 (ref)
            it("should return the value directly", function() --[[ Line: 1417 ]]
                -- upvalues: v0 (ref)
                local v319 = v0.any({
                    v0.reject(), 
                    v0.reject(), 
                    v0.resolve(1)
                });
                expect(v319:getStatus()).to.equal(v0.Status.Resolved);
                expect(v319._values[1]).to.equal(1);
            end);
            it("should error if all are rejected", function() --[[ Line: 1428 ]]
                -- upvalues: v0 (ref)
                expect(v0.any({
                    v0.reject(), 
                    v0.reject(), 
                    v0.reject()
                }):getStatus()).to.equal(v0.Status.Rejected);
            end);
        end);
    end);
    describe("Promise.allSettled", function() --[[ Line: 1438 ]]
        -- upvalues: v0 (copy)
        it("should resolve with an array of PromiseStatuses", function() --[[ Line: 1439 ]]
            -- upvalues: v0 (ref)
            local v320 = nil;
            local v323 = v0.allSettled({
                v0.resolve(), 
                v0.reject(), 
                v0.resolve(), 
                v0.new(function(_, v322) --[[ Line: 1445 ]]
                    -- upvalues: v320 (ref)
                    v320 = v322;
                end)
            });
            expect(v323:getStatus()).to.equal(v0.Status.Started);
            v320();
            expect(v323:getStatus()).to.equal(v0.Status.Resolved);
            expect(v323._values[1][1]).to.equal(v0.Status.Resolved);
            expect(v323._values[1][2]).to.equal(v0.Status.Rejected);
            expect(v323._values[1][3]).to.equal(v0.Status.Resolved);
            expect(v323._values[1][4]).to.equal(v0.Status.Rejected);
        end);
        it("should cancel promises if it is cancelled", function() --[[ Line: 1459 ]]
            -- upvalues: v0 (ref)
            local v324 = v0.new(function() --[[ Line: 1460 ]]

            end);
            v324:andThen(function() --[[ Line: 1461 ]]

            end);
            local v325 = {
                v0.new(function() --[[ Line: 1464 ]]

                end), 
                v0.new(function() --[[ Line: 1465 ]]

                end), 
                v324
            };
            v0.allSettled(v325):cancel();
            expect(v325[1]:getStatus()).to.equal(v0.Status.Cancelled);
            expect(v325[2]:getStatus()).to.equal(v0.Status.Cancelled);
            expect(v325[3]:getStatus()).to.equal(v0.Status.Started);
        end);
    end);
    describe("Promise:await", function() --[[ Line: 1477 ]]
        -- upvalues: v0 (copy), v2 (ref)
        it("should return the correct values", function() --[[ Line: 1478 ]]
            -- upvalues: v0 (ref)
            local v326, v327, v328, v329, v330 = v0.resolve(5, 6, nil, 7):await();
            expect(v326).to.equal(true);
            expect(v327).to.equal(5);
            expect(v328).to.equal(6);
            expect(v329).to.equal(nil);
            expect(v330).to.equal(7);
        end);
        it("should work if yielding is needed", function() --[[ Line: 1490 ]]
            -- upvalues: v0 (ref), v2 (ref)
            local v331 = false;
            task.spawn(function() --[[ Line: 1492 ]]
                -- upvalues: v0 (ref), v331 (ref)
                local _, v333 = v0.delay(1):await();
                expect((type(v333))).to.equal("number");
                v331 = true;
            end);
            v2(2);
            expect(v331).to.equal(true);
        end);
    end);
    describe("Promise:expect", function() --[[ Line: 1503 ]]
        -- upvalues: v0 (copy)
        it("should throw the correct values", function() --[[ Line: 1504 ]]
            -- upvalues: v0 (ref)
            local v334 = {};
            local v335 = v0.reject(v334);
            local l_status_2, l_result_2 = pcall(function() --[[ Line: 1508 ]]
                -- upvalues: v335 (copy)
                v335:expect();
            end);
            expect(l_status_2).to.equal(false);
            expect(l_result_2).to.equal(v334);
        end);
    end);
    describe("Promise:now", function() --[[ Line: 1517 ]]
        -- upvalues: v0 (copy)
        it("should resolve if the Promise is resolved", function() --[[ Line: 1518 ]]
            -- upvalues: v0 (ref)
            local v338, v339 = v0.resolve("foo"):now():_unwrap();
            expect(v338).to.equal(true);
            expect(v339).to.equal("foo");
        end);
        it("should reject if the Promise is not resolved", function() --[[ Line: 1525 ]]
            -- upvalues: v0 (ref)
            local v340, v341 = v0.new(function() --[[ Line: 1526 ]]

            end):now():_unwrap();
            expect(v340).to.equal(false);
            expect(v0.Error.isKind(v341, "NotResolvedInTime")).to.equal(true);
        end);
        it("should reject with a custom rejection value", function() --[[ Line: 1532 ]]
            -- upvalues: v0 (ref)
            local v342, v343 = v0.new(function() --[[ Line: 1533 ]]

            end):now("foo"):_unwrap();
            expect(v342).to.equal(false);
            expect(v343).to.equal("foo");
        end);
    end);
    describe("Promise.each", function() --[[ Line: 1540 ]]
        -- upvalues: v0 (copy)
        it("should iterate", function() --[[ Line: 1541 ]]
            -- upvalues: v0 (ref)
            local v344, v345 = v0.each({
                "foo", 
                "bar", 
                "baz", 
                "qux"
            }, function(...) --[[ Line: 1547 ]]
                return {
                    ...
                };
            end):_unwrap();
            expect(v344).to.equal(true);
            expect(v345[1][1]).to.equal("foo");
            expect(v345[1][2]).to.equal(1);
            expect(v345[2][1]).to.equal("bar");
            expect(v345[2][2]).to.equal(2);
            expect(v345[3][1]).to.equal("baz");
            expect(v345[3][2]).to.equal(3);
            expect(v345[4][1]).to.equal("qux");
            expect(v345[4][2]).to.equal(4);
        end);
        it("should iterate serially", function() --[[ Line: 1562 ]]
            -- upvalues: v0 (ref)
            local v346 = {};
            local v347 = {};
            local v351 = v0.each({
                "foo", 
                "bar", 
                "baz"
            }, function(v348, v349) --[[ Line: 1570 ]]
                -- upvalues: v347 (copy), v0 (ref), v346 (copy)
                v347[v349] = (v347[v349] or 0) + 1;
                return v0.new(function(v350) --[[ Line: 1573 ]]
                    -- upvalues: v346 (ref), v348 (copy)
                    table.insert(v346, function() --[[ Line: 1574 ]]
                        -- upvalues: v350 (copy), v348 (ref)
                        v350(v348:upper());
                    end);
                end);
            end);
            expect(v351:getStatus()).to.equal(v0.Status.Started);
            expect(#v346).to.equal(1);
            expect(v347[1]).to.equal(1);
            expect(v347[2]).to.never.be.ok();
            table.remove(v346, 1)();
            expect(v351:getStatus()).to.equal(v0.Status.Started);
            expect(#v346).to.equal(1);
            expect(v347[1]).to.equal(1);
            expect(v347[2]).to.equal(1);
            expect(v347[3]).to.never.be.ok();
            table.remove(v346, 1)();
            expect(v351:getStatus()).to.equal(v0.Status.Started);
            expect(v347[1]).to.equal(1);
            expect(v347[2]).to.equal(1);
            expect(v347[3]).to.equal(1);
            table.remove(v346, 1)();
            expect(v351:getStatus()).to.equal(v0.Status.Resolved);
            expect((type(v351._values[1]))).to.equal("table");
            expect((type(v351._values[2]))).to.equal("nil");
            local v352 = v351._values[1];
            expect(v352[1]).to.equal("FOO");
            expect(v352[2]).to.equal("BAR");
            expect(v352[3]).to.equal("BAZ");
        end);
        it("should reject with the value if the predicate promise rejects", function() --[[ Line: 1613 ]]
            -- upvalues: v0 (ref)
            local v353 = v0.each({
                1, 
                2, 
                3
            }, function() --[[ Line: 1614 ]]
                -- upvalues: v0 (ref)
                return v0.reject("foobar");
            end);
            expect(v353:getStatus()).to.equal(v0.Status.Rejected);
            expect(v353._values[1]).to.equal("foobar");
        end);
        it("should allow Promises to be in the list and wait when it gets to them", function() --[[ Line: 1622 ]]
            -- upvalues: v0 (ref)
            local v354 = nil;
            local v356 = v0.new(function(v355) --[[ Line: 1624 ]]
                -- upvalues: v354 (ref)
                v354 = v355;
            end);
            local v358 = v0.each({
                v356
            }, function(v357) --[[ Line: 1630 ]]
                return v357 * 2;
            end);
            expect(v358:getStatus()).to.equal(v0.Status.Started);
            v354(2);
            expect(v358:getStatus()).to.equal(v0.Status.Resolved);
            expect(v358._values[1][1]).to.equal(4);
        end);
        it("should reject with the value if a Promise from the list rejects", function() --[[ Line: 1642 ]]
            -- upvalues: v0 (ref)
            local v359 = false;
            local v361 = v0.each({
                1, 
                2, 
                v0.reject("foobar")
            }, function(_) --[[ Line: 1644 ]]
                -- upvalues: v359 (ref)
                v359 = true;
                return "never";
            end);
            expect(v361:getStatus()).to.equal(v0.Status.Rejected);
            expect(v361._values[1]).to.equal("foobar");
            expect(v359).to.equal(false);
        end);
        it("should reject immediately if there's a cancelled Promise in the list initially", function() --[[ Line: 1654 ]]
            -- upvalues: v0 (ref)
            local v362 = v0.new(function() --[[ Line: 1655 ]]

            end);
            v362:cancel();
            local v363 = false;
            local v364 = v0.each({
                1, 
                2, 
                v362
            }, function() --[[ Line: 1659 ]]
                -- upvalues: v363 (ref)
                v363 = true;
            end);
            expect(v364:getStatus()).to.equal(v0.Status.Rejected);
            expect(v363).to.equal(false);
            expect(v364._values[1].kind).to.equal(v0.Error.Kind.AlreadyCancelled);
        end);
        it("should stop iteration if Promise.each is cancelled", function() --[[ Line: 1668 ]]
            -- upvalues: v0 (ref)
            local v365 = {};
            local v368 = v0.each({
                "foo", 
                "bar", 
                "baz"
            }, function(_, v367) --[[ Line: 1675 ]]
                -- upvalues: v365 (copy), v0 (ref)
                v365[v367] = (v365[v367] or 0) + 1;
                return v0.new(function() --[[ Line: 1678 ]]

                end);
            end);
            expect(v368:getStatus()).to.equal(v0.Status.Started);
            expect(v365[1]).to.equal(1);
            expect(v365[2]).to.never.be.ok();
            v368:cancel();
            expect(v368:getStatus()).to.equal(v0.Status.Cancelled);
            expect(v365[1]).to.equal(1);
            expect(v365[2]).to.never.be.ok();
        end);
        it("should cancel the Promise returned from the predicate if Promise.each is cancelled", function() --[[ Line: 1692 ]]
            -- upvalues: v0 (ref)
            local v369 = nil;
            v0.each({
                "foo", 
                "bar", 
                "baz"
            }, function(_, _) --[[ Line: 1699 ]]
                -- upvalues: v369 (ref), v0 (ref)
                v369 = v0.new(function() --[[ Line: 1700 ]]

                end);
                return v369;
            end):cancel();
            expect(v369:getStatus()).to.equal(v0.Status.Cancelled);
        end);
        it("should cancel Promises in the list if Promise.each is cancelled", function() --[[ Line: 1709 ]]
            -- upvalues: v0 (ref)
            local v372 = v0.new(function() --[[ Line: 1710 ]]

            end);
            v0.each({
                v372
            }, function() --[[ Line: 1712 ]]

            end):cancel();
            expect(v372:getStatus()).to.equal(v0.Status.Cancelled);
        end);
    end);
    describe("Promise.retry", function() --[[ Line: 1720 ]]
        -- upvalues: v0 (copy)
        it("should retry N times", function() --[[ Line: 1721 ]]
            -- upvalues: v0 (ref)
            local v373 = 0;
            local v375 = v0.retry(function(v374) --[[ Line: 1724 ]]
                -- upvalues: v373 (ref), v0 (ref)
                expect(v374).to.equal("foo");
                v373 = v373 + 1;
                if v373 == 5 then
                    return v0.resolve("ok");
                else
                    return v0.reject("fail");
                end;
            end, 5, "foo");
            expect(v375:getStatus()).to.equal(v0.Status.Resolved);
            expect(v375._values[1]).to.equal("ok");
        end);
        it("should reject if threshold is exceeded", function() --[[ Line: 1740 ]]
            -- upvalues: v0 (ref)
            local v376 = v0.retry(function() --[[ Line: 1741 ]]
                -- upvalues: v0 (ref)
                return v0.reject("fail");
            end, 5);
            expect(v376:getStatus()).to.equal(v0.Status.Rejected);
            expect(v376._values[1]).to.equal("fail");
        end);
    end);
    describe("Promise.retryWithDelay", function() --[[ Line: 1750 ]]
        -- upvalues: v0 (copy), v2 (ref)
        it("should retry after a delay", function() --[[ Line: 1751 ]]
            -- upvalues: v0 (ref), v2 (ref)
            local v377 = 0;
            local v379 = v0.retryWithDelay(function(v378) --[[ Line: 1754 ]]
                -- upvalues: v377 (ref), v0 (ref)
                expect(v378).to.equal("foo");
                v377 = v377 + 1;
                if v377 == 3 then
                    return v0.resolve("ok");
                else
                    return v0.reject("fail");
                end;
            end, 3, 10, "foo");
            expect(v377).to.equal(1);
            v2(11);
            expect(v377).to.equal(2);
            v2(11);
            expect(v377).to.equal(3);
            expect(v379:getStatus()).to.equal(v0.Status.Resolved);
            expect(v379._values[1]).to.equal("ok");
        end);
    end);
    describe("Promise.fromEvent", function() --[[ Line: 1781 ]]
        -- upvalues: v0 (copy)
        it("should convert a Promise into an event", function() --[[ Line: 1782 ]]
            -- upvalues: v0 (ref)
            local l_BindableEvent_6 = Instance.new("BindableEvent");
            local v381 = v0.fromEvent(l_BindableEvent_6.Event);
            expect(v381:getStatus()).to.equal(v0.Status.Started);
            l_BindableEvent_6:Fire("foo");
            expect(v381:getStatus()).to.equal(v0.Status.Resolved);
            expect(v381._values[1]).to.equal("foo");
        end);
        it("should convert a Promise into an event with the predicate", function() --[[ Line: 1795 ]]
            -- upvalues: v0 (ref)
            local l_BindableEvent_7 = Instance.new("BindableEvent");
            local v384 = v0.fromEvent(l_BindableEvent_7.Event, function(v383) --[[ Line: 1798 ]]
                return v383 == "foo";
            end);
            expect(v384:getStatus()).to.equal(v0.Status.Started);
            l_BindableEvent_7:Fire("bar");
            expect(v384:getStatus()).to.equal(v0.Status.Started);
            l_BindableEvent_7:Fire("foo");
            expect(v384:getStatus()).to.equal(v0.Status.Resolved);
            expect(v384._values[1]).to.equal("foo");
        end);
    end);
    describe("Promise.is", function() --[[ Line: 1815 ]]
        -- upvalues: v0 (copy)
        it("should work with current version", function() --[[ Line: 1816 ]]
            -- upvalues: v0 (ref)
            local v385 = v0.resolve(1);
            expect(v0.is(v385)).to.equal(true);
        end);
        it("should work with any object with an andThen", function() --[[ Line: 1822 ]]
            -- upvalues: v0 (ref)
            local v386 = {
                andThen = function() --[[ Line: 1824 ]] --[[ Name: andThen ]]
                    return 1;
                end
            };
            expect(v0.is(v386)).to.equal(true);
        end);
        it("should work with older promises", function() --[[ Line: 1832 ]]
            -- upvalues: v0 (ref)
            local v387 = {
                prototype = {}
            };
            v387.__index = v387.prototype;
            v387.prototype.andThen = function(_) --[[ Line: 1837 ]] --[[ Name: andThen ]]

            end;
            local v389 = setmetatable({}, v387);
            expect(v0.is(v389)).to.equal(true);
        end);
    end);
end;