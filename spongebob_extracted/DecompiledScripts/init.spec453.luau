return function() --[[ Line: 1 ]]
    local v0 = require(script.Parent);
    describe("Some", function() --[[ Line: 4 ]]
        -- upvalues: v0 (copy)
        it("should create some option", function() --[[ Line: 5 ]]
            -- upvalues: v0 (ref)
            local v1 = v0.Some(true);
            expect(v1:IsSome()).to.equal(true);
        end);
        it("should fail to create some option with nil", function() --[[ Line: 10 ]]
            -- upvalues: v0 (ref)
            expect(function() --[[ Line: 11 ]]
                -- upvalues: v0 (ref)
                v0.Some(nil);
            end).to.throw();
        end);
        it("should not be none", function() --[[ Line: 16 ]]
            -- upvalues: v0 (ref)
            local v2 = v0.Some(10);
            expect(v2:IsNone()).to.equal(false);
        end);
    end);
    describe("None", function() --[[ Line: 22 ]]
        -- upvalues: v0 (copy)
        it("should be able to reference none", function() --[[ Line: 23 ]]
            -- upvalues: v0 (ref)
            expect(function() --[[ Line: 24 ]]
                -- upvalues: v0 (ref)
                local _ = v0.None;
            end).never.to.throw();
        end);
        it("should be able to check if none", function() --[[ Line: 29 ]]
            -- upvalues: v0 (ref)
            local l_None_1 = v0.None;
            expect(l_None_1:IsNone()).to.equal(true);
        end);
        it("should be able to check if not some", function() --[[ Line: 34 ]]
            -- upvalues: v0 (ref)
            local l_None_2 = v0.None;
            expect(l_None_2:IsSome()).to.equal(false);
        end);
    end);
    describe("Equality", function() --[[ Line: 40 ]]
        -- upvalues: v0 (copy)
        it("should equal the same some from same options", function() --[[ Line: 41 ]]
            -- upvalues: v0 (ref)
            local v6 = v0.Some(32);
            expect(v6).to.equal(v6);
        end);
        it("should equal the same some from different options", function() --[[ Line: 46 ]]
            -- upvalues: v0 (ref)
            local v7 = v0.Some(32);
            local v8 = v0.Some(32);
            expect(v7).to.equal(v8);
        end);
    end);
    describe("Assert", function() --[[ Line: 53 ]]
        -- upvalues: v0 (copy)
        it("should assert that a some option is an option", function() --[[ Line: 54 ]]
            -- upvalues: v0 (ref)
            expect(v0.Is(v0.Some(10))).to.equal(true);
        end);
        it("should assert that a none option is an option", function() --[[ Line: 58 ]]
            -- upvalues: v0 (ref)
            expect(v0.Is(v0.None)).to.equal(true);
        end);
        it("should assert that a non-option is not an option", function() --[[ Line: 62 ]]
            -- upvalues: v0 (ref)
            expect(v0.Is(10)).to.equal(false);
            expect(v0.Is(true)).to.equal(false);
            expect(v0.Is(false)).to.equal(false);
            expect(v0.Is("Test")).to.equal(false);
            expect(v0.Is({})).to.equal(false);
            expect(v0.Is(function() --[[ Line: 68 ]]

            end)).to.equal(false);
            expect(v0.Is(coroutine.create(function() --[[ Line: 69 ]]

            end))).to.equal(false);
            expect(v0.Is(v0)).to.equal(false);
        end);
    end);
    describe("Unwrap", function() --[[ Line: 74 ]]
        -- upvalues: v0 (copy)
        it("should unwrap a some option", function() --[[ Line: 75 ]]
            -- upvalues: v0 (ref)
            local v9 = v0.Some(10);
            expect(function() --[[ Line: 77 ]]
                -- upvalues: v9 (copy)
                v9:Unwrap();
            end).never.to.throw();
            expect(v9:Unwrap()).to.equal(10);
        end);
        it("should fail to unwrap a none option", function() --[[ Line: 83 ]]
            -- upvalues: v0 (ref)
            local l_None_3 = v0.None;
            expect(function() --[[ Line: 85 ]]
                -- upvalues: l_None_3 (copy)
                l_None_3:Unwrap();
            end).to.throw();
        end);
    end);
    describe("Expect", function() --[[ Line: 91 ]]
        -- upvalues: v0 (copy)
        it("should expect a some option", function() --[[ Line: 92 ]]
            -- upvalues: v0 (ref)
            local v11 = v0.Some(10);
            expect(function() --[[ Line: 94 ]]
                -- upvalues: v11 (copy)
                v11:Expect("Expecting some value");
            end).never.to.throw();
            expect(v11:Unwrap()).to.equal(10);
        end);
        it("should fail when expecting on a none option", function() --[[ Line: 100 ]]
            -- upvalues: v0 (ref)
            local l_None_4 = v0.None;
            expect(function() --[[ Line: 102 ]]
                -- upvalues: l_None_4 (copy)
                l_None_4:Expect("Expecting some value");
            end).to.throw();
        end);
    end);
    describe("ExpectNone", function() --[[ Line: 108 ]]
        -- upvalues: v0 (copy)
        it("should fail to expect a none option", function() --[[ Line: 109 ]]
            -- upvalues: v0 (ref)
            local v13 = v0.Some(10);
            expect(function() --[[ Line: 111 ]]
                -- upvalues: v13 (copy)
                v13:ExpectNone("Expecting some value");
            end).to.throw();
        end);
        it("should expect a none option", function() --[[ Line: 116 ]]
            -- upvalues: v0 (ref)
            local l_None_5 = v0.None;
            expect(function() --[[ Line: 118 ]]
                -- upvalues: l_None_5 (copy)
                l_None_5:ExpectNone("Expecting some value");
            end).never.to.throw();
        end);
    end);
    describe("UnwrapOr", function() --[[ Line: 124 ]]
        -- upvalues: v0 (copy)
        it("should unwrap a some option", function() --[[ Line: 125 ]]
            -- upvalues: v0 (ref)
            local v15 = v0.Some(10);
            expect(v15:UnwrapOr(20)).to.equal(10);
        end);
        it("should unwrap a none option", function() --[[ Line: 130 ]]
            -- upvalues: v0 (ref)
            local l_None_6 = v0.None;
            expect(l_None_6:UnwrapOr(20)).to.equal(20);
        end);
    end);
    describe("UnwrapOrElse", function() --[[ Line: 136 ]]
        -- upvalues: v0 (copy)
        it("should unwrap a some option", function() --[[ Line: 137 ]]
            -- upvalues: v0 (ref)
            local v17 = v0.Some(10):UnwrapOrElse(function() --[[ Line: 139 ]]
                return 30;
            end);
            expect(v17).to.equal(10);
        end);
        it("should unwrap a none option", function() --[[ Line: 145 ]]
            -- upvalues: v0 (ref)
            local v18 = v0.None:UnwrapOrElse(function() --[[ Line: 147 ]]
                return 30;
            end);
            expect(v18).to.equal(30);
        end);
    end);
    describe("And", function() --[[ Line: 154 ]]
        -- upvalues: v0 (copy)
        it("should return the second option with and when both are some", function() --[[ Line: 155 ]]
            -- upvalues: v0 (ref)
            local v19 = v0.Some(1);
            local v20 = v0.Some(2);
            expect(v19:And(v20)).to.equal(v20);
        end);
        it("should return none when first option is some and second option is none", function() --[[ Line: 161 ]]
            -- upvalues: v0 (ref)
            local v21 = v0.Some(1);
            local l_None_7 = v0.None;
            expect(v21:And(l_None_7):IsNone()).to.equal(true);
        end);
        it("should return none when first option is none and second option is some", function() --[[ Line: 167 ]]
            -- upvalues: v0 (ref)
            local l_None_8 = v0.None;
            local v24 = v0.Some(2);
            expect(l_None_8:And(v24):IsNone()).to.equal(true);
        end);
        it("should return none when both options are none", function() --[[ Line: 173 ]]
            -- upvalues: v0 (ref)
            local l_None_9 = v0.None;
            local l_None_10 = v0.None;
            expect(l_None_9:And(l_None_10):IsNone()).to.equal(true);
        end);
    end);
    describe("AndThen", function() --[[ Line: 180 ]]
        -- upvalues: v0 (copy)
        it("should pass the some value to the predicate", function() --[[ Line: 181 ]]
            -- upvalues: v0 (ref)
            v0.Some(32):AndThen(function(v27) --[[ Line: 183 ]]
                -- upvalues: v0 (ref)
                expect(v27).to.equal(32);
                return v0.None;
            end);
        end);
        it("should throw if an option is not returned from predicate", function() --[[ Line: 189 ]]
            -- upvalues: v0 (ref)
            local v28 = v0.Some(32);
            expect(function() --[[ Line: 191 ]]
                -- upvalues: v28 (copy)
                v28:AndThen(function() --[[ Line: 192 ]]

                end);
            end).to.throw();
        end);
        it("should return none if the option is none", function() --[[ Line: 196 ]]
            -- upvalues: v0 (ref)
            local l_None_11 = v0.None;
            expect(l_None_11:AndThen(function() --[[ Line: 198 ]]
                -- upvalues: v0 (ref)
                return v0.Some(10);
            end):IsNone()).to.equal(true);
        end);
        it("should return option of predicate if option is some", function() --[[ Line: 203 ]]
            -- upvalues: v0 (ref)
            local v30 = v0.Some(32):AndThen(function() --[[ Line: 205 ]]
                -- upvalues: v0 (ref)
                return v0.Some(10);
            end);
            expect(v30:IsSome()).to.equal(true);
            expect(v30:Unwrap()).to.equal(10);
        end);
    end);
    describe("Or", function() --[[ Line: 213 ]]
        -- upvalues: v0 (copy)
        it("should return the first option if it is some", function() --[[ Line: 214 ]]
            -- upvalues: v0 (ref)
            local v31 = v0.Some(10);
            local v32 = v0.Some(20);
            expect(v31:Or(v32)).to.equal(v31);
        end);
        it("should return the second option if the first one is none", function() --[[ Line: 220 ]]
            -- upvalues: v0 (ref)
            local l_None_12 = v0.None;
            local v34 = v0.Some(20);
            expect(l_None_12:Or(v34)).to.equal(v34);
        end);
    end);
    describe("OrElse", function() --[[ Line: 227 ]]
        -- upvalues: v0 (copy)
        it("should return the first option if it is some", function() --[[ Line: 228 ]]
            -- upvalues: v0 (ref)
            local v35 = v0.Some(10);
            local v36 = v0.Some(20);
            expect(v35:OrElse(function() --[[ Line: 231 ]]
                -- upvalues: v36 (copy)
                return v36;
            end)).to.equal(v35);
        end);
        it("should return the second option if the first one is none", function() --[[ Line: 236 ]]
            -- upvalues: v0 (ref)
            local l_None_13 = v0.None;
            local v38 = v0.Some(20);
            expect(l_None_13:OrElse(function() --[[ Line: 239 ]]
                -- upvalues: v38 (copy)
                return v38;
            end)).to.equal(v38);
        end);
        it("should throw if the predicate does not return an option", function() --[[ Line: 244 ]]
            -- upvalues: v0 (ref)
            local l_None_14 = v0.None;
            expect(function() --[[ Line: 246 ]]
                -- upvalues: l_None_14 (copy)
                l_None_14:OrElse(function() --[[ Line: 247 ]]

                end);
            end).to.throw();
        end);
    end);
    describe("XOr", function() --[[ Line: 252 ]]
        -- upvalues: v0 (copy)
        it("should return first option if first option is some and second option is none", function() --[[ Line: 253 ]]
            -- upvalues: v0 (ref)
            local v40 = v0.Some(1);
            local l_None_15 = v0.None;
            expect(v40:XOr(l_None_15)).to.equal(v40);
        end);
        it("should return second option if first option is none and second option is some", function() --[[ Line: 259 ]]
            -- upvalues: v0 (ref)
            local l_None_16 = v0.None;
            local v43 = v0.Some(2);
            expect(l_None_16:XOr(v43)).to.equal(v43);
        end);
        it("should return none if first and second option are some", function() --[[ Line: 265 ]]
            -- upvalues: v0 (ref)
            local v44 = v0.Some(1);
            local v45 = v0.Some(2);
            expect(v44:XOr(v45)).to.equal(v0.None);
        end);
        it("should return none if first and second option are none", function() --[[ Line: 271 ]]
            -- upvalues: v0 (ref)
            local l_None_17 = v0.None;
            local l_None_18 = v0.None;
            expect(l_None_17:XOr(l_None_18)).to.equal(v0.None);
        end);
    end);
    describe("Filter", function() --[[ Line: 278 ]]
        -- upvalues: v0 (copy)
        it("should return none if option is none", function() --[[ Line: 279 ]]
            -- upvalues: v0 (ref)
            local l_None_19 = v0.None;
            expect(l_None_19:Filter(function() --[[ Line: 281 ]]

            end)).to.equal(v0.None);
        end);
        it("should return none if option is some but fails predicate", function() --[[ Line: 284 ]]
            -- upvalues: v0 (ref)
            local v49 = v0.Some(10);
            expect(v49:Filter(function(_) --[[ Line: 286 ]]
                return false;
            end)).to.equal(v0.None);
        end);
        it("should return self if option is some and passes predicate", function() --[[ Line: 291 ]]
            -- upvalues: v0 (ref)
            local v51 = v0.Some(10);
            expect(v51:Filter(function(_) --[[ Line: 293 ]]
                return true;
            end)).to.equal(v51);
        end);
    end);
    describe("Contains", function() --[[ Line: 299 ]]
        -- upvalues: v0 (copy)
        it("should return true if some option contains the given value", function() --[[ Line: 300 ]]
            -- upvalues: v0 (ref)
            local v53 = v0.Some(32);
            expect(v53:Contains(32)).to.equal(true);
        end);
        it("should return false if some option does not contain the given value", function() --[[ Line: 305 ]]
            -- upvalues: v0 (ref)
            local v54 = v0.Some(32);
            expect(v54:Contains(64)).to.equal(false);
        end);
        it("should return false if option is none", function() --[[ Line: 310 ]]
            -- upvalues: v0 (ref)
            local l_None_20 = v0.None;
            expect(l_None_20:Contains(64)).to.equal(false);
        end);
    end);
    describe("ToString", function() --[[ Line: 316 ]]
        -- upvalues: v0 (copy)
        it("should return string of none option", function() --[[ Line: 317 ]]
            -- upvalues: v0 (ref)
            local l_None_21 = v0.None;
            expect((tostring(l_None_21))).to.equal("Option<None>");
        end);
        it("should return string of some option with type", function() --[[ Line: 322 ]]
            -- upvalues: v0 (ref)
            local v57 = {
                10, 
                true, 
                false, 
                "test", 
                {}, 
                function() --[[ Line: 323 ]]

                end, 
                coroutine.create(function() --[[ Line: 323 ]]

                end), 
                workspace
            };
            for _, v59 in ipairs(v57) do
                local v60 = ("Option<%s>"):format((typeof(v59)));
                expect((tostring(v0.Some(v59)))).to.equal(v60);
            end;
        end);
    end);
end;