local l_RunService_0 = game:GetService("RunService");
local l_StarterGui_0 = game:GetService("StarterGui");
local l_LocalPlayer_0 = game:GetService("Players").LocalPlayer;
local l_Shared_0 = script:WaitForChild("Shared");
local l_Util_0 = require(l_Shared_0:WaitForChild("Util"));
if l_RunService_0:IsClient() == false then
    error("[Cmdr] Server scripts cannot require the client library. Please require the server library from the server to use Cmdr in your own code.");
end;
local v5 = nil;
v5 = setmetatable({
    ReplicatedRoot = script, 
    RemoteFunction = script:WaitForChild("CmdrFunction"), 
    RemoteEvent = script:WaitForChild("CmdrEvent"), 
    ActivationKeys = {
        [Enum.KeyCode.F2] = true
    }, 
    Enabled = true, 
    MashToEnable = false, 
    ActivationUnlocksMouse = false, 
    HideOnLostFocus = true, 
    PlaceName = "Cmdr", 
    Util = l_Util_0, 
    Events = {}
}, {
    __index = function(v6, v7) --[[ Line: 79 ]] --[[ Name: __index ]]
        local v8 = v6.Dispatcher[v7];
        if v8 and type(v8) == "function" then
            return function(_, ...) --[[ Line: 82 ]]
                -- upvalues: v8 (copy), v6 (copy)
                return v8(v6.Dispatcher, ...);
            end;
        else
            return;
        end;
    end
});
v5.Registry = require(l_Shared_0.Registry)(v5);
v5.Dispatcher = require(l_Shared_0.Dispatcher)(v5);
if l_StarterGui_0:WaitForChild("Cmdr") and wait() and l_LocalPlayer_0:WaitForChild("PlayerGui"):FindFirstChild("Cmdr") == nil then
    l_StarterGui_0.Cmdr:Clone().Parent = l_LocalPlayer_0.PlayerGui;
end;
local v10 = require(script.CmdrInterface)(v5);
v5.SetActivationKeys = function(v11, v12) --[[ Line: 104 ]] --[[ Name: SetActivationKeys ]]
    -- upvalues: l_Util_0 (copy)
    v11.ActivationKeys = l_Util_0.MakeDictionary(v12);
end;
v5.SetPlaceName = function(v13, v14) --[[ Line: 113 ]] --[[ Name: SetPlaceName ]]
    -- upvalues: v10 (copy)
    v13.PlaceName = v14;
    v10.Window:UpdateLabel();
end;
v5.SetEnabled = function(v15, v16) --[[ Line: 123 ]] --[[ Name: SetEnabled ]]
    v15.Enabled = v16;
end;
v5.SetActivationUnlocksMouse = function(v17, v18) --[[ Line: 132 ]] --[[ Name: SetActivationUnlocksMouse ]]
    v17.ActivationUnlocksMouse = v18;
end;
v5.Show = function(v19) --[[ Line: 141 ]] --[[ Name: Show ]]
    -- upvalues: v10 (copy)
    if not v19.Enabled then
        return;
    else
        v10.Window:Show();
        return;
    end;
end;
v5.Hide = function(_) --[[ Line: 154 ]] --[[ Name: Hide ]]
    -- upvalues: v10 (copy)
    v10.Window:Hide();
end;
v5.Toggle = function(v21) --[[ Line: 163 ]] --[[ Name: Toggle ]]
    -- upvalues: v10 (copy)
    if not v21.Enabled then
        v21:Hide();
        return;
    else
        v10.Window:SetVisible(not v10.Window:IsVisible());
        return;
    end;
end;
v5.SetMashToEnable = function(v22, v23) --[[ Line: 179 ]] --[[ Name: SetMashToEnable ]]
    v22.MashToEnable = v23;
    if v23 then
        v22:SetEnabled(false);
    end;
end;
v5.SetHideOnLostFocus = function(v24, v25) --[[ Line: 193 ]] --[[ Name: SetHideOnLostFocus ]]
    v24.HideOnLostFocus = v25;
end;
v5.HandleEvent = function(v26, v27, v28) --[[ Line: 202 ]] --[[ Name: HandleEvent ]]
    v26.Events[v27] = v28;
end;
if l_RunService_0:IsServer() == false then
    v5.Registry:RegisterTypesIn(script:WaitForChild("Types"));
    v5.Registry:RegisterCommandsIn(script:WaitForChild("Commands"));
end;
v5.RemoteEvent.OnClientEvent:Connect(function(v29, ...) --[[ Line: 214 ]]
    -- upvalues: v5 (ref)
    if v5.Events[v29] then
        v5.Events[v29](...);
    end;
end);
require(script.DefaultEventHandlers)(v5);
return v5;