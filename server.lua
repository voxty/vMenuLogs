local webhookUrl = "https://discord.com/api/webhooks/1239053944819548222/uikmTaVajjQXr0Hk-IHusJKFhTAMYZh0YVH1Op2x6ls-lyWXReLXDPQAaeeAJ6n-zoD9"

local function SendToWebhook(webhookUrl, embed)
    local jsonData = json.encode({["embeds"] = {embed}})
    PerformHttpRequest(webhookUrl, function(statusCode, response, headers) end, 'POST', jsonData, {['Content-Type'] = 'application/json'})
end

RegisterNetEvent('vMenu:KickPlayer', function(target, kickReason)
    local sourceID = source
    local sourceName = GetPlayerName(sourceID)
    local targetName = GetPlayerName(target)

    local embed = {
        ["title"] = "vMenu: Player Kicked",
        ["color"] = 65280,
        ["fields"] = {
            { ["name"] = ""..sourceName.." | "..sourceID.."", ["value"] = "Has kicked a player." },
            { ["name"] = ""..targetName.." | "..target.."", ["value"] = "Has been killed."},
            { ["name"] = "Kick Reason", ["value"] = kickReason }
        }
    }
    SendToWebhook(webhookUrl, embed)
end)

RegisterNetEvent('vMenu:GetOutOfCar', function(vehicleNetId, playerOwner)
    local sourceID = source
    local sourceName = GetPlayerName(sourceID)

    local embed = {
        ["title"] = "vMenu: Player Kicked out of Car",
        ["color"] = 65280,
        ["fields"] = {
            { ["name"] = ""..sourceName.." | "..sourceID.."", ["value"] = "Has gotten out of a vehicle." },
            { ["name"] = "Vehicle NetID", ["value"] = vehicleNetId },
            { ["name"] = "Owner", ["value"] = playerOwner }
        }
    }
    SendToWebhook(webhookUrl, embed)
end)

RegisterNetEvent('vMenu:SendMessageToPlayer', function(target, message)
    local sourceID = source
    local sourceName = GetPlayerName(sourceID)
    local targetName = GetPlayerName(target)
    local embed = {
        ["title"] = "vMenu Private Message Sent",
        ["color"] = 65280,
        ["fields"] = {
            { ["name"] = ""..sourceName.." | "..sourceID.."", ["value"] = "Has sent a private message." },
            { ["name"] = ""..targetName.." | "..target.."", ["value"] = "Recieved the private message."},
            { ["name"] = "Message", ["value"] = message }
        }
    }
    SendToWebhook(webhookUrl, embed)
end)

RegisterNetEvent('vMenu:ClearArea', function()
    local sourceID = source
    local sourceName = GetPlayerName(sourceID)
    local embed = {
        ["title"] = "vMenu Area Cleared",
        ["color"] = 65280,
        ["fields"] = {
            { ["name"] = ""..sourceName.." | "..sourceID.."", ["value"] = "Has cleared the area." },
        }
    }
    SendToWebhook(webhookUrl, embed)
end)

RegisterNetEvent('vMenu:KillPlayer', function(target)
    local sourceID = source
    local sourceName = GetPlayerName(sourceID)
    local targetName = GetPlayerName(target)
    local embed = {
        ["title"] = "vMenu Player Killed",
        ["color"] = 65280,
        ["fields"] = {
            { ["name"] = ""..sourceName.." | "..sourceID.."", ["value"] = "Has killed a player." },
            { ["name"] = ""..targetName.." | "..target.."", ["value"] = "Has been killed."},
        }
    }
    SendToWebhook(webhookUrl, embed)
end)

RegisterNetEvent('vMenu:SummonPlayer', function(target)
    local sourceID = source
    local sourceName = GetPlayerName(sourceID)
    local targetName = GetPlayerName(target)
    local embed = {
        ["title"] = "vMenu Player Summoned",
        ["color"] = 65280,
        ["fields"] = {
            { ["name"] = ""..sourceName.." | "..sourceID.."", ["value"] = "Has summoned a player." },
            { ["name"] = ""..targetName.." | "..target.."", ["value"] = "Has been summoned."},
        }
    }
    SendToWebhook(webhookUrl, embed)
end)

RegisterNetEvent('vMenu:UpdateServerWeather', function(result)
    local sourceID = source
    local sourceName = GetPlayerName(sourceID)
    local embed = {
        ["title"] = "vMenu Weather Changed",
        ["color"] = 65280,
        ["fields"] = {
            { ["name"] = ""..sourceName.." | "..sourceID.."", ["value"] = "Has changed the weather." },
            { ["name"] = "The new weather is", ["value"] = result },
        }
    }
    SendToWebhook(webhookUrl, embed)
end)

RegisterNetEvent('vMenu:UpdateServerTime', function(result)
    local sourceID = source
    local sourceName = GetPlayerName(sourceID)
    local embed = {
        ["title"] = "vMenu Time Changed",
        ["color"] = 65280,
        ["fields"] = {
            { ["name"] = ""..sourceName.." | "..sourceID.."", ["value"] = "Has changed the time." },
            { ["name"] = "The new time is", ["value"] = "**"..result..":00**" },
        }
    }
    SendToWebhook(webhookUrl, embed)
end)
