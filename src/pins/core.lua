if IsWindows() == 1 then return end

function UpdatePin(player)
    local steamid = tostring(player:GetSteamID())

    if playerSkinsData[steamid] then
        for i=1,#playerSkinsData[steamid].skins do 
            local pin = playerSkinsData[steamid].skins[i]
            local pinID = string.match(pin, "^pin%-(%d+)$")
            if data["pins"][pin] then

                break
            end
        end
    end
end

events:on("OnPlayerSpawn", function(playerid)
    local player = GetPlayer(playerid)
    if not player then return end
    if player:IsFakeClient() == 1 then return end

    UpdatePin(player)
end)