local v0 = require(script.Apply);
local v1 = require(script.Diff);
return {
    diffImmutable = v1.diffImmutable, 
    diffMutable = v1.diffMutable, 
    applyImmutable = v0.applyImmutable, 
    applyMutable = v0.applyMutable
};