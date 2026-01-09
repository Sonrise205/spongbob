local l_TweenService_0 = game:GetService("TweenService");
local v1 = require(script.Parent);
local v2 = require(script.Parent.Parent.Parent.Promise);
print(debug.traceback());
local v3 = v1.findFirstChildThatMatches(workspace, "InstanceUtil/TestObjects") or Instance.new("Folder");
v3.Name = "InstanceUtil/TestObjects - " .. os.clock();
v3.Parent = workspace;
local function v4(...) --[[ Line: 14 ]]

end;
return function() --[[ Line: 18 ]]
    -- upvalues: v3 (copy), v4 (copy), v1 (copy), l_TweenService_0 (copy), v2 (copy)
    afterAll(function() --[[ Line: 20 ]]
        -- upvalues: v3 (ref), v4 (ref)
        v3:Destroy();
        v4("Finished Tests!");
    end);
    local function _(v5, v6, v7) --[[ Line: 25 ]] --[[ Name: create ]]
        -- upvalues: v3 (ref)
        local v8 = Instance.new(v5);
        v8.Name = v6;
        if v5 == "Part" then
            v8.Anchored = true;
        end;
        v8.Parent = v7 or v3;
        return v8;
    end;
    describe("promiseChild", function() --[[ Line: 35 ]]
        -- upvalues: v4 (ref), v3 (ref), v1 (ref)
        v4("Testing InstanceUtil.promiseChild . . .");
        local v10 = nil;
        beforeEach(function() --[[ Line: 40 ]]
            -- upvalues: v10 (ref), v3 (ref)
            local l_Folder_0 = Instance.new("Folder");
            l_Folder_0.Name = "TestParent";
            l_Folder_0.Parent = v3;
            v10 = l_Folder_0;
        end);
        afterEach(function() --[[ Line: 44 ]]
            -- upvalues: v10 (ref)
            v10:Destroy();
        end);
        it("should resolve when the child is found", function() --[[ Line: 48 ]]
            -- upvalues: v10 (ref), v3 (ref), v1 (ref)
            local l_v10_0 = v10;
            local l_Folder_1 = Instance.new("Folder");
            l_Folder_1.Name = "Child";
            l_Folder_1.Parent = l_v10_0 or v3;
            local l_l_Folder_1_0 = l_Folder_1;
            l_v10_0, l_Folder_1 = v1.promiseChild(v10, "Child", 10):await();
            expect(l_v10_0).to.equal(true);
            expect(l_Folder_1).to.equal(l_l_Folder_1_0);
        end);
        it("should reject when the timeout is reached", function() --[[ Line: 58 ]]
            -- upvalues: v1 (ref), v10 (ref)
            local v15, v16 = v1.promiseChild(v10, "NonExistentChild", 1):await();
            expect(v15).to.equal(false);
            expect(v16:find("Timed out after")).to.be.ok();
        end);
    end);
    describe("findFirstChildFromPredicate", function() --[[ Line: 69 ]]
        -- upvalues: v4 (ref), v3 (ref), v1 (ref)
        v4("Testing InstanceUtil.findFirstChildFromPredicate . . .");
        local v17 = nil;
        beforeEach(function() --[[ Line: 73 ]]
            -- upvalues: v17 (ref), v3 (ref)
            local l_Folder_2 = Instance.new("Folder");
            l_Folder_2.Name = "TestParent";
            l_Folder_2.Parent = v3;
            v17 = l_Folder_2;
        end);
        afterEach(function() --[[ Line: 77 ]]
            -- upvalues: v17 (ref)
            v17:Destroy();
        end);
        it("should return the first child matching the predicate", function() --[[ Line: 81 ]]
            -- upvalues: v17 (ref), v3 (ref), v1 (ref)
            local l_v17_0 = v17;
            local l_Part_0 = Instance.new("Part");
            l_Part_0.Name = "Target";
            l_Part_0.Anchored = true;
            l_Part_0.Parent = l_v17_0 or v3;
            local l_l_Part_0_0 = l_Part_0;
            l_v17_0 = v1.findFirstChildFromPredicate(v17, function(v22) --[[ Line: 84 ]]
                return v22.Name == "Target";
            end);
            expect(l_v17_0).to.equal(l_l_Part_0_0);
        end);
        it("should return nil if no child matches the predicate", function() --[[ Line: 91 ]]
            -- upvalues: v1 (ref), v17 (ref)
            local v24 = v1.findFirstChildFromPredicate(v17, function(v23) --[[ Line: 92 ]]
                return v23.Name == "NonExistent";
            end);
            expect(v24).to.equal(nil);
        end);
    end);
    describe("findFirstChildThatMatches", function() --[[ Line: 100 ]]
        -- upvalues: v4 (ref), v3 (ref), v1 (ref)
        v4("Testing InstanceUtil.findFirstChildThatMatches . . .");
        local v25 = nil;
        beforeEach(function() --[[ Line: 104 ]]
            -- upvalues: v25 (ref), v3 (ref)
            local l_Folder_3 = Instance.new("Folder");
            l_Folder_3.Name = "TestParent";
            l_Folder_3.Parent = v3;
            v25 = l_Folder_3;
        end);
        afterEach(function() --[[ Line: 108 ]]
            -- upvalues: v25 (ref)
            v25:Destroy();
        end);
        it("should return the first child whose name matches the pattern", function() --[[ Line: 112 ]]
            -- upvalues: v25 (ref), v3 (ref), v1 (ref)
            local l_v25_0 = v25;
            local l_Part_1 = Instance.new("Part");
            l_Part_1.Name = "TargetPart";
            l_Part_1.Anchored = true;
            l_Part_1.Parent = l_v25_0 or v3;
            local l_l_Part_1_0 = l_Part_1;
            l_v25_0 = v1.findFirstChildThatMatches(v25, "TargetPart");
            expect(l_v25_0).to.equal(l_l_Part_1_0);
        end);
        it("should return nil if no child name matches the pattern", function() --[[ Line: 120 ]]
            -- upvalues: v1 (ref), v25 (ref)
            local v30 = v1.findFirstChildThatMatches(v25, "NonExistent");
            expect(v30).to.equal(nil);
        end);
    end);
    describe("findFirstChildOfAncestor", function() --[[ Line: 127 ]]
        -- upvalues: v4 (ref), v3 (ref), v1 (ref)
        v4("Testing InstanceUtil.findFirstChildOfAncestor . . .");
        local v31 = nil;
        local v32 = nil;
        local v33 = nil;
        beforeEach(function() --[[ Line: 131 ]]
            -- upvalues: v31 (ref), v3 (ref), v32 (ref), v33 (ref)
            local l_Folder_4 = Instance.new("Folder");
            l_Folder_4.Name = "ParentFolder";
            l_Folder_4.Parent = v3;
            v31 = l_Folder_4;
            l_Folder_4 = v31;
            local l_Folder_5 = Instance.new("Folder");
            l_Folder_5.Name = "ChildFolder";
            l_Folder_5.Parent = l_Folder_4 or v3;
            v32 = l_Folder_5;
            l_Folder_4 = v32;
            l_Folder_5 = Instance.new("Part");
            l_Folder_5.Name = "DescendantPart";
            l_Folder_5.Anchored = true;
            l_Folder_5.Parent = l_Folder_4 or v3;
            v33 = l_Folder_5;
        end);
        afterEach(function() --[[ Line: 137 ]]
            -- upvalues: v31 (ref)
            v31:Destroy();
        end);
        it("should find the correct ancestor of the descendant", function() --[[ Line: 141 ]]
            -- upvalues: v1 (ref), v33 (ref), v31 (ref), v32 (ref)
            local v36 = v1.findFirstChildOfAncestor(v33, v31);
            expect(v36).to.equal(v32);
        end);
        it("should return nil if the descendant is not under the ancestor", function() --[[ Line: 147 ]]
            -- upvalues: v3 (ref), v1 (ref), v33 (ref)
            local l_Folder_6 = Instance.new("Folder");
            l_Folder_6.Name = "AnotherParentFolder";
            l_Folder_6.Parent = v3;
            local l_l_Folder_6_0 = l_Folder_6;
            l_Folder_6 = v1.findFirstChildOfAncestor(v33, l_l_Folder_6_0);
            expect(l_Folder_6).to.equal(nil);
            l_l_Folder_6_0:Destroy();
        end);
    end);
    describe("getDescendantsWhichAre", function() --[[ Line: 157 ]]
        -- upvalues: v4 (ref), v3 (ref), v1 (ref)
        v4("Testing InstanceUtil.getDescendantsWhichAre . . .");
        local v39 = nil;
        beforeEach(function() --[[ Line: 161 ]]
            -- upvalues: v39 (ref), v3 (ref)
            local l_Folder_7 = Instance.new("Folder");
            l_Folder_7.Name = "TestParent";
            l_Folder_7.Parent = v3;
            v39 = l_Folder_7;
            local l_v39_0 = v39;
            l_Folder_7 = Instance.new("Part");
            l_Folder_7.Name = "Part1";
            l_Folder_7.Anchored = true;
            l_Folder_7.Parent = l_v39_0 or v3;
            l_v39_0 = v39;
            l_Folder_7 = Instance.new("Part");
            l_Folder_7.Name = "Part2";
            l_Folder_7.Anchored = true;
            l_Folder_7.Parent = l_v39_0 or v3;
            l_v39_0 = v39;
            l_Folder_7 = Instance.new("Model");
            l_Folder_7.Name = "Model1";
            l_Folder_7.Parent = l_v39_0 or v3;
        end);
        afterEach(function() --[[ Line: 168 ]]
            -- upvalues: v39 (ref)
            v39:Destroy();
        end);
        it("should return all descendants of the specified class", function() --[[ Line: 172 ]]
            -- upvalues: v1 (ref), v39 (ref)
            local v42 = v1.getDescendantsWhichAre(v39, "Part");
            expect(#v42).to.equal(2);
            expect(v42[1].ClassName).to.equal("Part");
            expect(v42[2].ClassName).to.equal("Part");
        end);
        it("should handle multiple classes", function() --[[ Line: 180 ]]
            -- upvalues: v1 (ref), v39 (ref)
            local v43 = v1.getDescendantsWhichAre(v39, {
                "Part", 
                "Model"
            });
            expect(#v43).to.equal(3);
        end);
    end);
    describe("cloneChildren", function() --[[ Line: 187 ]]
        -- upvalues: v4 (ref), v3 (ref), v1 (ref)
        v4("Testing InstanceUtil.cloneChildren . . .");
        local v44 = nil;
        local v45 = nil;
        beforeEach(function() --[[ Line: 191 ]]
            -- upvalues: v44 (ref), v3 (ref), v45 (ref)
            local l_Folder_8 = Instance.new("Folder");
            l_Folder_8.Name = "SourceFolder";
            l_Folder_8.Parent = v3;
            v44 = l_Folder_8;
            l_Folder_8 = Instance.new("Folder");
            l_Folder_8.Name = "TargetFolder";
            l_Folder_8.Parent = v3;
            v45 = l_Folder_8;
            local l_v44_0 = v44;
            l_Folder_8 = Instance.new("Part");
            l_Folder_8.Name = "Part1";
            l_Folder_8.Anchored = true;
            l_Folder_8.Parent = l_v44_0 or v3;
            l_v44_0 = v44;
            l_Folder_8 = Instance.new("Part");
            l_Folder_8.Name = "Part2";
            l_Folder_8.Anchored = true;
            l_Folder_8.Parent = l_v44_0 or v3;
        end);
        afterEach(function() --[[ Line: 199 ]]
            -- upvalues: v44 (ref), v45 (ref)
            v44:Destroy();
            v45:Destroy();
        end);
        it("should clone all children", function() --[[ Line: 204 ]]
            -- upvalues: v1 (ref), v44 (ref), v45 (ref)
            local v48 = v1.cloneChildren(v44, v45);
            expect(#v48).to.equal(2);
            expect(v48[1].Parent).to.equal(v45);
            expect(v48[2].Parent).to.equal(v45);
        end);
        it("should clone only children that match the predicate", function() --[[ Line: 212 ]]
            -- upvalues: v1 (ref), v44 (ref), v45 (ref)
            local v50 = v1.cloneChildren(v44, v45, function(v49) --[[ Line: 213 ]]
                return v49.Name == "Part1";
            end);
            expect(#v50).to.equal(1);
            expect(v50[1].Name).to.equal("Part1");
            expect(v50[1].Parent).to.equal(v45);
        end);
    end);
    describe("safeDestroy", function() --[[ Line: 223 ]]
        -- upvalues: v4 (ref), v3 (ref), v1 (ref)
        v4("Testing InstanceUtil.safeDestroy . . .");
        local v51 = nil;
        beforeEach(function() --[[ Line: 227 ]]
            -- upvalues: v51 (ref), v3 (ref)
            local l_Part_2 = Instance.new("Part");
            l_Part_2.Name = "PartToDestroy";
            l_Part_2.Anchored = true;
            l_Part_2.Parent = v3;
            v51 = l_Part_2;
        end);
        it("should successfully destroy an instance", function() --[[ Line: 231 ]]
            -- upvalues: v1 (ref), v51 (ref)
            local v53, v54 = v1.safeDestroy(v51);
            expect(v53).to.equal(true);
            expect(v54).to.equal(nil);
            expect(v51.Parent).to.equal(nil);
        end);
    end);
    describe("weld", function() --[[ Line: 242 ]]
        -- upvalues: v4 (ref), v3 (ref), v1 (ref)
        v4("Testing InstanceUtil.weld . . .");
        local v55 = nil;
        local v56 = nil;
        beforeEach(function() --[[ Line: 247 ]]
            -- upvalues: v55 (ref), v3 (ref), v56 (ref)
            local l_workspace_0 = workspace;
            local l_Part_3 = Instance.new("Part");
            l_Part_3.Name = "Part1";
            l_Part_3.Anchored = true;
            l_Part_3.Parent = l_workspace_0 or v3;
            v55 = l_Part_3;
            l_workspace_0 = workspace;
            l_Part_3 = Instance.new("Part");
            l_Part_3.Name = "Part2";
            l_Part_3.Anchored = true;
            l_Part_3.Parent = l_workspace_0 or v3;
            v56 = l_Part_3;
        end);
        afterEach(function() --[[ Line: 252 ]]
            -- upvalues: v1 (ref), v55 (ref), v56 (ref)
            v1.safeDestroy(v55);
            v1.safeDestroy(v56);
        end);
        it("should create a WeldConstraint between two parts", function() --[[ Line: 257 ]]
            -- upvalues: v1 (ref), v55 (ref), v56 (ref)
            local v59 = v1.weld(v55, v56);
            expect(v59:IsA("WeldConstraint")).to.equal(true);
            expect(v59.Part0).to.equal(v55);
            expect(v59.Part1).to.equal(v56);
            expect(v59.Parent).to.equal(v55);
        end);
    end);
    describe("weldAssembly", function() --[[ Line: 267 ]]
        -- upvalues: v4 (ref), v3 (ref), v1 (ref)
        v4("Testing InstanceUtil.weldAssembly . . .");
        local v60 = nil;
        local v61 = nil;
        beforeEach(function() --[[ Line: 272 ]]
            -- upvalues: v60 (ref), v3 (ref), v61 (ref)
            local l_workspace_1 = workspace;
            local l_Model_0 = Instance.new("Model");
            l_Model_0.Name = "TestModel";
            l_Model_0.Parent = l_workspace_1 or v3;
            v60 = l_Model_0;
            l_workspace_1 = v60;
            l_Model_0 = Instance.new("Part");
            l_Model_0.Name = "PrimaryPart";
            l_Model_0.Anchored = true;
            l_Model_0.Parent = l_workspace_1 or v3;
            v61 = l_Model_0;
            v60.PrimaryPart = v61;
            local v64 = "Part" .. 1;
            l_workspace_1 = v60;
            l_Model_0 = Instance.new("Part");
            l_Model_0.Name = v64;
            l_Model_0.Anchored = true;
            l_Model_0.Parent = l_workspace_1 or v3;
            v64 = "Part" .. 2;
            l_workspace_1 = v60;
            l_Model_0 = Instance.new("Part");
            l_Model_0.Name = v64;
            l_Model_0.Anchored = true;
            l_Model_0.Parent = l_workspace_1 or v3;
            v64 = "Part" .. 3;
            l_workspace_1 = v60;
            l_Model_0 = Instance.new("Part");
            l_Model_0.Name = v64;
            l_Model_0.Anchored = true;
            l_Model_0.Parent = l_workspace_1 or v3;
        end);
        afterEach(function() --[[ Line: 282 ]]
            -- upvalues: v1 (ref), v60 (ref)
            v1.safeDestroy(v60);
        end);
        it("should weld all parts of a model to the PrimaryPart", function() --[[ Line: 286 ]]
            -- upvalues: v1 (ref), v60 (ref), v61 (ref)
            local v65 = v1.weldAssembly(v60);
            expect(#v65).to.equal(3);
            for _, v67 in ipairs(v65) do
                expect(v67.Part0).to.equal(v61);
                expect(v67.Parent).to.equal(v61);
            end;
        end);
    end);
    describe("isClass", function() --[[ Line: 297 ]]
        -- upvalues: v4 (ref), v3 (ref), v1 (ref)
        v4("Testing InstanceUtil.isClass . . .");
        local v68 = nil;
        beforeEach(function() --[[ Line: 301 ]]
            -- upvalues: v68 (ref), v3 (ref)
            local l_workspace_2 = workspace;
            local l_Part_4 = Instance.new("Part");
            l_Part_4.Name = "Part";
            l_Part_4.Anchored = true;
            l_Part_4.Parent = l_workspace_2 or v3;
            v68 = l_Part_4;
        end);
        afterEach(function() --[[ Line: 305 ]]
            -- upvalues: v1 (ref), v68 (ref)
            v1.safeDestroy(v68);
        end);
        it("should return true for a class that matches the instance", function() --[[ Line: 309 ]]
            -- upvalues: v1 (ref), v68 (ref)
            local v71 = v1.isClass(v68, "Part");
            expect(v71).to.equal(true);
        end);
        it("should return true for a class that matches one of multiple classes", function() --[[ Line: 314 ]]
            -- upvalues: v1 (ref), v68 (ref)
            local v72 = v1.isClass(v68, {
                "BasePart", 
                "Part"
            });
            expect(v72).to.equal(true);
        end);
        it("should return false for a class that does not match", function() --[[ Line: 319 ]]
            -- upvalues: v1 (ref), v68 (ref)
            local v73 = v1.isClass(v68, "Model");
            expect(v73).to.equal(false);
        end);
    end);
    describe("hasProperty", function() --[[ Line: 362 ]]
        -- upvalues: v4 (ref), v3 (ref), v1 (ref)
        v4("Testing InstanceUtil.hasProperty . . .");
        local v74 = nil;
        beforeEach(function() --[[ Line: 366 ]]
            -- upvalues: v74 (ref), v3 (ref)
            local l_workspace_3 = workspace;
            local l_Part_5 = Instance.new("Part");
            l_Part_5.Name = "Part";
            l_Part_5.Anchored = true;
            l_Part_5.Parent = l_workspace_3 or v3;
            v74 = l_Part_5;
            v74.Size = Vector3.new(4, 4, 4, 0);
        end);
        afterEach(function() --[[ Line: 371 ]]
            -- upvalues: v1 (ref), v74 (ref)
            v1.safeDestroy(v74);
        end);
        it("should return true and the value if the property exists", function() --[[ Line: 375 ]]
            -- upvalues: v1 (ref), v74 (ref)
            local v77, v78 = v1.hasProperty(v74, "Size");
            expect(v77).to.equal(true);
            expect(v78).to.equal(v74.Size);
        end);
        it("should return false if the property does not exist", function() --[[ Line: 381 ]]
            -- upvalues: v1 (ref), v74 (ref)
            local v79, _ = v1.hasProperty(v74, "NonExistentProperty");
            expect(v79).to.equal(false);
        end);
    end);
    describe("playTween", function() --[[ Line: 388 ]]
        -- upvalues: v4 (ref), v3 (ref), l_TweenService_0 (ref), v1 (ref), v2 (ref)
        v4("Testing InstanceUtil.playTween . . .");
        local v81 = nil;
        local v82 = nil;
        local v83 = nil;
        local v84 = nil;
        local v85 = nil;
        beforeEach(function() --[[ Line: 396 ]]
            -- upvalues: v81 (ref), v3 (ref), v82 (ref), v83 (ref), v84 (ref), l_TweenService_0 (ref)
            local l_workspace_4 = workspace;
            local l_Part_6 = Instance.new("Part");
            l_Part_6.Name = "Part";
            l_Part_6.Anchored = true;
            l_Part_6.Parent = l_workspace_4 or v3;
            v81 = l_Part_6;
            v82 = TweenInfo.new(1);
            v83 = {
                Size = Vector3.new(10, 10, 10, 0)
            };
            v84 = l_TweenService_0:Create(v81, v82, v83);
        end);
        afterEach(function() --[[ Line: 403 ]]
            -- upvalues: v1 (ref), v81 (ref)
            v1.safeDestroy(v81);
        end);
        it("should return a promise that resolves when the tween has finished", function() --[[ Line: 407 ]]
            -- upvalues: v4 (ref), v85 (ref), v1 (ref), v84 (ref), v2 (ref)
            v4("[Testing] InstanceUtil.playTween should return a promise that resolves when the tween has finished");
            v85 = v1.playTween(v84);
            expect(v2.is(v85)).to.equal(true);
            v85:andThen(function(v88) --[[ Line: 411 ]]
                expect(v88).to.equal(Enum.PlaybackState.Completed);
            end):await();
        end);
        it("should handle tween cancellation", function() --[[ Line: 416 ]]
            -- upvalues: v4 (ref), v85 (ref), v1 (ref), v84 (ref)
            v4("[Testing] InstanceUtil.playTween should handle tween cancellation");
            v85 = v1.playTween(v84);
            v84:Cancel();
            v85:andThen(function(v89) --[[ Line: 420 ]]
                expect(v89).to.equal(Enum.PlaybackState.Cancelled);
            end):await();
        end);
        it("should handle multiple tweens being created and played", function() --[[ Line: 425 ]]
            -- upvalues: v4 (ref), l_TweenService_0 (ref), v81 (ref), v82 (ref), v1 (ref), v84 (ref)
            v4("[Testing] InstanceUtil.playTween should handle multiple tweens being created and played");
            local v90 = {
                Position = Vector3.new(10, 10, 10, 0)
            };
            local v91 = l_TweenService_0:Create(v81, v82, v90);
            local v92 = v1.playTween(v84);
            local v93 = v1.playTween(v91);
            v92:andThen(function(v94) --[[ Line: 434 ]]
                expect(v94).to.equal(Enum.PlaybackState.Completed);
            end):await();
            v93:andThen(function(v95) --[[ Line: 437 ]]
                expect(v95).to.equal(Enum.PlaybackState.Completed);
            end):await();
        end);
        it("should correctly resolve when tween completes normally", function() --[[ Line: 442 ]]
            -- upvalues: v4 (ref), v82 (ref), v84 (ref), l_TweenService_0 (ref), v81 (ref), v83 (ref), v85 (ref), v1 (ref)
            v4("[Testing] InstanceUtil.playTween should correctly resolve when tween completes normally");
            v82 = TweenInfo.new(0.1);
            v84 = l_TweenService_0:Create(v81, v82, v83);
            v85 = v1.playTween(v84);
            wait(0.2);
            v85:andThen(function(v96) --[[ Line: 451 ]]
                expect(v96).to.equal(Enum.PlaybackState.Completed);
            end):await();
        end);
    end);
end;