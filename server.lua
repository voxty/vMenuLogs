local webhookUrl = Config.webhookUrl

local function SendToWebhook(webhookUrl, embed)
    local jsonData = json.encode({["embeds"] = {embed}})
    PerformHttpRequest(webhookUrl, function(statusCode, response, headers) end, 'POST', jsonData, {['Content-Type'] = 'application/json'})
end

local currentDate = os.date("%Y-%m-%d")
local currentTime = os.date("%H:%M:%S")

RegisterNetEvent('vMenu:GetPlayerIdentifiers', function(TargetPlayer)
    local sourceID = source
    local sourceName = GetPlayerName(sourceID)
    local targetName = GetPlayerName(TargetPlayer)

    local embed = {
        ["title"] = "vMenu: Get Player Identifiers",
        ["color"] = Config.webhookColor,
        ["fields"] = {
            { ["name"] = ""..sourceName.." | "..sourceID.."", ["value"] = "Has requested player identifiers." },
            { ["name"] = ""..targetName.." | "..TargetPlayer.."", ["value"] = "Information has been sent to the player."},
        },
        ["thumbnail"] = {
            ["url"] = Config.serverLogo
        },
        ["footer"] = {
                ["text"] = ""..Config.webhookFooter.." "..currentDate.." "..currentTime.."",
            ["icon_url"] = Config.serverLogo
        }
    }
    SendToWebhook(webhookUrl, embed)
end)

RegisterNetEvent('vMenu:RequestPlayerList', function()
    local sourceID = source
    local sourceName = GetPlayerName(sourceID)
    local embed = {
        ["title"] = "vMenu: Requested Player List",
        ["color"] = Config.webhookColor,
        ["fields"] = {
            { ["name"] = ""..sourceName.." | "..sourceID.."", ["value"] = "Has requested the player list." },
        },
        ["thumbnail"] = {
            ["url"] = Config.serverLogo
        },
        ["footer"] = {
                ["text"] = ""..Config.webhookFooter.." "..currentDate.." "..currentTime.."",
            ["icon_url"] = Config.serverLogo
        }
    }
    SendToWebhook(webhookUrl, embed)
end)

RegisterNetEvent('vMenu:GetPlayerCoords', function(playerId)
    local sourceID = source
    local sourceName = GetPlayerName(sourceID)
    local targetName = GetPlayerName(playerId)

    local embed = {
        ["title"] = "vMenu: Get Player Coordinates",
        ["color"] = Config.webhookColor,
        ["fields"] = {
            { ["name"] = ""..sourceName.." | "..sourceID.."", ["value"] = "Has requested player coordinates." },
            { ["name"] = ""..targetName.." | "..playerId.."", ["value"] = "Information has been sent to the player."},
        },
        ["thumbnail"] = {
            ["url"] = Config.serverLogo
        },
        ["footer"] = {
                ["text"] = ""..Config.webhookFooter.." "..currentDate.." "..currentTime.."",
            ["icon_url"] = Config.serverLogo
        }
    }
    SendToWebhook(webhookUrl, embed)
end)

RegisterNetEvent('vMenu:SaveTeleportLocation', function(locationJson)
    local sourceID = source
    local sourceName = GetPlayerName(sourceID)

    local embed = {
        ["title"] = "vMenu: Save Teleport Location",
        ["color"] = Config.webhookColor,
        ["fields"] = {
            { ["name"] = ""..sourceName.." | "..sourceID.."", ["value"] = "Has saved a teleport location." },
            { ["name"] = "Teleport Location", ["value"] = locationJson },
        },
        ["thumbnail"] = {
            ["url"] = Config.serverLogo
        },
        ["footer"] = {
                ["text"] = ""..Config.webhookFooter.." "..currentDate.." "..currentTime.."",
            ["icon_url"] = Config.serverLogo
        }
    }
    SendToWebhook(webhookUrl, embed)
end)

