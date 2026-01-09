local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.Knit);
local v2 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local _ = require(l_ReplicatedStorage_0.Packages.TableUtil);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v5 = require(l_ReplicatedStorage_0.Shared.Data.Variables);
local v6 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local v7 = require(l_ReplicatedStorage_0.Shared.Modules.ColorPalette);
local v8 = require(l_ReplicatedStorage_0.Shared.Data.CardsData);
local v9 = require(l_ReplicatedStorage_0.Shared.Data.InventoryAtlas);
local v10 = require(l_ReplicatedStorage_0.Shared.Util.PathUtil);
local v11 = require(l_ReplicatedStorage_0.Shared.Modules.WWSDebug);
local v12 = nil;
local v13 = nil;
local v14 = nil;
local v15 = nil;
local l_ROGUELIKE_0 = v5.ROGUELIKE;
local l_CardTemplates_0 = l_ReplicatedStorage_0.GUI.CardTemplates;
local l_CurseBG_0 = l_CardTemplates_0.CurseBG;
local v19 = v2.new();
local v20 = v2.new();
local v21 = nil;
local v22 = {};
local v23 = nil;
local v24 = nil;
local v25 = {
    primaryMenu = true, 
    highPriority = true, 
    blur = true, 
    ToggleAll = {}
};
local function v31(v26, v27, v28) --[[ Line: 53 ]] --[[ Name: observeScrollingFrame ]]
    -- upvalues: v19 (copy)
    v28 = v28 or 4;
    local l_UIListLayout_0 = v26:FindFirstChildOfClass("UIListLayout");
    assert(l_UIListLayout_0, "UIListLayout expected in ScrollingFrame");
    local function v30() --[[ Line: 59 ]] --[[ Name: update ]]
        -- upvalues: v27 (copy), l_UIListLayout_0 (copy), v28 (ref)
        l_UIListLayout_0.HorizontalAlignment = if #v27:GetChildren() - 1 >= v28 then Enum.HorizontalAlignment.Left else Enum.HorizontalAlignment.Center;
    end;
    v19:Add(v27.ChildAdded:Connect(v30));
    v19:Add(v27.ChildRemoved:Connect(v30));
    l_UIListLayout_0.HorizontalAlignment = if v28 <= #v27:GetChildren() - 1 then Enum.HorizontalAlignment.Left else Enum.HorizontalAlignment.Center;
