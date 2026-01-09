local l_CollectionService_0 = game:GetService("CollectionService");
local l_GuiService_0 = game:GetService("GuiService");
local l_Players_0 = game:GetService("Players");
local l_ReplicatedFirst_0 = game:GetService("ReplicatedFirst");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_StarterGui_0 = game:GetService("StarterGui");
local l_RunService_0 = game:GetService("RunService");
local l_TeleportService_0 = game:GetService("TeleportService");
local l_TweenService_0 = game:GetService("TweenService");
local l_ContentProvider_0 = game:GetService("ContentProvider");
local v10 = TweenInfo.new(0.75, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut);
local v11 = {
    MeshPart = true, 
    Decal = true, 
    Texture = true, 
    ImageLabel = true, 
    ImageButton = true, 
    Animation = true, 
    Sound = true, 
    ParticleEmitter = true, 
    Beam = true, 
    Trail = true
};
local v12 = require(script.Parent.PromiseFirst);
local v13 = require(script.Parent.PlaceIds);
local v14 = require(script.Parent.AutoScaler);
local v15 = require(script.Parent.GetLoadingScreen);
local v16 = l_RunService_0:IsStudio();
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_l_TeleportService_0_LocalPlayerTeleportData_0 = l_TeleportService_0:GetLocalPlayerTeleportData();
local l_v13_Destination_0 = v13:GetDestination();
l_LocalPlayer_0:SetAttribute("Loading", true);
l_LocalPlayer_0:SetAttribute("SHOW_PROMPTS", true);
local v20 = nil;
local v21 = false;
local function v34() --[[ Line: 50 ]] --[[ Name: tweenOut ]]
    -- upvalues: v21 (ref), v20 (ref), l_TweenService_0 (copy), v10 (copy), v12 (copy)
    if v21 then
        return;
    else
        v21 = true;
        local l_Main_0 = v20.Main;
        local l_Background_0 = l_Main_0.Background;
        local l_LoadingIcon_0 = l_Main_0.LoadingIcon;
        local l_Info_0 = l_Main_0.Info;
        local v26 = {
            l_TweenService_0:Create(l_Main_0, v10, {
                BackgroundTransparency = 1
            }), 
            l_TweenService_0:Create(l_Background_0, v10, {
                ImageTransparency = 1
            }), 
            l_TweenService_0:Create(l_LoadingIcon_0, v10, {
                ImageTransparency = 1
            })
        };
        for _, v28 in l_Info_0:GetDescendants() do
            if v28:IsA("TextLabel") then
                table.insert(v26, l_TweenService_0:Create(v28, v10, {
                    TextTransparency = 1
                }));
            elseif v28:IsA("UIStroke") then
                table.insert(v26, l_TweenService_0:Create(v28, v10, {
                    Transparency = 1
                }));
            end;
        end;
        local v29 = {};
        for _, v31 in v26 do
            table.insert(v29, v12.new(function(v32) --[[ Line: 79 ]]
                -- upvalues: v31 (copy)
                v31.Completed:Once(function() --[[ Line: 80 ]]
                    -- upvalues: v31 (ref), v32 (copy)
                    v31:Destroy();
                    v32();
                end);
                v31:Play();
            end));
        end;
        v12.allSettled(v29):andThen(function() --[[ Line: 89 ]]
            -- upvalues: v20 (ref), v29 (copy), v26 (copy)
            if v20 then
                v20:Destroy();
                v20 = nil;
            end;
            table.clear(v29);
            table.clear(v26);
        end):catch(function(v33) --[[ Line: 97 ]]
            -- upvalues: v20 (ref), v29 (copy), v26 (copy)
            warn((("[Loading Screen] Failed to tween out: %*"):format(v33)));
            if v20 then
                v20:Destroy();
                v20 = nil;
            end;
            table.clear(v29);
            table.clear(v26);
        end);
        return;
    end;
