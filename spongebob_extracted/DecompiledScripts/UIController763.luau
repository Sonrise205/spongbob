local _ = game:GetService("Players");
local l_ReplicatedFirst_0 = game:GetService("ReplicatedFirst");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("GuiService");
local l_RunService_0 = game:GetService("RunService");
local _ = game:GetService("StarterGui");
local l_TweenService_0 = game:GetService("TweenService");
local l_Packages_0 = l_ReplicatedStorage_0.Packages;
local l_Util_0 = script.Util;
local l_GuiModules_0 = script.GuiModules;
local v10 = nil;
local v11 = nil;
local v12 = nil;
local v13 = nil;
local v14 = require(l_Packages_0.Knit);
local v15 = require(l_Packages_0.Signal);
local v16 = require(l_Packages_0.Promise);
local v17 = require(l_Packages_0.Dumpster);
local _ = require(l_Packages_0.TableUtil);
local v19 = require(l_ReplicatedStorage_0.Shared.Modules.WWSDebug);
local v20 = require(l_Util_0.ClassicButton);
local v21 = require(l_ReplicatedFirst_0.AutoScaler);
local _ = require(l_Util_0.RichTextStroker);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v24 = require(l_Util_0.HoldButton);
local v25 = require(l_Util_0.Shaker);
local v26 = require(l_Util_0.Pulse);
local v27 = require(l_ReplicatedStorage_0.Shared.Util.PathUtil);
local v28 = require(l_ReplicatedFirst_0.PlaceIds);
local v29 = require(l_ReplicatedStorage_0.Shared.Data.Variables);
local v30 = require(l_ReplicatedStorage_0.Shared.Util.CharacterUtil);
local v31 = require(l_ReplicatedStorage_0.Shared.Util.PromisePolicyInfo);
local v32 = TweenInfo.new(0.15, Enum.EasingStyle.Circular, Enum.EasingDirection.Out);
local v33 = {
    "TouchGui", 
    "ContextActionGui", 
    "Chat", 
    "TopbarPlus", 
    "ProximityPrompts", 
    "LoadingScreen", 
    "SprintMobile"
};
local v34 = {
    "PromptOverlay", 
    "MessagePrompt", 
    "NumberPrompt", 
    "FirstUnitSelection", 
    "FirstUnitSelection2", 
    "Notification", 
    "TradeCategories", 
    "BossDialog"
};
local v35 = v14.CreateController({
    Name = "UIController", 
    PrimaryMenuClosed = v15.new(), 
    PrimaryMenuOpened = v15.new(), 
    PrimaryMenuOpening = v15.new(), 
    Toggling = v15.new(), 
    Toggled = v15.new(), 
    ToggledAll = v15.new(), 
    ModuleAdded = v15.new(), 
    Loaded = v15.new(), 
    IsLoaded = false, 
    Util = {}, 
    GuiModules = {}, 
    modules = {}, 
    toggleStates = {}, 
    uis = {}, 
    togglePromises = {}, 
    primaryMenuActive = nil
});
v35.KnitInit = function(_) --[[ Line: 118 ]] --[[ Name: KnitInit ]]
    -- upvalues: v10 (ref), v14 (copy), v11 (ref), v12 (ref), v13 (ref)
    v10 = v14.GetController("BlurController");
    v11 = v14.GetController("FOVController");
    v12 = v14.GetController("NPEController");
    v13 = v14.GetController("CharacterController");
