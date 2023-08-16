local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
local Tools = module("vrp", "lib/Tools")

vRP = Proxy.getInterface("vRP")
func = Tunnel.getInterface("gmz_elevator")

Citizen.CreateThread(function()
    while true do

        Citizen.Wait(1)

        local ped = PlayerPedId()
        local x, y, z = table.unpack(GetEntityCoords(ped))

        for k, v in pairs(Config.elevadores) do
            for n, m in pairs(v.localizacao) do
                local bowz, cdz = GetGroundZFor_3dCoord(m.x, m.y, m.z)
                local distance = GetDistanceBetweenCoords(m.x, m.y, cdz, x, y, z, true)
                if distance <= 1.5 then
                    DrawTxt("~r~[E] ~w~PARA ACESSAR O ELEVADOR")
                    if IsControlJustPressed(1, 38) then
                        if v.msg then
                            func.abrirElevador(k, v.localizacao, v.permissoes, v.msgs)
                        else
                            func.abrirElevador(k, v.localizacao, v.permissoes, nil)
                        end
                    end
                end
            end
        end

    end
end)

RegisterNetEvent("usarelevador")
AddEventHandler("usarelevador", function(x, y, z)
    local ped = PlayerPedId()
    DoScreenFadeOut(1000)
    Citizen.Wait(1000)
    SetEntityCoordsNoOffset(ped, x, y, z, 0, 0, 1)

    DoScreenFadeIn(1000)
end)

function DrawTxt(text)
    SetTextFont(0)
    SetTextProportional(1)
    SetTextScale(0.0, 0.45)
    SetTextDropshadow(1, 0, 0, 0, 255)
    SetTextEdge(1, 0, 0, 0, 255)

    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(0.400, 0.855)
end
