local l_HttpService_0 = game:GetService("HttpService");
return function(_, v2) --[[ Line: 3 ]]
    -- upvalues: l_HttpService_0 (copy)
    return l_HttpService_0:GetAsync(v2);
end;