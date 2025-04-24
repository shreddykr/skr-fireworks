if Config.Core == "ESX" then
    for k, v in pairs(Config.Fireworks) do
        if v.item then
            ESX.RegisterUsableItem(v.item, function(source)
                local xPlayer = ESX.GetPlayerFromId(source)
                if Config.NeedLighter then
                    local isHaveLighter = xPlayer.getInventoryItem(Config.LighterItem).count
                    if isHaveLighter == 0 then
                        return TriggerClientEvent('skr-fireworks:notification', source, Config.Translate['NEED_LIGHTER'], 'error')
                    end
                end
                if v.itemRemovable then
                    xPlayer.removeInventoryItem(v.item, 1)
                end
                TriggerClientEvent('skr-fireworks:startPlacingFirework', source, k)
            end)
        end
    end
elseif Config.Core == "QB-Core" then
    for k, v in pairs(Config.Fireworks) do
        if v.item then
            QBCore.Functions.CreateUseableItem(v.item, function(source, item)
                local Player = QBCore.Functions.GetPlayer(source)
                if Config.NeedLighter then
                    local isHaveLighter = Player.Functions.GetItemByName(Config.LighterItem)
                    if isHaveLighter == nil or isHaveLighter.amount == 0 then 
                        return TriggerClientEvent('skr-fireworks:notification', source, Config.Translate['NEED_LIGHTER'], 'error')
                    end
                end
                if v.itemRemovable then
                    Player.Functions.RemoveItem(v.item, 1, false)
                end
                TriggerClientEvent('skr-fireworks:startPlacingFirework', source, k)
            end)
        end
    end
end

Citizen.CreateThread(function()
    print("\27[32m") -- Green text
    print([[🛸  •    °  • .  🌎　°　• . 🌒 •　.°  •  🚀 
.　•　°  ✯  • .　•　°   • ·  • .  *　°  • . •
★　*  • .　•　°　 🛰 　°·　.　• 🪐   °  • 
▁▂▃▄▅▅▆▆▇▇▇▇▆▆▅▅▄▃▁]])
    print("\27[0m") -- Reset text color
end)
