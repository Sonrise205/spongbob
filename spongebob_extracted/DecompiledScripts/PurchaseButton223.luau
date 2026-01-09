local _ = game:GetService("Players");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v2 = require(l_ReplicatedStorage_0.Packages.Knit);
local v3 = require(l_ReplicatedStorage_0.Packages.Component);
local v4 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v5 = v2.GetController("PurchaseController");
local v6 = v2.GetController("UIController");
local v8 = v3.new({
    Tag = script.Name, 
    Ancestors = {
        v2.PlayerGui
    }, 
    Extensions = {
        {
            ShouldConstruct = function(v7) --[[ Line: 16 ]] --[[ Name: ShouldConstruct ]]
                if not v7.Instance:IsA("GuiButton") then
                    return false;
                else
                    return v7.Instance:GetAttribute("PurchaseName") ~= nil;
                end;
            end
        }
    }
});
v8.Construct = function(v9) --[[ Line: 28 ]] --[[ Name: Construct ]]
    -- upvalues: v4 (copy), v5 (copy), v6 (copy), v2 (copy)
    v9.dump = v4.new();
    local l_Attribute_0 = v9.Instance:GetAttribute("PurchaseName");
    local l_Attribute_1 = v9.Instance:GetAttribute("PurchaseType");
    local l_Product_0 = Enum.InfoType.Product;
    if l_Attribute_1 == "Gamepasses" then
        l_Product_0 = Enum.InfoType.GamePass;
    end;
    if l_Attribute_1 == "DevProducts" and not v5:GetProduct(l_Attribute_0) then
        return;
    elseif l_Attribute_1 == "Gamepasses" and not v5:GetGamepass(l_Attribute_0) then
        return;
    else
        v6:HandleButton(v9.Instance, function() --[[ Line: 46 ]]
            -- upvalues: l_Attribute_1 (copy), v5 (ref), l_Attribute_0 (copy)
            if l_Attribute_1 == "DevProducts" then
                v5:PromptProductPurchase(l_Attribute_0);
                return;
            else
                v5:PromptGamepassPurchase(l_Attribute_0);
                return;
            end;
        end);
        local l_Amount_0 = v9.Instance.Content:FindFirstChild("Amount");
        if not l_Amount_0 then
            return;
        else
            if l_Attribute_1 == "Gamepasses" then
                v5:ListenToGamepassOwned(v2.Player, l_Attribute_0, function(v14) --[[ Line: 61 ]]
                    -- upvalues: v9 (copy)
                    v9.Instance.Content.Visible = not v14;
                    v9.Instance.Owned.Visible = v14;
                end, true);
            end;
            v5:PromiseProductInfo(l_Attribute_0, l_Product_0):andThen(function(v15) --[[ Line: 67 ]]
                -- upvalues: l_Amount_0 (copy)
                if not v15 or not v15.PriceInRobux then
                    return;
                else
                    l_Amount_0.Text = v15.PriceInRobux;
                    return;
                end;
            end);
            return;
        end;
    end;
end;
v8.Start = function(_) --[[ Line: 76 ]] --[[ Name: Start ]]

end;
v8.Stop = function(v17) --[[ Line: 79 ]] --[[ Name: Stop ]]
    v17.dump:Destroy();
end;
return v8;