RegisterNetEvent('vMenu:KickPlayer', function(target, kickReason)
    local sourceID = source
    local sourceName = GetPlayerName(sourceID)
    local targetName = GetPlayerName(target)

    local embed = {
        ["title"] = "vMenu: Player Kicked",
        ["color"] = Config.webhookColor,
        ["fields"] = {
            { ["name"] = ""..sourceName.." | "..sourceID.."", ["value"] = "Has kicked a player." },
            { ["name"] = ""..targetName.." | "..target.."", ["value"] = "Has been killed."},
            { ["name"] = "Kick Reason", ["value"] = kickReason }
        },
        ["thumbnail"] = {
            ["url"] = Config.serverLogo
        },
        ["footer"] = {
                ["text"] = ""..Config.webhookFooter.." "..currentDate.." "..currentTime.."",
            ["icon_url"] = Config.serverLogo
        }
    }
    SendToWebhook(webhookUrl, embed)
end)

RegisterNetEvent('vMenu:PermBanPlayer', function(targetPlayer, banReason)
    local sourceID = source
    local sourceName = GetPlayerName(sourceID)
    local targetName = GetPlayerName(targetPlayer)

    local embed = {
        ["title"] = "vMenu: Player Permanently Banned",
        ["color"] = Config.webhookColor,
        ["fields"] = {
            { ["name"] = ""..sourceName.." | "..sourceID.."", ["value"] = "Has permanently banned a player." },
            { ["name"] = ""..targetName.." | "..targetPlayer.."", ["value"] = "Has been banned."},
            { ["name"] = "Ban Reason", ["value"] = banReason }
        },
        ["thumbnail"] = {
            ["url"] = Config.serverLogo
        },
        ["footer"] = {
                ["text"] = ""..Config.webhookFooter.." "..currentDate.." "..currentTime.."",
            ["icon_url"] = Config.serverLogo
        }
    }
    SendToWebhook(webhookUrl, embed)
end)

RegisterNetEvent('vMenu:TempBanPlayer', function(targetPlayer, banReason, banDurationHours)
    local sourceID = source
    local sourceName = GetPlayerName(sourceID)
    local targetName = GetPlayerName(targetPlayer)

    local embed = {
        ["title"] = "vMenu: Player Temporarily Banned",
        ["color"] = Config.webhookColor,
        ["fields"] = {
            { ["name"] = ""..sourceName.." | "..sourceID.."", ["value"] = "Has temporarily banned a player." },
            { ["name"] = ""..targetName.." | "..targetPlayer.."", ["value"] = "Has been banned."},
            { ["name"] = "Ban Reason", ["value"] = banReason },
            { ["name"] = "Ban Duration", ["value"] = banDurationHours }
        },
        ["thumbnail"] = {
            ["url"] = Config.serverLogo
        },
        ["footer"] = {
                ["text"] = ""..Config.webhookFooter.." "..currentDate.." "..currentTime.."",
            ["icon_url"] = Config.serverLogo
        }
    }
    SendToWebhook(webhookUrl, embed)
end)

RegisterNetEvent('vMenu:RequestPlayerUnban', function()
    local sourceID = source
    local sourceName = GetPlayerName(sourceID)
    local embed = {
        ["title"] = "vMenu: Player Unbanned",
        ["color"] = Config.webhookColor,
        ["fields"] = {
            { ["name"] = ""..sourceName.." | "..sourceID.."", ["value"] = "Has unbanned a player." },
        },
        ["thumbnail"] = {
            ["url"] = Config.serverLogo
        },
        ["footer"] = {
                ["text"] = ""..Config.webhookFooter.." "..currentDate.." "..currentTime.."",
            ["icon_url"] = Config.serverLogo
        }
    }
    SendToWebhook(webhookUrl, embed)
end)

RegisterNetEvent('vMenu:RequestBanList', function()
    local sourceID = source
    local sourceName = GetPlayerName(sourceID)
    local embed = {
        ["title"] = "vMenu: Requested Ban List",
        ["color"] = Config.webhookColor,
        ["fields"] = {
            { ["name"] = ""..sourceName.." | "..sourceID.."", ["value"] = "Has requested the ban list." },
        },
        ["thumbnail"] = {
            ["url"] = Config.serverLogo
        },
        ["footer"] = {
                ["text"] = ""..Config.webhookFooter.." "..currentDate.." "..currentTime.."",
            ["icon_url"] = Config.serverLogo
        }
    }
    SendToWebhook(webhookUrl, embed)
end)

