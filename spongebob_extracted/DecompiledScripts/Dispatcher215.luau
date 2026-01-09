local l_RunService_0 = game:GetService("RunService");
local l_TeleportService_0 = game:GetService("TeleportService");
local l_Players_0 = game:GetService("Players");
local v3 = require(script.Parent.Util);
local v4 = require(script.Parent.Command);
local v5 = false;
local v57 = {
    Cmdr = nil, 
    Registry = nil, 
    Evaluate = function(v6, v7, v8, v9, v10) --[[ Line: 45 ]] --[[ Name: Evaluate ]]
        -- upvalues: l_RunService_0 (copy), l_Players_0 (copy), v3 (copy), v4 (copy)
        if l_RunService_0:IsClient() == true and v8 ~= l_Players_0.LocalPlayer then
            error("[Cmdr] Can't evaluate a command that isn't sent by the local player.");
        end;
        local v11 = v3.SplitString(v7);
        local v12 = table.remove(v11, 1);
        local l_Command_0 = v6.Registry:GetCommand(v12);
        if l_Command_0 then
            v11 = v3.MashExcessArguments(v11, #l_Command_0.Args);
            local v14 = v4.new({
                Dispatcher = v6, 
                Text = v7, 
                CommandObject = l_Command_0, 
                Alias = v12, 
                Executor = v8, 
                Arguments = v11, 
                Data = v10
            });
            local v15, v16 = v14:Parse(v9);
            if v15 then
                return v14;
            else
                return false, v16;
            end;
        else
            return false, ("%q is not a valid command name. Use the help command to see all available commands."):format((tostring(v12)));
        end;
    end, 
    EvaluateAndRun = function(v17, v18, v19, v20) --[[ Line: 94 ]] --[[ Name: EvaluateAndRun ]]
        -- upvalues: l_Players_0 (copy), l_RunService_0 (copy)
        v19 = v19 or l_Players_0.LocalPlayer;
        v20 = v20 or {};
        if l_RunService_0:IsClient() and v20.IsHuman then
            v17:PushHistory(v18);
        end;
        local v21, v22 = v17:Evaluate(v18, v19, nil, v20.Data);
        if not v21 then
            return v22;
        else
            local v26, v27 = xpcall(function() --[[ Line: 115 ]]
                -- upvalues: v21 (copy)
                local v23, v24 = v21:Validate(true);
                if not v23 then
                    return v24;
                else
                    return v21:Run() or "Command executed.";
                end;
            end, function(v25) --[[ Line: 123 ]]
                return debug.traceback((tostring(v25)));
            end);
            if not v26 then
                warn(("[Cmdr] Error occurred while evaluating command string %%q\n%*"):format((tostring(v27))):format(v18));
            end;
            return v26 and v27 or "An error occurred while running this command. Check the console for more information.";
        end;
    end, 
    Send = function(v28, v29, v30) --[[ Line: 144 ]] --[[ Name: Send ]]
        -- upvalues: l_RunService_0 (copy)
        if l_RunService_0:IsClient() == false then
            error("[Cmdr] Dispatcher:Send can only be called from the client.");
        end;
        return v28.Cmdr.RemoteFunction:InvokeServer(v29, {
            Data = v30
        });
    end, 
    Run = function(v31, ...) --[[ Line: 164 ]] --[[ Name: Run ]]
        -- upvalues: l_Players_0 (copy)
        if not l_Players_0.LocalPlayer then
            error("[Cmdr] Dispatcher:Run can only be called from the client.");
        end;
        local v32 = {
            ...
        };
        local v33 = v32[1];
        for v34 = 2, #v32 do
            v33 = v33 .. " " .. tostring(v32[v34]);
        end;
        local v35, v36 = v31:Evaluate(v33, l_Players_0.LocalPlayer);
        if not v35 then
            error(v36);
        end;
        local v37, v38 = v35:Validate(true);
        if not v37 then
            error(v38);
        end;
        return v35:Run();
    end, 
    RunGuards = function(_, v40, ...) --[[ Line: 200 ]] --[[ Name: RunGuards ]]
        local l_Guards_0 = v40.Object.Guards;
        if l_Guards_0 == nil then
            return;
        else
            local v42 = typeof(l_Guards_0);
            assert(v42 == "table", (("expected a table for Command.Guards, got %*"):format(v42)));
            for _, v44 in pairs(l_Guards_0) do
                local v45 = typeof(v44);
                assert(v45 == "function", (("expected a function for a value in Command.Guards, got %*"):format(v45)));
                local v46 = v44(v40, ...);
                if v46 ~= nil then
                    return (tostring(v46));
                end;
            end;
            return;
        end;
    end, 
    RunHooks = function(v47, v48, v49, ...) --[[ Line: 236 ]] --[[ Name: RunHooks ]]
        -- upvalues: l_RunService_0 (copy), v5 (ref)
        if not v47.Registry.Hooks[v48] then
            error(("[Cmdr] Invalid hook name: %q"):format(v48), 2);
        end;
        if v48 == "BeforeRun" and #v47.Registry.Hooks[v48] == 0 and v49.Group ~= "DefaultUtil" and v49.Group ~= "UserAlias" and v49:HasImplementation() then
            if l_RunService_0:IsStudio() then
                if v5 == false then
                    v49:Reply((l_RunService_0:IsServer() and "<Server>" or "<Client>") .. " Commands will not run in-game if no BeforeRun hook is configured. Learn more: https://eryn.io/Cmdr/guide/Hooks.html", Color3.fromRGB(255, 228, 26));
                    v5 = true;
                end;
            else
                return "Command blocked for security as no BeforeRun hook is configured.";
            end;
        end;
        for _, v51 in ipairs(v47.Registry.Hooks[v48]) do
            local v52 = v51.callback(v49, ...);
            if v52 ~= nil then
                return (tostring(v52));
            end;
        end;
    end, 
    PushHistory = function(v53, v54) --[[ Line: 278 ]] --[[ Name: PushHistory ]]
        -- upvalues: l_RunService_0 (copy), v3 (copy), l_TeleportService_0 (copy)
        assert(l_RunService_0:IsClient(), "[Cmdr] PushHistory may only be used from the client.");
        local l_v53_History_0 = v53:GetHistory();
        if v3.TrimString(v54) == "" or v54 == l_v53_History_0[#l_v53_History_0] then
            return;
        else
            l_v53_History_0[#l_v53_History_0 + 1] = v54;
            l_TeleportService_0:SetTeleportSetting("CmdrCommandHistory", l_v53_History_0);
            return;
        end;
    end, 
    GetHistory = function(_) --[[ Line: 299 ]] --[[ Name: GetHistory ]]
        -- upvalues: l_RunService_0 (copy), l_TeleportService_0 (copy)
        assert(l_RunService_0:IsClient(), "[Cmdr] GetHistory may only be used from the client.");
        return l_TeleportService_0:GetTeleportSetting("CmdrCommandHistory") or {};
    end
};
return function(v58) --[[ Line: 305 ]]
    -- upvalues: v57 (copy)
    v57.Cmdr = v58;
    v57.Registry = v58.Registry;
    return v57;
end;