local _ = game:GetService("Players");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v2 = require(l_ReplicatedStorage_0.Packages.Knit);
local _ = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v4 = require(l_ReplicatedStorage_0.Packages.Component);
local v5 = nil;
local v6 = {
    "Sound", 
    "AudioPlayer"
};
local v8 = v4.new({
    Tag = script.Name, 
    Ancestors = {
        workspace
    }, 
    Extensions = {
        {
            ShouldConstruct = function(v7) --[[ Line: 20 ]] --[[ Name: ShouldConstruct ]]
                -- upvalues: v6 (copy)
                return table.find(v6, v7.Instance.ClassName);
            end
        }
    }
});
v8.Construct = function(_) --[[ Line: 27 ]] --[[ Name: Construct ]]
    -- upvalues: v5 (ref), v2 (copy)
    if not v5 then
        v5 = v2.GetController("AudioController");
    end;
end;
v8.Start = function(v10) --[[ Line: 33 ]] --[[ Name: Start ]]
    -- upvalues: v5 (ref)
    if v10.Instance:IsA("Sound") then
        v10.Instance.SoundGroup = v5:GetSoundGroup("Master");
    end;
    v10.Instance:Play();
end;
return v8;