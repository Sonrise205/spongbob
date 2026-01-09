local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v2 = require(l_ReplicatedStorage_0.Packages.Fusion);
local v3 = require(script.Parent.UIFocus);
return {
    fusion = v2, 
    controls = {}, 
    story = function(v4) --[[ Line: 26 ]] --[[ Name: story ]]
        -- upvalues: v3 (copy), v1 (copy)
        local l_scope_0 = v4.scope;
        local _ = v4.controls;
        local v7 = v3.new(v4.target);
        local v8 = v1.new();
        local v9 = Random.new();
        local v10 = {};
        for _ = 1, 3 do
            table.insert(v10, (l_scope_0:New("Frame")({
                Name = "TargetFrame", 
                Size = UDim2.fromOffset(v9:NextInteger(48, 256), v9:NextInteger(24, 96)), 
                Position = UDim2.fromScale(v9:NextNumber(0.1, 0.9), v9:NextNumber(0.1, 0.9)), 
                BackgroundColor3 = BrickColor.Random().Color, 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Parent = v4.target
            })));
        end;
        local v12 = nil;
        v8:Add(task.defer(function() --[[ Line: 47 ]]
            -- upvalues: v10 (copy), v9 (copy), v12 (ref), v7 (copy)
            while true do
                for _ = 1, 3 do
                    print("Changing target frame");
                    local v14 = nil;
                    while true do
                        v14 = v10[v9:NextInteger(1, #v10)];
                        if v14 ~= v12 then
                            v12 = v14;
                            v7:SetTarget(v14);
                            task.wait(v9:NextInteger(1, 3));
                            break;
                        end;
                    end;
                end;
                print("Setting target to nil");
                v7:SetTarget(nil);
                task.wait(2);
            end;
        end));
        return function() --[[ Line: 66 ]]
            -- upvalues: v12 (ref), v8 (copy), v7 (copy)
            warn("Destroying UIFocus");
            v12 = nil;
            v8:Destroy();
            v7:Destroy();
        end;
    end
};