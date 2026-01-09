local l_Parent_0 = script.Parent.Parent;
if l_Parent_0:FindFirstChild("Promise") then
    return (require(l_Parent_0.Promise));
else
    return nil;
end;