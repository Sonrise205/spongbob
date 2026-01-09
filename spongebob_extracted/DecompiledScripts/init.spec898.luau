return function() --[[ Line: 1 ]]
    local v0 = require(script.Parent);
    local v1 = nil;
    local v2 = nil;
    local v3 = nil;
    beforeEach(function() --[[ Line: 6 ]]
        -- upvalues: v1 (ref), v0 (copy), v2 (ref), v3 (ref)
        v1 = v0.new({
            Kills = 0, 
            Deaths = 0
        }, {
            SetKills = function(v4, v5) --[[ Line: 11 ]] --[[ Name: SetKills ]]
                v4.Kills = v5;
            end, 
            IncrementDeaths = function(v6, v7) --[[ Line: 14 ]] --[[ Name: IncrementDeaths ]]
                v6.Deaths = v6.Deaths + v7;
            end
        });
        v2 = v0.new({
            Money = 0
        }, {
            AddMoney = function(v8, v9) --[[ Line: 21 ]] --[[ Name: AddMoney ]]
                v8.Money = v8.Money + v9;
            end
        });
        v3 = v0.combine({
            Stats = v1, 
            Econ = v2
        });
    end);
    describe("State", function() --[[ Line: 31 ]]
        -- upvalues: v0 (copy), v3 (ref), v1 (ref), v2 (ref)
        it("should get state properly", function() --[[ Line: 32 ]]
            -- upvalues: v0 (ref)
            local l_State_0 = v0.new({
                ABC = 10
            }):GetState();
            expect(l_State_0).to.be.a("table");
            expect(l_State_0.ABC).to.equal(10);
        end);
        it("should get state from combined silos", function() --[[ Line: 41 ]]
            -- upvalues: v3 (ref)
            local l_v3_State_0 = v3:GetState();
            expect(l_v3_State_0).to.be.a("table");
            expect(l_v3_State_0.Stats).to.be.a("table");
            expect(l_v3_State_0.Econ).to.be.a("table");
            expect(l_v3_State_0.Stats.Kills).to.be.a("number");
            expect(l_v3_State_0.Stats.Deaths).to.be.a("number");
            expect(l_v3_State_0.Econ.Money).to.be.a("number");
        end);
        it("should not allow getting state from sub-silo", function() --[[ Line: 51 ]]
            -- upvalues: v1 (ref), v2 (ref)
            expect(function() --[[ Line: 52 ]]
                -- upvalues: v1 (ref)
                v1:GetState();
            end).to.throw();
            expect(function() --[[ Line: 55 ]]
                -- upvalues: v2 (ref)
                v2:GetState();
            end).to.throw();
        end);
        it("should throw error if attempting to modify state directly", function() --[[ Line: 60 ]]
            -- upvalues: v3 (ref)
            expect(function() --[[ Line: 61 ]]
                -- upvalues: v3 (ref)
                v3:GetState().Stats.Kills = 10;
            end).to.throw();
            expect(function() --[[ Line: 64 ]]
                -- upvalues: v3 (ref)
                v3:GetState().Stats.SomethingNew = 100;
            end).to.throw();
            expect(function() --[[ Line: 67 ]]
                -- upvalues: v3 (ref)
                v3:GetState().Stats = {};
            end).to.throw();
            expect(function() --[[ Line: 70 ]]
                -- upvalues: v3 (ref)
                v3:GetState().SomethingElse = {};
            end).to.throw();
        end);
    end);
    describe("Dispatch", function() --[[ Line: 76 ]]
        -- upvalues: v3 (ref), v1 (ref), v2 (ref), v0 (copy)
        it("should dispatch", function() --[[ Line: 77 ]]
            -- upvalues: v3 (ref), v1 (ref), v2 (ref)
            expect(v3:GetState().Stats.Kills).to.equal(0);
            v3:Dispatch(v1.Actions.SetKills(10));
            expect(v3:GetState().Stats.Kills).to.equal(10);
            v3:Dispatch(v2.Actions.AddMoney(10));
            v3:Dispatch(v2.Actions.AddMoney(20));
            expect(v3:GetState().Econ.Money).to.equal(30);
        end);
        it("should not allow dispatching from a sub-silo", function() --[[ Line: 86 ]]
            -- upvalues: v1 (ref), v2 (ref)
            expect(function() --[[ Line: 87 ]]
                -- upvalues: v1 (ref)
                v1:Dispatch(v1.Action.SetKills(0));
            end).to.throw();
            expect(function() --[[ Line: 90 ]]
                -- upvalues: v2 (ref)
                v2:Dispatch(v2.Action.AddMoney(0));
            end).to.throw();
        end);
        it("should not allow dispatching from within a modifier", function() --[[ Line: 95 ]]
            -- upvalues: v0 (ref)
            expect(function() --[[ Line: 96 ]]
                -- upvalues: v0 (ref)
                local v12 = nil;
                v12 = v0.new({
                    Data = 0
                }, {
                    SetData = function(v13, v14) --[[ Line: 101 ]] --[[ Name: SetData ]]
                        -- upvalues: v12 (ref)
                        v13.Data = v14;
                        v12:Dispatch({
                            Name = "", 
                            Payload = 0
                        });
                    end
                });
                local l_SetData_0 = v12.Actions.SetData;
                v12:Dispatch(l_SetData_0(0));
            end).to.throw();
        end);
    end);
    describe("Subscribe", function() --[[ Line: 111 ]]
        -- upvalues: v3 (ref), v1 (ref), v0 (copy)
        it("should subscribe to a silo", function() --[[ Line: 112 ]]
            -- upvalues: v3 (ref), v1 (ref)
            local v16 = nil;
            local v17 = nil;
            local v18 = 0;
            local v21 = v3:Subscribe(function(v19, v20) --[[ Line: 115 ]]
                -- upvalues: v18 (ref), v16 (ref), v17 (ref)
                v18 = v18 + 1;
                v16 = v19;
                v17 = v20;
            end);
            expect(v18).to.equal(0);
            v3:Dispatch(v1.Actions.SetKills(10));
            expect(v18).to.equal(1);
            expect(v16).to.be.a("table");
            expect(v17).to.be.a("table");
            expect(v16.Stats.Kills).to.equal(10);
            expect(v17.Stats.Kills).to.equal(0);
            v3:Dispatch(v1.Actions.SetKills(20));
            expect(v18).to.equal(2);
            expect(v16.Stats.Kills).to.equal(20);
            expect(v17.Stats.Kills).to.equal(10);
            v21();
            v3:Dispatch(v1.Actions.SetKills(30));
            expect(v18).to.equal(2);
        end);
        it("should not allow subscribing same function more than once", function() --[[ Line: 135 ]]
            -- upvalues: v3 (ref)
            local function v22() --[[ Line: 136 ]] --[[ Name: sub ]]

            end;
            expect(function() --[[ Line: 137 ]]
                -- upvalues: v3 (ref), v22 (copy)
                v3:Subscribe(v22);
            end).never.to.throw();
            expect(function() --[[ Line: 140 ]]
                -- upvalues: v3 (ref), v22 (copy)
                v3:Subscribe(v22);
            end).to.throw();
        end);
        it("should not allow subscribing to a sub-silo", function() --[[ Line: 145 ]]
            -- upvalues: v1 (ref)
            expect(function() --[[ Line: 146 ]]
                -- upvalues: v1 (ref)
                v1:Subscribe(function() --[[ Line: 147 ]]

                end);
            end).to.throw();
        end);
        it("should not allow subscribing from within a modifier", function() --[[ Line: 151 ]]
            -- upvalues: v0 (ref)
            expect(function() --[[ Line: 152 ]]
                -- upvalues: v0 (ref)
                local v23 = nil;
                v23 = v0.new({
                    Data = 0
                }, {
                    SetData = function(v24, v25) --[[ Line: 157 ]] --[[ Name: SetData ]]
                        -- upvalues: v23 (ref)
                        v24.Data = v25;
                        v23:Subscribe(function() --[[ Line: 159 ]]

                        end);
                    end
                });
                local l_SetData_1 = v23.Actions.SetData;
                v23:Dispatch(l_SetData_1(0));
            end).to.throw();
        end);
    end);
    describe("Watch", function() --[[ Line: 167 ]]
        -- upvalues: v3 (ref), v2 (ref), v1 (ref)
        it("should watch value changes", function() --[[ Line: 168 ]]
            -- upvalues: v3 (ref), v2 (ref), v1 (ref)
            local function v28(v27) --[[ Line: 169 ]] --[[ Name: SelectMoney ]]
                return v27.Econ.Money;
            end;
            local v29 = 0;
            local v30 = 0;
            local v32 = v3:Watch(v28, function(v31) --[[ Line: 174 ]]
                -- upvalues: v29 (ref), v30 (ref)
                v29 = v29 + 1;
                v30 = v31;
            end);
            expect(v29).to.equal(1);
            v3:Dispatch(v2.Actions.AddMoney(10));
            expect(v29).to.equal(2);
            expect(v30).to.equal(10);
            v3:Dispatch(v2.Actions.AddMoney(20));
            expect(v29).to.equal(3);
            expect(v30).to.equal(30);
            v3:Dispatch(v2.Actions.AddMoney(0));
            expect(v29).to.equal(3);
            expect(v30).to.equal(30);
            v3:Dispatch(v1.Actions.SetKills(10));
            expect(v29).to.equal(3);
            expect(v30).to.equal(30);
            v32();
            v3:Dispatch(v2.Actions.AddMoney(10));
            expect(v29).to.equal(3);
            expect(v30).to.equal(30);
        end);
    end);
    describe("ResetToDefaultState", function() --[[ Line: 198 ]]
        -- upvalues: v3 (ref), v1 (ref), v2 (ref)
        it("should reset the silo to it's default state", function() --[[ Line: 199 ]]
            -- upvalues: v3 (ref), v1 (ref), v2 (ref)
            v3:Dispatch(v1.Actions.SetKills(10));
            v3:Dispatch(v2.Actions.AddMoney(30));
            expect(v3:GetState().Stats.Kills).to.equal(10);
            expect(v3:GetState().Econ.Money).to.equal(30);
            v3:ResetToDefaultState();
            expect(v3:GetState().Stats.Kills).to.equal(0);
            expect(v3:GetState().Econ.Money).to.equal(0);
        end);
    end);
end;