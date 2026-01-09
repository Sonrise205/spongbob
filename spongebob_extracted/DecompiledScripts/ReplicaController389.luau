local v0 = {
    RequestDataRepeat = 10, 
    SetterError = "[ReplicaController]: Replica setters can only be called inside write functions"
};
local v1 = nil;
local l_RunService_0 = game:GetService("RunService");
local l_l_RunService_0_0 = l_RunService_0 --[[ copy: 2 -> 35 ]];
local function v11(v4, v5, v6) --[[ Line: 127 ]] --[[ Name: WaitForDescendant ]]
    -- upvalues: l_l_RunService_0_0 (copy)
    local l_v4_FirstChild_0 = v4:FindFirstChild(v5, true);
    if l_v4_FirstChild_0 == nil then
        local v8 = os.clock();
        local v9 = nil;
        v9 = v4.DescendantAdded:Connect(function(v10) --[[ Line: 132 ]]
            -- upvalues: v5 (copy), l_v4_FirstChild_0 (ref)
            if v10.Name == v5 then
                l_v4_FirstChild_0 = v10;
            end;
        end);
        while l_v4_FirstChild_0 == nil do
            if v8 ~= nil and os.clock() - v8 > 1 and (l_l_RunService_0_0:IsServer() == true or game:IsLoaded() == true) then
                v8 = nil;
                warn("[" .. script.Name .. "]: Missing " .. v6 .. " \"" .. v5 .. "\" in " .. v4:GetFullName() .. "; Please check setup documentation");
            end;
            task.wait();
        end;
        v9:Disconnect();
        return l_v4_FirstChild_0;
    else
        return l_v4_FirstChild_0;
    end;
end;
local v12 = nil;
if l_RunService_0:IsServer() == true then
    v12 = Instance.new("Folder");
    v12.Name = "ReplicaRemoteEvents";
    v12.Parent = game:GetService("ReplicatedStorage");
else
    v12 = v11(game:GetService("ReplicatedStorage"), "ReplicaRemoteEvents", "folder");
end;
local l_v11_0 = v11 --[[ copy: 3 -> 36 ]];
local l_l_RunService_0_1 = l_RunService_0 --[[ copy: 2 -> 37 ]];
do
    local l_v12_0 = v12;
    v1 = {
        GetShared = function(_, v17) --[[ Line: 163 ]] --[[ Name: GetShared ]]
            -- upvalues: l_v11_0 (copy)
            return (l_v11_0(game:GetService("ReplicatedStorage"), v17, "module"));
        end, 
        GetModule = function(_, v19) --[[ Line: 167 ]] --[[ Name: GetModule ]]
            -- upvalues: l_v11_0 (copy)
            return (l_v11_0(game:GetService("ServerScriptService"), v19, "module"));
        end, 
        SetupRemoteEvent = function(v20) --[[ Line: 170 ]] --[[ Name: SetupRemoteEvent ]]
            -- upvalues: l_l_RunService_0_1 (copy), l_v12_0 (ref), l_v11_0 (copy)
            if l_l_RunService_0_1:IsServer() == true then
                local l_RemoteEvent_0 = Instance.new("RemoteEvent");
                l_RemoteEvent_0.Name = v20;
                l_RemoteEvent_0.Parent = l_v12_0;
                return l_RemoteEvent_0;
            else
                return (l_v11_0(l_v12_0, v20, "remote event"));
            end;
        end, 
        Shared = {}
    };
    local v22 = require(v1.GetShared("Madwork", "MadworkScriptSignal"));
    v1.NewScriptSignal = v22.NewScriptSignal;
    v1.NewArrayScriptConnection = v22.NewArrayScriptConnection;
