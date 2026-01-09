local l_HttpService_0 = game:GetService("HttpService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v2 = require(l_ReplicatedStorage_0.Packages.Knit);
local _ = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v4 = require(l_ReplicatedStorage_0.Packages.Timer);
local v5 = require(l_ReplicatedStorage_0.Packages.Tree);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v7 = require(l_ReplicatedStorage_0.Shared.Data.Variables);
local v8 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local v9 = nil;
local v10 = {
    ["Content/UIGradient"] = {
        Color = ColorSequence.new(Color3.fromRGB(34, 218, 255), Color3.fromRGB(19, 125, 255)), 
        Rotation = 90
    }, 
    ["Content/UIStroke"] = {
        Color = Color3.fromRGB(21, 70, 177)
    }, 
    ["Content/Title/UIStroke"] = {
        Color = Color3.fromRGB(21, 70, 177)
    }
};
local v11 = {
    ["Content/UIGradient"] = {
        Color = ColorSequence.new(Color3.fromRGB(162, 187, 255), Color3.fromRGB(62, 82, 147)), 
        Rotation = 90
    }, 
    ["Content/UIStroke"] = {
        Color = Color3.fromRGB(35, 56, 88)
    }, 
    ["Content/Title/UIStroke"] = {
        Color = Color3.fromRGB(35, 56, 88)
    }
};
return {
    primaryMenu = true, 
    ToggleAll = {}, 
    _pageModules = {}, 
    _timerCallbacks = {}, 
    Init = function(_, _) --[[ Line: 65 ]] --[[ Name: Init ]]
        -- upvalues: v9 (ref), v2 (copy)
        v9 = v2.GetController("UIController");
    end, 
    Start = function(v14, v15) --[[ Line: 70 ]] --[[ Name: Start ]]
        -- upvalues: v7 (copy), v9 (ref), v4 (copy)
        v14.ui = v15;
        v14.main = v15.Main.Window;
        v14.timerBar = v14.main.TimerBar;
        v14.navButtons = v14.main.Content.Top.Buttons;
        v14.EventTimeLeft = v7.KAMP_KORAL_END - workspace:GetServerTimeNow();
        v9:HandleButton(v14.main.Exit, function() --[[ Line: 78 ]]
            -- upvalues: v9 (ref)
            v9:Toggle(script.Name, false);
        end);
        v14:_initPages();
        v14:_setupNavBar();
        v14:_setupCountdownBar();
        local v16 = nil;
        v16 = v4.Simple(1, function() --[[ Line: 87 ]]
            -- upvalues: v14 (copy), v16 (ref)
            local l_v14_0 = v14;
            l_v14_0.EventTimeLeft = l_v14_0.EventTimeLeft - 1;
            if v14.EventTimeLeft < 1 then
                v16:Disconnect();
                v16 = nil;
                table.clear(v14._timerCallbacks);
                return;
            else
                for _, v19 in pairs(v14._timerCallbacks) do
                    v19(v14.EventTimeLeft);
                end;
                return;
            end;
        end);
    end, 
    Opened = function(v20) --[[ Line: 103 ]] --[[ Name: Opened ]]
        v20:SetPage("Overview");
    end, 
    Closed = function(v21) --[[ Line: 107 ]] --[[ Name: Closed ]]
        for _, v23 in v21._pageModules do
            if v23.Closed then
                task.spawn(v23.Closed, v23);
            end;
        end;
    end, 
    SetPage = function(v24, v25) --[[ Line: 115 ]] --[[ Name: SetPage ]]
        -- upvalues: v10 (copy), v11 (copy), v5 (copy)
        for _, v27 in v24.main.Content.Bin:GetChildren() do
            local v28 = v24._pageModules[v27.Name];
            if v27.Visible and v27.Name ~= v25 and v28 and v28.Closed then
                task.spawn(v28.Closed, v28);
            end;
            v27.Visible = v27.Name == v25;
            if v27.Visible and v28 and v28.Opened then
                task.spawn(v28.Opened, v28);
            end;
        end;
        for _, v30 in v24.navButtons:GetChildren() do
            if v30:IsA("GuiButton") then
                local v31 = v30.Name == v25 and v10 or v11;
                for v32, v33 in v31 do
                    if v5.Exists(v30, v32) then
                        local v34 = v5.Find(v30, v32);
                        for v35, v36 in pairs(v33) do
                            if v34[v35] ~= nil then
                                v34[v35] = v36;
                            end;
                        end;
                    end;
                end;
            end;
        end;
    end, 
    ObserveTimeLeft = function(v37, v38) --[[ Line: 156 ]] --[[ Name: ObserveTimeLeft ]]
        -- upvalues: l_HttpService_0 (copy)
        v38(v37.EventTimeLeft);
        local v39 = l_HttpService_0:GenerateGUID(false);
        v37._timerCallbacks[v39] = v38;
        return function() --[[ Line: 162 ]]
            -- upvalues: v37 (copy), v39 (copy)
            v37._timerCallbacks[v39] = nil;
        end;
    end, 
    _initPages = function(v40) --[[ Line: 167 ]] --[[ Name: _initPages ]]
        local function v43() --[[ Line: 168 ]] --[[ Name: loadPageModules ]]
            -- upvalues: v40 (copy)
            for _, v42 in script.Pages:GetChildren() do
                if v42:IsA("ModuleScript") then
                    v40._pageModules[v42.Name] = require(v42);
                end;
            end;
        end;
        local function v48(v44) --[[ Line: 178 ]] --[[ Name: runPageMethods ]]
            -- upvalues: v40 (copy)
            for v45, v46 in v40._pageModules do
                local l_FirstChild_0 = v40.main.Content.Bin:FindFirstChild(v45);
                if v46[v44] and typeof(v46[v44]) == "function" then
                    task.spawn(v46[v44], v46, l_FirstChild_0);
                end;
            end;
        end;
        v43();
        v48("Init");
        v48("Start");
    end, 
    _setupNavBar = function(v49) --[[ Line: 193 ]] --[[ Name: _setupNavBar ]]
        -- upvalues: v9 (ref)
        for _, v51 in v49.navButtons:GetChildren() do
            if v51:IsA("GuiButton") then
                v9:HandleButton(v51, function() --[[ Line: 199 ]]
                    -- upvalues: v49 (copy), v51 (copy)
                    v49:SetPage(v51.Name);
                end);
            end;
        end;
    end, 
    _setupCountdownBar = function(v52) --[[ Line: 205 ]] --[[ Name: _setupCountdownBar ]]
        -- upvalues: v7 (copy), v8 (copy)
        local l_TimerBar_0 = v52.main.TimerBar;
        local l_KAMP_KORAL_START_0 = v7.KAMP_KORAL_START;
        local v55 = v7.KAMP_KORAL_END - l_KAMP_KORAL_START_0;
        v52:ObserveTimeLeft(function(v56) --[[ Line: 212 ]]
            -- upvalues: l_TimerBar_0 (copy), v8 (ref), v55 (copy)
            l_TimerBar_0.Bar.Title.Text = "Event Ends In";
            l_TimerBar_0.Bar.Timer.Text = v8:FormatTimeFromSeconds(v56 or 0);
            local v57 = math.clamp(1 - v56 / v55, 0, 1);
            l_TimerBar_0.Bar.Fill.Size = UDim2.fromScale(v57, 1);
        end);
    end
};