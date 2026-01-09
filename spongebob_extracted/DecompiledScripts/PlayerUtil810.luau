local l_Players_0 = game:GetService("Players");
local l_RunService_0 = game:GetService("RunService");
local l_Parent_0 = script.Parent;
local v3 = require(l_Parent_0.Parent.Janitor);
local v4 = require(l_Parent_0.Parent.Promise);
local v5 = require(l_Parent_0.TblUtil);
local _ = require(l_Parent_0.RailUtilTypes);
local v7 = nil;
local v8 = l_RunService_0:IsServer() and 0 or 1;
local v9 = {
    __mode = "kv"
};
local function _() --[[ Line: 49 ]] --[[ Name: _GetCharactersFolder ]]
    return workspace:FindFirstChild("Characters");
end;
local function v15(v11) --[[ Line: 53 ]] --[[ Name: createCleanerConnection ]]
    -- upvalues: v8 (ref)
    local v12 = true;
    local l_v8_0 = v8;
    v8 = v8 + 2;
    local function v14() --[[ Line: 58 ]] --[[ Name: cleanup ]]
        -- upvalues: v12 (ref), v11 (copy)
        if not v12 then
            return;
        else
            v12 = false;
            if typeof(v11) == "function" then
                v11();
                return;
            else
                v11:Destroy();
                return;
            end;
        end;
    end;
    return table.freeze({
        Id = l_v8_0, 
        Destroy = v14, 
        Disconnect = v14, 
        IsConnected = function() --[[ Line: 72 ]] --[[ Name: IsConnected ]]
            -- upvalues: v12 (ref)
            return v12;
        end
    });
end;
local function _(v16, v17) --[[ Line: 78 ]] --[[ Name: assertFunction ]]
    if v17 and v16 == nil then
        return;
    else
        assert(v16, "Missing Function to execute.");
        assert(typeof(v16) == "function", "Function must be a function.");
        return;
    end;
end;
local function _(v19) --[[ Line: 84 ]] --[[ Name: assertPlayer ]]
    assert(not v19 or v19:IsA("Player"), "Invalid Player.");
end;
local v23 = {
    getCharactersFolder = function() --[[ Line: 102 ]] --[[ Name: getCharactersFolder ]]
        -- upvalues: l_RunService_0 (copy)
        local l_Characters_0 = workspace:FindFirstChild("Characters");
        if not l_Characters_0 then
            if l_RunService_0:IsServer() then
                warn("Failed to find Characters folder! Creating...");
                warn("Please create a folder named 'Characters' in workspace ahead of time.");
                local l_Folder_0 = Instance.new("Folder");
                l_Folder_0.Name = "Characters";
                l_Folder_0.Parent = workspace;
                l_Characters_0 = l_Folder_0;
            else
                warn("Failed to find characters folder! Waiting...");
                l_Characters_0 = workspace:WaitForChild("Characters");
            end;
        end;
        assert(l_Characters_0, "Characters folder not found! (PlayerUtil.lua)");
        return l_Characters_0;
    end
};
v23.promiseCharactersFolder = function() --[[ Line: 121 ]] --[[ Name: promiseCharactersFolder ]]
    -- upvalues: v4 (copy), v23 (copy)
    return v4.new(function(v24) --[[ Line: 122 ]]
        -- upvalues: v23 (ref)
        return v24(v23.getCharactersFolder());
    end);
end;
v23.promiseCharacter = function(v25, v26) --[[ Line: 135 ]] --[[ Name: promiseCharacter ]]
    -- upvalues: v4 (copy), v23 (copy)
    if workspace:FindFirstChild("Characters") == nil then
        if v25.Character then
            return v4.resolve(v25.Character);
        else
            local v27 = v4.fromEvent(v25.CharacterAdded);
            if v26 then
                v27 = v27:timeout(v26, "Timed out waiting for character!");
            end;
            return v27;
        end;
    else
        return v23.promiseCharactersFolder():andThen(function(v28) --[[ Line: 148 ]]
            -- upvalues: v25 (copy), v4 (ref), v26 (copy)
            local l_Character_0 = v25.Character;
            if l_Character_0 and l_Character_0:IsDescendantOf(v28) then
                return v4.resolve(l_Character_0);
            elseif v26 and v26 == 0 then
                return v4.reject("Character not found");
            else
                local v31 = v4.fromEvent(v28.DescendantAdded, function(v30) --[[ Line: 156 ]]
                    -- upvalues: v25 (ref)
                    return v30 == v25.Character;
                end);
                if v26 then
                    v31 = v31:timeout(v26, "Timed out waiting for character!");
                end;
                return v31;
            end;
        end);
    end;
