local l_Object_0 = require(script.Parent:WaitForChild("collections")).Object;
local l_makeTimerImpl_0 = require(script:WaitForChild("makeTimerImpl"));
local l_makeIntervalImpl_0 = require(script:WaitForChild("makeIntervalImpl"));
return l_Object_0.assign({}, l_makeTimerImpl_0(task.delay), l_makeIntervalImpl_0(task.delay));