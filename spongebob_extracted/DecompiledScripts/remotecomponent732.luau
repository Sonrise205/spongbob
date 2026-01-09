local v0 = game:GetService("RunService"):IsServer();
local l_Parent_0 = script.Parent;
local v2 = require(l_Parent_0.Comm);
local v3 = require(l_Parent_0.Symbol);
local v4 = require(l_Parent_0.Promise);
local v5 = require(l_Parent_0.NetWire);
local l_Table_0 = require(l_Parent_0.RailUtil).Table;
local v7 = v3("InternalPromise");
return {
    createEvent = v5.createEvent, 
    createUnreliableEvent = v5.createUnreliableEvent, 
    createProperty = v5.createProperty, 
    Starting = function(v8) --[[ Line: 111 ]] --[[ Name: Starting ]]
        -- upvalues: v0 (copy), v2 (copy), l_Table_0 (copy), v5 (copy), v7 (copy), v4 (copy)
        local l_Instance_0 = v8.Instance;
        local v10 = v8.RemoteNamespace or v8.Tag .. "_RemoteComponent";
        if v0 then
            local l_ServerComm_0 = v2.ServerComm;
            if v8.Client then
                v8.Client = l_Table_0.Copy(v8.Client, true);
                if l_Instance_0:FindFirstChild(v10) then
                    warn("RemoteComponent: Namespace " .. v10 .. " already exists, overwriting");
                    l_Instance_0[v10]:Destroy();
                end;
                v8._serverComm = l_ServerComm_0.new(l_Instance_0, v10);
                local v12 = 0;
                for v13, v14 in pairs(v8.Client) do
                    v12 = v12 + 1;
                    if type(v14) == "function" then
                        v8._serverComm:WrapMethod(v8.Client, v13, nil, {
                            v5.PromiseConversionMiddleware
                        });
                    elseif type(v14) == "table" then
                        local v15 = tostring(v14[1]);
                        if v15:find("UNRELIABLE_SIGNAL_MARKER") then
                            v8.Client[v13] = v8._serverComm:CreateSignal(v13, true, table.unpack(v14, 2));
                        elseif v15:find("SIGNAL_MARKER") then
                            v8.Client[v13] = v8._serverComm:CreateSignal(v13, false, table.unpack(v14, 2));
                        elseif v15:find("PROPERTY_MARKER") then
                            v8.Client[v13] = v8._serverComm:CreateProperty(v13, table.unpack(v14, 2));
                        end;
                    end;
                end;
                v8.Client.Server = v8;
                l_Instance_0[v10]:SetAttribute("SRC", v12);
                return;
            else
                warn(v10 .. " extends RemoteComponent but is missing a Client table!");
                return;
            end;
        else
            local l_ClientComm_0 = v2.ClientComm;
            v8[v7] = v4.new(function(v17, _, _) --[[ Line: 154 ]]
                -- upvalues: l_Instance_0 (copy), v10 (copy)
                local v20 = l_Instance_0:WaitForChild(v10);
                if not v20:GetAttribute("SRC") then
                    v20:GetAttributeChangedSignal("SRC"):Wait();
                end;
                local function v25() --[[ Line: 162 ]] --[[ Name: GetRemotes ]]
                    -- upvalues: v20 (copy)
                    local l_RF_0 = v20:FindFirstChild("RF");
                    local l_RE_0 = v20:FindFirstChild("RE");
                    local l_RP_0 = v20:FindFirstChild("RP");
                    local v24 = 0;
                    if l_RF_0 then
                        v24 = v24 + #l_RF_0:GetChildren();
                    end;
                    if l_RE_0 then
                        v24 = v24 + #l_RE_0:GetChildren();
                    end;
                    if l_RP_0 then
                        v24 = v24 + #l_RP_0:GetChildren();
                    end;
                    return v24;
                end;
                while v25() < v20:GetAttribute("SRC") do
                    task.wait();
                end;
                v17();
            end):andThen(function() --[[ Line: 187 ]]
                -- upvalues: v8 (copy), l_ClientComm_0 (copy), l_Instance_0 (copy), v10 (copy), v5 (ref)
                local v26 = v8.UsePromisesForMethods == nil or v8.UsePromisesForMethods;
                local v27 = l_ClientComm_0.new(l_Instance_0, v26, v10);
                v8._clientComm = v27;
                v8.Server = v27:BuildObject({
                    v5.PromiseConversionMiddleware
                });
            end):timeout(30, "[TimeOut] Failed to initialize RemoteComponent " .. v10);
            local v28, v29 = v8[v7]:awaitStatus();
            if v28 == v4.Status.Rejected then
                error(v29);
                return;
            else
                if v28 == v4.Status.Cancelled then
                    error("RemoteComponent " .. v10 .. " was cancelled before it could initialize.");
                end;
                return;
            end;
        end;
    end, 
    Stopping = function(v30) --[[ Line: 206 ]] --[[ Name: Stopping ]]
        -- upvalues: v0 (copy), v7 (copy)
        local v31 = if v0 then v30._serverComm else v30._clientComm;
        if v31 then
            v31:Destroy();
        end;
        local v32 = if v0 then v30.Client else v30.Server;
        if v32 then
            for _, v34 in v32 do
                if typeof(v34) == "table" and v34.Destroy and v34 ~= v30 then
                    v34:Destroy();
                end;
            end;
        end;
        if v30[v7] then
            v30[v7]:cancel();
        end;
    end
};