end;
l_RunService_0 = {
    ReplicaClasses = {}, 
    NewReplicaSignal = v1.NewScriptSignal(), 
    InitialDataReceivedSignal = v1.NewScriptSignal(), 
    InitialDataReceived = false, 
    _replicas = {}, 
    _class_listeners = {}, 
    _child_listeners = {}
};
v11 = require(v1.GetShared("Madwork", "MadworkMaid"));
v12 = nil;
local l__replicas_0 = l_RunService_0._replicas;
local l_NewReplicaSignal_0 = l_RunService_0.NewReplicaSignal;
local l__class_listeners_0 = l_RunService_0._class_listeners;
local l__child_listeners_0 = l_RunService_0._child_listeners;
local v27 = v1.SetupRemoteEvent("Replica_ReplicaRequestData");
local v28 = v1.SetupRemoteEvent("Replica_ReplicaSetValue");
local v29 = v1.SetupRemoteEvent("Replica_ReplicaSetValues");
local v30 = v1.SetupRemoteEvent("Replica_ReplicaArrayInsert");
local v31 = v1.SetupRemoteEvent("Replica_ReplicaArraySet");
local v32 = v1.SetupRemoteEvent("Replica_ReplicaArrayRemove");
local v33 = v1.SetupRemoteEvent("Replica_ReplicaWrite");
local v34 = v1.SetupRemoteEvent("Replica_ReplicaSignal");
local v35 = v1.SetupRemoteEvent("Replica_ReplicaSetParent");
local v36 = v1.SetupRemoteEvent("Replica_ReplicaCreate");
local v37 = v1.SetupRemoteEvent("Replica_ReplicaDestroy");
local v38 = false;
local v39 = {};
local v40 = false;
local function v41(v42, v43, v44) --[[ Line: 301 ]] --[[ Name: GetWriteLibFunctionsRecursive ]]
    -- upvalues: v41 (copy)
    for v45, v46 in pairs(v43) do
        if type(v46) == "table" then
            v41(v42, v46, v44 .. v45 .. ".");
        elseif type(v46) == "function" then
            table.insert(v42, {
                v44 .. v45, 
                v46
            });
        else
            error("[ReplicaController]: Invalid write function value \"" .. tostring(v46) .. "\" (" .. typeof(v46) .. "); name_stack = \"" .. v44 .. "\"");
        end;
    end;
end;
local function v58(v47) --[[ Line: 313 ]] --[[ Name: LoadWriteLib ]]
    -- upvalues: v39 (copy), v41 (copy)
    local v48 = v39[v47];
    if v48 ~= nil then
        return v48;
    else
        local v49 = require(v47);
        local v50 = {};
        v41(v50, v49, "");
        table.sort(v50, function(v51, v52) --[[ Line: 324 ]]
            return v51[1] < v52[1];
        end);
        local v53 = {};
        local v54 = {};
        for v55, v56 in ipairs(v50) do
            v53[v55] = v56[2];
            v54[v56[1]] = v55;
        end;
        local v57 = {
            v53, 
            v54
        };
        v39[v47] = v57;
        return v57;
    end;
end;
local function v62(v59) --[[ Line: 343 ]] --[[ Name: StringPathToArray ]]
    local v60 = {};
    if v59 ~= "" then
        for v61 in string.gmatch(v59, "[^%.]+") do
            table.insert(v60, v61);
        end;
    end;
    return v60;
end;
local function v63(v64, v65) --[[ Line: 353 ]] --[[ Name: DestroyReplicaAndDescendantsRecursive ]]
    -- upvalues: v63 (copy), l__replicas_0 (copy), l_RunService_0 (copy), l__child_listeners_0 (copy)
    for _, v67 in ipairs(v64.Children) do
        v63(v67, true);
    end;
    local l_Id_0 = v64.Id;
    l__replicas_0[l_Id_0] = nil;
    l_RunService_0.ReplicaClasses[v64.Class] = nil;
    v64._maid:Cleanup();
    if v65 ~= true and v64.Parent ~= nil then
        local l_Children_0 = v64.Parent.Children;
        table.remove(l_Children_0, table.find(l_Children_0, v64));
    end;
    l__child_listeners_0[l_Id_0] = nil;
end;
local function v77(v70, v71, v72) --[[ Line: 377 ]] --[[ Name: CreateTableListenerPathIndex ]]
    local l__table_listeners_0 = v70._table_listeners;
    for v74 = 1, #v71 do
        local v75 = l__table_listeners_0[1][v71[v74]];
        if v75 == nil then
            v75 = {
                [1] = {}
            };
            l__table_listeners_0[1][v71[v74]] = v75;
        end;
        l__table_listeners_0 = v75;
    end;
    local v76 = l__table_listeners_0[v72];
    if v76 == nil then
        v76 = {};
        l__table_listeners_0[v72] = v76;
    end;
    return v76;
