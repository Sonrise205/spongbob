local function _(v0) --[[ Line: 3 ]] --[[ Name: FullNameToPath ]]
    return v0:GetFullName():gsub("%.", "/");
end;
return {
    Find = function(v2, v3, v4) --[[ Line: 29 ]] --[[ Name: Find ]]
        local l_v2_0 = v2;
        for _, v7 in (v3:split("/")) do
            if v7 == "" then
                error(("Invalid path: %*"):format(v3), 2);
            end;
            l_v2_0 = l_v2_0:FindFirstChild(v7);
            if l_v2_0 == nil then
                error(("Failed to find %* in %*"):format(v3, (v2:GetFullName():gsub("%.", "/"))), 2);
            end;
        end;
        if v4 and not l_v2_0:IsA(v4) then
            error(("Got class %*; expected to be of type %*"):format(l_v2_0.ClassName, v4), 2);
        end;
        return l_v2_0;
    end, 
    Exists = function(v8, v9, v10) --[[ Line: 69 ]] --[[ Name: Exists ]]
        local l_v8_0 = v8;
        for _, v13 in (v9:split("/")) do
            if v13 == "" then
                error(("Invalid path: %*"):format(v9), 2);
            end;
            l_v8_0 = l_v8_0:FindFirstChild(v13);
            if l_v8_0 == nil then
                return false;
            end;
        end;
        if v10 and not l_v8_0:IsA(v10) then
            return false;
        else
            return true;
        end;
    end, 
    Await = function(v14, v15, v16, v17) --[[ Line: 111 ]] --[[ Name: Await ]]
        local l_v14_0 = v14;
        for _, v20 in (v15:split("/")) do
            if v20 == "" then
                error(("Invalid path: %*"):format(v15), 2);
            end;
            l_v14_0 = l_v14_0:WaitForChild(v20, v16);
            if l_v14_0 == nil then
                error(("Failed to await %* in %* (timeout reached)"):format(v15, (v14:GetFullName():gsub("%.", "/"))), 2);
            end;
        end;
        if v17 and not l_v14_0:IsA(v17) then
            error(("Got class %*; expected to be of type %*"):format(l_v14_0.ClassName, v17), 2);
        end;
        return l_v14_0;
    end
};