end;
local v113 = {
    Start = function(v32, v33, v34) --[[ Line: 72 ]]
        -- upvalues: v19 (copy)
        v32:PopulateCards({
            cards = v34, 
            parent = v33.Cards, 
            dumpster = v19, 
            callback = function(v35) --[[ Line: 77 ]] --[[ Name: callback ]]
                -- upvalues: v32 (copy)
                v32:_selectCard(v35);
            end
        });
    end, 
    View = function(v36, v37, v38) --[[ Line: 83 ]]
        -- upvalues: v31 (copy), v19 (copy), v12 (ref), v22 (ref), v13 (ref)
        local l_Inner_0 = v37.Inner;
        local l_Close_0 = v37.Close;
        local l_Cards_0 = l_Inner_0.Cards;
        local l_Title_0 = v37.Title;
        v31(l_Inner_0, l_Cards_0);
        v36.sideDeck:SetAttribute("Disabled", false);
        v19:Add(v12:HandleButton(l_Close_0, function() --[[ Line: 93 ]]
            -- upvalues: v12 (ref)
            v12:Toggle(script.Name, false);
        end));
        local v43 = if v38 then v22 else v13.BuffCards:Get();
        l_Title_0.Text = v38 and "YOUR CURSES" or "YOUR DECK";
        v36:PopulateCards({
            cards = v43, 
            dumpster = v19, 
            parent = l_Cards_0
        });
    end, 
    Swap = function(v44, v45, v46) --[[ Line: 112 ]]
        -- upvalues: v31 (copy), v19 (copy), v13 (ref), v8 (copy), l_ROGUELIKE_0 (copy)
        local l_Inner_1 = v45.Inner;
        local l_Cards_1 = l_Inner_1.Cards;
        local l_Inner_2 = l_Inner_1.Deck.Inner;
        local l_Cards_2 = l_Inner_2.Cards;
        v31(l_Inner_2, l_Cards_2, 5);
        v44.sideDeck:SetAttribute("Disabled", true);
        v44:PopulateCards({
            cards = v46, 
            parent = l_Cards_1, 
            dumpster = v19, 
            callback = function(v51) --[[ Line: 126 ]] --[[ Name: callback ]]
                -- upvalues: v13 (ref), v8 (ref), l_ROGUELIKE_0 (ref), v44 (copy)
                local v52 = v13.Aura:Get() or 0;
                local l_v8_BuffCard_0 = v8:GetBuffCard(v51);
                local l_MAX_AURA_0 = l_ROGUELIKE_0.MAX_AURA;
                local v55 = v13.Modifiers:Get() or {};
                if v55.Aura then
                    l_MAX_AURA_0 = l_MAX_AURA_0 + v55.Aura;
                end;
                if v52 + l_v8_BuffCard_0.aura <= l_MAX_AURA_0 then
                    v44:_selectCard(v51);
                    return;
                else
                    local v56 = v52 + l_v8_BuffCard_0.aura - l_MAX_AURA_0;
                    v44:SetPage("Burn", v51, v56);
                    return;
                end;
            end
        });
        v44:PopulateCards({
            cards = v13.BuffCards:Get(), 
            parent = l_Cards_2, 
            dumpster = v19
        });
    end, 
    Burn = function(v57, v58, v59, v60) --[[ Line: 153 ]]
        -- upvalues: v31 (copy), v8 (copy), v13 (ref), l_ROGUELIKE_0 (copy), v7 (copy), v6 (copy), v19 (copy), v12 (ref), v15 (ref)
        local l_Inner_3 = v58.Inner;
        local l_Swap_0 = l_Inner_3.Swap;
        local l_Deck_0 = l_Inner_3.Deck;
        local l_Needed_0 = v58.Needed;
        v31(l_Inner_3, l_Deck_0);
        local v65 = {};
        local v66 = 0;
        local l_v8_BuffCard_1 = v8:GetBuffCard(v59);
        local v68 = (v13.Aura:Get() or 0) + l_v8_BuffCard_1.aura;
        local l_MAX_AURA_1 = l_ROGUELIKE_0.MAX_AURA;
        local v70 = v13.Modifiers:Get() or {};
        if v70.Aura then
            l_MAX_AURA_1 = l_MAX_AURA_1 + v70.Aura;
        end;
        v57:_updateAura(v68, l_MAX_AURA_1, true);
        v57.sideDeck.Visible = false;
        local l_Red_0 = v7.Solid.Red;
        local function _(v72) --[[ Line: 178 ]] --[[ Name: updateNeededLabel ]]
            -- upvalues: l_Needed_0 (copy), v6 (ref), l_Red_0 (copy)
            l_Needed_0.Text = ("%* AURA NEEDED FOR SWAP"):format((v6:Highlight(v72, l_Red_0)));
        end;
        l_Needed_0.Text = ("%* AURA NEEDED FOR SWAP"):format((v6:Highlight(v60, l_Red_0)));
        local v74 = nil;
        v74 = v57:PopulateCards({
            cards = v13.BuffCards:Get(), 
            parent = l_Deck_0, 
            dumpster = v19, 
            callback = function(_, v76) --[[ Line: 189 ]] --[[ Name: callback ]]
                -- upvalues: v74 (ref)
                for _, v78 in v74 do
                    if v78.Parent then
                        v78.Card.Content.Burn.Visible = v78 == v76;
                        v76:SetAttribute("Disabled", v78 == v76);
                    end;
                end;
            end
        });
        for _, v80 in v74 do
            local l_Burn_0 = v80.Card.Content.Burn;
            local l_Buttons_0 = l_Burn_0.Buttons;
            v12:HandleButton(l_Buttons_0.Yes, function() --[[ Line: 206 ]]
                -- upvalues: v80 (copy), v65 (copy), v8 (ref), v66 (ref), v74 (ref), v60 (ref), l_MAX_AURA_1 (ref), v68 (ref), v57 (copy), l_Needed_0 (copy), v6 (ref), l_Red_0 (copy), v59 (copy)
                local l_Name_0 = v80.Name;
                table.insert(v65, l_Name_0);
                local l_v8_BuffCard_2 = v8:GetBuffCard(l_Name_0);
                v66 = v66 + l_v8_BuffCard_2.aura;
                v80:Destroy();
                local v85 = table.find(v74, v80);
                if v85 then
                    table.remove(v74, v85);
                end;
                for _, v87 in l_v8_BuffCard_2.buffs do
                    if v87.type == "Aura" then
                        v60 = v60 + v87.amount;
                        l_MAX_AURA_1 = l_MAX_AURA_1 - v87.amount;
                    end;
                end;
                v68 = v68 - v66;
                v57:_updateAura(v68, l_MAX_AURA_1, true);
                local v88 = v60 - v66;
                l_Needed_0.Text = ("%* AURA NEEDED FOR SWAP"):format((v6:Highlight(v88, l_Red_0)));
                if v60 <= v66 then
                    v57:_selectCard(v59, v65);
                    return;
                else
                    return;
                end;
            end);
            v12:HandleButton(l_Buttons_0.No, function() --[[ Line: 236 ]]
                -- upvalues: l_Burn_0 (copy), v80 (copy)
                l_Burn_0.Visible = false;
                v80:SetAttribute("Disabled", false);
            end);
        end;
        v57:PopulateCards({
            cards = {
                v59
            }, 
            parent = l_Swap_0, 
            dumpster = v19, 
            callback = function() --[[ Line: 246 ]] --[[ Name: callback ]]
                -- upvalues: v15 (ref)
                v15:Notify({
                    message = "Select cards to burn on the right", 
                    isPositive = false, 
                    duration = 3
                });
            end
        });
    end, 
    Curse = function(v89, v90, v91) --[[ Line: 256 ]]
        -- upvalues: v19 (copy), l_CurseBG_0 (copy), v12 (ref), v24 (ref)
        local l_BackgroundTransparency_0 = v89.main.BackgroundTransparency;
        v89.main.BackgroundTransparency = 1;
        v89.infoFrame.Visible = false;
        local l_Inner_4 = v90.Inner;
        local l_Close_1 = l_Inner_4.Close;
        local l_Cards_3 = l_Inner_4.Cards;
        local v96 = v89:_createCard(v91, v19);
        v96.Parent = l_Cards_3;
        for _, v98 in l_CurseBG_0:GetChildren() do
            v98:Clone().Parent = v96;
        end;
        v12:HandleButton(v96);
        v19:Add(v96);
        v12:HandleButton(l_Close_1, function() --[[ Line: 277 ]]
            -- upvalues: v24 (ref), v12 (ref), v89 (copy)
            if not v24 then
                v12:Toggle(script.Name, false);
                return;
            else
                v89:SetPage("Swap", v24);
                return;
            end;
        end);
        v19:Add(function() --[[ Line: 287 ]]
            -- upvalues: v89 (copy), l_BackgroundTransparency_0 (copy)
            v89.main.BackgroundTransparency = l_BackgroundTransparency_0;
            v89.infoFrame.Visible = true;
        end);
    end, 
    BurnCurse = function(v99, v100) --[[ Line: 293 ]]
        -- upvalues: v31 (copy), v22 (ref), v19 (copy), v12 (ref), v13 (ref)
        local l_Inner_5 = v100.Inner;
        local l_Cards_4 = l_Inner_5.Cards;
        v31(l_Inner_5, l_Cards_4);
        v99.sideDeck:SetAttribute("Disabled", true);
        local v103 = nil;
        v103 = v99:PopulateCards({
            cards = v22, 
            parent = l_Cards_4, 
            dumpster = v19, 
            callback = function(_, v105) --[[ Line: 306 ]] --[[ Name: callback ]]
                -- upvalues: v103 (ref)
                for _, v107 in v103 do
                    if v107.Parent then
                        v107.Card.Content.Burn.Visible = v107 == v105;
                        v107:SetAttribute("Disabled", v107 == v105);
                    end;
                end;
            end
        });
        for _, v109 in v103 do
            local l_Burn_1 = v109.Card.Content.Burn;
            local l_Buttons_1 = l_Burn_1.Buttons;
            v12:HandleButton(l_Buttons_1.Yes, function() --[[ Line: 323 ]]
                -- upvalues: v109 (copy), v13 (ref), v12 (ref)
                local l_Name_1 = v109.Name;
                v13.BurnCurseCard:Fire(l_Name_1);
                v12:Toggle(script.Name, false);
            end);
            v12:HandleButton(l_Buttons_1.No, function() --[[ Line: 329 ]]
                -- upvalues: l_Burn_1 (copy), v109 (copy)
                l_Burn_1.Visible = false;
                v109:SetAttribute("Disabled", false);
            end);
        end;
    end
};
v25.Init = function(v114, v115, v116) --[[ Line: 338 ]] --[[ Name: Init ]]
    -- upvalues: v12 (ref), v1 (copy), v13 (ref), v14 (ref)
    v12 = v1.GetController("UIController");
    v13 = v1.GetService("CardService");
    v14 = v1.GetService("GameService");
    v114.currentMode = v116;
    v114.ui = v115;
    v114.main = v115.Main;
    v114.infoFrame = v114.main.Info;
    v114.auraFrame = v114.infoFrame.AuraAmount;
    v114.auraAmount = v114.auraFrame.Amount;
    v114.sideDeck = v114.infoFrame.SideDeck;
    v114.stageInfoFrame = v114.infoFrame.StageInfo;
    v114.waveLabel = v114.stageInfoFrame.Inner.Inner.CurrentWave;
    v114.pages = {
        Start = v114.main.Start, 
        View = v114.main.View, 
        Swap = v114.main.Swap, 
        Burn = v114.main.Burn, 
        Curse = v114.main.Curse, 
        BurnCurse = v114.main.BurnCurse
    };
