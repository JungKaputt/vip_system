local db

function initDB()
    db = dbConnect("sqlite", "registry.db")
    if db then
        dbExec(db, "CREATE TABLE IF NOT EXISTS vip_players (serial TEXT PRIMARY KEY, vip_until INTEGER)")
        outputDebugString("[VIP] Database connected and table ensured.")
    else
        outputDebugString("[VIP] Failed to connect to registry.db", 1)
    end
end

function addVIP(serial, days)
    local vipUntil = getRealTime().timestamp + (days * 86400)
    dbExec(db, "INSERT OR REPLACE INTO vip_players (serial, vip_until) VALUES (?, ?)", serial, vipUntil)
end

function isPlayerVIP(serial, callback)
    local qh = dbQuery(db, "SELECT vip_until FROM vip_players WHERE serial = ?", serial)
    dbPoll(qh, -1,
        function(result)
            local currentTime = getRealTime().timestamp
            if result and #result > 0 then
                local vipUntil = result[1].vip_until
                callback(vipUntil > currentTime)
            else
                callback(false)
            end
        end
    )
end

function checkVIPStatus(player)
    local serial = getPlayerSerial(player)
    isPlayerVIP(serial, function(isVIP)
        if isVIP then
            outputChatBox("[VIP] Anda adalah member VIP!", player, 0, 255, 0)
        else
            outputChatBox("[VIP] Anda bukan member VIP.", player, 255, 0, 0)
        end
    end)
end

addEventHandler("onPlayerLogin", root, function()
    checkVIPStatus(source)
end)

addCommandHandler("addvip", function(player, cmd, targetName, days)
    if not targetName or not days then
        outputChatBox("Usage: /addvip [playerName] [days]", player, 255, 255, 0)
        return
    end
    local target = getPlayerFromName(targetName)
    if target then
        addVIP(getPlayerSerial(target), tonumber(days))
        outputChatBox("VIP diberikan ke " .. targetName .. " selama " .. days .. " hari.", player, 0, 255, 0)
    else
        outputChatBox("Player tidak ditemukan.", player, 255, 0, 0)
    end
end)

addEventHandler("onResourceStart", resourceRoot, initDB)
