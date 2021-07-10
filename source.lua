Services = setmetatable({},{__index=function(s,r) return game:service(r) end})

if syn or hookmetamethod and getrawmetatable then 
spawn(function()
local OldIndex
OldIndex = hookmetamethod(game, "__index", function(Self, Index)
    return OldIndex(Self, Index)
end)

local OldNewIndex
OldNewIndex = hookmetamethod(game, "__newindex", function(Self, Index, Value)
    return OldNewIndex(Self, Index, Value)
end)

local OldNamecall
OldNamecall = hookmetamethod(game, "__namecall", function(Self, ...)
    return OldNamecall(Self, ...)
end)

local mt = getrawmetatable(game)

local old
old = hookfunction(mt.__namecall, function(...)
   return old(...)
end)

local function get_proxy_game_metatable(x)
 local proxy = {}
  local mt_func_list = {
    
 }
 local proxy_mt = {
    __newindex = function(t,k,v)
       local old
       old = hookmetamethod(game,k,v)
       mt_func_list[k] = old
     end;
      __index = function(t,k)
         return function(...)
             local list_func =  mt_func_list[k]
              local unpack_pcall = {pcall(list_func,...)}
           if unpack_pcall[1] == true then
                 table.remove(unpack_pcall,1)
              return unpack(unpack_pcall)
                end
          end
        end
  }
 return setmetatable(proxy,proxy_mt)
end
--hookfunction(getrawmetatable,get_proxy_game_metatable)
end)
end

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

if syn or hookmetamethod and getrawmetatable then
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
