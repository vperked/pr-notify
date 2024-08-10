RegisterServerEvent('onPlayerDeath')
AddEventHandler('onPlayerDeath', function (data)
  function checkConfig()
        if Config.Message == "" then
            print("Nil value!")
            return false
        end
        return true
    end
    if not checkConfig() then return end
    data.victim = source
    if data.killedByPlayer then
        lib.notify({
            title = Config.Message .. "".. GetPlayerName(data.victim) , 
            type = 'success',
            position = 'top',
            icon = 'fa-heart-o',
            iconAnimation = 'pulse',
        })
        print("[DEBUG] Notification Sent.")
    else
    local cOD = GetPedCauseOfDeath(data.victim)
        lib.notify({
            title = Config.Message .." "..  cOD , 
            type = 'success',
            position = 'top',
            icon = 'fa-heart-o',
            iconAnimation = 'pulse',
        })
        print("[DEBUG] Notification Sent.")
    end
end)

RegisterCommand("notify", function (source, args, raw)
    lib.notify({
        title = 'Player Killed',
        description = 'Notification description',
        type = 'success',
        position = 'top'
    })
    print("[DEBUG] Notification Sent.")
end)