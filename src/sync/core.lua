function SyncPlayerWithDB(pl)
    if not db then return end
    local player = pl
    local steamid = tostring(player:GetSteamID())
    local result = db:Query("select equippedSkins, skinsdata from sw_skins_users where steamid = '".. steamid .."'")
    if #result == 0 then return end

    local equippedSkins = json.decode(result[1].equippedSkins)
    local skinsdata = json.decode(result[1].skinsdata)

    playerSkinsData[steamid] = {
        skins = equippedSkins,
        data = skinsdata
    }
end

function SyncPlayersWithDB()
    for i=0,playermanager:GetPlayerCap()-1,1 do 
        local player = GetPlayer(i)
        if not player then goto sync_continue end
        SyncPlayerWithDB(player)
        ::sync_continue::
    end
end

function CheckPlayerConnection(pl)
    if not db then return end
    local player = pl
    local steamid = tostring(player:GetSteamID())
    local result = db:Query("select lastConnection from sw_skins_users where steamid = '".. steamid .."'")
    if #result == 0 then return end

    local lastConnection = result[1].lastConnection
    local currentTime = os.time()
    local diff = currentTime - lastConnection
    time = (config:Fetch("skins.daysToErase") * 86400)

    if time ~= nil and diff > time then
        db:Query("delete from sw_skins_users where steamid = '".. steamid .."'")
    end
end

function CheckPlayerConnection()
    for i=0,playermanager:GetPlayerCap()-1,1 do 
        local player = GetPlayer(i)
        if not player then goto check_continue end
        CheckPlayerConnection(player)
        ::check_continue::
    end
end

function RegisterLastConnection(pl)
    if not db then return end
    local player = pl
    local steamid = tostring(player:GetSteamID())
    local currentTime = os.time()
    db:Query("update sw_skins_users set lastConnection = '".. currentTime .."' where steamid = '".. steamid .."'")
end

function RegisterLastConnection()
    for i=0,playermanager:GetPlayerCap()-1,1 do 
        local player = GetPlayer(i)
        if not player then goto register_continue end
        RegisterLastConnection(player)
        ::register_continue::
    end
end