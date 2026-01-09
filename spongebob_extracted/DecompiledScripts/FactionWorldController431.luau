local _ = game:GetService("Players");
local l_ReplicatedFirst_0 = game:GetService("ReplicatedFirst");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v3 = require(l_ReplicatedStorage_0.Packages.Knit);
local _ = require(l_ReplicatedStorage_0.Packages.Dumpster);
local _ = require(l_ReplicatedStorage_0.Packages.Signal);
local _ = require(l_ReplicatedStorage_0.Packages.Promise);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v8 = require(l_ReplicatedStorage_0.Shared.Data.Variables);
local v9 = require(l_ReplicatedFirst_0.PlaceIds);
local _ = require(l_ReplicatedStorage_0.Shared.Util.FactionsUtil);
local v11 = require(l_ReplicatedStorage_0.ReplicaController);
local v12 = nil;
local v13 = nil;
local v14 = nil;
local v15 = nil;
local v16 = nil;
local v17 = nil;
local v18 = nil;
local v19 = nil;
local v20 = v3.CreateController({
    Name = script.Name
});
v20.KnitInit = function(_) --[[ Line: 46 ]] --[[ Name: KnitInit ]]
    -- upvalues: v12 (ref), v3 (copy), v13 (ref), v14 (ref), v15 (ref), v16 (ref), v17 (ref), v18 (ref)
    v12 = v3.GetController("DataController");
    v13 = v3.GetController("CharacterController");
    v14 = v3.GetService("FactionService");
    v15 = v3.GetController("UIController");
    v16 = v3.GetController("DeviceTypeController");
    v17 = v3.GetController("AudioController");
    v18 = v3.GetController("FastTravelController");
end;
v20.KnitStart = function(v22) --[[ Line: 57 ]] --[[ Name: KnitStart ]]
    -- upvalues: v9 (copy), v15 (ref), v19 (ref), v12 (ref), v3 (copy), v14 (ref), v8 (copy)
    if not v9:IsFactionWorld() then
        return;
    else
        local v23 = v15:GetModuleAsync("MessagePrompt"):expect();
        v19 = v15:GetModuleAsync("Sting"):expect();
        v22.factionData = v12:Get(v3.Player, "Faction"):expect();
        v22:_setupClubhouseReplica();
        v12:OnChanged(v3.Player, "Faction", function(v24) --[[ Line: 68 ]]
            -- upvalues: v22 (copy)
            local v25 = v22.factionData.Id ~= v24.Id;
            v22.factionData = v24;
            if not v25 then
                return;
            else
                v22:_setupClubhouseReplica();
                return;
            end;
        end, true);
        v14.FactionJoinSuccess:Connect(function(v26) --[[ Line: 80 ]]
            -- upvalues: v23 (copy), v8 (ref)
            if not v26 or v26 == 0 then
                return;
            else
                v23:Prompt({
                    message = ("Welcome to the %*! This is your clubhouse where you can interact with other faction members!"):format(v8.FACTIONS.FACTION_NAMES[v26]), 
                    options = {
                        {
                            text = "I'm Ready!"
                        }
                    }
                });
                return;
            end;
        end);
        v14.RequestEnterClubhouse:Connect(function() --[[ Line: 93 ]]
            -- upvalues: v22 (copy)
            v22:EnterClubhouse();
        end);
        return;
    end;
