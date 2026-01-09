local l_LocalPlayer_0 = game:GetService("Players").LocalPlayer;
return function(v1) --[[ Line: 6 ]]
    -- upvalues: l_LocalPlayer_0 (copy)
    local l_Util_0 = v1.Util;
    local l_Window_0 = require(script:WaitForChild("Window"));
    l_Window_0.Cmdr = v1;
    local v4 = require(script:WaitForChild("AutoComplete"))(v1);
    l_Window_0.AutoComplete = v4;
    l_Window_0.ProcessEntry = function(v5) --[[ Line: 16 ]] --[[ Name: ProcessEntry ]]
        -- upvalues: l_Util_0 (copy), l_Window_0 (copy), v1 (copy), l_LocalPlayer_0 (ref)
        v5 = l_Util_0.TrimString(v5);
        if #v5 == 0 then
            return;
        else
            l_Window_0:AddLine(l_Window_0:GetLabel() .. " " .. v5, Color3.fromRGB(255, 223, 93));
            l_Window_0:AddLine(v1.Dispatcher:EvaluateAndRun(v5, l_LocalPlayer_0, {
                IsHuman = true
            }));
            return;
        end;
    end;
    l_Window_0.OnTextChanged = function(v6) --[[ Line: 31 ]] --[[ Name: OnTextChanged ]]
        -- upvalues: v1 (copy), l_LocalPlayer_0 (ref), l_Util_0 (copy), l_Window_0 (copy), v4 (copy)
        local v7 = v1.Dispatcher:Evaluate(v6, l_LocalPlayer_0, true);
        local v8 = l_Util_0.SplitString(v6);
        local v9 = table.remove(v8, 1);
        local v10 = false;
        if v7 then
            v8 = l_Util_0.MashExcessArguments(v8, #v7.Object.Args);
            v10 = #v8 == #v7.Object.Args;
        end;
        local v11 = v9 and #v8 > 0;
        if v6:sub(#v6, #v6):match("%s") and not v10 then
            v11 = true;
            v8[#v8 + 1] = "";
        end;
        if v7 and v11 then
            local v12, v13 = v7:Validate();
            l_Window_0:SetIsValidInput(v12, ("Validation errors: %s"):format(v13 or ""));
            local v14 = {};
            local l_v7_Argument_0 = v7:GetArgument(#v8);
            if l_v7_Argument_0 then
                local l_TextSegmentInProgress_0 = l_v7_Argument_0.TextSegmentInProgress;
                local v17 = false;
                if l_v7_Argument_0.RawSegmentsAreAutocomplete then
                    for v18, v19 in ipairs(l_v7_Argument_0.RawSegments) do
                        v14[v18] = {
                            v19, 
                            v19
                        };
                    end;
                else
                    local l_l_v7_Argument_0_Autocomplete_0, v21 = l_v7_Argument_0:GetAutocomplete();
                    v17 = (v21 or {}).IsPartial or false;
                    for v22, v23 in pairs(l_l_v7_Argument_0_Autocomplete_0) do
                        v14[v22] = {
                            l_TextSegmentInProgress_0, 
                            v23
                        };
                    end;
                end;
                local v24 = true;
                if #l_TextSegmentInProgress_0 > 0 then
                    local v25, v26 = l_v7_Argument_0:Validate();
                    v24 = v25;
                    v13 = v26;
                end;
                if not v10 and v24 then
                    l_Window_0:HideInvalidState();
                end;
                local l_v4_0 = v4;
                local l_v14_0 = v14;
                local v29 = {
                    at = v10 and #v6 - #l_TextSegmentInProgress_0 + (v6:sub(#v6, #v6):match("%s") and -1 or 0), 
                    prefix = #l_v7_Argument_0.RawSegments == 1 and l_v7_Argument_0.Prefix or ""
                };
                local v30 = false;
                if #v7.Arguments == #v7.ArgumentDefinitions then
                    v30 = #l_TextSegmentInProgress_0 > 0;
                end;
                v29.isLast = v30;
                v29.numArgs = #v8;
                v29.command = v7;
                v29.arg = l_v7_Argument_0;
                v29.name = l_v7_Argument_0.Name .. (l_v7_Argument_0.Required and "" or "?");
                v29.type = l_v7_Argument_0.Type.DisplayName;
                v29.description = v24 == false and v13 or l_v7_Argument_0.Object.Description;
                v29.invalid = not v24;
                v29.isPartial = v17;
                return l_v4_0:Show(l_v14_0, v29);
            end;
        elseif v9 and #v8 == 0 then
            l_Window_0:SetIsValidInput(true);
            local l_Command_0 = v1.Registry:GetCommand(v9);
            local v32 = nil;
            if l_Command_0 then
                v32 = {
                    l_Command_0.Name, 
                    l_Command_0.Name; 
                    options = {
                        name = l_Command_0.Name, 
                        description = l_Command_0.Description
                    }
                };
                local v33 = l_Command_0.Args and l_Command_0.Args[1];
                if type(v33) == "function" then
                    v33 = v33(v7);
                end;
                if v33 and not v33.Optional and v33.Default == nil then
                    l_Window_0:SetIsValidInput(false, "This command has required arguments.");
                    l_Window_0:HideInvalidState();
                end;
            else
                l_Window_0:SetIsValidInput(false, ("%q is not a valid command name. Use the help command to see all available commands."):format(v9));
            end;
            local v34 = {
                v32
            };
            for _, v36 in pairs(v1.Registry:GetCommandNames()) do
                if v9:lower() == v36:lower():sub(1, #v9) and (v32 == nil or v32[1] ~= v9) then
                    local l_Command_1 = v1.Registry:GetCommand(v36);
                    v34[#v34 + 1] = {
                        v9, 
                        v36; 
                        options = {
                            name = l_Command_1.Name, 
                            description = l_Command_1.Description
                        }
                    };
                end;
            end;
            return v4:Show(v34);
        end;
        l_Window_0:SetIsValidInput(false, "Use the help command to see all available commands.");
        v4:Hide();
    end;
    l_Window_0:UpdateLabel();
    l_Window_0:UpdateWindowHeight();
    return {
        Window = l_Window_0, 
        AutoComplete = v4
    };
end;