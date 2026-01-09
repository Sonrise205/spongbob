local l_ReplicatedFirst_0 = game:GetService("ReplicatedFirst");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_AvatarEditorService_0 = game:GetService("AvatarEditorService");
local l_ExperienceNotificationService_0 = game:GetService("ExperienceNotificationService");
local l_RunService_0 = game:GetService("RunService");
local v5 = require(l_ReplicatedStorage_0.Packages.Knit);
local _ = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v7 = require(l_ReplicatedStorage_0.Packages.Promise);
local v8 = require(l_ReplicatedStorage_0.Packages.TableUtil);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v10 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local v11 = require(l_ReplicatedStorage_0.Levels);
local v12 = require(l_ReplicatedFirst_0.PlaceIds);
local v13 = nil;
local v14 = nil;
local v15 = nil;
local v16 = v5.CreateController({
    Name = "PopupController", 
    Client = {}
});
v16.KnitInit = function(_) --[[ Line: 47 ]] --[[ Name: KnitInit ]]
    -- upvalues: v13 (ref), v5 (copy), v14 (ref), v15 (ref)
    v13 = v5.GetController("DataController");
    v14 = v5.GetService("FavoritesService");
    v15 = v5.GetController("CutsceneController");
end;
v16.KnitStart = function(_) --[[ Line: 54 ]] --[[ Name: KnitStart ]]
    -- upvalues: v12 (copy), l_RunService_0 (copy), v5 (copy), v15 (ref), v13 (ref), v8 (copy), v11 (copy), v10 (copy), v7 (copy), l_ExperienceNotificationService_0 (copy), l_AvatarEditorService_0 (copy), v14 (ref)
    if not v12:IsHUB() or l_RunService_0:IsStudio() then
        return;
    else
        local function _() --[[ Line: 59 ]] --[[ Name: canDisplayPrompt ]]
            -- upvalues: v5 (ref), v15 (ref)
            return false;
        end;
        local function v25() --[[ Line: 75 ]] --[[ Name: tryNotifyPrompt ]]
            -- upvalues: v5 (ref), v15 (ref), v13 (ref), v8 (ref), v11 (ref), v10 (ref), v7 (ref), l_ExperienceNotificationService_0 (ref)
            if not false then
                return;
            else
                local v20 = v13:Get(v5.Player, "Completion"):expect();
                local v21 = v8.Values(v11:GetWorlds("Story"));
                table.sort(v21, function(v22, v23) --[[ Line: 84 ]]
                    return v22.WorldOrder < v23.WorldOrder;
                end);
                if not v10:IsChapterCompleted(v20, v21[1].WorldName, 1) then
                    return;
                else
                    return v7.retryWithDelay(function() --[[ Line: 92 ]]
                        -- upvalues: v7 (ref), l_ExperienceNotificationService_0 (ref)
                        return v7.try(function() --[[ Line: 93 ]]
                            -- upvalues: l_ExperienceNotificationService_0 (ref)
                            return l_ExperienceNotificationService_0:CanPromptOptInAsync();
                        end);
                    end, 5, 1):andThen(function(v24) --[[ Line: 96 ]]
                        -- upvalues: l_ExperienceNotificationService_0 (ref)
                        if not v24 then
                            return;
                        else
                            pcall(l_ExperienceNotificationService_0.PromptOptIn, l_ExperienceNotificationService_0);
                            return;
                        end;
                    end):catch(warn);
                end;
            end;
        end;
        local function v27() --[[ Line: 105 ]] --[[ Name: tryFavoritePrompt ]]
            -- upvalues: v5 (ref), v15 (ref), v13 (ref), l_AvatarEditorService_0 (ref), v14 (ref)
            if not false then
                return;
            elseif v13:Get(v5.Player, "GameFavorited"):expect() then
                return;
            else
                l_AvatarEditorService_0.PromptSetFavoriteCompleted:Once(function(v26) --[[ Line: 115 ]]
                    -- upvalues: v14 (ref)
                    if v26 == Enum.AvatarPromptResult.Success or v26 == Enum.AvatarPromptResult.Failed then
                        v14:FavoritedGame();
                    end;
                end);
                l_AvatarEditorService_0:PromptSetFavorite(game.PlaceId, Enum.AvatarItemType.Asset, true);
                return;
            end;
        end;
        local function v28() --[[ Line: 124 ]] --[[ Name: tryPrompts ]]
            -- upvalues: v25 (copy), v27 (copy)
            task.delay(60, v25);
            task.delay(120, v27);
        end;
        if not v5.Player:GetAttribute("Loading") then
            task.delay(60, v25);
            task.delay(120, v27);
            return;
        else
            v5.Player:GetAttributeChangedSignal("Loading"):Once(v28);
            return;
        end;
    end;
end;
return v16;