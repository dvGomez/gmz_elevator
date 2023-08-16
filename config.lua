Config = {}

Config.elevadores = {

    ["Mansão 3"] = {
        localizacao = {
            ['Apartamento de Luxo'] = {
                x = -286.38397216797,
                y = -722.93280029297,
                z = 125.47330474854
            },
            ['Rua'] = {
                x = -117.3627243042,
                y = -604.69610595703,
                z = 36.280715942383
            }
        },
        permissoes = {'mansao3.permissao'},
        msgs = {
            semPermissao = 'Essa casa não é sua.',
            sucesso = 'Seja, bem-vindo(a) ao seu lar.'
        }
    }
}

return Config
