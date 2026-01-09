local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.Types);
local v2 = require(l_Parent_0.External);
local v3 = require(l_Parent_0.Memory.scopePool);
local v4 = require(l_Parent_0.Memory.poisonScope);
local v5 = {};
local function v6(v7) --[[ Line: 24 ]] --[[ Name: doCleanup ]]
    -- upvalues: v5 (copy), v2 (copy), v6 (copy), v3 (copy), v4 (copy)
    if v5[v7] then
        return v2.logError("destroyedTwice");
    else
        v5[v7] = true;
        if typeof(v7) == "Instance" then
            v7:Destroy();
        elseif typeof(v7) == "RBXScriptConnection" then
            v7:Disconnect();
        elseif typeof(v7) == "function" then
            v7();
        elseif typeof(v7) == "table" then
            if typeof(v7.destroy) == "function" then
                v7:destroy();
            elseif typeof(v7.Destroy) == "function" then
                v7:Destroy();
            elseif v7[1] ~= nil then
                for v8 = #v7, 1, -1 do
                    v6(v7[v8]);
                    v7[v8] = nil;
                end;
                if v2.isTimeCritical() then
                    v3.giveIfEmpty(v7);
                else
                    v4(v7, "`doCleanup()` was previously called on this scope. Ensure you are not reusing scopes after cleanup.");
                end;
            end;
        end;
        v5[v7] = nil;
        return;
    end;
end;
return v6;