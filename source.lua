pcall(function()
if identifyexecutor() == "ScriptWare" then
local function decomp(a)
    return tostring(disassemble(a))
end

getgenv().decompile = decomp
end
end)


local cloneref = cloneref or function(ref)
    return ref
end

local CoreGui = cloneref(game:GetService("CoreGui"))
local InsertService = cloneref(game:GetService("InsertService"))

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
