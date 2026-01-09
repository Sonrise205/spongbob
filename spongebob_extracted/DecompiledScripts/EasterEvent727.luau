local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("RunService");
local _ = game:GetService("UserInputService");
local v3 = require(l_ReplicatedStorage_0.Packages.Knit);
local _ = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v5 = require(l_ReplicatedStorage_0.Packages.TableUtil);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v7 = require(l_ReplicatedStorage_0.Shared.Data.Variables);
local v8 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local v9 = require(l_ReplicatedStorage_0.RNGRolls);
local v10 = require(v3.Player.PlayerScripts.Knit.Modules.UIMenuAnimatedNPC);
local v11 = require(l_ReplicatedStorage_0.Shared.Modules.UnitViewport);
local v12 = require(v3.Player.PlayerScripts.Knit.Modules.UIClasses.GenericTooltip);
local v13 = nil;
local v14 = nil;
local v15 = nil;
local v16 = nil;
local v17 = nil;
local v18 = nil;
local v19 = #v5.Keys(v7.EGG_SHARDS);
return {
    primaryMenu = true, 
    shards = {}, 
    ToggleAll = {}, 
    _canCollectEgg = false, 
    Init = function(v20, v21) --[[ Line: 48 ]] --[[ Name: Init ]]
        -- upvalues: v13 (ref), v3 (copy), v14 (ref), v15 (ref), v16 (ref), v12 (copy), v9 (copy)
        v13 = v3.GetController("DataController");
        v14 = v3.GetController("UIController");
        v15 = v3.GetController("EventController");
        v16 = v3.GetService("EasterService");
        v20.ui = v21;
        v20.main = v21.Main;
        v20.inner = v20.main.Window;
        v20.timerBar = v20.inner.TimerBar;
        v20.titleFrame = v20.inner.Title;
        v20.contentFrame = v20.inner.Content;
        v20.eggFrame = v20.contentFrame.Egg;
        v20.taskFrame = v20.contentFrame.Task;
        v20.detailsFrame = v20.contentFrame.Details;
        v20.exitBtn = v20.inner.Exit;
        v12.new(v20.contentFrame.Details.Unit, {
            Name = "EasterBunnySpongebob", 
            IsUnit = true, 
            HideStats = true
        });
        for _, v23 in v20.eggFrame:GetChildren() do
            if v23:IsA("ImageLabel") then
                v20.shards[v23.Name] = v23;
                v23.Visible = false;
            end;
        end;
        local l_v9_VariantPool_0 = v9:GetVariantPool("EasterEgg");
        if not l_v9_VariantPool_0 then
            return;
        else
            for v25, v26 in l_v9_VariantPool_0 do
                local l_FirstChild_0 = v20.contentFrame.Details.Chances:FindFirstChild((("%*Chance"):format(v25)));
                if l_FirstChild_0 then
                    l_FirstChild_0.Amount.Text = ("%*%%"):format(v26.weight or 0);
                end;
            end;
            return;
        end;
    end, 
    Start = function(v28, _) --[[ Line: 101 ]] --[[ Name: Start ]]
        -- upvalues: v17 (ref), v14 (ref), v18 (ref), v13 (ref), v3 (copy), v19 (copy), v16 (ref)
        v17 = v14:GetModuleAsync("Notification"):expect();
        v18 = v14:GetModuleAsync("Rewards"):expect();
        v28.rarityVisualElements = {
            v28.contentFrame.Details.Unit.Content.Info.Backdrop, 
            v28.contentFrame.Details.Unit.Content.Glow
        };
        for _, v31 in v28.rarityVisualElements do
            v31:SetAttribute("Rarity", "Limited");
        end;
        v14:HandleButton(v28.exitBtn, function() --[[ Line: 114 ]]
            -- upvalues: v14 (ref)
            v14:Toggle(script.Name, false);
        end);
        v13:OnChanged(v3.Player, "Inventory", function(v32) --[[ Line: 118 ]]
            -- upvalues: v28 (copy), v19 (ref)
            local v33 = 0;
            for v34, v35 in v28.shards do
                if v32[v34] ~= nil then
                    v33 = v33 + 1;
                    v35.Visible = true;
                else
                    v35.Visible = false;
                end;
            end;
            v28.taskFrame.Claim.NotCompleted.Amount.Text = ("%*/%*"):format(v33, v19);
            v28.taskFrame.Claim.NotCompleted.Fill.Size = UDim2.fromScale(math.clamp(v33 / v19, 0, 1), 1);
            v28.taskFrame.Claim.NotCompleted.Visible = v33 < v19;
            v28.taskFrame.Claim.Content.Visible = v19 <= v33;
            v28._canCollectEgg = v19 <= v33;
        end, true);
        v14:HandleButton(v28.taskFrame.Claim, function() --[[ Line: 138 ]]
            -- upvalues: v28 (copy), v16 (ref), v17 (ref)
            if not v28._canCollectEgg then
                return;
            else
                v16:RedeemEgg():andThen(function(v36) --[[ Line: 143 ]]
                    -- upvalues: v17 (ref)
                    if not v36 then
                        v17:Notify({
                            message = "Failed to redeem shards into an egg!", 
                            isPositive = false
                        });
                        return;
                    else
                        v17:Notify({
                            message = "Successfully redeemed all shards into an egg!", 
                            isPositive = true
                        });
                        return;
                    end;
                end);
                return;
            end;
        end);
        v28:_setupTimerBar();
    end, 
    Opening = function(v37) --[[ Line: 165 ]] --[[ Name: Opening ]]
        -- upvalues: v10 (copy), v11 (copy)
        v37.animatorDump = v10(v37.ui);
        v37.unitViewport = v11.new(v37.contentFrame.Details.Unit.Content.Info, "EasterBunnySpongebob");
        for _, v39 in v37.rarityVisualElements do
            v39:AddTag("VisualizeRarity");
        end;
    end, 
    Closed = function(v40) --[[ Line: 174 ]] --[[ Name: Closed ]]
        if v40.animatorDump then
            v40.animatorDump:Destroy();
            v40.animatorDump = nil;
        end;
        if v40.unitViewport then
            v40.unitViewport:Destroy();
            v40.unitViewport = nil;
        end;
        for _, v42 in v40.rarityVisualElements do
            v42:RemoveTag("VisualizeRarity");
        end;
    end, 
    _setupTimerBar = function(v43) --[[ Line: 192 ]] --[[ Name: _setupTimerBar ]]
        -- upvalues: v15 (ref), v8 (copy), v14 (ref)
        local l_v15_Timestamps_0, v45 = v15:GetTimestamps();
        l_v15_Timestamps_0 = l_v15_Timestamps_0 and l_v15_Timestamps_0.UnixTimestamp;
        v45 = v45 and v45.UnixTimestamp;
        if l_v15_Timestamps_0 and v45 then
            local v46 = DateTime.fromUnixTimestamp(l_v15_Timestamps_0):FormatLocalTime("MMMM DD", "en-us");
            local v47 = DateTime.fromUnixTimestamp(v45):FormatLocalTime("MMMM DD", "en-us");
            v43.titleFrame.TitleContainer.Title.Title.Text = ("%* - %*"):format(string.upper(v46), (string.upper(v47)));
        end;
        local v52 = v15:ObserveTimeLeft(function(v48, _, v50) --[[ Line: 204 ]]
            -- upvalues: v43 (copy), v8 (ref), v45 (ref), l_v15_Timestamps_0 (ref)
            v43.timerBar.Bar.Title.Text = v50 and "Event Begins In" or "Event Ends In";
            v43.timerBar.Bar.Timer.Text = v8:FormatTimeFromSeconds(v48 or 0);
            local v51 = math.clamp(1 - v48 / (v45 - l_v15_Timestamps_0), 0, 1);
            v43.timerBar.Bar.Fill.Size = UDim2.fromScale(v51, 1);
        end);
        v15.EventEnded:Connect(function() --[[ Line: 215 ]]
            -- upvalues: v14 (ref), v52 (ref)
            if v14:GetToggleState(script.Name) then
                v14:Toggle(script.Name, false);
            end;
            if v52 then
                v52();
                v52 = nil;
            end;
        end);
    end
};