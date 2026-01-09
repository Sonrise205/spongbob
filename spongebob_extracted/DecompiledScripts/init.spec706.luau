local l_RunService_0 = game:GetService("RunService");
local function v3(v1) --[[ Line: 3 ]] --[[ Name: AwaitStop ]]
    local v2 = os.clock();
    v1:Update();
    while v1:IsShaking() do
        task.wait();
        v1:Update();
    end;
    return os.clock() - v2;
end;
return function() --[[ Line: 13 ]]
    -- upvalues: v3 (copy), l_RunService_0 (copy)
    local v4 = require(script.Parent);
    describe("Construct", function() --[[ Line: 16 ]]
        -- upvalues: v4 (copy)
        it("should construct a new shake instance", function() --[[ Line: 17 ]]
            -- upvalues: v4 (ref)
            expect(function() --[[ Line: 18 ]]
                -- upvalues: v4 (ref)
                local _ = v4.new();
            end).to.never.throw();
        end);
    end);
    describe("Static Functions", function() --[[ Line: 24 ]]
        -- upvalues: v4 (copy)
        it("should get next render name", function() --[[ Line: 25 ]]
            -- upvalues: v4 (ref)
            local v6 = v4.NextRenderName();
            local v7 = v4.NextRenderName();
            local v8 = v4.NextRenderName();
            expect(v6).to.be.a("string");
            expect(v7).to.be.a("string");
            expect(v8).to.be.a("string");
            expect(v6).to.never.equal(v7);
            expect(v7).to.never.equal(v8);
            expect(v8).to.never.equal(v6);
        end);
        it("should perform inverse square", function() --[[ Line: 37 ]]
            -- upvalues: v4 (ref)
            local v9 = v4.InverseSquare(Vector3.new(10, 10, 10, 0), 10);
            expect((typeof(v9))).to.equal("Vector3");
            expect(v9).to.equal((Vector3.new(0.09999999403953552, 0.09999999403953552, 0.09999999403953552, 0)));
        end);
    end);
    describe("Cloning", function() --[[ Line: 48 ]]
        -- upvalues: v4 (copy)
        it("should clone a shake instance", function() --[[ Line: 49 ]]
            -- upvalues: v4 (ref)
            local v10 = v4.new();
            v10.Amplitude = 5;
            v10.Frequency = 2;
            v10.FadeInTime = 3;
            v10.FadeOutTime = 4;
            v10.SustainTime = 6;
            v10.Sustain = true;
            v10.PositionInfluence = Vector3.new(1, 2, 3, 0);
            v10.RotationInfluence = Vector3.new(3, 2, 1, 0);
            v10.TimeFunction = function() --[[ Line: 59 ]]
                return os.clock();
            end;
            local v11 = v10:Clone();
            expect(v11).to.be.a("table");
            expect((getmetatable(v11))).to.equal(v4);
            expect(v11).to.never.equal(v10);
            for _, v13 in ipairs({
                "Amplitude", 
                "Frequency", 
                "FadeInTime", 
                "FadeOutTime", 
                "SustainTime", 
                "Sustain", 
                "PositionInfluence", 
                "RotationInfluence", 
                "TimeFunction"
            }) do
                expect(v10[v13]).to.equal(v11[v13]);
            end;
        end);
        it("should clone a shake instance but ignore running state", function() --[[ Line: 82 ]]
            -- upvalues: v4 (ref)
            local v14 = v4.new();
            v14:Start();
            local v15 = v14:Clone();
            expect(v14:IsShaking()).to.equal(true);
            expect(v15:IsShaking()).to.equal(false);
        end);
    end);
    describe("Shaking", function() --[[ Line: 91 ]]
        -- upvalues: v4 (copy), v3 (ref), l_RunService_0 (ref)
        it("should start", function() --[[ Line: 92 ]]
            -- upvalues: v4 (ref)
            local v16 = v4.new();
            expect(v16:IsShaking()).to.equal(false);
            v16:Start();
            expect(v16:IsShaking()).to.equal(true);
        end);
        it("should stop", function() --[[ Line: 99 ]]
            -- upvalues: v4 (ref)
            local v17 = v4.new();
            v17:Start();
            expect(v17:IsShaking()).to.equal(true);
            v17:Stop();
            expect(v17:IsShaking()).to.equal(false);
        end);
        it("should shake for nearly no time", function() --[[ Line: 107 ]]
            -- upvalues: v4 (ref), v3 (ref)
            local v18 = v4.new();
            v18.FadeInTime = 0;
            v18.FadeOutTime = 0;
            v18.SustainTime = 0;
            v18:Start();
            local v19 = v3(v18);
            expect(v19).to.be.near(0, 0.05);
        end);
        it("should shake for fade in time", function() --[[ Line: 117 ]]
            -- upvalues: v4 (ref), v3 (ref)
            local v20 = v4.new();
            v20.FadeInTime = 0.1;
            v20.FadeOutTime = 0;
            v20.SustainTime = 0;
            v20:Start();
            local v21 = v3(v20);
            expect(v21).to.be.near(0.1, 0.05);
        end);
        it("should shake for fade out time", function() --[[ Line: 127 ]]
            -- upvalues: v4 (ref), v3 (ref)
            local v22 = v4.new();
            v22.FadeInTime = 0;
            v22.FadeOutTime = 0.1;
            v22.SustainTime = 0;
            v22:Start();
            local v23 = v3(v22);
            expect(v23).to.be.near(0.1, 0.05);
        end);
        it("should shake for sustain time", function() --[[ Line: 137 ]]
            -- upvalues: v4 (ref), v3 (ref)
            local v24 = v4.new();
            v24.FadeInTime = 0;
            v24.FadeOutTime = 0;
            v24.SustainTime = 0.1;
            v24:Start();
            local v25 = v3(v24);
            expect(v25).to.be.near(0.1, 0.05);
        end);
        it("should shake for fade in and sustain time", function() --[[ Line: 147 ]]
            -- upvalues: v4 (ref), v3 (ref)
            local v26 = v4.new();
            v26.FadeInTime = 0.1;
            v26.FadeOutTime = 0;
            v26.SustainTime = 0.1;
            v26:Start();
            local v27 = v3(v26);
            expect(v27).to.be.near(0.2, 0.05);
        end);
        it("should shake for fade out and sustain time", function() --[[ Line: 157 ]]
            -- upvalues: v4 (ref), v3 (ref)
            local v28 = v4.new();
            v28.FadeInTime = 0;
            v28.FadeOutTime = 0.1;
            v28.SustainTime = 0.1;
            v28:Start();
            local v29 = v3(v28);
            expect(v29).to.be.near(0.2, 0.05);
        end);
        it("should shake for fade in and fade out time", function() --[[ Line: 167 ]]
            -- upvalues: v4 (ref), v3 (ref)
            local v30 = v4.new();
            v30.FadeInTime = 0.1;
            v30.FadeOutTime = 0.1;
            v30.SustainTime = 0;
            v30:Start();
            local v31 = v3(v30);
            expect(v31).to.be.near(0.2, 0.05);
        end);
        it("should shake for fading and sustain time", function() --[[ Line: 177 ]]
            -- upvalues: v4 (ref), v3 (ref)
            local v32 = v4.new();
            v32.FadeInTime = 0.1;
            v32.FadeOutTime = 0.1;
            v32.SustainTime = 0.1;
            v32:Start();
            local v33 = v3(v32);
            expect(v33).to.be.near(0.3, 0.05);
        end);
        it("should shake indefinitely", function() --[[ Line: 187 ]]
            -- upvalues: v4 (ref), v3 (ref)
            local v34 = v4.new();
            v34.FadeInTime = 0;
            v34.FadeOutTime = 0;
            v34.SustainTime = 0;
            v34.Sustain = true;
            v34:Start();
            task.delay(0.1, function() --[[ Line: 195 ]]
                -- upvalues: v34 (copy)
                v34:StopSustain();
            end);
            local v35 = v3(v34);
            expect(v35).to.be.near(0.1, 0.05);
        end);
        it("should shake indefinitely and fade out", function() --[[ Line: 202 ]]
            -- upvalues: v4 (ref), v3 (ref)
            local v36 = v4.new();
            v36.FadeInTime = 0;
            v36.FadeOutTime = 0.1;
            v36.SustainTime = 0;
            v36.Sustain = true;
            v36:Start();
            task.delay(0.1, function() --[[ Line: 210 ]]
                -- upvalues: v36 (copy)
                v36:StopSustain();
            end);
            local v37 = v3(v36);
            expect(v37).to.be.near(0.2, 0.05);
        end);
        it("should shake indefinitely and fade out with fade in time", function() --[[ Line: 217 ]]
            -- upvalues: v4 (ref), v3 (ref)
            local v38 = v4.new();
            v38.FadeInTime = 0.1;
            v38.FadeOutTime = 0.1;
            v38.SustainTime = 0;
            v38.Sustain = true;
            v38:Start();
            task.delay(0.3, function() --[[ Line: 225 ]]
                -- upvalues: v38 (copy)
                v38:StopSustain();
            end);
            local v39 = v3(v38);
            expect(v39).to.be.near(0.4, 0.05);
        end);
        it("should connect to signal", function() --[[ Line: 232 ]]
            -- upvalues: v4 (ref), l_RunService_0 (ref), v3 (ref)
            local v40 = v4.new();
            v40.SustainTime = 0.1;
            v40:Start();
            local v41 = false;
            local v42 = v40:OnSignal(l_RunService_0.Heartbeat, function() --[[ Line: 237 ]]
                -- upvalues: v41 (ref)
                v41 = true;
            end);
            expect((typeof(v42))).to.equal("RBXScriptConnection");
            expect(v42.Connected).to.equal(true);
            v3(v40);
            expect(v41).to.equal(true);
            expect(v42.Connected).to.equal(false);
        end);
        it("should bind to render step", function() --[[ Line: 247 ]]
            -- upvalues: v4 (ref), v3 (ref)
            local v43 = v4.new();
            v43.SustainTime = 0.1;
            v43:Start();
            local v44 = false;
            v43:BindToRenderStep("ShakeTest", Enum.RenderPriority.Last.Value, function() --[[ Line: 252 ]]
                -- upvalues: v44 (ref)
                v44 = true;
            end);
            v3(v43);
            expect(v44).to.equal(true);
        end);
    end);
end;