end;
local function v87(v78) --[[ Line: 398 ]] --[[ Name: CleanTableListenerTable ]]
    local v79 = v78[1];
    local v80 = v78[2];
    local l_v79_0 = v79;
    local v82 = {
        l_v79_0
    };
    for v83 = 1, #v80 do
        l_v79_0 = l_v79_0[1][v80[v83]];
        table.insert(v82, l_v79_0);
    end;
    for v84 = #v82, 2, -1 do
        local v85 = v82[v84];
        if next(v85[1]) ~= nil then
            return;
        else
            for v86 = 2, 6 do
                if v85[v86] ~= nil and #v85[v86] > 0 then
                    return;
                end;
            end;
            v82[v84 - 1][1][v80[v84 - 1]] = nil;
        end;
    end;
end;
local function v115(v88, v89) --[[ Line: 423 ]] --[[ Name: CreateReplicaBranch ]]
    -- upvalues: l__replicas_0 (copy), v58 (copy), v11 (copy), v12 (ref), l_RunService_0 (copy)
    local v90 = {};
    for v91, v92 in pairs(v88) do
        v92[6] = tonumber(v91);
        table.insert(v90, v92);
    end;
    table.sort(v90, function(v93, v94) --[[ Line: 431 ]]
        return v93[6] < v94[6];
    end);
    local v95 = {};
    v89 = v89 or {};
    for _, v97 in ipairs(v90) do
        local v98 = v97[6];
        local v99 = v97[4];
        local v100 = nil;
        local v101 = false;
        if v99 ~= 0 then
            v100 = l__replicas_0[v99];
            if v100 == nil then
                v101 = true;
            end;
        end;
        local v102 = nil;
        local v103 = nil;
        if v97[5] ~= nil then
            local v104 = v58(v97[5]);
            v102 = v104[1];
            v103 = v104[2];
        end;
        local v105 = {
            Data = v97[3], 
            Id = v98, 
            Class = v97[1], 
            Tags = v97[2], 
            Parent = v100, 
            Children = {}, 
            _write_lib = v102, 
            _write_lib_dictionary = v103, 
            _table_listeners = {
                [1] = {}
            }, 
            _function_listeners = {}, 
            _raw_listeners = {}, 
            _signal_listeners = {}, 
            _maid = v11.NewMaid()
        };
        setmetatable(v105, v12);
        if v100 ~= nil then
            table.insert(v100.Children, v105);
        elseif v101 == true then
            local v106 = v95[v99];
            if v106 == nil then
                v106 = {};
                v95[v99] = v106;
            end;
            table.insert(v106, v105);
        end;
        l__replicas_0[v98] = v105;
        l_RunService_0.ReplicaClasses[v105.Class] = v105;
        table.insert(v89, v105);
        local v107 = v95[v98];
        if v107 ~= nil then
            v95[v98] = nil;
            for _, v109 in ipairs(v107) do
                v109.Parent = v105;
                table.insert(v105.Children, v109);
            end;
        end;
    end;
    if next(v95) ~= nil then
        local v110 = "[ReplicaService]: BRANCH REPLICATION ERROR - Missing parents: ";
        for v111, v112 in pairs(v95) do
            v110 = v110 .. "[" .. tostring(v111) .. "]: {";
            for v113, v114 in ipairs(v112) do
                v110 = v110 .. (v113 == 1 and "" or ", ") .. v114:Identify();
            end;
            v110 = v110 .. "}; ";
        end;
        error(v110);
    end;
    return v89;
