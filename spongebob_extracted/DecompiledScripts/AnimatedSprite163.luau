local l_RunService_0 = game:GetService("RunService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v2 = require(l_ReplicatedStorage_0.Packages.Trove);
local _ = require(l_ReplicatedStorage_0.Packages.Signal);
local v4 = {};
v4.__index = v4;
local v5 = {
    "FPS", 
    "FrameRate"
};
v4.new = function(v6) --[[ Line: 56 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), v4 (copy)
    local v7 = setmetatable({
        _trove = v2.new(), 
        _currentFrame = 0, 
        _timeElapsedSinceLastUpdate = 1e999, 
        _isPlaying = false
    }, v4);
    if v6 then
        v7:LoadNewSpriteSheet(v6);
    end;
    return v7;
end;
v4.newFromAttributes = function(v8) --[[ Line: 76 ]] --[[ Name: newFromAttributes ]]
    -- upvalues: v4 (copy)
    local v9 = v4.BuildSpriteDataFromAttributes(v8);
    return v4.new(v9);
end;
v4.BuildSpriteDataFromAttributes = function(v10) --[[ Line: 84 ]] --[[ Name: BuildSpriteDataFromAttributes ]]
    -- upvalues: v5 (copy)
    return {
        spriteSheet = v10, 
        frameCount = v10:GetAttribute("FrameCount"), 
        frameSize = v10:GetAttribute("FrameSize"), 
        framesPerAxis = v10:GetAttribute("FramesPerAxis"), 
        frameOffset = v10:GetAttribute("FrameOffset"), 
        fps = v10:GetAttribute(v5[1]) or v10:GetAttribute(v5[2]), 
        loops = v10:GetAttribute("Loops")
    };
end;
v4.BuildFromAttributes = function(v11, v12) --[[ Line: 99 ]] --[[ Name: BuildFromAttributes ]]
    -- upvalues: v4 (copy)
    local l_spriteSheet_0 = v11.spriteSheet;
    v12 = v12 or l_spriteSheet_0;
    local v14 = v4.BuildSpriteDataFromAttributes(v12);
    v14.spriteSheet = l_spriteSheet_0;
    v11:LoadNewSpriteSheet(v14);
end;
v4.LoadNewSpriteSheet = function(v15, v16) --[[ Line: 136 ]] --[[ Name: LoadNewSpriteSheet ]]
    v15.spriteSheet = v16.spriteSheet or v15.spriteSheet;
    v15.frameCount = v16.frameCount or v15.frameCount;
    v15.frameSize = v16.frameSize or v15.frameSize;
    v15.framesPerAxis = v16.framesPerAxis or v15.framesPerAxis;
    v15.offset = v16.offset or v15.offset;
    v15.fps = v16.fps or v15.fps or 30;
    if v16.loops == nil and v15.loops == nil then
        v15.loops = true;
        return;
    else
        v15.loops = v16.loops or v15.loops;
        return;
    end;
end;
v4.Play = function(v17) --[[ Line: 152 ]] --[[ Name: Play ]]
    -- upvalues: l_RunService_0 (copy)
    if v17._isPlaying then
        return;
    else
        v17._trove:Clean();
        v17._trove:Add(l_RunService_0.RenderStepped:Connect(function(v18) --[[ Line: 161 ]]
            -- upvalues: v17 (copy)
            v17:_renderSprite(v18);
        end));
        v17._isPlaying = true;
        return;
    end;
end;
v4.Stop = function(v19) --[[ Line: 169 ]] --[[ Name: Stop ]]
    v19._trove:Clean();
    v19._isPlaying = false;
    v19._currentFrame = 0;
end;
v4.Destroy = function(v20) --[[ Line: 176 ]] --[[ Name: Destroy ]]
    v20._trove:Clean();
    table.clear(v20);
end;
v4._renderSprite = function(v21, v22) --[[ Line: 183 ]] --[[ Name: _renderSprite ]]
    if 1 / v21.fps < v21._timeElapsedSinceLastUpdate then
        if v21.loops or v21._currentFrame < v21.frameCount then
            v21:_advanceFrame();
            v21:_updateClippingMask();
        else
            v21:Stop();
        end;
        v21._timeElapsedSinceLastUpdate = 0;
    end;
    v21._timeElapsedSinceLastUpdate = v21._timeElapsedSinceLastUpdate + v22;
end;
v4._advanceFrame = function(v23) --[[ Line: 201 ]] --[[ Name: _advanceFrame ]]
    v23._currentFrame = v23._currentFrame % v23.frameCount + 1;
end;
v4._updateClippingMask = function(v24) --[[ Line: 206 ]] --[[ Name: _updateClippingMask ]]
    local l__currentFrame_0 = v24._currentFrame;
    local l_X_0 = v24.frameSize.X;
    local l_X_1 = v24.framesPerAxis.X;
    local l_Y_0 = v24.frameSize.Y;
    local v29 = l_X_0 * ((l__currentFrame_0 - 1 + l_X_1) % l_X_1);
    local v30 = l_Y_0 * math.floor((l__currentFrame_0 - 1) / l_X_1);
    v24.spriteSheet.ImageRectSize = v24.frameSize;
    v24.spriteSheet.ImageRectOffset = Vector2.new(v29, v30);
end;
return v4;