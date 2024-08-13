if not prNotifyCFG then
    print("[ERROR] Could not load prNotifyCFG!")
else
    print("[DEBUG] prNotifyCFG Loaded Successfully.")
end

function debugMode()
    if prNotifyCFG.Debug == true then
    print("[Pr-Notify] Debug Enabled.")   
    debugMessages = {"[DEBUG] Test notify Sent.",  "[DEBUG] Killed by random sent.", "[DEBUG] Killed by player Sent.", "[DEBUG] Player Revived."}
    end
end
debugMode() -- Debug mode is called just to make sure.
-- checks if the player gets revied or not.



function checkConfig()
    if prNotifyCFG.Message == "" then
        print("Nil value!")
        return false
    end
    return true
end
if not checkConfig() then return end
if not prNotifyCFG then
    print("Couldnt get CFG!")
end


AddEventHandler(prNotifyCFG.PlayerDeathEvent, function (data)
    if disablePr == true then
        return nil
    end
    print("prNotify Started!")
    data.victim = source
    if data.killedByPlayer then
        lib.notify({
            title =  prNotifyCFG.ServerName,
            description = data.victim .. "Has been killed by".. data.killerServerId ,
            style = {
                backgroundColor = prNotifyCFG.ColorBackRound,
                color = prNotifyCFG.Color
            },
            type = 'success',
            position =  prNotifyCFG.Display,
            icon = prNotifyCFG.Icon, 
        })
        if prNotifyCFG.Debug == true then
            print(debugMessages[3])
            end
    end
end)
-- To test if notis are working.
RegisterCommand("tnotify", function (source, args, raw)
    lib.notify({
        title = prNotifyCFG.ServerName,
        description = "Hello there!",
        type = 'info',
        style = {
            backgroundColor = prNotifyCFG.ColorBackRound,
            color = prNotifyCFG.Color
        },
        icon = prNotifyCFG.Display,
    })
    if prNotifyCFG.Debug == true then
        print(debugMessages[1])
        end
end)
-- Checking if player is revived.0
AddEventHandler(prNotifyCFG.ServerReviveEvent, function ()
    if prNotifyCFG.Debug == true then
        print(debugMessages[4])
    end
end)
-- If the player wants, they can disable the notis.
disablePr = RegisterCommand("disablepr", function (source, args, raw)
    local prAlert = lib.alertDialog({
        header = prNotifyCFG.ServerName,
        content = "Are you sure you wanna turn the killfeed off?",
        centered = true,
        style = {
            backgroundColor = prNotifyCFG.ColorBackRound,
            color = prNotifyCFG.Color
        },
        cancel = true,
    })
    print(prAlert)
end)
