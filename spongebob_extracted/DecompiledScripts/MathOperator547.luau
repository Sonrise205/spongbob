return function(v0) --[[ Line: 1 ]]
    v0:RegisterType("mathOperator", v0.Cmdr.Util.MakeEnumType("Math Operator", {
        {
            Name = "+", 
            Perform = function(v1, v2) --[[ Line: 7 ]] --[[ Name: Perform ]]
                return v1 + v2;
            end
        }, 
        {
            Name = "-", 
            Perform = function(v3, v4) --[[ Line: 13 ]] --[[ Name: Perform ]]
                return v3 - v4;
            end
        }, 
        {
            Name = "*", 
            Perform = function(v5, v6) --[[ Line: 19 ]] --[[ Name: Perform ]]
                return v5 * v6;
            end
        }, 
        {
            Name = "/", 
            Perform = function(v7, v8) --[[ Line: 25 ]] --[[ Name: Perform ]]
                return v7 / v8;
            end
        }, 
        {
            Name = "**", 
            Perform = function(v9, v10) --[[ Line: 31 ]] --[[ Name: Perform ]]
                return v9 ^ v10;
            end
        }, 
        {
            Name = "%", 
            Perform = function(v11, v12) --[[ Line: 37 ]] --[[ Name: Perform ]]
                return v11 % v12;
            end
        }
    }));
end;