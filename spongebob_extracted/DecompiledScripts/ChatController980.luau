local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_TextChatService_0 = game:GetService("TextChatService");
local l_Players_0 = game:GetService("Players");
local v3 = require(l_ReplicatedStorage_0.Packages.Knit);
local v4 = require(l_ReplicatedStorage_0.Shared.Data.Variables);
local _ = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local v6 = nil;
local v7 = nil;
local v8 = nil;
local v9 = nil;
local v10 = nil;
local v11 = {
    NAME_TAG = "#3498db", 
    VIP_TITLE = "#f4ff4a", 
    VIP_TEXT = "#ffffff", 
    ULTRA_VIP_TITLE = "#ffffff", 
    ULTRA_VIP_TEXT = "#ffffff"
};
local v12 = {
    ["1472901147"] = true, 
    ["5253902128"] = true, 
    ["20156359"] = true, 
    ["154747729"] = true, 
    ["121224620"] = true, 
    ["1914069651"] = true
};
local v13 = v3.CreateController({
    Name = "ChatController"
});
v13.KnitStart = function(v14) --[[ Line: 41 ]] --[[ Name: KnitStart ]]
    -- upvalues: l_TextChatService_0 (copy), v6 (ref)
    local l_TextChannel_0 = Instance.new("TextChannel");
    l_TextChannel_0.Name = "SystemMessages";
    l_TextChannel_0.Parent = l_TextChatService_0:WaitForChild("TextChannels");
    v14.systemChannel = l_TextChannel_0;
    v14:_changeSystemMessagesColor();
    v6.SendSystemMessage:Connect(function(v16, v17) --[[ Line: 51 ]]
        -- upvalues: v14 (copy)
        v14:DisplaySystemMessage(v16, true, v17);
    end);
end;
v13.KnitInit = function(_) --[[ Line: 64 ]] --[[ Name: KnitInit ]]
    -- upvalues: v6 (ref), v3 (copy), v7 (ref), v8 (ref), v9 (ref), v10 (ref)
    v6 = v3.GetService("SystemMessageService");
    v7 = v3.GetController("PurchaseController");
    v8 = v3.GetController("DeviceTypeController");
    v9 = v3.GetController("DataController");
    v10 = v3.GetController("KrustyKrewController");
end;
v13.DisplaySystemMessage = function(v19, v20, v21, v22) --[[ Line: 72 ]] --[[ Name: DisplaySystemMessage ]]
    if not v19.systemChannel then
        return;
    else
        if v22 then
            if typeof(v22) == "Color3" then
                v22 = ("#%*"):format((v22:ToHex()));
            end;
            v20 = ("<font color=\"%*\">%*</font>"):format(v22, v20);
        end;
        if v21 then
            v20 = ("<b>%*</b>"):format(v20);
        end;
        v19.systemChannel:DisplaySystemMessage(v20);
        return;
    end;
end;
local function _(v23) --[[ Line: 93 ]] --[[ Name: formatPrefix ]]
    return (("(%*):"):format((string.match(v23, "(.+):"))));