end;
v23.getCharacter = v23.promiseCharacter;
v23.getPlayerFromCharacterDescendant = function(v32) --[[ Line: 175 ]] --[[ Name: getPlayerFromCharacterDescendant ]]
    -- upvalues: l_Players_0 (copy)
    for _, v34 in ipairs(l_Players_0:GetPlayers()) do
        if v34.Character and v32:IsDescendantOf(v34.Character) then
            return v34;
        end;
    end;
    return nil;
end;
v23.getCharacterFromDescendant = function(v35) --[[ Line: 191 ]] --[[ Name: getCharacterFromDescendant ]]
    -- upvalues: v23 (copy)
    if not v35:IsDescendantOf(v23.getCharactersFolder()) then
        return nil;
    else
        for _, v37 in v23.getAllLoadedCharacters() do
            if v35:IsDescendantOf(v37) then
                return v37;
            end;
        end;
        return nil;
    end;
end;
v23.getAllLoadedCharacters = function() --[[ Line: 206 ]] --[[ Name: getAllLoadedCharacters ]]
    -- upvalues: v23 (copy), l_Players_0 (copy)
    local v38 = {};
    local v39 = v23.getCharactersFolder();
    for _, v41 in l_Players_0:GetPlayers() do
        local l_Character_1 = v41.Character;
        if l_Character_1 and l_Character_1:IsDescendantOf(v39) then
            table.insert(v38, l_Character_1);
        end;
    end;
    return v38;
end;
v23.forEachCharacter = function(v43, v44) --[[ Line: 226 ]] --[[ Name: forEachCharacter ]]
    -- upvalues: v9 (copy), v3 (copy), v15 (copy), l_Players_0 (copy), v23 (copy)
    assert(v43, "Missing Function to execute.");
    assert(typeof(v43) == "function", "Function must be a function.");
    assert(not v44 or v44:IsA("Player"), "Invalid Player.");
    local v45 = debug.traceback();
    local v46 = setmetatable({}, v9);
    local v47 = v3.new();
    local v48 = v15(v47);
    local function v52(v49) --[[ Line: 236 ]] --[[ Name: CheckChar ]]
        -- upvalues: v48 (copy), l_Players_0 (ref), v46 (copy), v45 (copy), v3 (ref), v43 (copy), v47 (copy)
        assert(v48:IsConnected(), "Connection already disconnected.");
        assert(v49, "Character is nil.");
        local l_l_Players_0_PlayerFromCharacter_0 = l_Players_0:GetPlayerFromCharacter(v49);
        assert(l_l_Players_0_PlayerFromCharacter_0, "Character does not belong to a player.");
        if v46[l_l_Players_0_PlayerFromCharacter_0] then
            return warn("Already setup Character:", v49, v45);
        else
            local v51 = v3.new();
            v51:Add(function() --[[ Line: 247 ]]
                -- upvalues: v46 (ref), l_l_Players_0_PlayerFromCharacter_0 (copy)
                v46[l_l_Players_0_PlayerFromCharacter_0] = nil;
            end);
            v51:Add(task.spawn(v43, v49, v51));
            v47:Add(v51, "Destroy", tostring(l_l_Players_0_PlayerFromCharacter_0.UserId) .. "_CharJani");
            return;
        end;
    end;
    local function v55(v53) --[[ Line: 255 ]] --[[ Name: SetupPlayer ]]
        -- upvalues: v47 (copy), v23 (ref), v52 (copy)
        local v54 = tostring(v53.UserId);
        v47:Add(v53.CharacterAdded:Connect(function() --[[ Line: 259 ]]
            -- upvalues: v47 (ref), v23 (ref), v53 (copy), v52 (ref)
            v47:AddPromise(v23.promiseCharacter(v53, 5):andThen(v52));
        end), "Disconnect", v54 .. "_CharacterAdded");
        if v53.Character then
            v47:AddPromise(v23.promiseCharacter(v53, 5):andThen(v52));
        end;
        v47:Add(v53.CharacterRemoving:Connect(function() --[[ Line: 271 ]]
            -- upvalues: v47 (ref), v54 (copy)
            v47:Remove(v54 .. "_CharJani");
        end), "Disconnect", v54 .. "_CharacterRemoving");
    end;
    if v44 then
        v55(v44);
        v47:Add(v23.onPlayerRemoving(v44, function() --[[ Line: 281 ]]
            -- upvalues: v48 (copy)
            v48:Destroy();
        end));
        return v48;
    else
        v47:Add(v23.forEachPlayer(v55));
        v47:Add(l_Players_0.PlayerRemoving:Connect(function(v56) --[[ Line: 286 ]]
            -- upvalues: v47 (copy)
            local v57 = tostring(v56.UserId);
            v47:Remove(v57 .. "_CharacterAdded");
            v47:Remove(v57 .. "_CharacterRemoving");
            v47:Remove(v57 .. "_CharJani");
        end));
        return v48;
    end;
