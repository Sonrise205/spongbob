local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.Knit);
local v2 = require(l_ReplicatedStorage_0.Packages.Component);
local v3 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v4 = require(l_ReplicatedStorage_0.Packages.Promise);
local v5 = require(l_ReplicatedStorage_0.Shared.Modules.TimeConvert);
local v6 = require(l_ReplicatedStorage_0.Shared.Modules.ColorPalette);
local v7 = require(l_ReplicatedStorage_0.Shared.Modules.Timer);
local v8 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local _ = require(l_ReplicatedStorage_0.Shared.Util.DataUtils);
local v10 = nil;
local v11 = nil;
local v12 = v2.new({
    Tag = script.Name, 
    Ancestors = {
        workspace
    }
});
local function _() --[[ Line: 27 ]] --[[ Name: checkIfRobloxAdmin ]]
    -- upvalues: v4 (copy), v1 (copy)
    return v4.retryWithDelay(function() --[[ Line: 28 ]]
        -- upvalues: v4 (ref), v1 (ref)
        return v4.resolve(v1.Player:IsInGroup(1200769));
    end, 50, 0.2);
end;
local function v18(v14) --[[ Line: 33 ]] --[[ Name: formatTime ]]
    local v15 = math.floor(v14 / 86400);
    v14 = v14 % 86400;
    local v16 = math.floor(v14 / 3600);
    v14 = v14 % 3600;
    local v17 = math.floor(v14 / 60);
    v14 = v14 % 60;
    if v15 >= 1 then
        return string.format("%dd %dh %dm", v15, v16, v17);
    elseif v15 < 1 and v16 >= 1 then
        return string.format("%dh %dm", v16, v17);
    elseif v16 < 1 and v17 >= 1 then
        return string.format("%dm %ds", v17, v14);
    elseif v17 < 1 and v15 < 1 and v16 < 1 then
        return string.format("%ds", v14);
    else
        return string.format("%dd %dh %dm", v15, v16, v17);
    end;
