local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("TweenService");
local l_Players_0 = game:GetService("Players");
local v3 = require(l_ReplicatedStorage_0.Packages.BaseComponent);
local v4 = require(l_ReplicatedStorage_0.Packages.RailComponent);
local _ = require(l_ReplicatedStorage_0.Packages.RailUtil);
local v6 = require(l_ReplicatedStorage_0.Packages.Fusion);
local v7 = require(l_ReplicatedStorage_0.Shared.Modules.Timer);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local _ = workspace.CurrentCamera;
local v12 = v4.new({
    Tag = "DiscoLighting", 
    Ancestors = {
        l_Players_0
    }, 
    Extensions = {
        v3, 
        {
            ShouldConstruct = function(v11) --[[ Line: 37 ]] --[[ Name: ShouldConstruct ]]
                -- upvalues: l_LocalPlayer_0 (copy)
                return v11.Instance == l_LocalPlayer_0;
            end
        }
    }
});
v12._SetupDiscoEffect = function(v13) --[[ Line: 48 ]] --[[ Name: _SetupDiscoEffect ]]
    -- upvalues: l_LocalPlayer_0 (copy), v6 (copy), v7 (copy)
    local l_v13_Scope_0 = v13:GetScope();
    local v15 = {
        Color3.fromRGB(0, 177, 14), 
        Color3.fromRGB(33, 117, 242), 
        Color3.fromRGB(158, 36, 228), 
        Color3.fromRGB(255, 77, 7), 
        Color3.fromRGB(242, 35, 91)
    };
    local v16 = 1;
    local l_PlayerGui_0 = l_LocalPlayer_0:FindFirstChild("PlayerGui");
    local v18 = l_v13_Scope_0:Value(v15[v16]);
    local _ = l_v13_Scope_0:Spring(v18, 10, 0.6);
    l_v13_Scope_0:New("ScreenGui")({
        Name = "DiscoEffect", 
        IgnoreGuiInset = true, 
        DisplayOrder = 0, 
        ClipToDeviceSafeArea = false, 
        Parent = l_PlayerGui_0, 
        [v6.Children] = {
            l_v13_Scope_0:New("Frame")({
                BackgroundTransparency = 0.4, 
                Size = UDim2.fromScale(1, 1), 
                BackgroundColor3 = l_v13_Scope_0:Spring(l_v13_Scope_0:Computed(function(v20) --[[ Line: 77 ]]
                    -- upvalues: v18 (copy)
                    return v20(v18);
                end), 12, 0.6), 
                [v6.Children] = {
                    l_v13_Scope_0:New("UIGradient")({
                        Color = ColorSequence.new({
                            ColorSequenceKeypoint.new(0, Color3.fromRGB(136, 0, 255)), 
                            ColorSequenceKeypoint.new(1, Color3.fromRGB(136, 0, 255))
                        }), 
                        Transparency = NumberSequence.new({
                            NumberSequenceKeypoint.new(0, 0), 
                            NumberSequenceKeypoint.new(0.5, 0.5), 
                            NumberSequenceKeypoint.new(1, 0)
                        })
                    })
                }
            })
        }
    });
    v13:AddTask(v7.Simple(1, function() --[[ Line: 99 ]]
        -- upvalues: v16 (ref), v15 (copy), v18 (copy)
        v16 = v16 + 1;
        if #v15 < v16 then
            v16 = 1;
        end;
        v18:set(v15[v16]);
    end));
end;
v12.Construct = function(_) --[[ Line: 114 ]] --[[ Name: Construct ]]

end;
v12.Start = function(v22) --[[ Line: 117 ]] --[[ Name: Start ]]
    v22:AddTask(function() --[[ Line: 118 ]]

    end);
    v22:_SetupDiscoEffect();
end;
v12.Stop = function(_) --[[ Line: 124 ]] --[[ Name: Stop ]]

end;
return v12;