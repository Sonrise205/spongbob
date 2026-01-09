return function() --[[ Line: 1 ]]
    local v0 = require(script.Parent);
    local v1 = require(script.Parent.Parent.Promise);
    local v2 = {};
    local function v6(v3, v4) --[[ Line: 7 ]] --[[ Name: Create ]]
        -- upvalues: v2 (copy)
        local l_Folder_0 = Instance.new("Folder");
        l_Folder_0.Name = v3;
        l_Folder_0.Parent = v4;
        table.insert(v2, l_Folder_0);
        return l_Folder_0;
    end;
    afterEach(function() --[[ Line: 15 ]]
        -- upvalues: v2 (copy)
        for _, v8 in ipairs(v2) do
            task.delay(0, function() --[[ Line: 17 ]]
                -- upvalues: v8 (copy)
                v8:Destroy();
            end);
        end;
        table.clear(v2);
    end);
    describe("WaitFor", function() --[[ Line: 24 ]]
        -- upvalues: v6 (copy), v0 (copy), v2 (copy), v1 (copy)
        it("should wait for child", function() --[[ Line: 25 ]]
            -- upvalues: v6 (ref), v0 (ref)
            local l_workspace_0 = workspace;
            task.delay(0.1, v6, "TestChild", l_workspace_0);
            local v10, v11 = v0.Child(l_workspace_0, "TestChild"):await();
            expect(v10).to.equal(true);
            expect((typeof(v11))).to.equal("Instance");
            expect(v11.Name).to.equal("TestChild");
            expect(v11.Parent).to.equal(l_workspace_0);
        end);
        it("should stop waiting for child if parent is unparented", function() --[[ Line: 38 ]]
            -- upvalues: v2 (ref), v0 (ref)
            local l_workspace_1 = workspace;
            local l_Folder_1 = Instance.new("Folder");
            l_Folder_1.Name = "SomeParent";
            l_Folder_1.Parent = l_workspace_1;
            table.insert(v2, l_Folder_1);
            local l_l_Folder_1_0 = l_Folder_1;
            task.delay(0.1, function() --[[ Line: 42 ]]
                -- upvalues: l_l_Folder_1_0 (copy)
                l_l_Folder_1_0:Destroy();
            end);
            l_workspace_1, l_Folder_1 = v0.Child(l_l_Folder_1_0, "TestChild"):await();
            expect(l_workspace_1).to.equal(false);
            expect(l_Folder_1).to.equal(v0.Error.Unparented);
        end);
        it("should stop waiting for child if timeout is reached", function() --[[ Line: 51 ]]
            -- upvalues: v0 (ref), v1 (ref)
            local v15, v16 = v0.Child(workspace, "InstanceThatDoesNotExist", 0.1):await();
            expect(v15).to.equal(false);
            expect(v1.Error.isKind(v16, v1.Error.Kind.TimedOut)).to.equal(true);
        end);
        it("should wait for children", function() --[[ Line: 57 ]]
            -- upvalues: v6 (ref), v0 (ref)
            local l_workspace_2 = workspace;
            local v18 = {
                "TestChild01", 
                "TestChild02", 
                "TestChild03"
            };
            task.delay(0.1, v6, v18[1], l_workspace_2);
            task.delay(0.2, v6, v18[2], l_workspace_2);
            task.delay(0.05, v6, v18[3], l_workspace_2);
            local v19, v20 = v0.Children(l_workspace_2, v18):await();
            expect(v19).to.equal(true);
            for v21, v22 in ipairs(v20) do
                expect((typeof(v22))).to.equal("Instance");
                expect(v22.Name).to.equal(v18[v21]);
                expect(v22.Parent).to.equal(l_workspace_2);
            end;
        end);
        it("should fail if any children are no longer parented in parent", function() --[[ Line: 74 ]]
            -- upvalues: v6 (ref), v2 (ref), v0 (ref)
            local l_workspace_3 = workspace;
            local v24 = {
                "TestChild04", 
                "TestChild05", 
                "TestChild06"
            };
            local v25 = nil;
            task.delay(0.1, v6, v24[1], l_workspace_3);
            task.delay(0.2, v6, v24[2], l_workspace_3);
            task.delay(0.05, function() --[[ Line: 82 ]]
                -- upvalues: v25 (ref), v24 (copy), l_workspace_3 (copy), v2 (ref)
                local v26 = v24[3];
                local l_l_workspace_3_0 = l_workspace_3;
                local l_Folder_2 = Instance.new("Folder");
                l_Folder_2.Name = v26;
                l_Folder_2.Parent = l_l_workspace_3_0;
                table.insert(v2, l_Folder_2);
                v25 = l_Folder_2;
            end);
            task.delay(0.1, function() --[[ Line: 85 ]]
                -- upvalues: v25 (ref)
                v25:Destroy();
            end);
            local v29, v30 = v0.Children(l_workspace_3, v24):await();
            expect(v29).to.equal(false);
            expect(v30).to.equal(v0.Error.ParentChanged);
        end);
        it("should wait for descendant", function() --[[ Line: 94 ]]
            -- upvalues: v6 (ref), v2 (ref), v0 (ref)
            local l_workspace_4 = workspace;
            local l_delay_0 = task.delay;
            local v33 = 0.1;
            local l_v6_0 = v6;
            local v35 = "TestDescendant";
            local l_Folder_3 = Instance.new("Folder");
            l_Folder_3.Name = "TestFolder";
            l_Folder_3.Parent = l_workspace_4;
            table.insert(v2, l_Folder_3);
            l_delay_0(v33, l_v6_0, v35, l_Folder_3);
            l_delay_0, v33 = v0.Descendant(l_workspace_4, "TestDescendant"):await();
            expect(l_delay_0).to.equal(true);
            expect((typeof(v33))).to.equal("Instance");
            expect(v33.Name).to.equal("TestDescendant");
            expect(v33:IsDescendantOf(l_workspace_4)).to.equal(true);
        end);
        it("should wait for many descendants", function() --[[ Line: 107 ]]
            -- upvalues: v6 (ref), v2 (ref), v0 (ref)
            local l_workspace_5 = workspace;
            local v38 = {
                "TestDescendant01", 
                "TestDescendant02", 
                "TestDescendant03"
            };
            local l_delay_1 = task.delay;
            local v40 = 0.1;
            local l_v6_1 = v6;
            local v42 = v38[1];
            local l_Folder_4 = Instance.new("Folder");
            l_Folder_4.Name = "TestFolder1";
            l_Folder_4.Parent = l_workspace_5;
            table.insert(v2, l_Folder_4);
            l_delay_1(v40, l_v6_1, v42, l_Folder_4);
            l_delay_1 = task.delay;
            v40 = 0.05;
            l_v6_1 = v6;
            v42 = v38[2];
            l_Folder_4 = Instance.new("Folder");
            l_Folder_4.Name = "TestFolder2";
            l_Folder_4.Parent = l_workspace_5;
            table.insert(v2, l_Folder_4);
            l_delay_1(v40, l_v6_1, v42, l_Folder_4);
            l_delay_1 = task.delay;
            v40 = 0.2;
            l_v6_1 = v6;
            v42 = v38[3];
            local l_Folder_5 = Instance.new("Folder");
            l_Folder_5.Name = "TestFolder3";
            l_Folder_5.Parent = l_workspace_5;
            table.insert(v2, l_Folder_5);
            l_Folder_4 = l_Folder_5;
            l_Folder_5 = Instance.new("Folder");
            l_Folder_5.Name = "TestFolder4";
            l_Folder_5.Parent = l_Folder_4;
            table.insert(v2, l_Folder_5);
            l_delay_1(v40, l_v6_1, v42, l_Folder_5);
            l_delay_1, v40 = v0.Descendants(l_workspace_5, v38):await();
            expect(l_delay_1).to.equal(true);
            for v45, v46 in ipairs(v40) do
                expect((typeof(v46))).to.equal("Instance");
                expect(v46.Name == v38[v45]).to.equal(true);
                expect(v46:IsDescendantOf(l_workspace_5)).to.equal(true);
            end;
        end);
        it("should wait for primarypart", function() --[[ Line: 124 ]]
            -- upvalues: v0 (ref)
            local l_Model_0 = Instance.new("Model");
            local l_Part_0 = Instance.new("Part");
            l_Part_0.Anchored = true;
            l_Part_0.Parent = l_Model_0;
            l_Model_0.Parent = workspace;
            task.delay(0.1, function() --[[ Line: 132 ]]
                -- upvalues: l_Model_0 (copy), l_Part_0 (copy)
                l_Model_0.PrimaryPart = l_Part_0;
            end);
            local v49, v50 = v0.PrimaryPart(l_Model_0):await();
            expect(v49).to.equal(true);
            expect((typeof(v50))).to.equal("Instance");
            expect(v50).to.equal(l_Part_0);
            expect(l_Model_0.PrimaryPart).to.equal(v50);
            l_Model_0:Destroy();
        end);
        it("should wait for objectvalue", function() --[[ Line: 145 ]]
            -- upvalues: v2 (ref), v0 (ref)
            local l_ObjectValue_0 = Instance.new("ObjectValue");
            l_ObjectValue_0.Parent = workspace;
            local l_workspace_6 = workspace;
            local l_Folder_6 = Instance.new("Folder");
            l_Folder_6.Name = "SomeInstance";
            l_Folder_6.Parent = l_workspace_6;
            table.insert(v2, l_Folder_6);
            local l_l_Folder_6_0 = l_Folder_6;
            task.delay(0.1, function() --[[ Line: 151 ]]
                -- upvalues: l_ObjectValue_0 (copy), l_l_Folder_6_0 (copy)
                l_ObjectValue_0.Value = l_l_Folder_6_0;
            end);
            l_workspace_6, l_Folder_6 = v0.ObjectValue(l_ObjectValue_0):await();
            expect(l_workspace_6).to.equal(true);
            expect((typeof(l_Folder_6))).to.equal("Instance");
            expect(l_Folder_6).to.equal(l_l_Folder_6_0);
            expect(l_ObjectValue_0.Value == l_Folder_6);
            l_ObjectValue_0:Destroy();
        end);
        it("should wait for custom predicate", function() --[[ Line: 164 ]]
            -- upvalues: v2 (ref), v0 (ref)
            local v55 = nil;
            task.delay(0.1, function() --[[ Line: 166 ]]
                -- upvalues: v55 (ref), v2 (ref)
                local l_workspace_7 = workspace;
                local l_Folder_7 = Instance.new("Folder");
                l_Folder_7.Name = "CustomInstance";
                l_Folder_7.Parent = l_workspace_7;
                table.insert(v2, l_Folder_7);
                v55 = l_Folder_7;
            end);
            local v58, v59 = v0.Custom(function() --[[ Line: 170 ]]
                -- upvalues: v55 (ref)
                return v55;
            end):await();
            expect(v58).to.equal(true);
            expect((typeof(v59))).to.equal("Instance");
            expect(v59).to.equal(v55);
        end);
    end);
end;