local l_HttpService_0 = game:GetService("HttpService");
return function(v1) --[[ Line: 3 ]]
    -- upvalues: l_HttpService_0 (copy)
    v1:RegisterType("json", {
        Validate = function(v2) --[[ Line: 5 ]] --[[ Name: Validate ]]
            -- upvalues: l_HttpService_0 (ref)
            return pcall(l_HttpService_0.JSONDecode, l_HttpService_0, v2);
        end, 
        Parse = function(v3) --[[ Line: 9 ]] --[[ Name: Parse ]]
            -- upvalues: l_HttpService_0 (ref)
            return l_HttpService_0:JSONDecode(v3);
        end
    });
end;