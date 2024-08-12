AddEventHandler('esx:onPlayerDeath', function ()
    if prNotifyCFG.Debug == true then
        print("[DEBUG] Player dead")
    end
end)

AddEventHandler('playerSpawned', function ()
    if prNotifyCFG.Debug == true then
        print("[DEBUG] Player Spawned")
    end
end)
