local l_ReplicatedFirst_0 = game:GetService("ReplicatedFirst");
local v1 = require(l_ReplicatedFirst_0.LoadingScreens);
local l_LoadingScreenTemplate_0 = l_ReplicatedFirst_0.LoadingScreenTemplate;
local function _(v3, v4, v5) --[[ Line: 7 ]] --[[ Name: getInfo ]]
    -- upvalues: v1 (copy)
    local v6 = v1[v3];
    assert(v6, (("Loading screen category \"%*\" not found"):format(v3)));
    local v7 = v6[v4];
    assert(v7, (("Loading screen '%*' not found in category \"%*\""):format(v4, v3)));
    if v3 == "Game" then
        v5 = v5 or 1;
        v7 = v7[v5];
        assert(v7, (("Loading screen \"%*\" with act (%*) not found in category \"%*\""):format(v4, v5, v3)));
    end;
    return v7;
end;
return {
    Get = function(v9, v10, v11) --[[ Line: 24 ]] --[[ Name: Get ]]
        -- upvalues: v1 (copy)
        local l_v11_0 = v11;
        local v13 = v1[v9];
        assert(v13, (("Loading screen category \"%*\" not found"):format(v9)));
        local v14 = v13[v10];
        assert(v14, (("Loading screen '%*' not found in category \"%*\""):format(v10, v9)));
        if v9 == "Game" then
            l_v11_0 = l_v11_0 or 1;
            v14 = v14[l_v11_0];
            assert(v14, (("Loading screen \"%*\" with act (%*) not found in category \"%*\""):format(v10, l_v11_0, v9)));
        end;
        return v14;
    end, 
    Create = function(v15, v16, v17) --[[ Line: 28 ]] --[[ Name: Create ]]
        -- upvalues: l_LoadingScreenTemplate_0 (copy), v1 (copy)
        local v18 = l_LoadingScreenTemplate_0:Clone();
        v18.Name = ("LoadingScreen_%*_%*"):format(v15, v16);
        v18.DisplayOrder = 999;
        v18.Enabled = true;
        local l_v17_0 = v17;
        local v20 = v1[v15];
        assert(v20, (("Loading screen category \"%*\" not found"):format(v15)));
        local v21 = v20[v16];
        assert(v21, (("Loading screen '%*' not found in category \"%*\""):format(v16, v15)));
        if v15 == "Game" then
            l_v17_0 = l_v17_0 or 1;
            v21 = v21[l_v17_0];
            assert(v21, (("Loading screen \"%*\" with act (%*) not found in category \"%*\""):format(v16, l_v17_0, v15)));
        end;
        local l_v21_0 = v21;
        l_v17_0 = v18.Main;
        v20 = l_v17_0.Info;
        v21 = l_v17_0.Background;
        local l_Destination_0 = v20.Destination;
        local l_Hint_0 = v20.Hint;
        v21.Image = l_v21_0.background;
        v21.ImageColor3 = l_v21_0.backgroundColor;
        l_Destination_0.Text = l_v21_0.destination;
        l_Hint_0.Text = l_v21_0.hint;
        return v18;
    end
};