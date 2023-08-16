local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
local Tools = module("vrp", "lib/Tools")
local cfg = module("gmz_elevator", "Config")

vRPclient = Tunnel.getInterface("vRP")
vRP = Proxy.getInterface("vRP")

func = {}
Tunnel.bindInterface("gmz_elevator", func)

function func.abrirElevador(k, v, permissoes, mensagens)
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then

        local menu = {
            name = k
        }

        for titulo, info in pairs(v) do
            menu[titulo] = {function(player, choice)

                local hasPermission = false
                if type(permissoes) == "table" then
                    for _, permissao in ipairs(permissoes) do
                        if vRP.hasPermission(user_id, permissao) then
                            hasPermission = true
                            break
                        end
                    end
                else
                    hasPermission = true
                end

                if hasPermission then
                    TriggerClientEvent("usarelevador", source, info.x, info.y, info.z)
                    vRP.closeMenu(source)
                    if type(mensagens) == "table" and mensagens.sucesso then
                        TriggerClientEvent("Notify", source, "sucesso", mensagens.sucesso)
                    end
                else
                    if type(mensagens) == "table" and mensagens.semPermissao then
                        TriggerClientEvent("Notify", source, "negado", mensagens.semPermissao)
                    else
                        TriggerClientEvent("Notify", source, "negado", "Você não possui permissão para entrar aí")
                    end
                end
            end}

            vRP.openMenu(source, menu)
        end

    end
end

