local l_ReplicatedFirst_0 = game:GetService("ReplicatedFirst");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_RunService_0 = game:GetService("RunService");
local l_TeleportService_0 = game:GetService("TeleportService");
local l_TweenService_0 = game:GetService("TweenService");
local _ = game:GetService("UserInputService");
local v6 = require(l_ReplicatedStorage_0.Packages.Knit);
local _ = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v8 = require(l_ReplicatedStorage_0.Packages.Promise);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local _ = require(l_ReplicatedStorage_0.Shared.Util.PathUtil);
local _ = require(l_ReplicatedStorage_0.Shared.Data.Variables);
local _ = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local v13 = require(l_ReplicatedStorage_0.Shared.Modules.WWSDebug);
local v14 = require(l_ReplicatedFirst_0.GetLoadingScreen);
local v15 = TweenInfo.new(0.75, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut);
local v16 = nil;
local v17 = nil;
local v18 = nil;
local v19 = nil;
local v20 = v6.CreateController({
    Name = script.Name, 
    Client = {}
});
v20.KnitInit = function(_) --[[ Line: 51 ]] --[[ Name: KnitInit ]]
    -- upvalues: v16 (ref), v6 (copy), v17 (ref), v18 (ref), v19 (ref)
    v16 = v6.GetController("DataController");
    v17 = v6.GetService("PlaceTeleportService");
    v18 = v6.GetController("AudioController");
    v19 = v6.GetController("UIController");
end;
v20.KnitStart = function(v22) --[[ Line: 59 ]] --[[ Name: KnitStart ]]
    -- upvalues: v17 (ref)
    v17.TeleportScreen:Connect(function(v23, v24, v25, v26) --[[ Line: 60 ]]
        -- upvalues: v22 (copy)
        if not v24 then
            v22:_showLoadingScreen("General", v23);
            return;
        else
            local v27 = v25 and (v25 < 6 and 1 or 2);
            if v26 and v25 > 1 then
                v27 = 2;
            end;
            v22:_showLoadingScreen("Game", v24, v27);
            return;
        end;
    end);
end;
v20.Teleport = function(v28, v29) --[[ Line: 78 ]] --[[ Name: Teleport ]]
    -- upvalues: l_RunService_0 (copy), v13 (copy), v6 (copy), v17 (ref)
    if l_RunService_0:IsStudio() then
        v13:Warn("Cannot teleport in Studio");
        return;
    elseif v6.Player:GetAttribute("PARTY_ID") then
        v17:Teleport(v29);
        return;
    else
        v28:_showLoadingScreen("General", v29):andThen(function() --[[ Line: 97 ]]
            -- upvalues: v17 (ref), v29 (copy)
            warn("attempting teleport");
            v17:Teleport(v29);
        end);
        return;
    end;
end;
v20._showLoadingScreen = function(_, v31, v32, v33) --[[ Line: 105 ]] --[[ Name: _showLoadingScreen ]]
    -- upvalues: v14 (copy), v6 (copy), l_TeleportService_0 (copy), l_RunService_0 (copy), v18 (ref), l_TweenService_0 (copy), v15 (copy), v8 (copy), v19 (ref), v17 (ref)
    local v34 = v14.Create(v31, v32, v33);
    v34.Enabled = false;
    local l_Main_0 = v34.Main;
    local l_Background_0 = l_Main_0.Background;
    local l_LoadingIcon_0 = l_Main_0.LoadingIcon;
    local l_Info_0 = l_Main_0.Info;
    v34.Parent = v6.Player.PlayerGui;
    task.wait();
    local v39 = v34:Clone();
    v39.Enabled = true;
    l_TeleportService_0:SetTeleportGui(v39);
    l_Main_0.BackgroundTransparency = 1;
    l_Background_0.ImageTransparency = 1;
    l_LoadingIcon_0.ImageTransparency = 1;
    for _, v41 in l_Info_0:GetDescendants() do
        if v41:IsA("TextLabel") then
            v41.TextTransparency = 1;
        elseif v41:IsA("UIScale") then
            v41.Transparency = 1;
        end;
    end;
    v34.Enabled = true;
    l_RunService_0.RenderStepped:Connect(function(v42) --[[ Line: 137 ]]
        -- upvalues: l_LoadingIcon_0 (copy)
        local l_l_LoadingIcon_0_0 = l_LoadingIcon_0;
        l_l_LoadingIcon_0_0.Rotation = l_l_LoadingIcon_0_0.Rotation + 60 * v42;
    end);
    v18:StopAllMusic(1);
    local v44 = {
        l_TweenService_0:Create(l_Main_0, v15, {
            BackgroundTransparency = 0
        }), 
        l_TweenService_0:Create(l_Background_0, v15, {
            ImageTransparency = 0
        }), 
        l_TweenService_0:Create(l_LoadingIcon_0, v15, {
            ImageTransparency = 0
        })
    };
    for _, v46 in l_Info_0:GetDescendants() do
        if v46:IsA("TextLabel") then
            table.insert(v44, l_TweenService_0:Create(v46, v15, {
                TextTransparency = 0
            }));
        elseif v46:IsA("UIStroke") then
            table.insert(v44, l_TweenService_0:Create(v46, v15, {
                Transparency = 0
            }));
        end;
    end;
    local v47 = {};
    for _, v49 in v44 do
        table.insert(v47, v8.new(function(v50) --[[ Line: 161 ]]
            -- upvalues: v49 (copy)
            v49.Completed:Once(function() --[[ Line: 162 ]]
                -- upvalues: v49 (ref), v50 (copy)
                v49:Destroy();
                v50();
            end);
            v49:Play();
        end));
    end;
    return v8.allSettled(v47):andThen(function() --[[ Line: 171 ]]
        -- upvalues: v47 (copy), v44 (copy), v19 (ref), v17 (ref)
        table.clear(v47);
        table.clear(v44);
        v19:ToggleAll(nil, false);
        v17:HideCharacter();
    end);
end;
return v20;