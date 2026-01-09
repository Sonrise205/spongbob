local l_Players_0 = game:GetService("Players");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_UserService_0 = game:GetService("UserService");
local v3 = require(l_ReplicatedStorage_0.Packages.Promise);
local v4 = require(l_ReplicatedStorage_0.Shared.Modules.Timer);
local v5 = {};
local v6 = {};
local v19 = {
    GetUserInfo = function(_, v8) --[[ Line: 14 ]] --[[ Name: GetUserInfo ]]
        -- upvalues: v3 (copy), v5 (copy), l_UserService_0 (copy)
        if not v8 then
            return v3.reject("No UserId given.");
        elseif v5[v8] then
            return v3.resolve(v5[v8]);
        else
            local function v12() --[[ Line: 24 ]] --[[ Name: promiseInfo ]]
                -- upvalues: v3 (ref), l_UserService_0 (ref), v8 (copy), v5 (ref)
                return v3.new(function(v9, v10) --[[ Line: 25 ]]
                    -- upvalues: l_UserService_0 (ref), v8 (ref), v5 (ref)
                    local l_l_UserService_0_UserInfosByUserIdsAsync_0 = l_UserService_0:GetUserInfosByUserIdsAsync({
                        v8
                    });
                    if not l_l_UserService_0_UserInfosByUserIdsAsync_0 then
                        return v10();
                    elseif #l_l_UserService_0_UserInfosByUserIdsAsync_0 < 1 then
                        return v10();
                    else
                        v5[v8] = l_l_UserService_0_UserInfosByUserIdsAsync_0[1];
                        return v9(l_l_UserService_0_UserInfosByUserIdsAsync_0[1]);
                    end;
                end);
            end;
            return v3.retryWithDelay(v12, 10, 1);
        end;
    end, 
    GetUsername = function(_, v14) --[[ Line: 44 ]] --[[ Name: GetUsername ]]
        -- upvalues: v3 (copy), v6 (copy), l_Players_0 (copy)
        if not v14 then
            return v3.reject("No UserId given.");
        elseif v6[v14] then
            return v3.resolve(v6[v14]);
        else
            local function v18() --[[ Line: 54 ]] --[[ Name: promiseInfo ]]
                -- upvalues: v3 (ref), l_Players_0 (ref), v14 (copy), v6 (ref)
                return v3.new(function(v15, v16) --[[ Line: 55 ]]
                    -- upvalues: l_Players_0 (ref), v14 (ref), v6 (ref)
                    local l_l_Players_0_NameFromUserIdAsync_0 = l_Players_0:GetNameFromUserIdAsync(v14);
                    if not l_l_Players_0_NameFromUserIdAsync_0 then
                        return v16();
                    else
                        v6[v14] = l_l_Players_0_NameFromUserIdAsync_0;
                        return v15(l_l_Players_0_NameFromUserIdAsync_0);
                    end;
                end);
            end;
            return v3.retryWithDelay(v18, 10, 1);
        end;
    end
};
v4.Simple(600, function() --[[ Line: 72 ]]
    -- upvalues: v5 (copy)
    table.clear(v5);
end);
return v19;