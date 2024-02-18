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