end;
v35.KnitStart = function(v37) --[[ Line: 127 ]] --[[ Name: KnitStart ]]
    -- upvalues: v14 (copy), l_ReplicatedStorage_0 (copy), v28 (copy), l_GuiModules_0 (copy), l_Util_0 (copy), v31 (copy), v33 (copy), v21 (copy), v16 (copy), v12 (ref), v29 (copy), l_RunService_0 (copy)
    if not game:IsLoaded() then
        game.Loaded:Wait();
    end;
    local l_PlayerGui_0 = v14.Player:WaitForChild("PlayerGui");
    local l_GUI_0 = l_ReplicatedStorage_0.GUI;
    v37.currentMode = v28:GetDestination();
    local v40 = {};
    local function v46(v41) --[[ Line: 138 ]] --[[ Name: preloadUI ]]
        -- upvalues: l_GUI_0 (copy), l_GuiModules_0 (ref), l_PlayerGui_0 (copy), v40 (copy)
        print((("Awaiting UI: %*"):format(v41)));
        local v42 = l_GUI_0:WaitForChild(v41);
        for _, v44 in v42:GetChildren() do
            local l_Name_0 = v44.Name;
            if l_GuiModules_0:FindFirstChild(l_Name_0) then
                v44.Parent = l_PlayerGui_0;
                table.insert(v40, l_Name_0);
            end;
        end;
        v42:Destroy();
        print((("Loaded UI: %*"):format(v41)));
    end;
    v46(v37.currentMode);
    if v37.currentMode ~= "Lobby" and v28:IsHUB() then
        v46("Lobby");
    end;
    if v37.currentMode ~= "AFK" then
        v46("Shared");
    end;
    local v47 = {};
    for _, v49 in l_Util_0:GetChildren() do
        v37.Util[v49.Name] = require(v49);
    end;
    local _, _ = v31():await();
    for _, v53 in l_GuiModules_0:GetChildren() do
        if v53.Name ~= "GuiControllerTemplate" and table.find(v40, v53.Name) then
            local l_l_PlayerGui_0_FirstChild_0 = l_PlayerGui_0:FindFirstChild(v53.Name);
            if l_l_PlayerGui_0_FirstChild_0 then
                v37.uis[v53.Name] = l_l_PlayerGui_0_FirstChild_0;
                v37.modules[v53.Name] = require(v53);
                v37.GuiModules[v53.Name] = v37.modules[v53.Name];
                v37.ModuleAdded:Fire(v53.Name, v37.modules[v53.Name]);
                table.insert(v47, {
                    gui = l_l_PlayerGui_0_FirstChild_0, 
                    class = v37.modules[v53.Name]
                });
            end;
        end;
    end;
    for _, v56 in v47 do
        v37.uis[v56.gui.Name] = v56.gui;
        if typeof(v56.class.Init) == "function" then
            v56.class:Init(v56.gui, v37.currentMode);
        end;
        v37:_initToggle(v56.gui.Name);
    end;
    for _, v58 in v47 do
        if typeof(v58.class.Start) == "function" then
            task.spawn(v58.class.Start, v58.class, v58.gui);
        end;
    end;
    l_PlayerGui_0.ChildAdded:Connect(function(v59) --[[ Line: 239 ]]
        -- upvalues: l_GuiModules_0 (ref), v37 (copy)
        if not v59:IsA("ScreenGui") then
            return;
        else
            local l_l_GuiModules_0_FirstChild_0 = l_GuiModules_0:FindFirstChild(v59.Name);
            if not l_l_GuiModules_0_FirstChild_0 then
                return;
            else
                l_l_GuiModules_0_FirstChild_0 = require(l_l_GuiModules_0_FirstChild_0);
                v37.uis[v59.Name] = v59;
                v37.modules[v59.Name] = l_l_GuiModules_0_FirstChild_0;
                v37.GuiModules[v59.Name] = v37.modules[v59.Name];
                v37.ModuleAdded:Fire(v59.Name, v37.modules[v59.Name]);
                if typeof(l_l_GuiModules_0_FirstChild_0.Init) == "function" then
                    l_l_GuiModules_0_FirstChild_0:Init(v59, v37.currentMode);
                end;
                v37:_initToggle(v59.Name);
                if typeof(l_l_GuiModules_0_FirstChild_0.Start) == "function" then
                    task.spawn(l_l_GuiModules_0_FirstChild_0.Start, l_l_GuiModules_0_FirstChild_0, v59);
                end;
                return;
            end;
        end;
    end);
    local function v66(v61) --[[ Line: 273 ]] --[[ Name: descendantAdded ]]
        -- upvalues: v33 (ref), v21 (ref)
        local l_v61_FirstAncestorOfClass_0 = v61:FindFirstAncestorOfClass("ScreenGui");
        if not l_v61_FirstAncestorOfClass_0 then
            return;
        elseif table.find(v33, l_v61_FirstAncestorOfClass_0.Name) then
            return;
        elseif v61:GetAttribute(v21.AUTO_SCALE_IGNORE_ATTRIBUTE) then
            return;
        else
            if v21.UI_ELEMENTS_TO_AUTO_SCALE[v61.ClassName] then
                local v63 = v21.new(v61);
                if not v63 then
                    return;
                else
                    v61.AncestryChanged:Once(function(_, v65) --[[ Line: 293 ]]
                        -- upvalues: v63 (copy)
                        if not v65 then
                            v63:Destroy();
                        end;
                    end);
                end;
            end;
            return;
        end;
    end;
    for _, v68 in l_PlayerGui_0:GetDescendants() do
        task.spawn(v66, v68);
    end;
    l_PlayerGui_0.DescendantAdded:Connect(v66);
    v16.new(function(v69) --[[ Line: 308 ]]
        -- upvalues: v14 (ref)
        if v14.Player:GetAttribute("Loading") then
            v14.Player:GetAttributeChangedSignal("Loading"):Once(function() --[[ Line: 312 ]]
                -- upvalues: v69 (copy)
                v69();
            end);
            return;
        else
            v69();
            return;
        end;
    end):await();
    local v70 = {};
    for _, v72 in v47 do
        local l_Name_1 = v72.gui.Name;
        table.insert(v70, (v37:Toggle(l_Name_1, (v37:_getInitialState(l_Name_1)))));
    end;
    v16.allSettled(v70):await();
    v37.IsLoaded = true;
    v37.Loaded:Fire();
    if not v28:IsLobby() and not v28:IsKarateLobby() then
        return;
    else
        if v12:IsInNPE() then
            v12.NPEFinished:Wait();
        end;
        for _, v75 in v29.ON_JOIN_UI do
            local v76 = v37.modules[v75];
            if not v76 then
                warn("No module found for OnJoin UI:", v75);
            elseif typeof(v76.OnJoin) ~= "function" then
                warn("No OnJoin function found for UI:", v75);
            elseif v76:OnJoin() and pcall(v37.Toggle, v37, v75, true) then
                local v77 = nil;
                do
                    local l_v77_0 = v77;
                    v16.new(function(v79) --[[ Line: 370 ]]
                        -- upvalues: l_v77_0 (ref), v37 (copy), v75 (copy)
                        l_v77_0 = v37.Toggled:Connect(function(v80, v81) --[[ Line: 371 ]]
                            -- upvalues: v75 (ref), v79 (copy)
                            if v80 == v75 and not v81 then
                                v79();
                            end;
                        end);
                    end):await();
                    l_v77_0:Disconnect();
                    l_RunService_0.RenderStepped:Wait();
                end;
            end;
        end;
        return;
    end;
