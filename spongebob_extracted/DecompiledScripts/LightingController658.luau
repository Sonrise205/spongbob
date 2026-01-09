local l_Lighting_0 = game:GetService("Lighting");
local l_ReplicatedFirst_0 = game:GetService("ReplicatedFirst");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_TweenService_0 = game:GetService("TweenService");
local v4 = require(l_ReplicatedStorage_0.Packages.Knit);
local _ = require(l_ReplicatedStorage_0.Packages.Dumpster);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v7 = require(l_ReplicatedStorage_0.Shared.Util.PathUtil);
local v8 = require(l_ReplicatedStorage_0.Shared.Data.Variables);
local v9 = require(l_ReplicatedFirst_0.PlaceIds);
local v10 = TweenInfo.new(1.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut);
local v11 = nil;
local v12 = v4.CreateController({
    Name = script.Name, 
    Client = {}
});
v12.KnitInit = function(_) --[[ Line: 36 ]] --[[ Name: KnitInit ]]
    -- upvalues: v11 (ref), v4 (copy)
    v11 = v4.GetController("DataController");
end;
v12.KnitStart = function(_) --[[ Line: 41 ]] --[[ Name: KnitStart ]]

end;
v12.LoadLighting = function(_, v16, v17, v18) --[[ Line: 46 ]] --[[ Name: LoadLighting ]]
    -- upvalues: v9 (copy), v7 (copy), l_ReplicatedStorage_0 (copy), v8 (copy), l_Lighting_0 (copy), v10 (copy), l_TweenService_0 (copy)
    if not v16 then
        if v9:IsLobby() then
            v16 = "Lobby.Day";
        elseif v9:IsTrading() then
            v16 = "Trading.Normal";
        elseif v9:IsGame() then
            v16 = "Universal.Day";
            if workspace:FindFirstChild("Map") then
                v16 = workspace.Map:GetAttribute("LightingPath");
                if not v16 then
                    workspace:GetAttributeChangedSignal("LightingPath"):Wait();
                    v16 = workspace.Map:GetAttribute("LightingPath") or "Universal.Day";
                end;
            end;
        end;
    end;
    local v19 = v7(l_ReplicatedStorage_0.Lighting, v16);
    if not v19 then
        return;
    else
        v19 = require(v19);
        local v20 = {};
        local v21 = {};
        for v22, v23 in v19.Lighting do
            if not v17 and v8.TWEENABLE[typeof(v23)] then
                v21[v22] = v23;
            else
                l_Lighting_0[v22] = v23;
            end;
        end;
        local l_v10_0 = v10;
        if v18 then
            l_v10_0 = TweenInfo.new(v18, v10.EasingStyle, v10.EasingDirection);
        end;
        if not v17 then
            table.insert(v20, l_TweenService_0:Create(l_Lighting_0, l_v10_0, v21));
        end;
        if v19.Sky then
            local l_Sky_0 = l_Lighting_0:FindFirstChildOfClass("Sky");
            if not l_Sky_0 then
                l_Sky_0 = Instance.new("Sky");
                l_Sky_0.Parent = l_Lighting_0;
            end;
            for v26, v27 in v19.Sky do
                l_Sky_0[v26] = v27;
            end;
        end;
        if v19.Clouds then
            local l_Clouds_0 = workspace.Terrain:FindFirstChildOfClass("Clouds");
            if not l_Clouds_0 then
                l_Clouds_0 = Instance.new("Clouds");
                l_Clouds_0.Parent = workspace.Terrain;
            end;
            for v29, v30 in v19.Clouds do
                l_Clouds_0[v29] = v30;
            end;
        end;
        if v19.Atmosphere then
            local l_Atmosphere_0 = l_Lighting_0:FindFirstChildOfClass("Atmosphere");
            local v32 = l_Atmosphere_0 ~= nil;
            if not l_Atmosphere_0 then
                l_Atmosphere_0 = Instance.new("Atmosphere");
                l_Atmosphere_0.Parent = l_Lighting_0;
            end;
            local v33 = {};
            for v34, v35 in v19.Atmosphere do
                if not v17 and v32 and v8.TWEENABLE[typeof(v35)] then
                    v33[v34] = v35;
                else
                    l_Atmosphere_0[v34] = v35;
                end;
            end;
            if not v17 and v32 then
                table.insert(v20, l_TweenService_0:Create(l_Atmosphere_0, l_v10_0, v33));
            end;
        end;
        local l_PostEffects_0 = v19.PostEffects;
        if l_PostEffects_0 and l_PostEffects_0.Lighting then
            for v37, v38 in l_PostEffects_0.Lighting do
                local l_l_Lighting_0_FirstChildOfClass_0 = l_Lighting_0:FindFirstChildOfClass(v37);
                local v40 = l_l_Lighting_0_FirstChildOfClass_0 ~= nil;
                if not l_l_Lighting_0_FirstChildOfClass_0 then
                    l_l_Lighting_0_FirstChildOfClass_0 = Instance.new(v37);
                    l_l_Lighting_0_FirstChildOfClass_0.Parent = l_Lighting_0;
                end;
                local v41 = {};
                for v42, v43 in v38 do
                    if not v17 and v40 and v8.TWEENABLE[typeof(v43)] then
                        v41[v42] = v43;
                    else
                        l_l_Lighting_0_FirstChildOfClass_0[v42] = v43;
                    end;
                end;
                if not v17 and v40 then
                    table.insert(v20, l_TweenService_0:Create(l_l_Lighting_0_FirstChildOfClass_0, l_v10_0, v41));
                end;
            end;
        end;
        if not v17 then
            for _, v45 in v20 do
                v45.Completed:Once(function() --[[ Line: 197 ]]
                    -- upvalues: v45 (copy)
                    v45:Destroy();
                end);
                v45:Play();
            end;
            return v20;
        else
            return;
        end;
    end;
end;
return v12;