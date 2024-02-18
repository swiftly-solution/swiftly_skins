if IsWindows() == 1 then return end

playerSkinsData = {}
data = {}
cooldowns = {}

events:on("OnClientConnect", function(playerid)
    local player = GetPlayer(playerid)
    if not player then return false end
    if not db then return false end
    if db:IsConnected() == 0 then return true end

    SyncPlayerWithDB(player)
    return true;
end)

events:on("OnClientDisconnect", function(playerid)
    local player = GetPlayer(playerid)
    if not player then return end

    local steamid = tostring(player:GetSteamID())
    playerSkinsData[steamid] = nil
end)