end;
local v82 = {};
v35.HandleButton = function(_, v84, v85, v86) --[[ Line: 388 ]] --[[ Name: HandleButton ]]
    -- upvalues: v82 (copy), v17 (copy), v20 (copy)
    local v87 = if typeof(v84) == "table" then v84.button else v84;
    if v82[v87] then
        v82[v87]:Destroy();
    end;
    v82[v87] = nil;
    local v88 = v17.new();
    v88:Add(function() --[[ Line: 402 ]]
        -- upvalues: v82 (ref), v87 (ref), v88 (ref)
        v82[v87] = nil;
        v87 = nil;
        v88 = nil;
    end);
    local v89 = v20.new(v84, v85, v86);
    if v89 then
        v88:Add(v89);
    end;
    v88:AttachTo(v87);
    return v88;
end;
v35.HandleHoldButton = function(_, v91, v92, v93, v94) --[[ Line: 419 ]] --[[ Name: HandleHoldButton ]]
    -- upvalues: v82 (copy), v17 (copy), v24 (copy)
    local v95 = if typeof(v91) == "table" then v91.button else v91;
    if v82[v95] then
        v82[v95]:Destroy();
    end;
    v82[v95] = nil;
    local v96 = v17.new();
    v96:Add(function() --[[ Line: 433 ]]
        -- upvalues: v82 (ref), v95 (ref), v96 (ref)
        v82[v95] = nil;
        v95 = nil;
        v96 = nil;
    end);
    local v97 = v24.new(v91, v92, v93, v94);
    if v97 then
        v96:Add(v97);
    end;
    v96:AttachTo(v95);
