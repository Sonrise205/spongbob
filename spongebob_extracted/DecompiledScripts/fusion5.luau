local _ = require(script.PubTypes);
return (require(script.Utility.restrictRead)("Fusion", {
    version = {
        major = 0, 
        minor = 2, 
        isRelease = true
    }, 
    New = require(script.Instances.New), 
    Hydrate = require(script.Instances.Hydrate), 
    Ref = require(script.Instances.Ref), 
    Out = require(script.Instances.Out), 
    Cleanup = require(script.Instances.Cleanup), 
    Children = require(script.Instances.Children), 
    OnEvent = require(script.Instances.OnEvent), 
    OnChange = require(script.Instances.OnChange), 
    Value = require(script.State.Value), 
    Computed = require(script.State.Computed), 
    ForPairs = require(script.State.ForPairs), 
    ForKeys = require(script.State.ForKeys), 
    ForValues = require(script.State.ForValues), 
    Observer = require(script.State.Observer), 
    Tween = require(script.Animation.Tween), 
    Spring = require(script.Animation.Spring), 
    cleanup = require(script.Utility.cleanup), 
    doNothing = require(script.Utility.doNothing)
}));