end;
v12.new(function(v35) --[[ Line: 134 ]]
    -- upvalues: l_ReplicatedFirst_0 (copy), l_GuiService_0 (copy), l_StarterGui_0 (copy), v16 (copy), l_v13_Destination_0 (copy), l_ReplicatedStorage_0 (copy), l_l_TeleportService_0_LocalPlayerTeleportData_0 (ref), v20 (ref), v15 (copy), l_LocalPlayer_0 (copy), v14 (copy), l_RunService_0 (copy), l_ContentProvider_0 (copy), l_CollectionService_0 (copy), v11 (copy), v12 (copy)
    l_ReplicatedFirst_0:RemoveDefaultLoadingScreen();
    l_GuiService_0.TouchControlsEnabled = false;
    l_StarterGui_0:SetCoreGuiEnabled(Enum.CoreGuiType.Backpack, false);
    l_StarterGui_0:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, false);
    l_StarterGui_0:SetCoreGuiEnabled(Enum.CoreGuiType.Health, false);
    l_StarterGui_0:SetCoreGuiEnabled(Enum.CoreGuiType.Chat, false);
    if v16 and l_v13_Destination_0 == "Game" then
        l_l_TeleportService_0_LocalPlayerTeleportData_0 = require(l_ReplicatedStorage_0:WaitForChild("TEST_FLAGS")).TEST_MATCH_SETTINGS;
    end;
    local v36 = l_l_TeleportService_0_LocalPlayerTeleportData_0 and l_l_TeleportService_0_LocalPlayerTeleportData_0.Mode;
    if l_v13_Destination_0 == "Game" then
        local v37 = nil;
        local l_Chapter_0 = l_l_TeleportService_0_LocalPlayerTeleportData_0.Chapter;
        if v36 == "Event" then
            v37 = l_Chapter_0;
        elseif v36 == "TowerOfKarate" then
            v37 = 1;
            l_l_TeleportService_0_LocalPlayerTeleportData_0.World = "TowerOfKarate";
        elseif v36 ~= "BossBattle" then
            v37 = l_Chapter_0 < 6 and 1 or 2;
            if v36 == "Endless" and l_Chapter_0 > 1 then
                v37 = 2;
            end;
        end;
        v20 = v15.Create("Game", l_l_TeleportService_0_LocalPlayerTeleportData_0.World, v37);
    else
        v20 = v15.Create("General", l_v13_Destination_0);
    end;
    v20.Parent = l_LocalPlayer_0.PlayerGui;
    local v39 = {};
    local v40 = {};
    for _, v42 in v20:GetDescendants() do
        if v14.UI_ELEMENTS_TO_AUTO_SCALE[v42.ClassName] then
            table.insert(v39, (v14.new(v42)));
        end;
    end;
    local l_LoadingIcon_1 = v20.Main.LoadingIcon;
    table.insert(v40, l_RunService_0.RenderStepped:Connect(function(v44) --[[ Line: 186 ]]
        -- upvalues: l_LoadingIcon_1 (copy)
        local l_l_LoadingIcon_1_0 = l_LoadingIcon_1;
        l_l_LoadingIcon_1_0.Rotation = l_l_LoadingIcon_1_0.Rotation + 60 * v44;
    end));
    if not game:IsLoaded() then
        game.Loaded:Wait();
    end;
    local v46 = {};
    local v47 = false;
    local function v50(v48) --[[ Line: 198 ]] --[[ Name: preloadObjAdded ]]
        -- upvalues: l_v13_Destination_0 (ref), v47 (ref), v46 (ref), l_ContentProvider_0 (ref)
        local l_v48_Attribute_0 = v48:GetAttribute("PRELOAD_BRANCH");
        l_v48_Attribute_0 = l_v48_Attribute_0 and string.lower(l_v48_Attribute_0);
        if l_v48_Attribute_0 and l_v48_Attribute_0 ~= "" and l_v48_Attribute_0 ~= l_v13_Destination_0 then
            return;
        elseif not v47 then
            table.insert(v46, v48);
            return;
        else
            task.spawn(l_ContentProvider_0.PreloadAsync, l_ContentProvider_0, {
                v48
            });
            return;
        end;
    end;
    for _, v52 in l_CollectionService_0:GetTagged("PRELOAD") do
        v50(v52);
    end;
    l_CollectionService_0:GetInstanceAddedSignal("PRELOAD"):Connect(v50);
    local v53 = 0;
    for _, v55 in v46 do
        for _, v57 in v55:GetDescendants() do
            if v11[v57.ClassName] then
                v53 = v53 + 1;
            end;
        end;
    end;
    if v53 >= 1 then
        local v58 = os.clock();
        local v59 = 0;
        do
            local l_v59_0 = v59;
            local v63 = v12.try(function() --[[ Line: 240 ]]
                -- upvalues: l_ContentProvider_0 (ref), v46 (ref), l_v59_0 (ref)
                return l_ContentProvider_0:PreloadAsync(v46, function(_, v62) --[[ Line: 241 ]]
                    -- upvalues: l_v59_0 (ref)
                    if v62 == Enum.AssetFetchStatus.Success then
                        l_v59_0 = l_v59_0 + 1;
                    end;
                end);
            end):timeout(6):await();
            local v64 = os.clock() - v58;
            local v65 = v64 < 1 and "ms" or "s";
            local v66 = tostring(if v64 < 1 then v64 * 1000 else v64);
            print((("Took %*(%*) to preload (%*) assets"):format(string.format("%.03f", v66), v65, l_v59_0)));
            if not v63 then
                warn("Failed to preload all assets in expected time");
            end;
            task.defer(function() --[[ Line: 260 ]]
                -- upvalues: l_ReplicatedStorage_0 (ref), v64 (copy)
                local l_Packages_0 = l_ReplicatedStorage_0:WaitForChild("Packages");
                local l_Knit_0 = require(l_Packages_0:WaitForChild("Knit"));
                l_Knit_0:OnStart():andThen(function() --[[ Line: 264 ]]
                    -- upvalues: l_Knit_0 (copy), v64 (ref)
                    l_Knit_0.GetService("AnalyticReportService").LoadingCompleted:Fire(v64);
                end):catch(warn);
            end);
        end;
    end;
    v47 = true;
    table.clear(v46);
    v46 = nil;
    if l_v13_Destination_0 == "Game" then
        workspace:WaitForChild("Map");
    end;
    if require(l_ReplicatedStorage_0:WaitForChild("Shared"):WaitForChild("Data"):WaitForChild("Variables")).LIMIT_ACCESS_TO_RANKS and not l_LocalPlayer_0:GetAttribute("WHITELISTED_RANK") then
        l_LocalPlayer_0:GetAttributeChangedSignal("WHITELISTED_RANK"):Wait();
        if not l_LocalPlayer_0:GetAttribute("WHITELISTED_RANK") then
            return;
        end;
    end;
    if l_v13_Destination_0 == "Cave" and not l_LocalPlayer_0:GetAttribute("ALLOWED_IN_CAVE") then
        l_LocalPlayer_0:GetAttributeChangedSignal("ALLOWED_IN_CAVE"):Wait();
        if not l_LocalPlayer_0:GetAttribute("ALLOWED_IN_CAVE") then
            return;
        end;
    end;
    for _, v70 in v39 do
        v70:Destroy();
    end;
    for _, v72 in v40 do
        v72:Disconnect();
    end;
    v35();
end):timeout(10):catch(function(v73) --[[ Line: 317 ]]
    warn((("[Loading Screen] Failed to load:\n%*"):format(v73)));
end):finally(function() --[[ Line: 110 ]] --[[ Name: finalizeLoading ]]
    -- upvalues: v34 (copy), l_v13_Destination_0 (copy), l_StarterGui_0 (copy), l_GuiService_0 (copy), l_LocalPlayer_0 (copy)
    v34();
    if l_v13_Destination_0 ~= "AFK" then
        l_StarterGui_0:SetCoreGuiEnabled(Enum.CoreGuiType.Chat, true);
    end;
    l_GuiService_0.TouchControlsEnabled = true;
    l_LocalPlayer_0:SetAttribute("Loading", false);
    if l_v13_Destination_0 == "Game" then
        task.spawn(function() --[[ Line: 121 ]]
            -- upvalues: l_StarterGui_0 (ref)
            for _ = 1, 8 do
                if not pcall(l_StarterGui_0.SetCore, l_StarterGui_0, "ResetButtonCallback", false) then
                    task.wait(0.5);
                else
                    break;
                end;
            end;
        end);
    end;
end);