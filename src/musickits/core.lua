if IsWindows() == 1 then return end

function PreloadMusic()
    for _,model in next,musicDataPath,nil do 
        precacher:PrecacheSound(model)
    end
end

function UpdateMusicKit(player)
    local steamid = tostring(player:GetSteamID())

    if playerSkinsData[steamid] then
        for i=1,#playerSkinsData[steamid].skins do 
            local musickit = playerSkinsData[steamid].skins[i]
            if data["musickits"][musickit] then
                NextTick(function()
                    player:SetMusicKit(tonumber(string.match(musickit, "%d+")))
                end)
                break
            end
        end
    end
end

events:on("OnPlayerSpawn", function(playerid)
    local player = GetPlayer(playerid)
    if not player then return end
    if player:IsFakeClient() == 1 then return end

    UpdateMusicKit(player)
end)