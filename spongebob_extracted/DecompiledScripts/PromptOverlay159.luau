local l_MarketplaceService_0 = game:GetService("MarketplaceService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_RunService_0 = game:GetService("RunService");
local l_AvatarEditorService_0 = game:GetService("AvatarEditorService");
local _ = game:GetService("UserInputService");
local v5 = require(l_ReplicatedStorage_0.Packages.Knit);
local v6 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v7 = require(l_ReplicatedStorage_0.Packages.Signal);
local v8 = require(l_ReplicatedStorage_0.Packages.Fusion);
local l_scoped_0 = v8.scoped;
local l_peek_0 = v8.peek;
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v12 = require(l_ReplicatedStorage_0.Shared.Util.Lerp);
local v13 = nil;
return {
    primaryMenu = false, 
    ExternalToggle = v7.new(), 
    Init = function(v14, v15) --[[ Line: 41 ]] --[[ Name: Init ]]
        -- upvalues: v13 (ref), v5 (copy), v6 (copy)
        v13 = v5.GetController("PurchaseController");
        v14.main = v15.Main;
        v14.loading = v14.main.Loading;
        v14.loadingIcon = v14.loading.Icon;
        v14.loadingScale = v14.loading.UIScale;
        v14.gradient = v14.main.UIGradient;
        v14.sink = v14.main.Sink;
        v14.sink.Visible = false;
        v14.dumpster = v6.new();
    end, 
    Start = function(v16, _) --[[ Line: 57 ]] --[[ Name: Start ]]
        -- upvalues: l_scoped_0 (copy), v8 (copy), l_peek_0 (copy), v12 (copy), v13 (ref), l_MarketplaceService_0 (copy), v5 (copy), l_AvatarEditorService_0 (copy)
        local v18 = l_scoped_0(v8);
        v16.goal = v18:Value(0);
        local v19 = v18:Spring(v16.goal, 10, 1);
        local v20 = v18:Spring(v16.goal, 10, 0.8);
        v18:Observer(v19):onBind(function() --[[ Line: 64 ]]
            -- upvalues: l_peek_0 (ref), v19 (copy), v16 (copy), v12 (ref)
            local v21 = l_peek_0(v19);
            v16.gradient.Offset = Vector2.new(0, v12(1, -0.2, v21));
            v16.main.Visible = v21 > 0;
        end);
        v18:Observer(v20):onBind(function() --[[ Line: 71 ]]
            -- upvalues: l_peek_0 (ref), v20 (copy), v16 (copy)
            local v22 = l_peek_0(v20);
            v16.loadingScale.Scale = math.max(v22, 0);
            v16.loading.Visible = v22 > 0;
        end);
        v13.PurchasePromptOpened:Connect(function() --[[ Line: 77 ]]
            -- upvalues: v16 (copy)
            v16:_promptOpened();
        end);
        local function v23() --[[ Line: 81 ]] --[[ Name: close ]]
            -- upvalues: v16 (copy)
            v16.goal:set(0);
            v16.sink.Visible = false;
            v16.dumpster:Destroy();
        end;
        v13.PurchasePromptClosed:Connect(v23);
        l_MarketplaceService_0.PromptPurchaseFinished:Connect(function(v24) --[[ Line: 89 ]]
            -- upvalues: v5 (ref), v16 (copy)
            if v24 ~= v5.Player then
                return;
            else
                v16.goal:set(0);
                v16.sink.Visible = false;
                v16.dumpster:Destroy();
                return;
            end;
        end);
        v16.ExternalToggle:Connect(function(v25) --[[ Line: 97 ]]
            -- upvalues: v16 (copy)
            if v25 then
                v16:_promptOpened();
                return;
            else
                v16.goal:set(0);
                v16.sink.Visible = false;
                v16.dumpster:Destroy();
                return;
            end;
        end);
        l_AvatarEditorService_0.PromptAllowInventoryReadAccessCompleted:Connect(v23);
    end, 
    Toggle = function(v26, v27) --[[ Line: 113 ]] --[[ Name: Toggle ]]
        v26.ExternalToggle:Fire(v27);
    end, 
    PromptAllowInventoryReadAccess = function(v28) --[[ Line: 117 ]] --[[ Name: PromptAllowInventoryReadAccess ]]
        -- upvalues: l_AvatarEditorService_0 (copy)
        v28:_promptOpened();
        l_AvatarEditorService_0:PromptAllowInventoryReadAccess();
    end, 
    _promptOpened = function(v29) --[[ Line: 123 ]] --[[ Name: _promptOpened ]]
        -- upvalues: l_RunService_0 (copy)
        v29.goal:set(1);
        v29.sink.Visible = true;
        v29.dumpster:Add(l_RunService_0.RenderStepped:Connect(function(v30) --[[ Line: 127 ]]
            -- upvalues: v29 (copy)
            local l_loadingIcon_0 = v29.loadingIcon;
            l_loadingIcon_0.Rotation = l_loadingIcon_0.Rotation + v30 * 60;
        end));
    end
};