local isPlayerDead = false

AddEventHandler('esx:onPlayerDeath', function ()
    isPlayerDead = true
    print("[DEBUG] Player dead")
end)

AddEventHandler('playerSpawned', function ()
    if isPlayerDead == false then
        print("[DEBUG] Player Spawned.")
    end
end)
