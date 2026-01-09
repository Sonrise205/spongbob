return function(v0, v1, v2, v3) --[[ Line: 6 ]] --[[ Name: getOrCreateAttachment ]]
    local l_v0_FirstChild_0 = v0:FindFirstChild(v1);
    if l_v0_FirstChild_0 then
        return l_v0_FirstChild_0;
    else
        local l_Attachment_0 = Instance.new("Attachment");
        l_Attachment_0.Name = v1;
        if v2 then
            l_Attachment_0.Axis = v2;
        end;
        if v3 then
            l_Attachment_0.SecondaryAxis = v3;
        end;
        l_Attachment_0.Parent = v0;
        return l_Attachment_0;
    end;
end;