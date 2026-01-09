local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.TblUtil);
return function() --[[ Line: 7 ]]
    -- upvalues: v1 (copy)
    describe("GreedyMesh2D", function() --[[ Line: 8 ]]
        -- upvalues: v1 (ref)
        it("should find a single large rectangle in a full grid", function() --[[ Line: 9 ]]
            -- upvalues: v1 (ref)
            local v2 = v1.GreedyMesh2D({
                {
                    true, 
                    true, 
                    true
                }, 
                {
                    true, 
                    true, 
                    true
                }, 
                {
                    true, 
                    true, 
                    true
                }
            });
            expect(#v2).to.equal(1);
            expect(v2[1].Position).to.equal(Vector2.new(1, 1));
            expect(v2[1].Size).to.equal(Vector2.new(3, 3));
        end);
        it("should find two separate rectangles", function() --[[ Line: 23 ]]
            -- upvalues: v1 (ref)
            local v3 = v1.GreedyMesh2D({
                {
                    true, 
                    true, 
                    false, 
                    false
                }, 
                {
                    true, 
                    true, 
                    false, 
                    false
                }, 
                {
                    false, 
                    false, 
                    true, 
                    true
                }, 
                {
                    false, 
                    false, 
                    true, 
                    true
                }
            });
            expect(#v3).to.equal(2);
            expect(v3[1].Position).to.equal(Vector2.new(1, 1));
            expect(v3[1].Size).to.equal(Vector2.new(2, 2));
            expect(v3[2].Position).to.equal(Vector2.new(3, 3));
            expect(v3[2].Size).to.equal(Vector2.new(2, 2));
        end);
        it("should correctly handle a non-rectangular shape", function() --[[ Line: 44 ]]
            -- upvalues: v1 (ref)
            local v4 = v1.GreedyMesh2D({
                {
                    true, 
                    true, 
                    false
                }, 
                {
                    true, 
                    false, 
                    false
                }, 
                {
                    true, 
                    true, 
                    true
                }
            });
            expect(#v4).to.be.greaterThanOrEqual(2);
        end);
        it("should return an empty array for an empty grid", function() --[[ Line: 56 ]]
            -- upvalues: v1 (ref)
            local v5 = v1.GreedyMesh2D({
                {
                    false, 
                    false
                }, 
                {
                    false, 
                    false
                }
            });
            expect(#v5).to.equal(0);
        end);
        it("should respect the isValid callback function", function() --[[ Line: 67 ]]
            -- upvalues: v1 (ref)
            local v7 = v1.GreedyMesh2D({
                {
                    1, 
                    2, 
                    0
                }, 
                {
                    1, 
                    0, 
                    0
                }, 
                {
                    1, 
                    2, 
                    2
                }
            }, function(v6) --[[ Line: 74 ]]
                return v6 > 1;
            end);
            expect(#v7).to.equal(1);
            expect(v7[1].Position).to.equal(Vector2.new(3, 2));
            expect(v7[1].Size).to.equal(Vector2.new(2, 2));
        end);
    end);
end;