end;
v25.Start = function(v117) --[[ Line: 364 ]] --[[ Name: Start ]]
    -- upvalues: v15 (ref), v12 (ref), v13 (ref), v22 (ref), v21 (ref), v24 (ref), v14 (ref), v6 (copy), v23 (ref)
    v15 = v12:GetModuleAsync("Notification"):expect();
    v13.Start:Connect(function(v118) --[[ Line: 367 ]]
        -- upvalues: v22 (ref), v117 (copy)
        table.clear(v22);
        v117:SetPage("Start", v118);
    end);
    v13.Swap:Connect(function(v119) --[[ Line: 372 ]]
        -- upvalues: v21 (ref), v24 (ref), v117 (copy)
        if v21 == "Curse" then
            v24 = v119;
            return;
        else
            v117:SetPage("Swap", v119);
            return;
        end;
    end);
    v13.CurseCards:Observe(function(v120) --[[ Line: 380 ]]
        -- upvalues: v22 (ref), v12 (ref), v117 (copy)
        local v121 = nil;
        if #v120 > #v22 then
            v121 = v120[#v120];
        end;
        v22 = v120;
        if v12:GetToggleState(script.Name) then
            v117:_populateSideCards("Curse");
        end;
        if not v121 then
            return;
        else
            v117:SetPage("Curse", v121);
            return;
        end;
    end);
    v13.Modifiers:Observe(function() --[[ Line: 400 ]]
        -- upvalues: v117 (copy)
        v117:_updateAura();
    end);
    v13.Aura:Observe(function(v122) --[[ Line: 404 ]]
        -- upvalues: v117 (copy)
        v117:_updateAura(v122);
    end);
    v14.Wave:Observe(function(v123) --[[ Line: 408 ]]
        -- upvalues: v117 (copy)
        v117.waveLabel.Text = ("Wave %*"):format(v123);
    end);
    local function v126() --[[ Line: 412 ]] --[[ Name: updateSideDeckState ]]
        -- upvalues: v117 (copy), v6 (ref)
        local v124 = v117.sideDeck:GetAttribute("Disabled") or false;
        v6:IterateClass(v117.sideDeck, "TextButton", function(v125) --[[ Line: 415 ]]
            -- upvalues: v124 (copy)
            v125.Card.Content.Deselected.Visible = v124;
        end, true);
    end;
    v117.sideDeck:GetAttributeChangedSignal("Disabled"):Connect(v126);
    v12:HandleButton(v117.sideDeck, function() --[[ Line: 422 ]]
        -- upvalues: v117 (copy), v23 (ref)
        if v117.sideDeck:GetAttribute("Disabled") then
            return;
        elseif v23 == "Curse" then
            v117:_populateSideCards("Buff");
            v117:SetPage("View", true);
            return;
        else
            if v23 == "Buff" then
                v117:_populateSideCards("Curse");
                v117:SetPage("View");
            end;
            return;
        end;
    end);
end;
v25.Opening = function(v127) --[[ Line: 437 ]] --[[ Name: Opening ]]
    -- upvalues: v22 (ref)
    if #v22 > 0 then
        v127:_populateSideCards("Curse");
    end;
end;
v25.Closed = function(v128) --[[ Line: 443 ]] --[[ Name: Closed ]]
    -- upvalues: v19 (copy), v20 (copy), v21 (ref), v24 (ref)
    v19:Destroy();
    v20:Destroy();
    v21 = nil;
    v24 = nil;
    v128.sideDeck.Visible = true;
end;
v25.Toggle = function(v129) --[[ Line: 455 ]] --[[ Name: Toggle ]]
    -- upvalues: v12 (ref), v21 (ref)
    if v12:GetToggleState(script.Name) and v21 ~= "View" then
        return;
    elseif v21 == "View" then
        v12:Toggle(script.Name, false);
        return;
    else
        v129:SetPage("View");
        return;
    end;
end;
v25.PopulateCards = function(v130, v131) --[[ Line: 470 ]] --[[ Name: PopulateCards ]]
    -- upvalues: v6 (copy), v2 (copy), v12 (ref)
    assert(v131.cards ~= nil, "Card names expected");
    assert(v131.parent ~= nil, "Parent for cards expected");
    v6:IterateClass(v131.parent, "TextButton", function(v132) --[[ Line: 481 ]]
        -- upvalues: v131 (copy)
        if not table.find(v131.cards, v132.Name) then
            v132:Destroy();
        end;
    end, true);
    local v133 = v131.dumpster or v2.new();
    local v134 = {};
    for _, v136 in v131.cards do
        if not v131.parent:FindFirstChild(v136) then
            local v137 = v130:_createCard(v136, v133, v131.uiScale);
            table.insert(v134, v137);
            v137.Parent = v131.parent;
            v133:Add(v137);
            if not v131.static then
                v12:HandleButton(v137, function() --[[ Line: 505 ]]
                    -- upvalues: v131 (copy), v136 (copy), v137 (copy)
                    if not v131.callback then
                        return;
                    else
                        v131.callback(v136, v137);
                        return;
                    end;
                end);
            end;
        end;
    end;
    return v134, v133;
end;
v25.SetPage = function(v138, v139, ...) --[[ Line: 517 ]] --[[ Name: SetPage ]]
    -- upvalues: v21 (ref), v19 (copy), v113 (copy), v12 (ref)
    assert(v138.pages[v139], (("Page %* does not exist"):format(v139)));
    v21 = v139;
    v19:Destroy();
    v113[v139](v138, v138.pages[v139], ...);
    for v140, v141 in v138.pages do
        v141.Visible = v140 == v139;
    end;
    if not v12:GetToggleState(script.Name) then
        v12:Toggle(script.Name, true);
    end;
end;
v25._getModifierText = function(_, v143) --[[ Line: 535 ]] --[[ Name: _getModifierText ]]
    -- upvalues: v9 (copy), v10 (copy), l_ROGUELIKE_0 (copy), v11 (copy)
    if v143.reward then
        local l_v9_DisplayName_0 = v9:GetDisplayName(v143.reward.name);
        return (("Every %* Waves\n+%* %*"):format(v143.rewardInterval, v143.reward.amount, l_v9_DisplayName_0));
    else
        local l_type_0 = v143.type;
        if v143.name then
            l_type_0 = l_type_0 .. (".%*"):format(v143.name);
        end;
        local v146 = v10(l_ROGUELIKE_0.MODIFIER_TEXT_MAP, l_type_0);
        if not v146 then
            v11:Warn((("Modifier text not found for path: %*"):format(l_type_0)));
            return "N/A";
        else
            local v147 = if v143.amount > 0 then ("+%*"):format(v143.amount) else v143.amount;
            v146 = string.gsub(v146, "<amount>", v147);
            return (string.gsub(v146, "<unsignedAmount>", v143.amount));
        end;
    end;
end;
v25._createCard = function(v148, v149, v150, v151) --[[ Line: 561 ]] --[[ Name: _createCard ]]
    -- upvalues: v8 (copy), l_CardTemplates_0 (copy), v6 (copy)
    local l_v8_Card_0 = v8:GetCard(v149);
    local v153 = if v8:GetBuffCard(v149) then l_CardTemplates_0.BuffTemplate:Clone() else l_CardTemplates_0.CurseTemplate:Clone();
    v153.Name = v149;
    v153.UIScale.Scale = v151 or 1;
    v153:SetAttribute("InvertClick", true);
    local l_Card_0 = v153.Card;
    local l_Backdrop_0 = l_Card_0.Backdrop;
    local l_Content_0 = l_Card_0.Content;
    local l_Modifiers_0 = l_Content_0.Modifiers;
    l_Backdrop_0.Image = l_v8_Card_0.image;
    if l_v8_Card_0.aura then
        l_Content_0.AuraAmount.Amount.Text = l_v8_Card_0.aura;
    end;
    local v158 = {};
    local v159 = {};
    if l_v8_Card_0.buffs then
        local l_Pro_0 = l_Modifiers_0.Inner.Pro;
        local v161 = l_Pro_0.Label:Clone();
        l_Pro_0.Label:Destroy();
        local l_TypeCondition_0 = l_Pro_0.TypeCondition;
        local l_AttackType_0 = l_TypeCondition_0.AttackType;
        l_AttackType_0.Interactable = false;
        l_AttackType_0:SetAttribute("IGNORE_AUTO_SCALING", true);
        table.insert(v158, l_TypeCondition_0.Label);
        table.insert(v159, {
            object = l_AttackType_0, 
            originalSize = l_AttackType_0.Size
        });
        for _, v165 in l_v8_Card_0.buffs do
            local v166 = v161:Clone();
            v166.Name = if v165.name then ("%*_%*"):format(v165.type, v165.name) else v165.type;
            v166.Text = v148:_getModifierText(v165);
            v166.Parent = l_Pro_0;
            table.insert(v158, v166);
            if v165.unitTypeInclusion then
                l_TypeCondition_0.Visible = true;
                local l_v6_AttackTypeIcon_0 = v6:GetAttackTypeIcon(v165.unitTypeInclusion);
                l_AttackType_0.Icon.Image = l_v6_AttackTypeIcon_0;
            end;
        end;
    end;
    if l_v8_Card_0.nerfs then
        local l_Con_0 = l_Modifiers_0.Inner.Con;
        local v169 = l_Con_0.Label:Clone();
        l_Con_0.Label:Destroy();
        local l_TypeCondition_1 = l_Con_0.TypeCondition;
        table.insert(v158, l_TypeCondition_1.Label);
        for _, v172 in l_v8_Card_0.nerfs do
            local v173 = v169:Clone();
            v173.Name = if v172.name then ("%*_%*"):format(v172.type, v172.name) else v172.type;
            v173.Text = v148:_getModifierText(v172);
            v173.Parent = l_Con_0;
            table.insert(v158, v173);
            if v172.unitTypeExclusion then
                l_TypeCondition_1.Visible = true;
            end;
        end;
    end;
    for _, v175 in v158 do
        local l_UITextSizeConstraint_0 = v175.UITextSizeConstraint;
        local l_UIStroke_0 = v175:FindFirstChildOfClass("UIStroke");
        l_UITextSizeConstraint_0:SetAttribute("IGNORE_AUTO_SCALING", true);
        local v178 = {
            constraint = l_UITextSizeConstraint_0, 
            stroke = l_UIStroke_0, 
            originalTextSize = l_UITextSizeConstraint_0.MaxTextSize
        };
        if l_UIStroke_0 then
            l_UIStroke_0:SetAttribute("IGNORE_AUTO_SCALING", true);
            v178.originalStrokeSize = l_UIStroke_0.Thickness;
        end;
        table.insert(v159, v178);
    end;
    local function v182() --[[ Line: 666 ]] --[[ Name: updateTextSizes ]]
        -- upvalues: v153 (copy), v159 (copy)
        local v179 = v153.AbsoluteSize.Y / 555;
        for _, v181 in v159 do
            if v181.object then
                v181.object.Size = UDim2.fromOffset(v181.originalSize.X.Offset * v179, v181.originalSize.Y.Offset * v179);
            end;
            if v181.constraint then
                v181.constraint.MaxTextSize = math.max(v181.constraint.MinTextSize, v181.originalTextSize * v179);
            end;
            if v181.stroke then
                v181.stroke.Thickness = v181.originalStrokeSize * v179;
            end;
        end;
    end;
    v150:Add(v153:GetPropertyChangedSignal("AbsoluteSize"):Connect(v182));
    v182();
    return v153;
end;
v25._populateSideCards = function(v183, v184) --[[ Line: 696 ]] --[[ Name: _populateSideCards ]]
    -- upvalues: v20 (copy), v23 (ref), v22 (ref), v13 (ref), v12 (ref), v21 (ref)
    v20:Destroy();
    v23 = v184;
    local v185 = v183:PopulateCards({
        cards = if v184 == "Curse" then v22 else v13.BuffCards:Get(), 
        parent = v183.sideDeck, 
        dumpster = v20, 
        static = true
    });
    local v186 = v12:GetToggleState(script.Name) and v21 ~= "View";
    for _, v188 in v185 do
        v188.Interactable = false;
        v188.Card.Content.Deselected.Visible = v186;
    end;
end;
v25._updateAura = function(v189, v190, v191, v192) --[[ Line: 720 ]] --[[ Name: _updateAura ]]
    -- upvalues: v13 (ref), l_ROGUELIKE_0 (copy), v7 (copy), v6 (copy)
    v190 = v190 or v13.Aura:Get() or 0;
    if not v191 then
        v191 = l_ROGUELIKE_0.MAX_AURA;
        local v193 = v13.Modifiers:Get() or {};
        if v193.Aura then
            v191 = v191 + v193.Aura;
        end;
    end;
    if not v192 then
        v189.auraAmount.Text = ("%*/%*"):format(v190, v191);
        return;
    else
        local v194 = if v191 <= v190 then v7.Solid.Red else v7.Solid.Green;
        local v195 = ("<font color=\"%*\">%*</font>"):format(v6:Color3ToHex(v194), v190);
        v189.auraAmount.Text = ("%*/%*"):format(v195, v191);
        return;
    end;
end;
v25._selectCard = function(v196, v197, v198) --[[ Line: 744 ]] --[[ Name: _selectCard ]]
    -- upvalues: v13 (ref), v8 (copy), v12 (ref)
    v13.SelectCard:Fire(v197, v198);
    for _, v200 in v8:GetCard(v197).buffs do
        if v200.type == "BurnCurse" then
            v196:SetPage("BurnCurse");
            return;
        end;
    end;
    v12:Toggle(script.Name, false);
end;
return v25;