local l_HttpService_0 = game:GetService("HttpService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v2 = require(l_ReplicatedStorage_0.Packages.Knit);
local _ = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v4 = require(l_ReplicatedStorage_0.Packages.Timer);
local _ = require(l_ReplicatedStorage_0.Packages.Tree);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local _ = require(l_ReplicatedStorage_0.Shared.Data.Variables);
local v8 = require(l_ReplicatedStorage_0.Shared.Data.EventVariables);
local v9 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local v10 = nil;
return {
    primaryMenu = true, 
    ToggleAll = {}, 
    page = nil, 
    _pageModules = {}, 
    _timerCallbacks = {}, 
    Init = function(_, _) --[[ Line: 39 ]] --[[ Name: Init ]]
        -- upvalues: v10 (ref), v2 (copy)
        v10 = v2.GetController("UIController");
    end, 
    Start = function(v13, v14) --[[ Line: 44 ]] --[[ Name: Start ]]
        -- upvalues: v8 (copy), v10 (ref), v4 (copy)
        v13.ui = v14;
        v13.main = v14.Main.Window;
        v13.timerBar = v13.main.TimerBar;
        v13.EventTimeLeft = v8.EVENT_END.UnixTimestamp - workspace:GetServerTimeNow();
        v10:HandleButton(v13.main.Exit, function() --[[ Line: 51 ]]
            -- upvalues: v13 (copy), v10 (ref)
            if v13.page ~= "Overview" then
                v13:SetPage("Overview");
                return;
            else
                v10:Toggle(script.Name, false);
                return;
            end;
        end);
        v13:_initPages();
        v13:_setupCountdownBar();
        local v15 = nil;
        v15 = v4.Simple(1, function() --[[ Line: 65 ]]
            -- upvalues: v13 (copy), v15 (ref)
            local l_v13_0 = v13;
            l_v13_0.EventTimeLeft = l_v13_0.EventTimeLeft - 1;
            if v13.EventTimeLeft < 1 then
                v15:Disconnect();
                v15 = nil;
                table.clear(v13._timerCallbacks);
                return;
            else
                for _, v18 in pairs(v13._timerCallbacks) do
                    v18(v13.EventTimeLeft);
                end;
                return;
            end;
        end);
    end, 
    Opened = function(v19) --[[ Line: 81 ]] --[[ Name: Opened ]]
        v19:SetPage("Overview");
    end, 
    Closed = function(v20) --[[ Line: 85 ]] --[[ Name: Closed ]]
        for _, v22 in v20._pageModules do
            if v22.Closed then
                task.spawn(v22.Closed, v22);
            end;
        end;
    end, 
    SetPage = function(v23, v24) --[[ Line: 93 ]] --[[ Name: SetPage ]]
        if v23.page == v24 then
            return;
        else
            v23.page = v24;
            for _, v26 in v23.main.Content:GetChildren() do
                local v27 = v23._pageModules[v26.Name];
                if v26.Visible and v26.Name ~= v24 and v27 and v27.Closed then
                    task.spawn(v27.Closed, v27);
                end;
                v26.Visible = v26.Name == v24;
                if v26.Visible and v27 and v27.Opened then
                    task.spawn(v27.Opened, v27);
                end;
            end;
            return;
        end;
    end, 
    ObserveTimeLeft = function(v28, v29) --[[ Line: 117 ]] --[[ Name: ObserveTimeLeft ]]
        -- upvalues: l_HttpService_0 (copy)
        v29(v28.EventTimeLeft);
        local v30 = l_HttpService_0:GenerateGUID(false);
        v28._timerCallbacks[v30] = v29;
        return function() --[[ Line: 123 ]]
            -- upvalues: v28 (copy), v30 (copy)
            v28._timerCallbacks[v30] = nil;
        end;
    end, 
    _initPages = function(v31) --[[ Line: 128 ]] --[[ Name: _initPages ]]
        local function v34() --[[ Line: 129 ]] --[[ Name: loadPageModules ]]
            -- upvalues: v31 (copy)
            for _, v33 in script.Pages:GetChildren() do
                if v33:IsA("ModuleScript") then
                    v31._pageModules[v33.Name] = require(v33);
                end;
            end;
        end;
        local function v39(v35) --[[ Line: 139 ]] --[[ Name: runPageMethods ]]
            -- upvalues: v31 (copy)
            for v36, v37 in v31._pageModules do
                local l_FirstChild_0 = v31.main.Content:FindFirstChild(v36);
                if v37[v35] and typeof(v37[v35]) == "function" then
                    task.spawn(v37[v35], v37, l_FirstChild_0, v31);
                end;
            end;
        end;
        v34();
        v39("Init");
        v39("Start");
    end, 
    _setupCountdownBar = function(v40) --[[ Line: 154 ]] --[[ Name: _setupCountdownBar ]]
        -- upvalues: v8 (copy), v9 (copy)
        local l_TimerBar_0 = v40.main.TimerBar;
        local l_UnixTimestamp_0 = v8.EVENT_START.UnixTimestamp;
        local v43 = v8.EVENT_END.UnixTimestamp - l_UnixTimestamp_0;
        v40:ObserveTimeLeft(function(v44) --[[ Line: 161 ]]
            -- upvalues: l_TimerBar_0 (copy), v9 (ref), v43 (copy)
            l_TimerBar_0.Bar.Title.Text = "Event Ends In";
            l_TimerBar_0.Bar.Timer.Text = v9:FormatTimeFromSeconds(v44 or 0);
            local v45 = math.clamp(1 - v44 / v43, 0, 1);
            l_TimerBar_0.Bar.Fill.Size = UDim2.fromScale(v45, 1);
        end);
    end
};