end;
v13._changeSystemMessagesColor = function(_) --[[ Line: 98 ]] --[[ Name: _changeSystemMessagesColor ]]
    -- upvalues: l_TextChatService_0 (copy), v9 (ref), v3 (copy), l_Players_0 (copy), v4 (copy), v12 (copy), v10 (ref), v7 (ref), v11 (copy)
    local l_ChatWindowConfiguration_0 = l_TextChatService_0.ChatWindowConfiguration;
    local l_UIGradient_0 = Instance.new("UIGradient");
    l_UIGradient_0.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(212, 0, 255)), 
        ColorSequenceKeypoint.new(0.348, Color3.fromRGB(0, 255, 238)), 
        ColorSequenceKeypoint.new(0.678, Color3.fromRGB(255, 200, 0)), 
        ColorSequenceKeypoint.new(1, Color3.fromRGB(212, 0, 255))
    });
    local v28 = false;
    v9:OnChanged(v3.Player, "ClaimedLikeReward", function(v29) --[[ Line: 111 ]]
        -- upvalues: v28 (ref)
        v28 = v29;
    end, true);
    l_TextChatService_0.OnChatWindowAdded = function(v30) --[[ Line: 115 ]]
        -- upvalues: l_ChatWindowConfiguration_0 (copy), l_Players_0 (ref), v9 (ref), v4 (ref), v12 (ref), v10 (ref), l_UIGradient_0 (copy), v7 (ref), v11 (ref)
        local v31 = l_ChatWindowConfiguration_0:DeriveNewMessageProperties();
        if not v30.TextSource then
            return v31;
        else
            local l_UserId_0 = v30.TextSource.UserId;
            local l_l_Players_0_PlayerByUserId_0 = l_Players_0:GetPlayerByUserId(l_UserId_0);
            v31.PrefixTextProperties = l_ChatWindowConfiguration_0:DeriveNewMessageProperties();
            local v34 = v9:Get(l_l_Players_0_PlayerByUserId_0, "PlayerStats"):expect();
            local v35 = v34 and v34.Prestige or 0;
            local v36 = "";
            if table.find(v4.INFLUENCER_IDS, l_l_Players_0_PlayerByUserId_0.UserId) then
                v36 = v36 .. "[\226\173\144] ";
            end;
            if l_l_Players_0_PlayerByUserId_0:GetAttribute("IS_ADMIN") then
                v36 = v36 .. "[\240\159\148\168]";
            end;
            if v12[tostring(l_l_Players_0_PlayerByUserId_0.UserId)] then
                v36 = v36 .. "[MOD]";
            end;
            if v35 >= 1 and v4.PRESTIGE.TITLES[v35] then
                v36 = v36 .. ("[ %* ]"):format((string.gsub(v4.PRESTIGE.TITLES[v35], "PRESTIGE ", "")));
            end;
            v31.PrefixText = v31.PrefixText .. ("%* %*"):format(v36, v31.PrefixText);
            if v10:IsActive() then
                local l_l_l_Players_0_PlayerByUserId_0_Attribute_0 = l_l_Players_0_PlayerByUserId_0:GetAttribute("KrewKrewMonths");
                local v38 = if l_l_l_Players_0_PlayerByUserId_0_Attribute_0 then (" (%*) "):format(l_l_l_Players_0_PlayerByUserId_0_Attribute_0) else " ";
                local l_PrefixText_0 = v31.PrefixText;
                local l_format_0 = string.format;
                local v41 = ("[ KRUSTY KREW%*] %%s"):format(v38);
                local v42 = "%*";
                local l_PrefixText_1 = v30.PrefixText;
                v31.PrefixText = l_PrefixText_0 .. l_format_0(v41, (v42:format((("(%*):"):format((string.match(l_PrefixText_1, "(.+):")))))));
                l_UIGradient_0:Clone().Parent = v31.PrefixTextProperties;
                return v31;
            elseif v7:HasGamepass(l_l_Players_0_PlayerByUserId_0, "UltraVIP") then
                local l_PrefixText_2 = v31.PrefixText;
                local l_format_1 = string.format;
                local v46 = "[\240\159\145\145 ULTRA VIP] %s";
                local v47 = "%*";
                local l_PrefixText_3 = v30.PrefixText;
                v31.PrefixText = l_PrefixText_2 .. l_format_1(v46, (v47:format((("(%*):"):format((string.match(l_PrefixText_3, "(.+):")))))));
                l_UIGradient_0:Clone().Parent = v31.PrefixTextProperties;
                return v31;
            elseif v7:HasGamepass(l_l_Players_0_PlayerByUserId_0, "VIP") then
                local l_PrefixText_4 = v31.PrefixText;
                local l_format_2 = string.format;
                local v51 = ("<font color=\"%*\">[\240\159\145\145 VIP] %%s</font>"):format(v11.VIP_TITLE);
                local v52 = "<font color=\"%*\">%*</font>";
                local l_NAME_TAG_0 = v11.NAME_TAG;
                local l_PrefixText_5 = v30.PrefixText;
                v31.PrefixText = l_PrefixText_4 .. l_format_2(v51, (v52:format(l_NAME_TAG_0, (("(%*):"):format((string.match(l_PrefixText_5, "(.+):")))))));
                return v31;
            else
                local l_PrefixText_6 = v31.PrefixText;
                local v56 = "<font color=\"%*\">%*</font>";
                local l_NAME_TAG_1 = v11.NAME_TAG;
                local l_PrefixText_7 = v30.PrefixText;
                v31.PrefixText = l_PrefixText_6 .. v56:format(l_NAME_TAG_1, (("(%*):"):format((string.match(l_PrefixText_7, "(.+):")))));
                return v31;
            end;
        end;
    end;
end;
return v13;