end;
v12.Construct = function(v19) --[[ Line: 62 ]] --[[ Name: Construct ]]
    -- upvalues: v1 (copy), v3 (copy), v6 (copy), v5 (copy), v8 (copy), v18 (copy), v10 (ref), v7 (copy), v11 (ref)
    v1.OnStart():await();
    local v20 = 0;
    v19.dump = v3.new();
    local l_Attribute_0 = v19.Instance:GetAttribute("UGC_ID");
    if not l_Attribute_0 then
        v19.Instance:RemoveTag(v19.Tag);
        v19:Stop();
        return;
    else
        local v22 = v19.Instance:WaitForChild("InfoPart", 10);
        if not v22 then
            v19.Instance:RemoveTag(v19.Tag);
            v19:Stop();
            return;
        else
            local l_Attribute_1 = v19.Instance:GetAttribute("ReleasesOn");
            if not l_Attribute_1 then
                v19.Instance:RemoveTag(v19.Tag);
                return;
            else
                local v24 = v22:WaitForChild("Description", 10);
                v24 = v24 and v24:WaitForChild("DescriptionBillboard", 10);
                local v25 = v22:WaitForChild("Description", 10);
                v25 = v25 and v25:WaitForChild("ReleaseCountdown", 10);
                v24.Enabled = false;
                v25.Enabled = false;
                local v26 = v22:WaitForChild("Title", 10);
                v26 = v26 and v26:WaitForChild("TitleBillboard", 10);
                v26:WaitForChild("UGCName");
                if not v24 or not v26 or not v25 then
                    v19.Instance:RemoveTag(v19.Tag);
                    v19:Stop();
                    return;
                else
                    local v27 = v22:WaitForChild("ProximityPrompt", 10) or Instance.new("ProximityPrompt");
                    v27.ActionText = "Claim";
                    v27.MaxActivationDistance = 10;
                    v27.ClickablePrompt = true;
                    v27.Enabled = false;
                    v27.RequiresLineOfSight = false;
                    v27.AutoLocalize = true;
                    v27.Parent = v22;
                    local v28 = v24:WaitForChild("Requirements", 10);
                    local v29 = v24:WaitForChild("Quantity", 10);
                    local function _() --[[ Line: 129 ]] --[[ Name: getTimeLeft ]]
                        -- upvalues: v19 (copy), v1 (ref), l_Attribute_0 (copy)
                        local v30 = v19.Instance:GetAttribute("TimeNeeded") or 0;
                        return (math.clamp(v30 - (v1.Player:GetAttribute((("TimeForUGC_%*"):format(l_Attribute_0))) or 0), 0, v30));
                    end;
                    local function v34() --[[ Line: 137 ]] --[[ Name: updateTimeRemaining ]]
                        -- upvalues: v19 (copy), v1 (ref), l_Attribute_0 (copy), v27 (copy), v28 (copy), v6 (ref), v5 (ref)
                        local v32 = v19.Instance:GetAttribute("TimeNeeded") or 0;
                        local v33 = math.clamp(v32 - (v1.Player:GetAttribute((("TimeForUGC_%*"):format(l_Attribute_0))) or 0), 0, v32);
                        if v33 < 1 then
                            v27.ActionText = "Claim";
                            v28["Time Block"].TextLabel.TextColor3 = v6.Solid.LightGreen;
                            return;
                        else
                            v27.ActionText = ("Claim In: %*"):format((v5:Convert(v33)));
                            v28["Time Block"].TextLabel.TextColor3 = v6.Solid.LightRed;
                            return;
                        end;
                    end;
                    local function v38() --[[ Line: 151 ]] --[[ Name: updateRemaining ]]
                        -- upvalues: v19 (copy), v27 (copy), v29 (copy), v6 (ref), v24 (ref), v8 (ref)
                        local v35 = v19.Instance:GetAttribute("ON_SALE") or false;
                        if not v35 then
                            v27.Enabled = false;
                            v29.Text = "RELEASING NOW!\n(Give us a few minutes please)";
                            v29.TextColor3 = v6.Solid.LightGreen;
                            v24.Requirements.Visible = false;
                            return;
                        else
                            local v36 = v19.Instance:GetAttribute("RemainingCount") or 1;
                            v29.Text = ("%* REMAINING"):format((v8:CommaNumber(v36)));
                            v29.TextColor3 = v6.Solid.LightRed;
                            local v37 = v35 and v36 >= 1;
                            v27.Enabled = v37;
                            v24.Requirements.Visible = v37;
                            return;
                        end;
                    end;
                    local function v40() --[[ Line: 175 ]] --[[ Name: updateTimeRequiredLabel ]]
                        -- upvalues: v19 (copy), v28 (copy)
                        local v39 = math.floor((v19.Instance:GetAttribute("TimeNeeded") or 0) / 60);
                        v28["Time Block"].TextLabel.Text = ("\226\143\176 Play %* minutes!"):format(v39);
                    end;
                    local function v42() --[[ Line: 182 ]] --[[ Name: updateTitleLabel ]]
                        -- upvalues: v19 (copy), v26 (ref)
                        local v41 = v19.Instance:GetAttribute("UGCDisplayName") or "";
                        v26.UGCName.Text = v41;
                    end;
                    local function v45() --[[ Line: 187 ]] --[[ Name: updateReleaseCountdownTimer ]]
                        -- upvalues: l_Attribute_1 (copy), v19 (copy), v25 (ref), v24 (ref), v27 (copy), v6 (ref), v18 (ref)
                        local l_UnixTimestamp_0 = DateTime.now().UnixTimestamp;
                        local v44 = math.clamp(l_Attribute_1 - l_UnixTimestamp_0, 0, 1e999);
                        if v44 < 1 then
                            if v19.dump:Get("UpdateCounter") then
                                v19.dump:Remove("UpdateCounter");
                            end;
                            v25.Enabled = false;
                            v24.Enabled = true;
                            v27.Enabled = v19.Instance:GetAttribute("ON_SALE") or false;
                            return;
                        else
                            v25.Enabled = true;
                            v24.Enabled = false;
                            v27.Enabled = false;
                            v25.Countdown.TextColor3 = v6.Solid.LightGreen;
                            v25.Countdown.Text = ("Releases in: %*!"):format((v18(v44)));
                            return;
                        end;
                    end;
                    local v46 = v19.Instance:GetAttribute("UGCDisplayName") or "";
                    v26.UGCName.Text = v46;
                    v19.dump:Add(v19.Instance:GetAttributeChangedSignal("UGCDisplayName"):Connect(v42));
                    local v47 = math.floor((v19.Instance:GetAttribute("TimeNeeded") or 0) / 60);
                    v28["Time Block"].TextLabel.Text = ("\226\143\176 Play %* minutes!"):format(v47);
                    v19.dump:Add(v19.Instance:GetAttributeChangedSignal("TimeNeeded"):Connect(v40));
                    v19.dump:Add(v27.Triggered:Connect(function() --[[ Line: 221 ]]
                        -- upvalues: v20 (ref), v10 (ref), l_Attribute_0 (copy)
                        if os.clock() - v20 < 5 then
                            return;
                        else
                            v20 = os.clock();
                            v10:TryClaim(l_Attribute_0);
                            return;
                        end;
                    end));
                    v38();
                    v47 = v19.Instance:GetAttribute("TimeNeeded") or 0;
                    v46 = math.clamp(v47 - (v1.Player:GetAttribute((("TimeForUGC_%*"):format(l_Attribute_0))) or 0), 0, v47);
                    if v46 < 1 then
                        v27.ActionText = "Claim";
                        v28["Time Block"].TextLabel.TextColor3 = v6.Solid.LightGreen;
                    else
                        v27.ActionText = ("Claim In: %*"):format((v5:Convert(v46)));
                        v28["Time Block"].TextLabel.TextColor3 = v6.Solid.LightRed;
                    end;
                    v19.dump:Connect(v19.Instance:GetAttributeChangedSignal("RemainingCount"), v38);
                    v19.dump:Connect(v19.Instance:GetAttributeChangedSignal("ON_SALE"), v38);
                    v19.dump:Connect(v1.Player:GetAttributeChangedSignal((("TimeForUGC_%*"):format(l_Attribute_0))), v34);
                    v19.dump:Add(v7.Simple(1, v45, true), "UpdateCounter");
                    for _, v49 in v28:GetChildren() do
                        if v49:IsA("Frame") then
                            local v50 = v49:GetAttribute("AttributeNeeded") or v49:GetAttribute("DataKeyNeeded");
                            local l_v49_Attribute_0 = v49:GetAttribute("RequiredValue");
                            local l_v49_Attribute_1 = v49:GetAttribute("DictionaryIndex");
                            if l_v49_Attribute_1 then
                                l_v49_Attribute_1 = string.gsub(l_v49_Attribute_1, "$assetID", l_Attribute_0);
                            end;
                            if not v50 or l_v49_Attribute_0 == nil then
                                --[[ close >= 24 ]]
                            else
                                local v53 = v49:GetAttribute("AttributeNeeded") ~= nil;
                                local function _(v54, v55) --[[ Line: 263 ]] --[[ Name: checkFinished ]]
                                    if v54 == nil then
                                        return false;
                                    elseif typeof(v55) == "number" then
                                        return v55 <= v54;
                                    else
                                        return v54 == v55;
                                    end;
                                end;
                                local function v61(v57) --[[ Line: 276 ]] --[[ Name: updateColor ]]
                                    -- upvalues: v1 (ref), v50 (copy), l_v49_Attribute_0 (copy), v49 (copy), v6 (ref)
                                    local v58 = v57 or v1.Player:GetAttribute(v50);
                                    local l_l_v49_Attribute_0_0 = l_v49_Attribute_0;
                                    local v60 = v58 ~= nil and if typeof(l_l_v49_Attribute_0_0) == "number" then l_l_v49_Attribute_0_0 <= v58 else v58 == l_l_v49_Attribute_0_0;
                                    v49.TextLabel.TextColor3 = if v60 then v6.Solid.LightGreen else v6.Solid.LightRed;
                                end;
                                if v53 then
                                    local l_Attribute_2 = v1.Player:GetAttribute(v50);
                                    local v63 = l_Attribute_2 ~= nil and if typeof(l_v49_Attribute_0) == "number" then l_v49_Attribute_0 <= l_Attribute_2 else l_Attribute_2 == l_v49_Attribute_0;
                                    v49.TextLabel.TextColor3 = if v63 then v6.Solid.LightGreen else v6.Solid.LightRed;
                                    v19.dump:Connect(v1.Player:GetAttributeChangedSignal(v50), v61);
                                    --[[ close >= 24 ]]
                                else
                                    do
                                        local l_l_v49_Attribute_1_0 = l_v49_Attribute_1;
                                        v19.dump:Add(v11:OnChanged(v1.Player, v50, function(v65) --[[ Line: 290 ]]
                                            -- upvalues: v1 (ref), v50 (copy), l_v49_Attribute_0 (copy), v49 (copy), v6 (ref), l_l_v49_Attribute_1_0 (ref)
                                            local l_v65_0 = v65;
                                            if not l_v65_0 then
                                                local v67 = l_v65_0 or v1.Player:GetAttribute(v50);
                                                local l_l_v49_Attribute_0_1 = l_v49_Attribute_0;
                                                local v69 = v67 ~= nil and if typeof(l_l_v49_Attribute_0_1) == "number" then l_l_v49_Attribute_0_1 <= v67 else v67 == l_l_v49_Attribute_0_1;
                                                v49.TextLabel.TextColor3 = if v69 then v6.Solid.LightGreen else v6.Solid.LightRed;
                                                return;
                                            else
                                                if l_l_v49_Attribute_1_0 then
                                                    for _, v71 in (string.split(l_l_v49_Attribute_1_0, ".")) do
                                                        l_v65_0 = l_v65_0[v71];
                                                        if not l_v65_0 then
                                                            break;
                                                        end;
                                                    end;
                                                end;
                                                local v72 = l_v65_0 or v1.Player:GetAttribute(v50);
                                                local l_l_v49_Attribute_0_2 = l_v49_Attribute_0;
                                                local v74 = v72 ~= nil and if typeof(l_l_v49_Attribute_0_2) == "number" then l_l_v49_Attribute_0_2 <= v72 else v72 == l_l_v49_Attribute_0_2;
                                                v49.TextLabel.TextColor3 = if v74 then v6.Solid.LightGreen else v6.Solid.LightRed;
                                                return;
                                            end;
                                        end, true));
                                    end;
                                end;
                            end;
                        end;
                    end;
                    return;
                end;
            end;
        end;
    end;
end;
v12.Stop = function(v75) --[[ Line: 315 ]] --[[ Name: Stop ]]
    if v75.dump then
        v75.dump:Destroy();
    end;
end;
v1.OnStart():andThen(function() --[[ Line: 321 ]]
    -- upvalues: v10 (ref), v1 (copy), v11 (ref)
    v10 = v1.GetService("UGCService");
    v11 = v1.GetController("DataController");
end);
return v12;