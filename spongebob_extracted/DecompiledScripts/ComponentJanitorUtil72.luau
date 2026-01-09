local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Symbol);
local v2 = require(l_Parent_0.Janitor);
local v3 = v1("Janitor");
local v17 = {
    AddPromise = function(v4, v5) --[[ Line: 50 ]] --[[ Name: AddPromise ]]
        -- upvalues: v3 (copy)
        return v4[v3]:AddPromise(v5);
    end, 
    AddTask = function(v6, v7, v8, v9) --[[ Line: 65 ]] --[[ Name: AddTask ]]
        -- upvalues: v3 (copy)
        return v6[v3]:Add(v7, v8, v9);
    end, 
    RemoveTask = function(v10, v11, v12) --[[ Line: 90 ]] --[[ Name: RemoveTask ]]
        -- upvalues: v3 (copy)
        if v12 then
            v10[v3]:RemoveNoClean(v11);
        end;
        v10[v3]:Remove(v11);
    end, 
    RemoveTaskNoClean = function(v13, v14) --[[ Line: 77 ]] --[[ Name: RemoveTaskNoClean ]]
        -- upvalues: v3 (copy)
        v13[v3]:RemoveNoClean(v14);
    end, 
    GetTask = function(v15, v16) --[[ Line: 106 ]] --[[ Name: GetTask ]]
        -- upvalues: v3 (copy)
        return v15[v3]:Get(v16);
    end
};
return {
    ClassName = "ComponentJanitorUtil", 
    Methods = v17, 
    Constructing = function(v18) --[[ Line: 132 ]] --[[ Name: Constructing ]]
        -- upvalues: v3 (copy), v2 (copy)
        v18[v3] = v2.new();
    end, 
    Stopped = function(v19) --[[ Line: 141 ]] --[[ Name: Stopped ]]
        -- upvalues: v3 (copy)
        v19[v3]:Destroy();
        v19[v3] = nil;
    end
};