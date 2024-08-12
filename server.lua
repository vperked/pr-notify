if not prNotifyCFG then
    print("[ERROR] Could not load prNotifyCFG!")
else
    print("[DEBUG] prNotifyCFG Loaded Successfully.")
end


RegisterServerEvent('esx:onPlayerDeath')
AddEventHandler('esx:onPlayerDeath', function (data)
  function checkConfig()
        if prNotifyCFG.Message == "" then
            print("Nil value!")
            return false
        end
        return true
    end
    if not checkConfig() then return end
    data.victim = source
    if data.killedByPlayer then
        lib.notify(source{
            title = prNotifyCFG.Message .. "".. GetPlayerName(data.victim) , 
            type = 'success',
            position =  prNotifyCFG.Display,
            icon = 'fa-heart-o',
            iconAnimation = 'pulse',
        })
        if prNotifyCFG.Debug == true then
        print(debugMessages[3])
        end
    else

        lib.notify({
            title = "test",
            type = 'success',
            position =  prNotifyCFG.Display,
            icon = 'fa-heart-o',
            iconAnimation = 'pulse',
        })
        if prNotifyCFG.Debug == true then
        print(debugMessages[2])
        end
    end 
end)
if not prNotifyCFG then
    print("Couldnt get CFG!")
end
RegisterCommand("notify", function (source, args, raw)
    lib.notify(source{
        title = 'Player Killed',
        description = 'Notification description',
        type = 'success',
        position =  prNotifyCFG.Display,
    })
    if prNotifyCFG.Debug == true then
        print(debugMessages[1])
        end
end)

function debugMode()
    if prNotifyCFG.Debug == true then
    print("[Pr-Notify] Debug Enabled.")   
    debugMessages = {"[DEBUG] Test notify Sent.",  "[DEBUG] Killed by random sent.", "[DEBUG] Killed by player Sent.", "[DEBUG] Player Revived."}
    end
end
debugMode()
RegisterServerEvent("deathscreen:revive")
    AddEventHandler("deathscreen:revive", function ()
        if prNotifyCFG.Debug == true then
            print(debugMessages[4])
        end
    end)
