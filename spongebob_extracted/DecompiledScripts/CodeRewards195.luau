return {
    Codes = {
        ["Code 1"] = "Socials", 
        ["Code 2"] = "Socials", 
        ["Code 3"] = "Gamepass"
    }, 
    Socials = {
        {
            type = "Currency", 
            name = "CurrencySmall", 
            amount = 1
        }, 
        {
            type = "Currency", 
            name = "CurrencySmall", 
            amount = 2
        }, 
        {
            type = "Currency", 
            name = "CurrencySmall", 
            amount = 3
        }, 
        {
            type = "Currency", 
            name = "CurrencySmall", 
            amount = 4
        }, 
        {
            type = "Currency", 
            name = "CurrencySmall", 
            amount = 5
        }
    }, 
    Gamepass = {}, 
    GetCodes = function(v0) --[[ Line: 41 ]] --[[ Name: GetCodes ]]
        return v0.Codes;
    end, 
    DoesCodeExist = function(v1, v2) --[[ Line: 46 ]] --[[ Name: DoesCodeExist ]]
        return v1.Codes[v2] ~= nil;
    end, 
    GetCodeType = function(v3, v4) --[[ Line: 51 ]] --[[ Name: GetCodeType ]]
        for v5, v6 in v3:GetCodes() do
            if v5 == v4 then
                return v6;
            end;
        end;
    end, 
    GetRewardsFromType = function(v7, v8) --[[ Line: 59 ]] --[[ Name: GetRewardsFromType ]]
        return v7[v8];
    end
};