end;
v23.forEachPlayer = function(v58) --[[ Line: 304 ]] --[[ Name: forEachPlayer ]]
    -- upvalues: v9 (copy), v3 (copy), v15 (copy), l_Players_0 (copy), v5 (copy)
    assert(v58, "Missing Function to execute.");
    assert(typeof(v58) == "function", "Function must be a function.");
    local v59 = setmetatable({}, v9);
    local v60 = v3.new();
    local v61 = v15(v60);
    local function v64(v62) --[[ Line: 311 ]] --[[ Name: CheckPlayer ]]
        -- upvalues: v59 (copy), v60 (copy), v3 (ref), v58 (copy)
        if table.find(v59, v62) then
            return;
        else
            table.insert(v59, v62);
            local v63 = v60:Add(v3.new(), nil, v62);
            v63:Add(task.spawn(v58, v62, v63));
            return;
        end;
    end;
    v60:Add(l_Players_0.PlayerAdded:Connect(v64));
    v60:Add(l_Players_0.PlayerRemoving:Connect(function(v65) --[[ Line: 321 ]]
        -- upvalues: v60 (copy), v5 (ref), v59 (copy)
        v60:Remove(v65);
        v5.SwapRemoveFirstValue(v59, v65);
    end));
    for _, v67 in ipairs(l_Players_0:GetPlayers()) do
        v64(v67);
    end;
    return v61;
end;
v23.onPlayerRemoving = function(v68, v69, ...) --[[ Line: 339 ]] --[[ Name: onPlayerRemoving ]]
    -- upvalues: v3 (copy), v15 (copy), l_Players_0 (copy)
    assert(v69, "Missing Function to execute.");
    assert(typeof(v69) == "function", "Function must be a function.");
    assert(not v68 or v68:IsA("Player"), "Invalid Player.");
    local v70 = v3.new();
    local v71 = v15(v70);
    local v72 = {
        select(1, ...)
    };
    v70:Add(l_Players_0.PlayerRemoving:Connect(function(v73) --[[ Line: 347 ]]
        -- upvalues: v68 (copy), v71 (copy), v69 (copy), v72 (copy)
        if v68 == v73 then
            v71:Destroy();
            v69(table.unpack(v72));
        end;
    end));
    return v71;
end;
v23.setupCharacterInitialization = function(v74) --[[ Line: 361 ]] --[[ Name: setupCharacterInitialization ]]
    -- upvalues: v7 (ref), v23 (copy)
    if v74 ~= nil then
        assert(v74, "Missing Function to execute.");
        assert(typeof(v74) == "function", "Function must be a function.");
    end;
    if v7 then
        error("Character initialization already setup. Calling this function multiple times is not supported.\nOriginal call: " .. tostring(v7) .. "\n\nCurrent call: ");
    end;
    v7 = debug.traceback();
    return v23.forEachPlayer(function(v75) --[[ Line: 368 ]]
        -- upvalues: v23 (ref), v74 (copy)
        local function v78(v76) --[[ Line: 369 ]] --[[ Name: onCharAdded ]]
            -- upvalues: v23 (ref), v74 (ref)
            if not v76 then
                return;
            else
                local v77 = v23.getCharactersFolder();
                while v76.Parent ~= v77 do
                    v76.Parent = v77;
                    task.wait();
                end;
                if v74 then
                    v74(v76);
                end;
                v76.Parent = v77;
                return;
            end;
        end;
        v75.CharacterAdded:Connect(v78);
        v78(v75.Character);
    end);
end;
return table.freeze(v23);