end;
local function v131(v116, v117, v118) --[[ Line: 519 ]] --[[ Name: ReplicaSetValue ]]
    -- upvalues: l__replicas_0 (copy)
    local v119 = l__replicas_0[v116];
    local l_Data_0 = v119.Data;
    local l__table_listeners_1 = v119._table_listeners;
    for v122 = 1, #v117 - 1 do
        l_Data_0 = l_Data_0[v117[v122]];
        if l__table_listeners_1 ~= nil then
            l__table_listeners_1 = l__table_listeners_1[1][v117[v122]];
        end;
    end;
    local v123 = v117[#v117];
    local v124 = l_Data_0[v123];
    l_Data_0[v123] = v118;
    if v124 ~= v118 and l__table_listeners_1 ~= nil then
        if v124 == nil and l__table_listeners_1[3] ~= nil then
            for _, v126 in ipairs(l__table_listeners_1[3]) do
                v126(v118, v123);
            end;
        end;
        l__table_listeners_1 = l__table_listeners_1[1][v117[#v117]];
        if l__table_listeners_1 ~= nil and l__table_listeners_1[2] ~= nil then
            for _, v128 in ipairs(l__table_listeners_1[2]) do
                v128(v118, v124);
            end;
        end;
    end;
    for _, v130 in ipairs(v119._raw_listeners) do
        v130("SetValue", v117, v118);
    end;
end;
local function v149(v132, v133, v134) --[[ Line: 558 ]] --[[ Name: ReplicaSetValues ]]
    -- upvalues: l__replicas_0 (copy)
    local v135 = l__replicas_0[v132];
    local l_Data_1 = v135.Data;
    local l__table_listeners_2 = v135._table_listeners;
    for v138 = 1, #v133 do
        l_Data_1 = l_Data_1[v133[v138]];
        if l__table_listeners_2 ~= nil then
            l__table_listeners_2 = l__table_listeners_2[1][v133[v138]];
        end;
    end;
    for v139, v140 in pairs(v134) do
        local v141 = l_Data_1[v139];
        l_Data_1[v139] = v140;
        if v141 ~= v140 and l__table_listeners_2 ~= nil then
            if v141 == nil and l__table_listeners_2[3] ~= nil then
                for _, v143 in ipairs(l__table_listeners_2[3]) do
                    v143(v140, v139);
                end;
            end;
            local v144 = l__table_listeners_2[1][v139];
            if v144 ~= nil and v144[2] ~= nil then
                for _, v146 in ipairs(v144[2]) do
                    v146(v140, v141);
                end;
            end;
        end;
    end;
    for _, v148 in ipairs(v135._raw_listeners) do
        v148("SetValues", v133, v134);
    end;
end;
local function v162(v150, v151, v152) --[[ Line: 599 ]] --[[ Name: ReplicaArrayInsert ]]
    -- upvalues: l__replicas_0 (copy)
    local v153 = l__replicas_0[v150];
    local l_Data_2 = v153.Data;
    local l__table_listeners_3 = v153._table_listeners;
    for v156 = 1, #v151 do
        l_Data_2 = l_Data_2[v151[v156]];
        if l__table_listeners_3 ~= nil then
            l__table_listeners_3 = l__table_listeners_3[1][v151[v156]];
        end;
    end;
    table.insert(l_Data_2, v152);
    local v157 = #l_Data_2;
    if l__table_listeners_3 ~= nil and l__table_listeners_3[4] ~= nil then
        for _, v159 in ipairs(l__table_listeners_3[4]) do
            v159(v157, v152);
        end;
    end;
    for _, v161 in ipairs(v153._raw_listeners) do
        v161("ArrayInsert", v151, v152, v157);
    end;
    return v157;
end;
local function v175(v163, v164, v165, v166) --[[ Line: 628 ]] --[[ Name: ReplicaArraySet ]]
    -- upvalues: l__replicas_0 (copy)
    local v167 = l__replicas_0[v163];
    local l_Data_3 = v167.Data;
    local l__table_listeners_4 = v167._table_listeners;
    for v170 = 1, #v164 do
        l_Data_3 = l_Data_3[v164[v170]];
        if l__table_listeners_4 ~= nil then
            l__table_listeners_4 = l__table_listeners_4[1][v164[v170]];
        end;
    end;
    l_Data_3[v165] = v166;
    if l__table_listeners_4 ~= nil and l__table_listeners_4[5] ~= nil then
        for _, v172 in ipairs(l__table_listeners_4[5]) do
            v172(v165, v166);
        end;
    end;
    for _, v174 in ipairs(v167._raw_listeners) do
        v174("ArraySet", v164, v165, v166);
    end;
end;
local function v188(v176, v177, v178) --[[ Line: 655 ]] --[[ Name: ReplicaArrayRemove ]]
    -- upvalues: l__replicas_0 (copy)
    local v179 = l__replicas_0[v176];
    local l_Data_4 = v179.Data;
    local l__table_listeners_5 = v179._table_listeners;
    for v182 = 1, #v177 do
        l_Data_4 = l_Data_4[v177[v182]];
        if l__table_listeners_5 ~= nil then
            l__table_listeners_5 = l__table_listeners_5[1][v177[v182]];
        end;
    end;
    local v183 = table.remove(l_Data_4, v178);
    if l__table_listeners_5 ~= nil and l__table_listeners_5[6] ~= nil then
        for _, v185 in ipairs(l__table_listeners_5[6]) do
            v185(v178, v183);
        end;
    end;
    for _, v187 in ipairs(v179._raw_listeners) do
        v187("ArrayRemove", v177, v178, v183);
    end;
    return v183;
end;
v12 = {};
v12.__index = v12;
v12.ListenToChange = function(v189, v190, v191) --[[ Line: 691 ]] --[[ Name: ListenToChange ]]
    -- upvalues: v62 (copy), v77 (copy), v1 (ref), v87 (copy)
    if type(v191) ~= "function" then
        error("[ReplicaController]: Only a function can be set as listener in Replica:ListenToChange()");
    end;
    local v192 = type(v190) == "string" and v62(v190) or v190;
    if #v192 < 1 then
        error("[ReplicaController]: Passed empty path - a value key must be specified");
    end;
    local v193 = v77(v189, v192, 2);
    table.insert(v193, v191);
    return v1.NewArrayScriptConnection(v193, v191, v87, {
        v189._table_listeners, 
        v192
    });
end;
v12.ListenToNewKey = function(v194, v195, v196) --[[ Line: 707 ]] --[[ Name: ListenToNewKey ]]
    -- upvalues: v62 (copy), v77 (copy), v1 (ref), v87 (copy)
    if type(v196) ~= "function" then
        error("[ReplicaController]: Only a function can be set as listener in Replica:ListenToNewKey()");
    end;
    local v197 = type(v195) == "string" and v62(v195) or v195;
    local v198 = v77(v194, v197, 3);
    table.insert(v198, v196);
    if #v197 == 0 then
        return v1.NewArrayScriptConnection(v198, v196);
    else
        return v1.NewArrayScriptConnection(v198, v196, v87, {
            v194._table_listeners, 
            v197
        });
    end;
end;
v12.ListenToArrayInsert = function(v199, v200, v201) --[[ Line: 724 ]] --[[ Name: ListenToArrayInsert ]]
    -- upvalues: v62 (copy), v77 (copy), v1 (ref), v87 (copy)
    if type(v201) ~= "function" then
        error("[ReplicaController]: Only a function can be set as listener in Replica:ListenToArrayInsert()");
    end;
    local v202 = type(v200) == "string" and v62(v200) or v200;
    local v203 = v77(v199, v202, 4);
    table.insert(v203, v201);
    if #v202 == 0 then
        return v1.NewArrayScriptConnection(v203, v201);
    else
        return v1.NewArrayScriptConnection(v203, v201, v87, {
            v199._table_listeners, 
            v202
        });
    end;
end;
v12.ListenToArraySet = function(v204, v205, v206) --[[ Line: 741 ]] --[[ Name: ListenToArraySet ]]
    -- upvalues: v62 (copy), v77 (copy), v1 (ref), v87 (copy)
    if type(v206) ~= "function" then
        error("[ReplicaController]: Only a function can be set as listener in Replica:ListenToArraySet()");
    end;
    local v207 = type(v205) == "string" and v62(v205) or v205;
    local v208 = v77(v204, v207, 5);
    table.insert(v208, v206);
    if #v207 == 0 then
        return v1.NewArrayScriptConnection(v208, v206);
    else
        return v1.NewArrayScriptConnection(v208, v206, v87, {
            v204._table_listeners, 
            v207
        });
    end;
end;
v12.ListenToArrayRemove = function(v209, v210, v211) --[[ Line: 758 ]] --[[ Name: ListenToArrayRemove ]]
    -- upvalues: v62 (copy), v77 (copy), v1 (ref), v87 (copy)
    if type(v211) ~= "function" then
        error("[ReplicaController]: Only a function can be set as listener in Replica:ListenToArrayRemove()");
    end;
    local v212 = type(v210) == "string" and v62(v210) or v210;
    local v213 = v77(v209, v212, 6);
    table.insert(v213, v211);
    if #v212 == 0 then
        return v1.NewArrayScriptConnection(v213, v211);
    else
        return v1.NewArrayScriptConnection(v213, v211, v87, {
            v209._table_listeners, 
            v212
        });
    end;
end;
v12.ListenToWrite = function(v214, v215, v216) --[[ Line: 775 ]] --[[ Name: ListenToWrite ]]
    -- upvalues: v1 (ref)
    if type(v216) ~= "function" then
        error("[ReplicaController]: Only a function can be set as listener in Replica:ListenToWrite()");
    end;
    if v214._write_lib == nil then
        error("[ReplicaController]: _write_lib was not declared for this replica");
    end;
    local v217 = v214._write_lib_dictionary[v215];
    if v217 == nil then
        error("[ReplicaController]: Write function \"" .. v215 .. "\" not declared inside _write_lib of this replica");
    end;
    local v218 = v214._function_listeners[v217];
    if v218 == nil then
        v218 = {};
        v214._function_listeners[v217] = v218;
    end;
    table.insert(v218, v216);
    return v1.NewArrayScriptConnection(v218, v216);
end;
v12.ListenToRaw = function(v219, v220) --[[ Line: 799 ]] --[[ Name: ListenToRaw ]]
    -- upvalues: v1 (ref)
    local l__raw_listeners_0 = v219._raw_listeners;
    table.insert(l__raw_listeners_0, v220);
    return v1.NewArrayScriptConnection(l__raw_listeners_0, v220);
end;
v12.ConnectOnClientEvent = function(v222, v223) --[[ Line: 806 ]] --[[ Name: ConnectOnClientEvent ]]
    -- upvalues: v1 (ref)
    if type(v223) ~= "function" then
        error("[ReplicaController]: Only functions can be passed to Replica:ConnectOnClientEvent()");
    end;
    table.insert(v222._signal_listeners, v223);
    return v1.NewArrayScriptConnection(v222._signal_listeners, v223);
end;
v12.FireServer = function(v224, ...) --[[ Line: 814 ]] --[[ Name: FireServer ]]
    -- upvalues: v34 (copy)
    v34:FireServer(v224.Id, ...);
end;
v12.ListenToChildAdded = function(v225, v226) --[[ Line: 819 ]] --[[ Name: ListenToChildAdded ]]
    -- upvalues: l__replicas_0 (copy), l__child_listeners_0 (copy), v1 (ref)
    if type(v226) ~= "function" then
        error("[ReplicaController]: Only a function can be set as listener");
    end;
    if l__replicas_0[v225.Id] == nil then
        return;
    else
        local v227 = l__child_listeners_0[v225.Id];
        if v227 == nil then
            v227 = {};
            l__child_listeners_0[v225.Id] = v227;
        end;
        table.insert(v227, v226);
        return v1.NewArrayScriptConnection(v227, v226);
    end;
end;
v12.FindFirstChildOfClass = function(v228, v229) --[[ Line: 837 ]] --[[ Name: FindFirstChildOfClass ]]
    for _, v231 in ipairs(v228.Children) do
        if v231.Class == v229 then
            return v231;
        end;
    end;
    return nil;
end;
v12.Identify = function(v232) --[[ Line: 847 ]] --[[ Name: Identify ]]
    local v233 = "";
    for v234, v235 in pairs(v232.Tags) do
        v233 = v233 .. "" .. tostring(v234) .. "=" .. tostring(v235);
    end;
    return "[Id:" .. tostring(v232.Id) .. ";Class:" .. v232.Class .. ";Tags:{" .. v233 .. "}]";
end;
v12.IsActive = function(v236) --[[ Line: 858 ]] --[[ Name: IsActive ]]
    -- upvalues: l__replicas_0 (copy)
    return l__replicas_0[v236.Id] ~= nil;
end;
v12.AddCleanupTask = function(v237, v238) --[[ Line: 862 ]] --[[ Name: AddCleanupTask ]]
    return v237._maid:AddCleanupTask(v238);
end;
v12.RemoveCleanupTask = function(v239, v240) --[[ Line: 866 ]] --[[ Name: RemoveCleanupTask ]]
    v239._maid:RemoveCleanupTask(v240);
end;
v12.SetValue = function(v241, v242, v243) --[[ Line: 872 ]] --[[ Name: SetValue ]]
    -- upvalues: v40 (ref), v0 (copy), v62 (copy), v131 (copy)
    if v40 == false then
        error(v0.SetterError);
    end;
    local v244 = type(v242) == "string" and v62(v242) or v242;
    v131(v241.Id, v244, v243);
end;
v12.SetValues = function(v245, v246, v247) --[[ Line: 880 ]] --[[ Name: SetValues ]]
    -- upvalues: v40 (ref), v0 (copy), v62 (copy), v149 (copy)
    if v40 == false then
        error(v0.SetterError);
    end;
    local v248 = type(v246) == "string" and v62(v246) or v246;
    v149(v245.Id, v248, v247);
end;
v12.ArrayInsert = function(v249, v250, v251) --[[ Line: 888 ]] --[[ Name: ArrayInsert ]]
    -- upvalues: v40 (ref), v0 (copy), v62 (copy), v162 (copy)
    if v40 == false then
        error(v0.SetterError);
    end;
    local v252 = type(v250) == "string" and v62(v250) or v250;
    return (v162(v249.Id, v252, v251));
end;
v12.ArraySet = function(v253, v254, v255, v256) --[[ Line: 896 ]] --[[ Name: ArraySet ]]
    -- upvalues: v40 (ref), v0 (copy), v62 (copy), v175 (copy)
    if v40 == false then
        error(v0.SetterError);
    end;
    local v257 = type(v254) == "string" and v62(v254) or v254;
    v175(v253.Id, v257, v255, v256);
end;
v12.ArrayRemove = function(v258, v259, v260) --[[ Line: 904 ]] --[[ Name: ArrayRemove ]]
    -- upvalues: v40 (ref), v0 (copy), v62 (copy), v188 (copy)
    if v40 == false then
        error(v0.SetterError);
    end;
    local v261 = type(v259) == "string" and v62(v259) or v259;
    return (v188(v258.Id, v261, v260));
end;
v12.Write = function(v262, v263, ...) --[[ Line: 912 ]] --[[ Name: Write ]]
    -- upvalues: v40 (ref), v0 (copy)
    if v40 == false then
        error(v0.SetterError);
    end;
    local v264 = v262._write_lib_dictionary[v263];
    local v265 = table.pack(v262._write_lib[v264](v262, ...));
    local v266 = v262._function_listeners[v264];
    if v266 ~= nil then
        for _, v268 in ipairs(v266) do
            v268(...);
        end;
    end;
    return table.unpack(v265);
end;
l_RunService_0.RequestData = function() --[[ Line: 930 ]] --[[ Name: RequestData ]]
    -- upvalues: v38 (ref), v27 (copy), v0 (copy), l_RunService_0 (copy)
    if v38 == true then
        return;
    else
        v38 = true;
        task.spawn(function() --[[ Line: 935 ]]
            -- upvalues: v27 (ref), v0 (ref), l_RunService_0 (ref)
            while game:IsLoaded() == false do
                task.wait();
            end;
            v27:FireServer();
            while task.wait(v0.RequestDataRepeat) and l_RunService_0.InitialDataReceived ~= true do
                v27:FireServer();
            end;
        end);
        return;
    end;
end;
l_RunService_0.ReplicaOfClassCreated = function(v269, v270) --[[ Line: 949 ]] --[[ Name: ReplicaOfClassCreated ]]
    -- upvalues: l__class_listeners_0 (copy), v1 (ref)
    if type(v269) ~= "string" then
        error("[ReplicaController]: replica_class must be a string");
    end;
    if type(v270) ~= "function" then
        error("[ReplicaController]: Only a function can be set as listener in ReplicaController.ReplicaOfClassCreated()");
    end;
    local v271 = l__class_listeners_0[v269];
    if v271 == nil then
        v271 = v1.NewScriptSignal();
        l__class_listeners_0[v269] = v271;
    end;
    return v271:Connect(v270, function() --[[ Line: 962 ]]
        -- upvalues: v271 (ref), l__class_listeners_0 (ref), v269 (copy)
        if v271:GetListenerCount() == 0 and l__class_listeners_0[v269] == v271 then
            l__class_listeners_0[v269] = nil;
        end;
    end);
end;
l_RunService_0.GetReplicaById = function(v272) --[[ Line: 970 ]] --[[ Name: GetReplicaById ]]
    -- upvalues: l__replicas_0 (copy)
    return l__replicas_0[v272];
end;
v27.OnClientEvent:Connect(function() --[[ Line: 977 ]]
    -- upvalues: l_RunService_0 (copy)
    l_RunService_0.InitialDataReceived = true;
    print("[ReplicaController]: Initial data received");
    l_RunService_0.InitialDataReceivedSignal:Fire();
end);
v28.OnClientEvent:Connect(v131);
v29.OnClientEvent:Connect(v149);
v30.OnClientEvent:Connect(v162);
v31.OnClientEvent:Connect(v175);
v32.OnClientEvent:Connect(v188);
v33.OnClientEvent:Connect(function(v273, v274, ...) --[[ Line: 994 ]]
    -- upvalues: l__replicas_0 (copy), v40 (ref)
    local v275 = l__replicas_0[v273];
    v40 = true;
    v275._write_lib[v274](v275, ...);
    v40 = false;
    local v276 = v275._function_listeners[v274];
    if v276 ~= nil then
        for _, v278 in ipairs(v276) do
            v278(...);
        end;
    end;
end);
v34.OnClientEvent:Connect(function(v279, ...) --[[ Line: 1010 ]]
    -- upvalues: l__replicas_0 (copy)
    local l__signal_listeners_0 = l__replicas_0[v279]._signal_listeners;
    for _, v282 in ipairs(l__signal_listeners_0) do
        v282(...);
    end;
end);
v35.OnClientEvent:Connect(function(v283, v284) --[[ Line: 1020 ]]
    -- upvalues: l__replicas_0 (copy), l__child_listeners_0 (copy)
    local v285 = l__replicas_0[v283];
    local l_Children_1 = v285.Parent.Children;
    local v287 = l__replicas_0[v284];
    table.remove(l_Children_1, table.find(l_Children_1, v285));
    table.insert(v287.Children, v285);
    v285.Parent = v287;
    local v288 = l__child_listeners_0[v284];
    if v288 ~= nil then
        for v289 = 1, #v288 do
            v288[v289](v285);
        end;
    end;
end);
v36.OnClientEvent:Connect(function(v290, v291) --[[ Line: 1037 ]]
    -- upvalues: v115 (copy), l__child_listeners_0 (copy), l_NewReplicaSignal_0 (copy), l__class_listeners_0 (copy)
    local v292 = {};
    if type(v290) == "table" then
        table.sort(v290, function(v293, v294) --[[ Line: 1051 ]]
            return v293[1] < v294[1];
        end);
        for _, v296 in ipairs(v290) do
            v115(v296[2], v292);
        end;
    elseif v291[1] ~= nil then
        v115({
            [tostring(v290)] = v291
        }, v292);
    else
        v115(v291, v292);
    end;
    table.sort(v292, function(v297, v298) --[[ Line: 1063 ]]
        return v297.Id < v298.Id;
    end);
    for _, v300 in ipairs(v292) do
        local l_Parent_0 = v300.Parent;
        if l_Parent_0 ~= nil then
            local v302 = l__child_listeners_0[l_Parent_0.Id];
            if v302 ~= nil then
                for v303 = 1, #v302 do
                    v302[v303](v300);
                end;
            end;
        end;
    end;
    for _, v305 in ipairs(v292) do
        l_NewReplicaSignal_0:Fire(v305);
        local v306 = l__class_listeners_0[v305.Class];
        if v306 ~= nil then
            v306:Fire(v305);
        end;
    end;
end);
v37.OnClientEvent:Connect(function(v307) --[[ Line: 1089 ]]
    -- upvalues: l__replicas_0 (copy), v63 (copy)
    local v308 = l__replicas_0[v307];
    v63(v308);
end);
return l_RunService_0;