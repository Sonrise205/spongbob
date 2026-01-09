return function() --[[ Line: 1 ]]
    local v0 = require(script.Parent);
    describe("Trove", function() --[[ Line: 4 ]]
        -- upvalues: v0 (copy)
        local v1 = nil;
        beforeEach(function() --[[ Line: 7 ]]
            -- upvalues: v1 (ref), v0 (ref)
            v1 = v0.new();
        end);
        afterEach(function() --[[ Line: 11 ]]
            -- upvalues: v1 (ref)
            if v1 then
                v1:Destroy();
                v1 = nil;
            end;
        end);
        it("should add and clean up roblox instance", function() --[[ Line: 18 ]]
            -- upvalues: v1 (ref)
            local l_Part_0 = Instance.new("Part");
            l_Part_0.Parent = workspace;
            v1:Add(l_Part_0);
            v1:Destroy();
            expect(l_Part_0.Parent).to.equal(nil);
        end);
        it("should add and clean up roblox connection", function() --[[ Line: 26 ]]
            -- upvalues: v1 (ref)
            local v3 = workspace.Changed:Connect(function() --[[ Line: 27 ]]

            end);
            v1:Add(v3);
            v1:Destroy();
            expect(v3.Connected).to.equal(false);
        end);
        it("should add and clean up a table with a destroy method", function() --[[ Line: 33 ]]
            -- upvalues: v1 (ref)
            local v5 = {
                Destroyed = false, 
                Destroy = function(v4) --[[ Line: 35 ]] --[[ Name: Destroy ]]
                    v4.Destroyed = true;
                end
            };
            v1:Add(v5);
            v1:Destroy();
            expect(v5.Destroyed).to.equal(true);
        end);
        it("should add and clean up a table with a disconnect method", function() --[[ Line: 43 ]]
            -- upvalues: v1 (ref)
            local v7 = {
                Connected = true, 
                Disconnect = function(v6) --[[ Line: 45 ]] --[[ Name: Disconnect ]]
                    v6.Connected = false;
                end
            };
            v1:Add(v7);
            v1:Destroy();
            expect(v7.Connected).to.equal(false);
        end);
        it("should add and clean up a function", function() --[[ Line: 53 ]]
            -- upvalues: v1 (ref)
            local v8 = false;
            v1:Add(function() --[[ Line: 55 ]]
                -- upvalues: v8 (ref)
                v8 = true;
            end);
            v1:Destroy();
            expect(v8).to.equal(true);
        end);
        it("should allow a custom cleanup method", function() --[[ Line: 62 ]]
            -- upvalues: v1 (ref)
            local v10 = {
                Cleaned = false, 
                Cleanup = function(v9) --[[ Line: 64 ]] --[[ Name: Cleanup ]]
                    v9.Cleaned = true;
                end
            };
            v1:Add(v10, "Cleanup");
            v1:Destroy();
            expect(v10.Cleaned).to.equal(true);
        end);
        it("should return the object passed to add", function() --[[ Line: 72 ]]
            -- upvalues: v1 (ref)
            local l_Part_1 = Instance.new("Part");
            local v12 = v1:Add(l_Part_1);
            expect(l_Part_1).to.equal(v12);
            v1:Destroy();
        end);
        it("should fail to add object without proper cleanup method", function() --[[ Line: 79 ]]
            -- upvalues: v1 (ref)
            local v13 = {};
            expect(function() --[[ Line: 81 ]]
                -- upvalues: v1 (ref), v13 (copy)
                v1:Add(v13);
            end).to.throw();
        end);
        it("should construct an object and add it", function() --[[ Line: 86 ]]
            -- upvalues: v1 (ref)
            local v14 = {};
            v14.__index = v14;
            v14.new = function(v15) --[[ Line: 89 ]] --[[ Name: new ]]
                -- upvalues: v14 (copy)
                local v16 = setmetatable({}, v14);
                v16._msg = v15;
                v16._destroyed = false;
                return v16;
            end;
            v14.Destroy = function(v17) --[[ Line: 95 ]] --[[ Name: Destroy ]]
                v17._destroyed = true;
            end;
            local v18 = v1:Construct(v14, "abc");
            expect((typeof(v18))).to.equal("table");
            expect((getmetatable(v18))).to.equal(v14);
            expect(v18._msg).to.equal("abc");
            expect(v18._destroyed).to.equal(false);
            v1:Destroy();
            expect(v18._destroyed).to.equal(true);
        end);
        it("should connect to a signal", function() --[[ Line: 108 ]]
            -- upvalues: v1 (ref)
            local v19 = v1:Connect(workspace.Changed, function() --[[ Line: 109 ]]

            end);
            expect((typeof(v19))).to.equal("RBXScriptConnection");
            expect(v19.Connected).to.equal(true);
            v1:Destroy();
            expect(v19.Connected).to.equal(false);
        end);
        it("should remove an object", function() --[[ Line: 116 ]]
            -- upvalues: v1 (ref)
            local v20 = v1:Connect(workspace.Changed, function() --[[ Line: 117 ]]

            end);
            expect(v1:Remove(v20)).to.equal(true);
            expect(v20.Connected).to.equal(false);
        end);
        it("should not remove an object not in the trove", function() --[[ Line: 122 ]]
            -- upvalues: v1 (ref)
            local v21 = workspace.Changed:Connect(function() --[[ Line: 123 ]]

            end);
            expect(v1:Remove(v21)).to.equal(false);
            expect(v21.Connected).to.equal(true);
            v21:Disconnect();
        end);
        it("should attach to instance", function() --[[ Line: 129 ]]
            -- upvalues: v1 (ref)
            local l_Part_2 = Instance.new("Part");
            l_Part_2.Parent = workspace;
            local v23 = v1:AttachToInstance(l_Part_2);
            expect(v23.Connected).to.equal(true);
            l_Part_2:Destroy();
            expect(v23.Connected).to.equal(false);
        end);
        it("should fail to attach to instance not in hierarchy", function() --[[ Line: 138 ]]
            -- upvalues: v1 (ref)
            local l_Part_3 = Instance.new("Part");
            expect(function() --[[ Line: 140 ]]
                -- upvalues: v1 (ref), l_Part_3 (copy)
                v1:AttachToInstance(l_Part_3);
            end).to.throw();
        end);
        it("should extend itself", function() --[[ Line: 145 ]]
            -- upvalues: v1 (ref), v0 (ref)
            local v25 = v1:Extend();
            local v26 = false;
            v25:Add(function() --[[ Line: 148 ]]
                -- upvalues: v26 (ref)
                v26 = true;
            end);
            expect(v25).to.be.a("table");
            expect((getmetatable(v25))).to.equal(v0);
            v1:Clean();
            expect(v26).to.equal(true);
        end);
        it("should clone an instance", function() --[[ Line: 157 ]]
            -- upvalues: v1 (ref)
            local v27 = v1:Construct(Instance.new, "Part");
            v27.Name = "TroveCloneTest";
            local v28 = v1:Clone(v27);
            expect((typeof(v28))).to.equal("Instance");
            expect(v28).to.never.equal(v27);
            expect(v28.Name).to.equal("TroveCloneTest");
            expect(v27.Name).to.equal(v28.Name);
        end);
        it("should clean up a thread", function() --[[ Line: 168 ]]
            -- upvalues: v1 (ref)
            local v29 = coroutine.create(function() --[[ Line: 169 ]]

            end);
            v1:Add(v29);
            expect(coroutine.status(v29)).to.equal("suspended");
            v1:Clean();
            expect(coroutine.status(v29)).to.equal("dead");
        end);
        it("should not allow objects added during cleanup", function() --[[ Line: 176 ]]
            -- upvalues: v1 (ref)
            expect(function() --[[ Line: 177 ]]
                -- upvalues: v1 (ref)
                v1:Add(function() --[[ Line: 178 ]]
                    -- upvalues: v1 (ref)
                    v1:Add(function() --[[ Line: 179 ]]

                    end);
                end);
                v1:Clean();
            end).to.throw();
        end);
        it("should not allow objects to be removed during cleanup", function() --[[ Line: 185 ]]
            -- upvalues: v1 (ref)
            expect(function() --[[ Line: 186 ]]
                -- upvalues: v1 (ref)
                local function v30() --[[ Line: 187 ]]

                end;
                v1:Add(v30);
                v1:Add(function() --[[ Line: 189 ]]
                    -- upvalues: v1 (ref), v30 (copy)
                    v1:Remove(v30);
                end);
                v1:Clean();
            end).to.throw();
        end);
    end);
end;