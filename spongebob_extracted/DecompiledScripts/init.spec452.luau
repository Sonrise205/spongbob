return function() --[[ Line: 1 ]]
    local v0 = require(script.Parent);
    describe("Constructor", function() --[[ Line: 4 ]]
        -- upvalues: v0 (copy)
        it("should create a new symbol", function() --[[ Line: 5 ]]
            -- upvalues: v0 (ref)
            local v1 = v0("Test");
            expect(v1).to.be.a("userdata");
            expect(v1 == v1).to.equal(true);
            expect((tostring(v1))).to.equal("Symbol(Test)");
        end);
        it("should create a new symbol with no name", function() --[[ Line: 12 ]]
            -- upvalues: v0 (ref)
            local v2 = v0();
            expect(v2).to.be.a("userdata");
            expect(v2 == v2).to.equal(true);
            expect((tostring(v2))).to.equal("Symbol()");
        end);
        it("should be unique regardless of the name", function() --[[ Line: 19 ]]
            -- upvalues: v0 (ref)
            expect(v0("Test") == v0("Test")).to.equal(false);
            expect(v0() == v0()).to.equal(false);
            expect(v0("Test") == v0()).to.equal(false);
            expect(v0("Test1") == v0("Test2")).to.equal(false);
        end);
        it("should be useable as a table key", function() --[[ Line: 26 ]]
            -- upvalues: v0 (ref)
            local v3 = v0();
            local v4 = {
                [v3] = 100
            };
            expect(v4[v3]).to.equal(100);
        end);
    end);
end;