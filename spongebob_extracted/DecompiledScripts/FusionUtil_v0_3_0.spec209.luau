local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Parent.Fusion_v0_3_0);
local v2 = require(l_Parent_0.FusionUtil)["0.3.0"];
local l_scoped_0 = v1.scoped;
local l_Value_0 = v1.Value;
local l_peek_0 = v1.peek;
return function() --[[ Line: 12 ]]
    -- upvalues: l_scoped_0 (copy), v2 (copy), l_peek_0 (copy), l_Value_0 (copy)
    describe("ensureIsState", function() --[[ Line: 13 ]]
        -- upvalues: l_scoped_0 (ref), v2 (ref), l_peek_0 (ref), l_Value_0 (ref)
        it("should return a state object if data is nil", function() --[[ Line: 14 ]]
            -- upvalues: l_scoped_0 (ref), v2 (ref), l_peek_0 (ref)
            local v6 = l_scoped_0({});
            local v7 = v2.ensureIsState(v6, nil, 10);
            expect(l_peek_0(v7)).to.equal(10);
        end);
        it("should return the same state object if data is already a state object", function() --[[ Line: 20 ]]
            -- upvalues: l_scoped_0 (ref), l_Value_0 (ref), v2 (ref)
            local v8 = l_scoped_0({});
            local v9 = l_Value_0(v8, 5);
            local v10 = v2.ensureIsState(v8, v9, 10);
            expect(v10).to.equal(v9);
        end);
        it("should wrap non-state data in a state object", function() --[[ Line: 27 ]]
            -- upvalues: l_scoped_0 (ref), v2 (ref), l_peek_0 (ref)
            local v11 = l_scoped_0({});
            local v12 = v2.ensureIsState(v11, 20, 10);
            expect(l_peek_0(v12)).to.equal(20);
        end);
        it("should warn and return default value if data type does not match", function() --[[ Line: 33 ]]
            -- upvalues: l_scoped_0 (ref), v2 (ref), l_peek_0 (ref)
            local v13 = l_scoped_0({});
            local v14 = v2.ensureIsState(v13, "not a number", 10, "number");
            expect(l_peek_0(v14)).to.equal(10);
        end);
    end);
    describe("addTask", function() --[[ Line: 40 ]]
        -- upvalues: l_scoped_0 (ref), v2 (ref)
        it("should add a task to the scope", function() --[[ Line: 41 ]]
            -- upvalues: l_scoped_0 (ref), v2 (ref)
            local v15 = l_scoped_0({});
            v2.addTask(v15, function() --[[ Line: 43 ]]

            end);
            expect(#v15).to.equal(1);
        end);
        it("should remove existing task with the same taskId", function() --[[ Line: 48 ]]
            -- upvalues: l_scoped_0 (ref), v2 (ref)
            local v16 = l_scoped_0({});
            local function v17() --[[ Line: 50 ]]

            end;
            local function v18() --[[ Line: 51 ]]

            end;
            v2.addTask(v16, v17, nil, "TaskID");
            v2.addTask(v16, v18, nil, "TaskID");
            expect(#v16).to.equal(1);
            expect(v16[1].Task).to.equal(v18);
        end);
    end);
    describe("removeTask", function() --[[ Line: 59 ]]
        -- upvalues: l_scoped_0 (ref), v2 (ref)
        it("should remove the task from the scope by taskId", function() --[[ Line: 60 ]]
            -- upvalues: l_scoped_0 (ref), v2 (ref)
            local v19 = l_scoped_0({});
            v2.addTask(v19, function() --[[ Line: 62 ]]

            end, nil, "TaskID");
            v2.removeTask(v19, "TaskID");
            expect(#v19).to.equal(0);
        end);
        it("should return the removed task", function() --[[ Line: 68 ]]
            -- upvalues: l_scoped_0 (ref), v2 (ref)
            local v20 = l_scoped_0({});
            local function v21() --[[ Line: 70 ]]

            end;
            v2.addTask(v20, v21, nil, "TaskID");
            local v22 = v2.removeTask(v20, "TaskID");
            expect(v22).to.equal(v21);
        end);
    end);
    describe("getTask", function() --[[ Line: 77 ]]
        -- upvalues: l_scoped_0 (ref), v2 (ref)
        it("should return the task with the specified taskId", function() --[[ Line: 78 ]]
            -- upvalues: l_scoped_0 (ref), v2 (ref)
            local v23 = l_scoped_0({});
            local function v24() --[[ Line: 80 ]]

            end;
            v2.addTask(v23, v24, nil, "TaskID");
            local v25 = v2.getTask(v23, "TaskID");
            expect(v25).to.equal(v24);
        end);
        it("should return nil if the taskId does not exist", function() --[[ Line: 86 ]]
            -- upvalues: l_scoped_0 (ref), v2 (ref)
            local v26 = l_scoped_0({});
            local v27 = v2.getTask(v26, "NonExistentTaskID");
            expect(v27).to.equal(nil);
        end);
    end);
    describe("syncValues", function() --[[ Line: 93 ]]
        -- upvalues: l_scoped_0 (ref), l_Value_0 (ref), v2 (ref), l_peek_0 (ref)
        it("should sync the value of one state to another", function() --[[ Line: 94 ]]
            -- upvalues: l_scoped_0 (ref), l_Value_0 (ref), v2 (ref), l_peek_0 (ref)
            local v28 = l_scoped_0({});
            local v29 = l_Value_0(v28, 123);
            local v30 = l_Value_0(v28, 0);
            v2.syncValues(v28, v29, v30);
            expect(l_peek_0(v30)).to.equal(123);
            v29:set(456);
            expect(l_peek_0(v30)).to.equal(456);
        end);
    end);
    describe("formatAssetId", function() --[[ Line: 105 ]]
        -- upvalues: l_scoped_0 (ref), v2 (ref), l_peek_0 (ref)
        it("should format a string asset id correctly", function() --[[ Line: 106 ]]
            -- upvalues: l_scoped_0 (ref), v2 (ref), l_peek_0 (ref)
            local v31 = l_scoped_0({});
            local v32 = v2.formatAssetId(v31, "rbxassetid://1234567890");
            expect(l_peek_0(v32)).to.equal("rbxassetid://1234567890");
        end);
        it("should format a numeric asset id correctly", function() --[[ Line: 112 ]]
            -- upvalues: l_scoped_0 (ref), v2 (ref), l_peek_0 (ref)
            local v33 = l_scoped_0({});
            local v34 = v2.formatAssetId(v33, 1234567890);
            expect(l_peek_0(v34)).to.equal("rbxassetid://1234567890");
        end);
        it("should use the default value if the id is nil", function() --[[ Line: 118 ]]
            -- upvalues: l_scoped_0 (ref), v2 (ref), l_peek_0 (ref)
            local v35 = l_scoped_0({});
            local v36 = v2.formatAssetId(v35, nil, 1234567890);
            expect(l_peek_0(v36)).to.equal("rbxassetid://1234567890");
        end);
    end);
    describe("ratio", function() --[[ Line: 125 ]]
        -- upvalues: l_scoped_0 (ref), l_Value_0 (ref), v2 (ref), l_peek_0 (ref)
        it("should compute the ratio of two states", function() --[[ Line: 126 ]]
            -- upvalues: l_scoped_0 (ref), l_Value_0 (ref), v2 (ref), l_peek_0 (ref)
            local v37 = l_scoped_0({});
            local v38 = l_Value_0(v37, 100);
            local v39 = l_Value_0(v37, 200);
            local v40 = v2.ratio(v37, v38, v39);
            expect(l_peek_0(v40)).to.equal(0.5);
        end);
    end);
    describe("lerpNumber", function() --[[ Line: 135 ]]
        -- upvalues: l_scoped_0 (ref), l_Value_0 (ref), v2 (ref), l_peek_0 (ref)
        it("should lerp between two number states", function() --[[ Line: 136 ]]
            -- upvalues: l_scoped_0 (ref), l_Value_0 (ref), v2 (ref), l_peek_0 (ref)
            local v41 = l_scoped_0({});
            local v42 = l_Value_0(v41, 10);
            local v43 = l_Value_0(v41, 20);
            local v44 = l_Value_0(v41, 0.5);
            local v45 = v2.lerpNumber(v41, v42, v43, v44);
            expect(l_peek_0(v45)).to.equal(15);
        end);
    end);
    describe("eq", function() --[[ Line: 146 ]]
        -- upvalues: l_scoped_0 (ref), l_Value_0 (ref), v2 (ref), l_peek_0 (ref)
        it("should return true if two states are equal", function() --[[ Line: 147 ]]
            -- upvalues: l_scoped_0 (ref), l_Value_0 (ref), v2 (ref), l_peek_0 (ref)
            local v46 = l_scoped_0({});
            local v47 = l_Value_0(v46, 10);
            local v48 = l_Value_0(v46, 10);
            local v49 = v2.eq(v46, v47, v48);
            expect(l_peek_0(v49)).to.equal(true);
        end);
        it("should return false if two states are not equal", function() --[[ Line: 155 ]]
            -- upvalues: l_scoped_0 (ref), l_Value_0 (ref), v2 (ref), l_peek_0 (ref)
            local v50 = l_scoped_0({});
            local v51 = l_Value_0(v50, 10);
            local v52 = l_Value_0(v50, 20);
            local v53 = v2.eq(v50, v51, v52);
            expect(l_peek_0(v53)).to.equal(false);
        end);
    end);
    describe("observeState", function() --[[ Line: 164 ]]
        -- upvalues: l_scoped_0 (ref), l_Value_0 (ref), v2 (ref)
        it("should observe a state and call the callback on change", function() --[[ Line: 165 ]]
            -- upvalues: l_scoped_0 (ref), l_Value_0 (ref), v2 (ref)
            local v54 = l_scoped_0({});
            local v55 = l_Value_0(v54, 10);
            local v56 = false;
            local v57 = nil;
            v2.observeState(v54, v55, function(v58) --[[ Line: 170 ]]
                -- upvalues: v56 (ref), v57 (ref)
                v56 = true;
                v57 = v58;
            end);
            expect(v56).to.equal(true);
            expect(v57).to.equal(10);
            v55:set(20);
            expect(v57).to.equal(20);
        end);
    end);
end;