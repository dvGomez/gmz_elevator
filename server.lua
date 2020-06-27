local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
local Tools = module("vrp", "lib/Tools")
local cfg = module("gmz_elevator", "Config")

vRPclient = Tunnel.getInterface("vRP")
vRP = Proxy.getInterface("vRP")

func = {}
Tunnel.bindInterface("gmz_elevator", func)

function func.abrirElevador(k, v)
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then

        local menu = { name = k }

        for titulo, info in pairs(v) do
            menu[titulo] = { function(player,choice)
                TriggerClientEvent("usarelevador", source, info.x, info.y, info.z)
                vRP.closeMenu(source)
            end}

            vRP.openMenu(source,menu)
        end
        
    end
end

