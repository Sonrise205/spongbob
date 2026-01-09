local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = require(l_ReplicatedStorage_0.Shared.Types);
return {
    REWARDS = {
        [1] = {
            time = 300
        }, 
        [2] = {
            time = 600
        }, 
        [3] = {
            time = 900
        }, 
        [4] = {
            time = 1200
        }, 
        [5] = {
            time = 1800, 
            dropChanceBoost = 5
        }, 
        [6] = {
            time = 2700, 
            dropChanceBoost = 5
        }, 
        [7] = {
            time = 3600, 
            dropChanceBoost = 5
        }, 
        [8] = {
            time = 7200, 
            dropChanceBoost = 20
        }, 
        [9] = {
            time = 10800, 
            dropChanceBoost = 20
        }
    }, 
    PLAYTIME_SESSION_BUFFER = 600, 
    PLAYTIME_SAVE_INTERVAL = 10, 
    TIMER_INTERVAL = 1
};