end;
v35.HandleShaker = function(_, v99, v100) --[[ Line: 448 ]] --[[ Name: HandleShaker ]]
    -- upvalues: v25 (copy)
    return v25.new(v99, v100);
end;
v35.HandlePulse = function(_, v102, v103) --[[ Line: 452 ]] --[[ Name: HandlePulse ]]
    -- upvalues: v26 (copy)
    return v26.new(v102, v103);
end;
v35.ToggleMultiple = function(v104, v105, v106, v107) --[[ Line: 458 ]] --[[ Name: ToggleMultiple ]]
    for _, v109 in v105 do
        local v110 = v104.uis[v109];
        if v109 and (not v107 or v107(v110)) then
            v104:Toggle(v109, v106);
        end;
    end;
end;
v35.ToggleAll = function(v111, v112, v113, v114) --[[ Line: 475 ]] --[[ Name: ToggleAll ]]
    -- upvalues: v34 (copy)
    local v115 = {};
    for v116, v117 in v111.GuiModules do
        if (not v114 or not v117.primaryMenu) and not table.find(v34, v116) and (not v112 or not table.find(v112, v116)) then
            local l_v111_ScreenGui_0 = v111:GetScreenGui(v116);
            if l_v111_ScreenGui_0 then
                local l_v111_ToggleState_0 = v111:GetToggleState(v116);
                if l_v111_ToggleState_0 ~= v113 then
                    l_v111_ScreenGui_0:SetAttribute("Hidden", v113 == false);
                    v111:Toggle(v116, v113);
                    v115[v116] = l_v111_ToggleState_0;
                end;
            end;
        end;
    end;
    return v115;
end;
v35.ClosePrimaryMenus = function(v120) --[[ Line: 511 ]] --[[ Name: ClosePrimaryMenus ]]
    -- upvalues: v16 (copy)
    local v121 = {};
    for v122, v123 in v120.GuiModules do
        if v123.primaryMenu and not v123.ignoreClosePrimaryMenus and v122 ~= "GuiControllerTemplate" then
            local v124 = v120:Toggle(v122, false);
            if v124 then
                table.insert(v121, v124);
            end;
        end;
    end;
    return v16.allSettled(v121);
end;
v35.RevertFromToggleAll = function(v125, v126, v127) --[[ Line: 538 ]] --[[ Name: RevertFromToggleAll ]]
    local v128 = {};
    for v129, v130 in v126 do
        if not v127 or not v125.modules[v129] or not v125.modules[v129].primaryMenu then
            local v131 = v125:Toggle(v129, v130);
            if v131 then
                table.insert(v128, v131);
            end;
        end;
    end;
    return v128;
end;
v35.GetToggleState = function(v132, v133) --[[ Line: 556 ]] --[[ Name: GetToggleState ]]
    return v132.toggleStates[v133] == true;
end;
v35.IsPrimaryMenuOpen = function(v134) --[[ Line: 560 ]] --[[ Name: IsPrimaryMenuOpen ]]
    return v134.primaryMenuActive ~= nil;
end;
v35.CheckIfPrimaryMenu = function(v135, v136) --[[ Line: 564 ]] --[[ Name: CheckIfPrimaryMenu ]]
    local v137 = v135.modules[v136];
    if not v137 then
        return false;
    else
        return v137.primaryMenu;
    end;
end;
v35.GetActivePrimaryMenu = function(v138) --[[ Line: 573 ]] --[[ Name: GetActivePrimaryMenu ]]
    return v138.primaryMenuActive;
end;
v35.GetScreenGui = function(v139, v140) --[[ Line: 578 ]] --[[ Name: GetScreenGui ]]
    return v139.uis[v140];
