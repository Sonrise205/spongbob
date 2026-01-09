local l_CollectionService_0 = game:GetService("CollectionService");
local l_GuiService_0 = game:GetService("GuiService");
local l_ReplicatedFirst_0 = game:GetService("ReplicatedFirst");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_RunService_0 = game:GetService("RunService");
local l_SocialService_0 = game:GetService("SocialService");
local l_TweenService_0 = game:GetService("TweenService");
local v7 = require(l_ReplicatedStorage_0.Packages.Knit);
local _ = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v9 = require(l_ReplicatedStorage_0.Packages.WaitFor);
local l_PreferredInput_0 = require(l_ReplicatedStorage_0.Packages.Input).PreferredInput;
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v12 = require(l_ReplicatedFirst_0.PlaceIds);
local v13 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local v14 = require(l_ReplicatedStorage_0.Shared.Data.Variables);
local v15 = nil;
local v16 = nil;
local v17 = nil;
local v18 = nil;
local v19 = nil;
local v20 = nil;
local v21 = nil;
local v22 = nil;
local v23 = nil;
local v24 = nil;
return {
    primaryMenu = true, 
    blur = true, 
    Init = function(v25, v26, v27) --[[ Line: 52 ]] --[[ Name: Init ]]
        -- upvalues: v15 (ref), v7 (copy), v16 (ref), v17 (ref), v18 (ref), v19 (ref), v20 (ref), v21 (ref), v22 (ref)
        v15 = v7.GetController("DataController");
        v16 = v7.GetController("UIController");
        v17 = v7.GetController("DeviceTypeController");
        v18 = v7.GetController("NPEController");
        v19 = v7.GetService("VersionService");
        v20 = v7.GetController("FastTravelController");
        v21 = v7.GetController("TreasureController");
        v22 = v7.GetController("UnitViewerController");
        v25.currentMode = v27;
        v25.ui = v26;
        v25.main = v26.Main;
        v25.exitBtn = v25.main.Exit;
        v25.playBtn = v25.main.Confirm;
        v25.bin = v25.main.Content.Bin;
        v25.binLayout = v25.bin.UIListLayout;
        v25.binPadding = v25.bin.UIPadding;
        v25.playBtn.Visible = false;
        v25.updates = {};
    end, 
    Start = function(v28, _) --[[ Line: 76 ]] --[[ Name: Start ]]
        -- upvalues: v12 (copy), v24 (ref), v16 (ref), v23 (ref), v19 (ref), v15 (ref), v7 (copy), v13 (copy), v20 (ref), l_CollectionService_0 (copy), l_SocialService_0 (copy), l_ReplicatedStorage_0 (copy), v14 (copy), v21 (ref), v22 (ref)
        if not v12:IsLobby() then
            return;
        else
            v24 = v16:GetModuleAsync("HUD"):expect();
            v23 = v16:GetModuleAsync("Notification"):expect();
            local function v30() --[[ Line: 84 ]] --[[ Name: closeUI ]]
                -- upvalues: v16 (ref)
                v16:Toggle(script.Name, false);
            end;
            v16:HandleButton(v28.exitBtn, v30);
            v16:HandleButton(v28.playBtn, v30);
            local v31 = v19:GetVersion():expect();
            v15:Get(v7.Player, "PatchNotesSeen"):andThen(function(v32) --[[ Line: 94 ]]
                -- upvalues: v31 (copy), v28 (copy), v24 (ref)
                if v32 == v31 then
                    v28.seenPatchNotes = true;
                    v24:TogglePatchNotesIndicator(false);
                    return;
                else
                    v28.seenPatchNotes = false;
                    v24:TogglePatchNotesIndicator(true);
                    return;
                end;
            end);
            v13:IterateClass(v28.main.Content.Bin, "TextButton", function(v33) --[[ Line: 106 ]]
                -- upvalues: v28 (copy)
                local l_Parent_0 = v33.Parent;
                v33.AutoButtonColor = false;
                local v35 = tonumber((string.gsub(l_Parent_0.Name, "Update", "")));
                if not v35 then
                    return;
                else
                    table.insert(v28.updates, {
                        button = v33, 
                        frame = l_Parent_0, 
                        updateNum = v35
                    });
                    return;
                end;
            end);
            table.sort(v28.updates, function(v36, v37) --[[ Line: 128 ]]
                return v36.updateNum > v37.updateNum;
            end);
            local function v42(v38) --[[ Line: 132 ]] --[[ Name: setupTeleportButton ]]
                -- upvalues: v16 (ref), v15 (ref), v7 (ref), v13 (ref), v23 (ref), v20 (ref)
                if not v38:IsA("GuiButton") then
                    return;
                else
                    local l_v38_Attribute_0 = v38:GetAttribute("FastTravelLocation");
                    local l_v38_Attribute_1 = v38:GetAttribute("RequiredLevel");
                    v16:HandleButton(v38, function() --[[ Line: 140 ]]
                        -- upvalues: l_v38_Attribute_0 (copy), l_v38_Attribute_1 (copy), v15 (ref), v7 (ref), v13 (ref), v23 (ref), v20 (ref), v16 (ref)
                        if not l_v38_Attribute_0 then
                            return;
                        else
                            if l_v38_Attribute_1 then
                                local v41 = v15:Get(v7.Player, "PlayerStats"):expect();
                                if not v13:MeetsLevelRequirement(v41, l_v38_Attribute_1) then
                                    v23:Notify({
                                        message = ("Reach Level %* to participate!"):format(l_v38_Attribute_1), 
                                        isPositive = false, 
                                        duration = 4
                                    });
                                    return;
                                end;
                            end;
                            v20:Travel(l_v38_Attribute_0);
                            v16:Toggle(script.Name, false);
                            return;
                        end;
                    end);
                    return;
                end;
            end;
            for _, v44 in l_CollectionService_0:GetTagged("PatchNotesTeleportButton") do
                v42(v44);
            end;
            l_CollectionService_0:GetInstanceAddedSignal("PatchNotesTeleportButton"):Connect(v42);
            local function v47(v45) --[[ Line: 169 ]] --[[ Name: setupEventButton ]]
                -- upvalues: v16 (ref), l_SocialService_0 (ref)
                if not v45:IsA("GuiButton") then
                    return;
                else
                    local l_v45_Attribute_0 = v45:GetAttribute("EventId");
                    if not l_v45_Attribute_0 then
                        v45:Destroy();
                        return;
                    else
                        l_v45_Attribute_0 = tostring(l_v45_Attribute_0);
                        v16:HandleButton(v45, function() --[[ Line: 183 ]]
                            -- upvalues: l_SocialService_0 (ref), l_v45_Attribute_0 (ref)
                            l_SocialService_0:PromptRsvpToEventAsync(l_v45_Attribute_0);
                        end);
                        return;
                    end;
                end;
            end;
            for _, v49 in l_CollectionService_0:GetTagged("PatchNotesEventButton") do
                v47(v49);
            end;
            l_CollectionService_0:GetInstanceAddedSignal("PatchNotesEventButton"):Connect(v47);
            local function v52(v50) --[[ Line: 195 ]] --[[ Name: setupUIButton ]]
                -- upvalues: v16 (ref)
                local l_v50_Attribute_0 = v50:GetAttribute("UIName");
                if not l_v50_Attribute_0 then
                    return;
                else
                    v16:HandleButton(v50, function() --[[ Line: 202 ]]
                        -- upvalues: v16 (ref), l_v50_Attribute_0 (copy)
                        v16:Toggle(l_v50_Attribute_0, true);
                    end);
                    return;
                end;
            end;
            for _, v54 in l_CollectionService_0:GetTagged("UIOpenButton") do
                local l_v54_Attribute_0 = v54:GetAttribute("UIName");
                if l_v54_Attribute_0 then
                    v16:HandleButton(v54, function() --[[ Line: 202 ]]
                        -- upvalues: v16 (ref), l_v54_Attribute_0 (copy)
                        v16:Toggle(l_v54_Attribute_0, true);
                    end);
                end;
            end;
            l_CollectionService_0:GetInstanceAddedSignal("UIOpenButton"):Connect(v52);
            v28:TogglePatchNotes(v28.updates[2].frame, true);
            local _ = require(l_ReplicatedStorage_0.Shared.Util.DateTimeUtil);
            local l_workspace_ServerTimeNow_0 = workspace:GetServerTimeNow();
            local l_CHRISTMAS_START_0 = v14.CHRISTMAS_START;
            v28.bin.Update52.Visible = false;
            if l_CHRISTMAS_START_0 <= l_workspace_ServerTimeNow_0 then
                v28.bin.Update52.Visible = true;
                v28:TogglePatchNotes(v28.updates[1].frame, true);
                return;
            else
                task.delay(l_CHRISTMAS_START_0 - l_workspace_ServerTimeNow_0, function() --[[ Line: 229 ]]
                    -- upvalues: v28 (copy), v12 (ref), v21 (ref), v22 (ref), v16 (ref)
                    v28.bin.Update52.Visible = true;
                    v28:TogglePatchNotes(v28.updates[1].frame, true);
                    if v12:IsLobby() and not v21:IsOpening() and not v22._unitQueue and not v16:IsPrimaryMenuOpen() then
                        v16:Toggle(script.Name, true);
                    end;
                end);
                return;
            end;
        end;
    end, 
    Opened = function(_) --[[ Line: 241 ]] --[[ Name: Opened ]]
        -- upvalues: l_GuiService_0 (copy)
        l_GuiService_0.SelectedObject = nil;
    end, 
    Closed = function(v60) --[[ Line: 245 ]] --[[ Name: Closed ]]
        -- upvalues: v19 (ref), v24 (ref)
        if v60.currentMode ~= "Lobby" then
            return;
        else
            v19:SeenPatchNotes();
            v24:TogglePatchNotesIndicator(false);
            v60.seenPatchNotes = true;
            return;
        end;
    end, 
    OnJoin = function(v61) --[[ Line: 255 ]] --[[ Name: OnJoin ]]
        -- upvalues: v9 (copy)
        v9.Custom(function() --[[ Line: 256 ]]
            -- upvalues: v61 (copy)
            return v61.seenPatchNotes;
        end):await();
        return not v61.seenPatchNotes;
    end, 
    TogglePatchNotes = function(v62, v63, v64) --[[ Line: 263 ]] --[[ Name: TogglePatchNotes ]]
        -- upvalues: l_PreferredInput_0 (copy), l_RunService_0 (copy), l_TweenService_0 (copy)
        local v65 = if v64 ~= nil then v64 else not v63.PatchNotes.Visible;
        for _, v67 in v62.updates do
            if v67.frame:FindFirstChild("PatchNotes") then
                v67.frame.PatchNotes.Visible = v67.frame == v63 and v65;
            end;
            if l_PreferredInput_0.Current ~= "Touch" then
                v67.frame.Interactable = true;
            else
                v67.frame.Interactable = v67.frame ~= v63 or not v65;
            end;
        end;
        l_RunService_0.PreRender:Once(function() --[[ Line: 280 ]]
            -- upvalues: v62 (copy), v63 (copy), l_TweenService_0 (ref)
            local v68 = v62.bin.CanvasPosition.Y + v63.AbsolutePosition.Y - v62.bin.AbsolutePosition.Y - (v62.binLayout.Padding.Offset / 2 + v62.binPadding.PaddingTop.Offset);
            if v68 < 0 then
                v68 = 0;
            end;
            local v69 = l_TweenService_0:Create(v62.bin, TweenInfo.new(0.2), {
                CanvasPosition = Vector2.new(0, v68)
            });
            v69.Completed:Once(function() --[[ Line: 295 ]]
                -- upvalues: v69 (copy)
                v69:Destroy();
            end);
            v69:Play();
        end);
    end
};