end;
local v27 = TweenInfo.new(0.6);
v20.EnterClubhouse = function(v28) --[[ Line: 103 ]] --[[ Name: EnterClubhouse ]]
    -- upvalues: v17 (ref), v19 (ref), v27 (copy), v27 (copy), v14 (ref), v13 (ref), v16 (ref), v18 (ref)
    local v29 = nil;
    local v30 = nil;
    v17:StopAllMusic(true, 1);
    local v31 = os.clock();
    v29 = v19:Transition({
        config = {
            tweenInInfo = v27, 
            tweenOutInfo = v27, 
            color = Color3.new(1, 1, 1)
        }, 
        callbacks = {
            hold = function() --[[ Line: 118 ]] --[[ Name: hold ]]
                -- upvalues: v30 (ref), v14 (ref), v13 (ref), v31 (copy), v29 (ref)
                v30 = v14:EnterClubhouse():expect();
                if v30 then
                    local l_v13_RootPart_0 = v13:GetRootPart();
                    if not l_v13_RootPart_0 then
                        return;
                    else
                        l_v13_RootPart_0.Anchored = true;
                        l_v13_RootPart_0.AssemblyLinearVelocity = Vector3.new(0, 0, 0, 0);
                        l_v13_RootPart_0.AssemblyAngularVelocity = Vector3.new(0, 0, 0, 0);
                        l_v13_RootPart_0:PivotTo(v30);
                    end;
                end;
                local v33 = os.clock() - v31;
                if v33 < 1 then
                    task.wait(1 - v33);
                end;
                v29();
            end, 
            tweenOut = function() --[[ Line: 140 ]] --[[ Name: tweenOut ]]
                -- upvalues: v28 (copy), v16 (ref), v30 (ref), v17 (ref), v18 (ref), v13 (ref)
                v28._inClubhouse = true;
                v16:TogglePlayerControls(true);
                local v34 = v28.factionData.Id or 0;
                if v34 == 0 then
                    return;
                else
                    if v30 then
                        v17:SetMusicOverride((("Music.FactionClubhouses.%*"):format(v34)));
                        v18:ResetCamera();
                        local l_v13_RootPart_1 = v13:GetRootPart();
                        if l_v13_RootPart_1 then
                            l_v13_RootPart_1.Anchored = false;
                            return;
                        end;
                    else
                        v17:SetMusicOverride();
                    end;
                    return;
                end;
            end
        }
    });
end;
v20.ExitClubhouse = function(v36) --[[ Line: 166 ]] --[[ Name: ExitClubhouse ]]
    -- upvalues: v17 (ref), v19 (ref), v27 (copy), v27 (copy), v14 (ref), v13 (ref), v16 (ref), v18 (ref)
    local v37 = nil;
    local v38 = nil;
    v17:StopAllMusic(true, 1);
    local v39 = os.clock();
    v37 = v19:Transition({
        config = {
            holdTime = 1, 
            tweenInInfo = v27, 
            tweenOutInfo = v27, 
            color = Color3.fromRGB(255, 255, 255)
        }, 
        callbacks = {
            hold = function() --[[ Line: 182 ]] --[[ Name: hold ]]
                -- upvalues: v38 (ref), v14 (ref), v13 (ref), v39 (copy), v37 (ref)
                v38 = v14:ExitClubhouse():expect();
                if v38 then
                    local l_v13_RootPart_2 = v13:GetRootPart();
                    if not l_v13_RootPart_2 then
                        return;
                    else
                        l_v13_RootPart_2.Anchored = true;
                        l_v13_RootPart_2.AssemblyLinearVelocity = Vector3.new(0, 0, 0, 0);
                        l_v13_RootPart_2.AssemblyAngularVelocity = Vector3.new(0, 0, 0, 0);
                        l_v13_RootPart_2:PivotTo(v38);
                    end;
                end;
                local v41 = os.clock() - v39;
                if v41 < 1 then
                    task.wait(1 - v41);
                end;
                v37();
            end, 
            tweenOut = function() --[[ Line: 204 ]] --[[ Name: tweenOut ]]
                -- upvalues: v36 (copy), v16 (ref), v17 (ref), v38 (ref), v18 (ref), v13 (ref)
                v36._inClubhouse = false;
                v16:TogglePlayerControls(true);
                v17:SetMusicOverride();
                if v38 then
                    v18:ResetCamera();
                    local l_v13_RootPart_3 = v13:GetRootPart();
                    if l_v13_RootPart_3 then
                        l_v13_RootPart_3.Anchored = false;
                    end;
                end;
            end
        }
    });
end;
v20.InClubhouse = function(v43) --[[ Line: 223 ]] --[[ Name: InClubhouse ]]
    return v43._inClubhouse or false;
end;
v20._setupClubhouseReplica = function(v44) --[[ Line: 228 ]] --[[ Name: _setupClubhouseReplica ]]
    -- upvalues: v11 (copy)
    if v44.factionData and v44.factionData.Id == 0 then
        return;
    else
        v11.ReplicaOfClassCreated(("Clubhouse_Faction_%*"):format(v44.factionData.Id), function(v45) --[[ Line: 233 ]]
            -- upvalues: v44 (copy)
            v44.clubhouseReplica = v45;
            v45:AddCleanupTask(function() --[[ Line: 236 ]]
                -- upvalues: v44 (ref)
                v44.clubhouseReplica = nil;
            end);
        end);
        return;
    end;
end;
return v20;