RegisterNetEvent('vMenu:GetOutOfCar', function(vehicleNetId, playerOwner)
    local sourceID = source
    local sourceName = GetPlayerName(sourceID)

    local embed = {
        ["title"] = "vMenu: Player Kicked out of Car",
        ["color"] = Config.webhookColor,
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
        ["color"] = Config.webhookColor,
        ["fields"] = {
            { ["name"] = ""..sourceName.." | "..sourceID.."", ["value"] = "Has sent a private message." },
            { ["name"] = ""..targetName.." | "..target.."", ["value"] = "Recieved the private message."},
            { ["name"] = "Message", ["value"] = message }
        },
        ["thumbnail"] = {
            ["url"] = Config.serverLogo
        },
        ["footer"] = {
                ["text"] = ""..Config.webhookFooter.." "..currentDate.." "..currentTime.."",
            ["icon_url"] = Config.serverLogo
        }
    }
    SendToWebhook(webhookUrl, embed)
end)

RegisterNetEvent('vMenu:ClearArea', function(x, y, z)
    local sourceID = source
    local sourceName = GetPlayerName(sourceID)
    local embed = {
        ["title"] = "vMenu Area Cleared",
        ["color"] = Config.webhookColor,
        ["fields"] = {
            { ["name"] = "Player", ["value"] = sourceName .. " | " .. sourceID, ["inline"] = true },
            { ["name"] = "Position", ["value"] = "X: "..x..", Y: "..y..", Z: "..z.."",["inline"] = true },
            { ["name"] = "Action", ["value"] = "Cleared an area near the coordinates.", ["inline"] = false }
        },
        ["thumbnail"] = {
            ["url"] = Config.serverLogo
        },
        ["footer"] = {
                ["text"] = ""..Config.webhookFooter.." "..currentDate.." "..currentTime.."",
            ["icon_url"] = Config.serverLogo
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
        ["color"] = Config.webhookColor,
        ["fields"] = {
            { ["name"] = ""..sourceName.." | "..sourceID.."", ["value"] = "Has killed a player." },
            { ["name"] = ""..targetName.." | "..target.."", ["value"] = "Has been killed."},
        },
        ["thumbnail"] = {
            ["url"] = Config.serverLogo
        },
        ["footer"] = {
                ["text"] = ""..Config.webhookFooter.." "..currentDate.." "..currentTime.."",
            ["icon_url"] = Config.serverLogo
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
        ["color"] = Config.webhookColor,
        ["fields"] = {
            { ["name"] = ""..sourceName.." | "..sourceID.."", ["value"] = "Has summoned a player." },
            { ["name"] = ""..targetName.." | "..target.."", ["value"] = "Has been summoned."},
        },
        ["thumbnail"] = {
            ["url"] = Config.serverLogo
        },
        ["footer"] = {
                ["text"] = ""..Config.webhookFooter.." "..currentDate.." "..currentTime.."",
            ["icon_url"] = Config.serverLogo
        }
    }
    SendToWebhook(webhookUrl, embed)
end)

RegisterNetEvent('vMenu:UpdateServerWeather', function(result)
    local sourceID = source
    local sourceName = GetPlayerName(sourceID)
    local embed = {
        ["title"] = "vMenu Weather Changed",
        ["color"] = Config.webhookColor,
        ["fields"] = {
            { ["name"] = ""..sourceName.." | "..sourceID.."", ["value"] = "Has changed the weather." },
            { ["name"] = "The new weather is", ["value"] = result },
        },
        ["thumbnail"] = {
            ["url"] = Config.serverLogo
        },
        ["footer"] = {
                ["text"] = ""..Config.webhookFooter.." "..currentDate.." "..currentTime.."",
            ["icon_url"] = Config.serverLogo
        }
    }
    SendToWebhook(webhookUrl, embed)
end)