end;
v35.GetScreenGuiAsync = function(v141, v142) --[[ Line: 582 ]] --[[ Name: GetScreenGuiAsync ]]
    -- upvalues: v16 (copy), v14 (copy)
    local v143 = v141.uis[v142];
    if v143 then
        return v16.resolve(v143);
    else
        local function v146() --[[ Line: 588 ]] --[[ Name: fetchUI ]]
            -- upvalues: v16 (ref), v143 (ref), v141 (copy), v142 (copy)
            return v16.new(function(v144, v145) --[[ Line: 589 ]]
                -- upvalues: v143 (ref), v141 (ref), v142 (ref)
                v143 = v141.uis[v142];
                if not v143 then
                    v145((("No UI found with name: %*"):format(v142)));
                end;
                v144(v143);
            end);
        end;
        return v16.retryWithDelay(v146, 60, 0.5):catch(function(_) --[[ Line: 599 ]]
            -- upvalues: v142 (copy), v14 (ref)
            warn("Failed to load a UI: ", v142);
            v14.Player:Kick("Something went wrong, please rejoin the game! (Developer error code: 404-2)");
        end);
    end;
end;
v35.GetModule = function(v148, v149) --[[ Line: 608 ]] --[[ Name: GetModule ]]
    return v148.modules[v149];
end;
v35.GetModuleAsync = function(v150, v151) --[[ Line: 613 ]] --[[ Name: GetModuleAsync ]]
    -- upvalues: v16 (copy), v14 (copy)
    local v152 = v150.modules[v151];
    if v152 then
        return v16.resolve(v152);
    else
        local function v155() --[[ Line: 619 ]] --[[ Name: fetchModule ]]
            -- upvalues: v16 (ref), v152 (ref), v150 (copy), v151 (copy)
            return v16.new(function(v153, v154) --[[ Line: 620 ]]
                -- upvalues: v152 (ref), v150 (ref), v151 (ref)
                v152 = v150.modules[v151];
                if not v152 then
                    v154((("No UI Module found with name: %*"):format(v151)));
                end;
                v153(v152);
            end);
        end;
        local v156 = debug.traceback();
        return v16.retryWithDelay(v155, 60, 0.5):catch(function(_) --[[ Line: 632 ]]
            -- upvalues: v151 (copy), v156 (copy), v14 (ref)
            warn((("Failed to get a GUI module: \"%*\"\n> Trace: %*"):format(v151, v156)));
            v14.Player:Kick("Something went wrong, please rejoin the game! (Developer error code: 404-1)");
        end);
    end;
end;
v35.ToggleHideAll = function(v158, v159, v160) --[[ Line: 639 ]] --[[ Name: ToggleHideAll ]]
    if v159 then
        v158.uiHidden = true;
        v158.ToggledAll:Fire(true);
        v158.toggleAllCache = v158:ToggleAll(nil, false);
        v158:Toggle("Notification", false);
        v158.toggleAllCache.Notification = true;
        if v160 then
            for _, v162 in v160 do
                if v158.toggleAllCache[v162] then
                    v158.toggleAllCache[v162] = nil;
                end;
            end;
        end;
        return;
    else
        v158.uiHidden = false;
        if v158.toggleAllCache then
            v158:RevertFromToggleAll(v158.toggleAllCache, true);
            v158.toggleAllCache = nil;
        end;
        v158.ToggledAll:Fire(false);
        return;
    end;
