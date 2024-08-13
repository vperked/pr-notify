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

function checkConfig()
    if prNotifyCFG.Message == "" then
        print("Nil value!")
        return false
    end
end
if not prNotifyCFG then
    print("Couldnt get CFG!")
end

print("^1 prNotify Started ^1")
AddEventHandler(prNotifyCFG.PlayerDeathEvent, function (data)
    data.victim = source
    if data.killedByPlayer then
     lib.notify({
            title = prNotifyCFG.ServerName,
            description =  data.victim .. "Killed by " .. data.killerServerId,
            style = {
                backgroundColor = prNotifyCFG.ColorBackRound,
                color = prNotifyCFG.Color,
            },
            type = 'success',
            position = prNotifyCFG.Display,
            icon = prNotifyCFG.Icon,
            iconColor = prNotifyCFG.IconColor
            })
        else
            lib.notify({
            title = prNotifyCFG.ServerName,
            description = "You've died too something random.",
            style = {
                backgroundColor = prNotifyCFG.ColorBackRound,
                color = prNotifyCFG.Color,
            },
            type = 'success',
            position = prNotifyCFG.Display,
            icon = prNotifyCFG.Icon,
            iconColor = prNotifyCFG.IconColor
            })
    end
end)

-- To test if notis are working.
RegisterCommand("tnotify", function (source, args, raw)
    lib.notify({
        title = prNotifyCFG.ServerName,
        description =  "Hi from prNotify!" ,
        style = {
            backgroundColor = prNotifyCFG.ColorBackRound,
            color = prNotifyCFG.Color,
        },
        type = 'success',
        position = prNotifyCFG.Display,
        icon = prNotifyCFG.Icon,
        iconColor = prNotifyCFG.IconColor
        })
    if prNotifyCFG.Debug == true then
        print(debugMessages[1])
        end
end)
-- If the player wants, they can disable the notis.
 RegisterCommand("disablepr", function (source, args, raw)
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

