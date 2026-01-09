return function() --[[ Line: 1 ]]
    local v0 = require(script.Parent);
    describe("Timer", function() --[[ Line: 4 ]]
        -- upvalues: v0 (copy)
        local v1 = nil;
        beforeEach(function() --[[ Line: 7 ]]
            -- upvalues: v1 (ref), v0 (ref)
            v1 = v0.new(0.1);
            v1.TimeFunction = os.clock;
        end);
        afterEach(function() --[[ Line: 12 ]]
            -- upvalues: v1 (ref)
            if v1 then
                v1:Destroy();
                v1 = nil;
            end;
        end);
        it("should create a new timer", function() --[[ Line: 19 ]]
            -- upvalues: v0 (ref), v1 (ref)
            expect(v0.Is(v1)).to.equal(true);
        end);
        it("should tick appropriately", function() --[[ Line: 23 ]]
            -- upvalues: v1 (ref)
            local v2 = os.clock();
            v1:Start();
            v1.Tick:Wait();
            local v3 = os.clock() - v2;
            expect(v3).to.be.near(v3, 0.02);
        end);
        it("should start immediately", function() --[[ Line: 31 ]]
            -- upvalues: v1 (ref)
            local v4 = os.clock();
            local v5 = nil;
            v1.Tick:Connect(function() --[[ Line: 34 ]]
                -- upvalues: v5 (ref)
                if not v5 then
                    v5 = os.clock();
                end;
            end);
            v1:StartNow();
            v1.Tick:Wait();
            expect(v5).to.be.a("number");
            local v6 = v5 - v4;
            expect(v6).to.be.near(0, 0.02);
        end);
        it("should stop", function() --[[ Line: 46 ]]
            -- upvalues: v1 (ref)
            local v7 = 0;
            v1.Tick:Connect(function() --[[ Line: 48 ]]
                -- upvalues: v7 (ref)
                v7 = v7 + 1;
            end);
            v1:StartNow();
            v1:Stop();
            task.wait(1);
            expect(v7).to.equal(1);
        end);
        it("should detect if running", function() --[[ Line: 57 ]]
            -- upvalues: v1 (ref)
            expect(v1:IsRunning()).to.equal(false);
            v1:Start();
            expect(v1:IsRunning()).to.equal(true);
            v1:Stop();
            expect(v1:IsRunning()).to.equal(false);
            v1:StartNow();
            expect(v1:IsRunning()).to.equal(true);
            v1:Stop();
            expect(v1:IsRunning()).to.equal(false);
        end);
    end);
end;