end;
v35.Toggle = function(v163, v164, v165, v166) --[[ Line: 669 ]] --[[ Name: Toggle ]]
    -- upvalues: v16 (copy), v30 (copy), v14 (copy), v34 (copy), v10 (ref), v11 (ref)
    local v167 = v163.uis[v164];
    local v168 = v163.modules[v164];
    if not v167 or not v168 then
        return v16.resolve();
    else
        if v168.primaryMenu or v168.hideMobileControls == true then
            v30:SetJumpPower(v14.Player, v165 and 0 or nil);
        end;
        if v168.primaryMenu then
            if v164 ~= "VideoPlayer" and v163:GetToggleState("VideoPlayer") then
                return v16.resolve();
            else
                local l_v163_ActivePrimaryMenu_0 = v163:GetActivePrimaryMenu();
                local v170 = l_v163_ActivePrimaryMenu_0 and v163:GetModule(l_v163_ActivePrimaryMenu_0);
                if v165 and v170 and v170.highPriority and not v168.highPriority then
                    return v16.resolve();
                end;
            end;
        end;
        local l_v163_ToggleState_0 = v163:GetToggleState(v164);
        if v165 == nil then
            v165 = not l_v163_ToggleState_0;
        end;
        if v165 == l_v163_ToggleState_0 then
            return v16.resolve();
        elseif v165 and v163.uiHidden and v164 ~= "Notification" and not table.find(v34, v164) then
            return v16.resolve();
        elseif v165 and typeof(v168.CanOpen) == "function" and not v168:CanOpen() then
            return v16.resolve();
        else
            local v172 = {};
            if v165 and v168.primaryMenu then
                v163.primaryMenuActive = v164;
            end;
            if v168.primaryMenu and v163.globalToggleAllRevertQueue then
                v16.allSettled(v163.globalToggleAllRevertQueue):andThen(function() --[[ Line: 728 ]]
                    -- upvalues: v163 (copy), v164 (copy), v165 (ref)
                    v163:Toggle(v164, v165);
                end);
                return v16.resolve();
            else
                v163.Toggling:Fire(v164, v165);
                v163.toggleStates[v164] = v165;
                local v173 = nil;
                if v163.togglePromises[v164] then
                    for v174 = #v163.togglePromises[v164], 1, -1 do
                        v163.togglePromises[v164][v174]:cancel();
                    end;
                end;
                local v175 = {};
                v163.togglePromises[v164] = v175;
                if v165 and v168.primaryMenu then
                    for v176, v177 in v163.modules do
                        if v176 ~= v164 and v177.primaryMenu and v163:GetToggleState(v176) then
                            local v178 = v163:Toggle(v176, false);
                            if v178 then
                                table.insert(v172, v178);
                                if v177.HiddenUI then
                                    if v168.ToggleAll then
                                        v173 = table.clone(v177.HiddenUI);
                                        v177.HiddenUI = nil;
                                    else
                                        v163:RevertFromToggleAll(table.clone(v177.HiddenUI), true);
                                        v177.HiddenUI = nil;
                                    end;
                                end;
                            end;
                        end;
                    end;
                end;
                local v194 = v16.new(function(v179) --[[ Line: 796 ]]
                    -- upvalues: v16 (ref), v172 (copy), v175 (copy), v165 (ref), v167 (copy), v168 (copy), v163 (copy), v166 (copy), v164 (copy), v10 (ref), v11 (ref), v173 (ref)
                    local v180 = v16.allSettled(v172);
                    local v181 = nil;
                    table.insert(v175, v180);
                    table.insert(v175, v180:andThen(function() --[[ Line: 802 ]]
                        -- upvalues: v165 (ref), v167 (ref), v168 (ref), v163 (ref), v16 (ref), v166 (ref), v164 (ref), v10 (ref), v11 (ref), v173 (ref), v181 (ref), v175 (ref), v179 (copy)
                        local v182 = v165 and "Opened" or "Closed";
                        local v183 = v165 and "Opening" or "Closing";
                        local v184 = nil;
                        if not v167:GetAttribute("Hidden") then
                            local v185 = v165 and "ToggleAll" or "RevertFromToggleAll";
                            if typeof(v168[v185]) == "function" then
                                if v185 == "RevertFromToggleAll" then
                                    v163.globalToggleAllRevertQueue = v168.RevertFromToggleAll(v168, v167);
                                    if v163.globalToggleAllRevertQueue then
                                        v16.allSettled(v163.globalToggleAllRevertQueue):andThen(function() --[[ Line: 814 ]]
                                            -- upvalues: v163 (ref)
                                            v163.globalToggleAllRevertQueue = nil;
                                        end);
                                    end;
                                else
                                    v168.ToggleAll(v168, v167);
                                end;
                            end;
                        end;
                        if v168.primaryMenu or v168.ToggleProperties then
                            v184 = v163:_attemptToggle(v168, v167, v165, v166);
                            if v168.primaryMenu then
                                v163.PrimaryMenuOpening:Fire(v164);
                            end;
                            if typeof(v168[v183]) == "function" then
                                task.spawn(v168[v183], v168, v167);
                            end;
                        else
                            v167.Enabled = v165 or v167.Enabled;
                            v184 = v16.resolve();
                        end;
                        if v168.primaryMenu then
                            if v168.blur then
                                local v186 = if v165 then v10.DEFAULT_SIZE else 0;
                                v11[v165 and "SetFOV" or "Revert"](v11);
                                v10:SetBlur(v186);
                            end;
                            if v168.depthOfField then
                                v11[v165 and "SetFOV" or "Revert"](v11);
                                v10:SetDepth(v165);
                            end;
                            if v168.ToggleAll then
                                if v165 then
                                    if not v173 then
                                        v168.HiddenUI = v163:ToggleAll(v168.ToggleAll, false, true);
                                        for _, v188 in v168.ToggleAll do
                                            v168.HiddenUI[v188] = true;
                                        end;
                                    else
                                        v168.HiddenUI = v173;
                                        for v189, v190 in v168.HiddenUI do
                                            local v191 = table.find(v168.ToggleAll, v189) ~= nil;
                                            if v191 then
                                                v163:Toggle(v189, true);
                                            elseif not v191 and v190 and v163:GetToggleState(v189) then
                                                v163:Toggle(v189, false);
                                                v168.HiddenUI[v189] = true;
                                            end;
                                        end;
                                    end;
                                elseif v168.HiddenUI then
                                    local v192 = v163:RevertFromToggleAll(table.clone(v168.HiddenUI), true);
                                    v168.HiddenUI = nil;
                                    if v192 then
                                        v181 = v16.allSettled(v192);
                                    end;
                                end;
                            end;
                        end;
                        if v168.playToggleSound and not v168.primaryMenu and not v168.primaryMenu then
                            task.defer(function() --[[ Line: 890 ]]
                                -- upvalues: v163 (ref)
                                if v163.primaryMenuActive then
                                    return;
                                else
                                    return;
                                end;
                            end);
                        end;
                        if not v181 then
                            v181 = v16.resolve();
                        end;
                        table.insert(v175, v184);
                        table.insert(v175, v181);
                        table.insert(v175, v184:andThen(function() --[[ Line: 907 ]]
                            -- upvalues: v168 (ref), v182 (copy), v167 (ref), v165 (ref), v163 (ref), v164 (ref), v179 (ref), v175 (ref), v181 (ref)
                            if typeof(v168[v182]) == "function" then
                                task.spawn(function() --[[ Line: 909 ]]
                                    -- upvalues: v168 (ref), v182 (ref), v167 (ref)
                                    local v193 = v168[v182](v168, v167);
                                    if v193 then
                                        v193:catch(warn);
                                    end;
                                end);
                            end;
                            v167.Enabled = v165;
                            if v165 then
                                if v168.primaryMenu then
                                    v163.PrimaryMenuOpened:Fire(v164);
                                end;
                                v163.Toggled:Fire(v164, true);
                                v167:SetAttribute("Hidden", false);
                                v179();
                                return;
                            elseif not v165 and v168.primaryMenu and v163.primaryMenuActive == v164 then
                                table.insert(v175, v181:andThen(function() --[[ Line: 929 ]]
                                    -- upvalues: v163 (ref), v164 (ref), v179 (ref)
                                    v163.primaryMenuActive = nil;
                                    v163.PrimaryMenuClosed:Fire(v164);
                                    v163.Toggled:Fire(v164, false);
                                    v179();
                                end));
                                return;
                            else
                                v163.Toggled:Fire(v164, v165);
                                v179();
                                return;
                            end;
                        end));
                    end));
                end);
                table.insert(v175, v194);
                return v194;
            end;
        end;
    end;
