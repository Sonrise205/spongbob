local l_Players_0 = game:GetService("Players");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v2 = require(l_ReplicatedStorage_0.Packages.Knit);
local v3 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v5 = nil;
local v6 = nil;
local v7 = nil;
return {
    primaryMenu = false, 
    Init = function(v8, v9) --[[ Line: 33 ]] --[[ Name: Init ]]
        -- upvalues: v5 (ref), v2 (copy), v6 (ref), v7 (ref), v3 (copy)
        v5 = v2.GetController("DataController");
        v6 = v2.GetController("UIController");
        v7 = v2.GetService("GameService");
        v8.ui = v9;
        v8.main = v9.Main;
        v8.inner = v8.main.Inner;
        v8.voteLabel = v8.inner.VoteCount;
        v8.yesBtn = v8.inner.Options.Yes;
        v8.noBtn = v8.inner.Options.No;
        v8.dumpster = v3.new();
    end, 
    Start = function(_, _) --[[ Line: 50 ]] --[[ Name: Start ]]
        -- upvalues: v6 (ref), v7 (ref), l_Players_0 (copy)
    end, 
    Closing = function(v12) --[[ Line: 88 ]] --[[ Name: Closing ]]
        v12.dumpster:Destroy();
    end
};