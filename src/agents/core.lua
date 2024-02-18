if IsWindows() == 1 then return end

function PreloadAgents()
    for _,model in next,agentsModelPath,nil do 
        precacher:PrecacheModel(model)
    end
end

events:on("OnPlayerSpawn", function(playerid)
    local player = GetPlayer(playerid)
    if not player then return end

    local steamid = tostring(player:GetSteamID())
    local team = (player:team():Get() == TEAM_T and "t" or "ct")

    if playerSkinsData[steamid] then
        for i=1,#playerSkinsData[steamid].skins do 
            local agent = playerSkinsData[steamid].skins[i]
            if data["agents"][agent] then
                if (data["agents"][agent].team == "both") or (data["agents"][agent].team == team) then
                    NextTick(function()
                        player:SetModel(agentsModelPath[agent])
                    end)
                    break
                end
            end
        end
    end

    CheckGloves(player)
end)