return function() --[[ Line: 1 ]]
    local v0 = require(script.Parent);
    local l_CollectionService_0 = game:GetService("CollectionService");
    local l_RunService_0 = game:GetService("RunService");
    local v3 = nil;
    local function _() --[[ Line: 11 ]] --[[ Name: CreateTaggedInstance ]]
        -- upvalues: l_CollectionService_0 (copy), v3 (ref)
        local l_Folder_0 = Instance.new("Folder");
        l_CollectionService_0:AddTag(l_Folder_0, "__KnitTestComponent__");
        l_Folder_0.Name = "ComponentTest";
        l_Folder_0.Archivable = false;
        l_Folder_0.Parent = v3;
        return l_Folder_0;
    end;
    local v13 = {
        ShouldConstruct = function(_) --[[ Line: 21 ]] --[[ Name: ShouldConstruct ]]
            return true;
        end, 
        Constructing = function(v7) --[[ Line: 24 ]] --[[ Name: Constructing ]]
            v7.Data = "a";
            v7.DidHeartbeat = false;
            v7.DidStepped = false;
            v7.DidRenderStepped = false;
        end, 
        Constructed = function(v8) --[[ Line: 30 ]] --[[ Name: Constructed ]]
            v8.Data = v8.Data .. "c";
        end, 
        Starting = function(v9) --[[ Line: 33 ]] --[[ Name: Starting ]]
            v9.Data = v9.Data .. "d";
        end, 
        Started = function(v10) --[[ Line: 36 ]] --[[ Name: Started ]]
            v10.Data = v10.Data .. "f";
        end, 
        Stopping = function(v11) --[[ Line: 39 ]] --[[ Name: Stopping ]]
            v11.Data = v11.Data .. "g";
        end, 
        Stopped = function(v12) --[[ Line: 42 ]] --[[ Name: Stopped ]]
            v12.Data = v12.Data .. "i";
        end
    };
    local v14 = v0.new({
        Tag = "__KnitTestComponent__", 
        Ancestors = {
            workspace, 
            game:GetService("Lighting")
        }, 
        Extensions = {
            v13
        }
    });
    local v15 = v0.new({
        Tag = "__KnitTestComponent__"
    });
    v15.GetData = function(_) --[[ Line: 53 ]] --[[ Name: GetData ]]
        return true;
    end;
    v14.Construct = function(v17) --[[ Line: 57 ]] --[[ Name: Construct ]]
        v17.Data = v17.Data .. "b";
    end;
    v14.Start = function(v18) --[[ Line: 61 ]] --[[ Name: Start ]]
        -- upvalues: v15 (copy)
        v18.Another = v18:GetComponent(v15);
        v18.Data = v18.Data .. "e";
    end;
    v14.Stop = function(v19) --[[ Line: 66 ]] --[[ Name: Stop ]]
        v19.Data = v19.Data .. "h";
    end;
    v14.HeartbeatUpdate = function(v20, _) --[[ Line: 70 ]] --[[ Name: HeartbeatUpdate ]]
        v20.DidHeartbeat = true;
    end;
    v14.SteppedUpdate = function(v22, _) --[[ Line: 74 ]] --[[ Name: SteppedUpdate ]]
        v22.DidStepped = true;
    end;
    v14.RenderSteppedUpdate = function(v24, _) --[[ Line: 78 ]] --[[ Name: RenderSteppedUpdate ]]
        v24.DidRenderStepped = true;
    end;
    beforeAll(function() --[[ Line: 82 ]]
        -- upvalues: v3 (ref)
        v3 = Instance.new("Folder");
        v3.Name = "KnitComponentTest";
        v3.Archivable = false;
        v3.Parent = workspace;
    end);
    afterEach(function() --[[ Line: 89 ]]
        -- upvalues: v3 (ref)
        v3:ClearAllChildren();
    end);
    afterAll(function() --[[ Line: 93 ]]
        -- upvalues: v3 (ref), v14 (copy)
        v3:Destroy();
        v14:Destroy();
    end);
    describe("Component", function() --[[ Line: 98 ]]
        -- upvalues: v14 (copy), l_CollectionService_0 (copy), v3 (ref), l_RunService_0 (copy), v0 (copy)
        it("should capture start and stop events", function() --[[ Line: 99 ]]
            -- upvalues: v14 (ref), l_CollectionService_0 (ref), v3 (ref)
            local v26 = 0;
            local v27 = 0;
            local v28 = v14.Started:Connect(function() --[[ Line: 102 ]]
                -- upvalues: v26 (ref)
                v26 = v26 + 1;
            end);
            local v29 = v14.Stopped:Connect(function() --[[ Line: 105 ]]
                -- upvalues: v27 (ref)
                v27 = v27 + 1;
            end);
            local l_Folder_1 = Instance.new("Folder");
            l_CollectionService_0:AddTag(l_Folder_1, "__KnitTestComponent__");
            l_Folder_1.Name = "ComponentTest";
            l_Folder_1.Archivable = false;
            l_Folder_1.Parent = v3;
            local l_l_Folder_1_0 = l_Folder_1;
            task.wait();
            l_l_Folder_1_0:Destroy();
            task.wait();
            v28:Disconnect();
            v29:Disconnect();
            expect(v26).to.equal(1);
            expect(v27).to.equal(1);
        end);
        it("should be able to get component from the instance", function() --[[ Line: 118 ]]
            -- upvalues: l_CollectionService_0 (ref), v3 (ref), v14 (ref)
            local l_Folder_2 = Instance.new("Folder");
            l_CollectionService_0:AddTag(l_Folder_2, "__KnitTestComponent__");
            l_Folder_2.Name = "ComponentTest";
            l_Folder_2.Archivable = false;
            l_Folder_2.Parent = v3;
            local l_l_Folder_2_0 = l_Folder_2;
            task.wait();
            l_Folder_2 = v14:FromInstance(l_l_Folder_2_0);
            expect(l_Folder_2).to.be.ok();
        end);
        it("should be able to get all component instances existing", function() --[[ Line: 125 ]]
            -- upvalues: l_CollectionService_0 (ref), v3 (ref), v14 (ref)
            local v34 = table.create(3);
            local l_Folder_3 = Instance.new("Folder");
            l_CollectionService_0:AddTag(l_Folder_3, "__KnitTestComponent__");
            l_Folder_3.Name = "ComponentTest";
            l_Folder_3.Archivable = false;
            l_Folder_3.Parent = v3;
            v34[1] = l_Folder_3;
            l_Folder_3 = Instance.new("Folder");
            l_CollectionService_0:AddTag(l_Folder_3, "__KnitTestComponent__");
            l_Folder_3.Name = "ComponentTest";
            l_Folder_3.Archivable = false;
            l_Folder_3.Parent = v3;
            v34[2] = l_Folder_3;
            l_Folder_3 = Instance.new("Folder");
            l_CollectionService_0:AddTag(l_Folder_3, "__KnitTestComponent__");
            l_Folder_3.Name = "ComponentTest";
            l_Folder_3.Archivable = false;
            l_Folder_3.Parent = v3;
            v34[3] = l_Folder_3;
            task.wait();
            local l_v14_All_0 = v14:GetAll();
            expect(l_v14_All_0).to.be.a("table");
            expect(#l_v14_All_0).to.equal(3);
            for _, v38 in ipairs(l_v14_All_0) do
                expect(table.find(v34, v38.Instance)).to.be.ok();
            end;
        end);
        it("should call lifecycle methods and extension functions", function() --[[ Line: 141 ]]
            -- upvalues: l_CollectionService_0 (ref), v3 (ref), v14 (ref), l_RunService_0 (ref)
            local l_Folder_4 = Instance.new("Folder");
            l_CollectionService_0:AddTag(l_Folder_4, "__KnitTestComponent__");
            l_Folder_4.Name = "ComponentTest";
            l_Folder_4.Archivable = false;
            l_Folder_4.Parent = v3;
            local l_l_Folder_4_0 = l_Folder_4;
            task.wait(0.2);
            l_Folder_4 = v14:FromInstance(l_l_Folder_4_0);
            expect(l_Folder_4).to.be.ok();
            expect(l_Folder_4.Data).to.equal("abcdef");
            expect(l_Folder_4.DidHeartbeat).to.equal(true);
            expect(l_Folder_4.DidStepped).to.equal(l_RunService_0:IsRunning());
            expect(l_Folder_4.DidRenderStepped).to.never.equal(true);
            l_l_Folder_4_0:Destroy();
            task.wait();
            expect(l_Folder_4.Data).to.equal("abcdefghi");
        end);
        it("should get another component linked to the same instance", function() --[[ Line: 155 ]]
            -- upvalues: l_CollectionService_0 (ref), v3 (ref), v14 (ref)
            local l_Folder_5 = Instance.new("Folder");
            l_CollectionService_0:AddTag(l_Folder_5, "__KnitTestComponent__");
            l_Folder_5.Name = "ComponentTest";
            l_Folder_5.Archivable = false;
            l_Folder_5.Parent = v3;
            local l_l_Folder_5_0 = l_Folder_5;
            task.wait();
            l_Folder_5 = v14:FromInstance(l_l_Folder_5_0);
            expect(l_Folder_5).to.be.ok();
            expect(l_Folder_5.Another).to.be.ok();
            expect(l_Folder_5.Another:GetData()).to.equal(true);
        end);
        it("should use extension to decide whether or not to construct", function() --[[ Line: 164 ]]
            -- upvalues: v0 (ref), l_CollectionService_0 (ref), v3 (ref)
            local v43 = {
                c = true
            };
            v43.ShouldConstruct = function(_) --[[ Line: 166 ]] --[[ Name: ShouldConstruct ]]
                -- upvalues: v43 (copy)
                return v43.c;
            end;
            local v45 = {
                c = true
            };
            v45.ShouldConstruct = function(_) --[[ Line: 171 ]] --[[ Name: ShouldConstruct ]]
                -- upvalues: v45 (copy)
                return v45.c;
            end;
            local v47 = {
                c = true
            };
            v47.ShouldConstruct = function(_) --[[ Line: 176 ]] --[[ Name: ShouldConstruct ]]
                -- upvalues: v47 (copy)
                return v47.c;
            end;
            local v49 = v0.new({
                Tag = "__KnitTestComponent__", 
                Extensions = {
                    v43
                }
            });
            local v50 = v0.new({
                Tag = "__KnitTestComponent__", 
                Extensions = {
                    v43, 
                    v45
                }
            });
            local v51 = v0.new({
                Tag = "__KnitTestComponent__", 
                Extensions = {
                    v43, 
                    v45, 
                    v47
                }
            });
            local function _(v52, v53, v54) --[[ Line: 184 ]] --[[ Name: SetE ]]
                -- upvalues: v43 (copy), v45 (copy), v47 (copy)
                v43.c = v52;
                v45.c = v53;
                v47.c = v54;
            end;
            local function v60(v56, v57, v58) --[[ Line: 190 ]] --[[ Name: Check ]]
                local v59 = v57:FromInstance(v56);
                if v58 then
                    expect(v59).to.be.ok();
                    return;
                else
                    expect(v59).to.never.be.ok();
                    return;
                end;
            end;
            local function _(v61, v62, v63) --[[ Line: 199 ]] --[[ Name: CreateAndCheckAll ]]
                -- upvalues: l_CollectionService_0 (ref), v3 (ref), v60 (copy), v49 (copy), v50 (copy), v51 (copy)
                local l_Folder_6 = Instance.new("Folder");
                l_CollectionService_0:AddTag(l_Folder_6, "__KnitTestComponent__");
                l_Folder_6.Name = "ComponentTest";
                l_Folder_6.Archivable = false;
                l_Folder_6.Parent = v3;
                local l_l_Folder_6_0 = l_Folder_6;
                task.wait();
                v60(l_l_Folder_6_0, v49, v61);
                v60(l_l_Folder_6_0, v50, v62);
                v60(l_l_Folder_6_0, v51, v63);
            end;
            v43.c = true;
            v45.c = true;
            v47.c = true;
            local l_Folder_7 = Instance.new("Folder");
            l_CollectionService_0:AddTag(l_Folder_7, "__KnitTestComponent__");
            l_Folder_7.Name = "ComponentTest";
            l_Folder_7.Archivable = false;
            l_Folder_7.Parent = v3;
            local l_l_Folder_7_0 = l_Folder_7;
            task.wait();
            v60(l_l_Folder_7_0, v49, true);
            v60(l_l_Folder_7_0, v50, true);
            v60(l_l_Folder_7_0, v51, true);
            v43.c = false;
            v45.c = false;
            v47.c = false;
            l_Folder_7 = Instance.new("Folder");
            l_CollectionService_0:AddTag(l_Folder_7, "__KnitTestComponent__");
            l_Folder_7.Name = "ComponentTest";
            l_Folder_7.Archivable = false;
            l_Folder_7.Parent = v3;
            l_l_Folder_7_0 = l_Folder_7;
            task.wait();
            v60(l_l_Folder_7_0, v49, false);
            v60(l_l_Folder_7_0, v50, false);
            v60(l_l_Folder_7_0, v51, false);
            v43.c = true;
            v45.c = false;
            v47.c = true;
            l_Folder_7 = Instance.new("Folder");
            l_CollectionService_0:AddTag(l_Folder_7, "__KnitTestComponent__");
            l_Folder_7.Name = "ComponentTest";
            l_Folder_7.Archivable = false;
            l_Folder_7.Parent = v3;
            l_l_Folder_7_0 = l_Folder_7;
            task.wait();
            v60(l_l_Folder_7_0, v49, true);
            v60(l_l_Folder_7_0, v50, false);
            v60(l_l_Folder_7_0, v51, false);
            v43.c = false;
            v45.c = false;
            v47.c = true;
            l_Folder_7 = Instance.new("Folder");
            l_CollectionService_0:AddTag(l_Folder_7, "__KnitTestComponent__");
            l_Folder_7.Name = "ComponentTest";
            l_Folder_7.Archivable = false;
            l_Folder_7.Parent = v3;
            l_l_Folder_7_0 = l_Folder_7;
            task.wait();
            v60(l_l_Folder_7_0, v49, false);
            v60(l_l_Folder_7_0, v50, false);
            v60(l_l_Folder_7_0, v51, false);
        end);
        it("should decide whether or not to use extend", function() --[[ Line: 224 ]]
            -- upvalues: v0 (ref), l_CollectionService_0 (ref), v3 (ref)
            local v69 = {
                extend = true
            };
            v69.ShouldExtend = function(_) --[[ Line: 226 ]] --[[ Name: ShouldExtend ]]
                -- upvalues: v69 (copy)
                return v69.extend;
            end;
            v69.Constructing = function(v71) --[[ Line: 229 ]] --[[ Name: Constructing ]]
                v71.E1 = true;
            end;
            local v72 = {
                extend = true
            };
            v72.ShouldExtend = function(_) --[[ Line: 234 ]] --[[ Name: ShouldExtend ]]
                -- upvalues: v72 (copy)
                return v72.extend;
            end;
            v72.Constructing = function(v74) --[[ Line: 237 ]] --[[ Name: Constructing ]]
                v74.E2 = true;
            end;
            local v75 = v0.new({
                Tag = "__KnitTestComponent__", 
                Extensions = {
                    v69, 
                    v72
                }
            });
            local function v80(v76, v77) --[[ Line: 243 ]] --[[ Name: SetAndCheck ]]
                -- upvalues: v69 (copy), v72 (copy), l_CollectionService_0 (ref), v3 (ref), v75 (copy)
                v69.extend = v76;
                v72.extend = v77;
                local l_Folder_8 = Instance.new("Folder");
                l_CollectionService_0:AddTag(l_Folder_8, "__KnitTestComponent__");
                l_Folder_8.Name = "ComponentTest";
                l_Folder_8.Archivable = false;
                l_Folder_8.Parent = v3;
                local l_l_Folder_8_0 = l_Folder_8;
                task.wait();
                l_Folder_8 = v75:FromInstance(l_l_Folder_8_0);
                expect(l_Folder_8).to.be.ok();
                if v76 then
                    expect(l_Folder_8.E1).to.equal(true);
                else
                    expect(l_Folder_8.E1).to.never.be.ok();
                end;
                if v77 then
                    expect(l_Folder_8.E2).to.equal(true);
                    return;
                else
                    expect(l_Folder_8.E2).to.never.be.ok();
                    return;
                end;
            end;
            v80(true, true);
            v80(false, false);
            v80(true, false);
            v80(false, true);
        end);
        it("should allow yielding within construct", function() --[[ Line: 268 ]]
            -- upvalues: v0 (ref), l_CollectionService_0 (ref)
            local v81 = v0.new({
                Tag = "CustomTag"
            });
            local v82 = 0;
            v81.Construct = function(_) --[[ Line: 275 ]] --[[ Name: Construct ]]
                -- upvalues: v82 (ref)
                v82 = v82 + 1;
                task.wait(0.5);
            end;
            local l_Part_0 = Instance.new("Part");
            l_Part_0.Anchored = true;
            l_Part_0.Parent = game:GetService("ReplicatedStorage");
            l_CollectionService_0:AddTag(l_Part_0, "CustomTag");
            local v85 = l_Part_0:Clone();
            v85.Parent = workspace;
            task.wait(0.6);
            expect(v82).to.equal(1);
            l_Part_0:Destroy();
            v85:Destroy();
        end);
        it("should wait for instance", function() --[[ Line: 294 ]]
            -- upvalues: l_CollectionService_0 (ref), v14 (ref)
            local l_Part_1 = Instance.new("Part");
            l_Part_1.Anchored = true;
            l_Part_1.Parent = workspace;
            task.delay(0.1, function() --[[ Line: 298 ]]
                -- upvalues: l_CollectionService_0 (ref), l_Part_1 (copy)
                l_CollectionService_0:AddTag(l_Part_1, "__KnitTestComponent__");
            end);
            local v87, v88 = v14:WaitForInstance(l_Part_1):timeout(1):await();
            expect(v87).to.equal(true);
            expect(v88).to.be.a("table");
            expect(v88.Instance).to.equal(l_Part_1);
            l_Part_1:Destroy();
        end);
    end);
end;