end;
v35.OnLoaded = function(v195, v196) --[[ Line: 952 ]] --[[ Name: OnLoaded ]]
    -- upvalues: v19 (copy)
    v19:Assert(v196 and typeof(v196) == "function", "Callback must be a function!");
    if v195.IsLoaded then
        task.spawn(v196);
        return;
    else
        v195.Loaded:Once(function() --[[ Line: 960 ]]
            -- upvalues: v196 (copy)
            task.spawn(v196);
        end);
        return;
    end;
end;
v35._getInitialState = function(v197, v198) --[[ Line: 965 ]] --[[ Name: _getInitialState ]]
    local v199 = v197.uis[v198];
    local v200 = v197.modules[v198];
    if not v199 or not v200 then
        return;
    else
        local l_v199_Attribute_0 = v199:GetAttribute("INITIAL_STATE");
        return (if l_v199_Attribute_0 ~= nil then l_v199_Attribute_0 else v199.Enabled) and typeof(v200.CanOpen) == "function" and v200:CanOpen();
    end;
end;
v35._initToggle = function(v202, v203) --[[ Line: 983 ]] --[[ Name: _initToggle ]]
    -- upvalues: v14 (copy), v27 (copy)
    local v204 = v202.uis[v203];
    local v205 = v202.modules[v203];
    if not v204 or not v205 then
        return;
    else
        local v206 = v202:_getInitialState(v203);
        v204:SetAttribute("INITIAL_STATE", v206);
        if v14.Player:GetAttribute("Loading") then
            v206 = false;
        end;
        v202.toggleStates[v203] = v206;
        v204.Enabled = v206;
        local l_ToggleProperties_0 = v205.ToggleProperties;
        if not l_ToggleProperties_0 then
            return;
        else
            for v208, v209 in l_ToggleProperties_0 do
                local v210 = v27(v204, v208);
                if v210 then
                    local v211 = if v206 then v209.Open else v209.Close;
                    for v212, v213 in v211 do
                        if v212 ~= "ToggleTweenInfo" then
                            v210[v212] = v213;
                        end;
                    end;
                end;
            end;
            return;
        end;
    end;
end;
v35._attemptToggle = function(_, v215, v216, v217, v218) --[[ Line: 1028 ]] --[[ Name: _attemptToggle ]]
    -- upvalues: v16 (copy), v27 (copy), v32 (copy), l_TweenService_0 (copy), v17 (copy)
    local v219 = v218 or v215.ToggleProperties;
    if not v219 then
        v216.Enabled = v217;
        return v16.resolve();
    else
        if v217 then
            v216.Enabled = true;
        end;
        local v220 = {};
        for v221, v222 in v219 do
            local v223 = v27(v216, v221);
            if v223 then
                local v224 = if v217 then v222.Open else v222.Close;
                if v224 then
                    local l_ToggleTweenInfo_0 = v224.ToggleTweenInfo;
                    local v226 = {};
                    for v227, v228 in v224 do
                        if v227 ~= "ToggleTweenInfo" then
                            v226[v227] = if typeof(v228) == "function" then v228() else v228;
                        end;
                    end;
                    local v229 = if l_ToggleTweenInfo_0 then l_ToggleTweenInfo_0 else if v222.ToggleTweenInfo then v222.ToggleTweenInfo else if v215.ToggleTweenInfo then v215.ToggleTweenInfo else v32;
                    local v230 = l_TweenService_0:Create(v223, v229, v226);
                    do
                        local l_v230_0 = v230;
                        table.insert(v220, v16.new(function(v232) --[[ Line: 1073 ]]
                            -- upvalues: v17 (ref), l_v230_0 (ref)
                            local v233 = v17.new();
                            v233:Add(l_v230_0.Completed:Once(function() --[[ Line: 1076 ]]
                                -- upvalues: v233 (ref)
                                v233:Destroy();
                            end));
                            v233:Add(function() --[[ Line: 1080 ]]
                                -- upvalues: l_v230_0 (ref), v233 (ref), v232 (copy)
                                l_v230_0:Cancel();
                                l_v230_0:Destroy();
                                l_v230_0 = nil;
                                v233 = nil;
                                v232();
                            end);
                            l_v230_0:Play();
                        end));
                    end;
                end;
            end;
        end;
        if #v220 < 1 then
            return v16.resolve();
        else
            return v16.allSettled(v220);
        end;
    end;
end;
return v35;