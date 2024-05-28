if IsWindows() == 1 then return end

function UpdateKnife(player)
    local steamid = tostring(player:GetSteamID())
    local team = (player:team():Get() == TEAM_T and "_t" or "")

    local weap = player:weapons():GetWeaponFromSlot(gear_slot_t.GEAR_SLOT_KNIFE)
    if weap:Exists() == 1 then
        weap:Remove()
    end

    local given = false
    if playerSkinsData[steamid] then
        for i=1,#playerSkinsData[steamid].skins do 
            local skin = playerSkinsData[steamid].skins[i]
            if data["skins"][skin] then
                if data["skins"][skin].weapon:find("knife") then
                    NextTick(function()
                        player:weapons():GiveWeapons(data["skins"][skin].weapon)
                    end)
                    given = true
                    break
                end
            end
        end
    end
    
    if given == false then
        NextTick(function()
            player:weapons():GiveWeapons("weapon_knife"..team)
        end)
    end
end

events:on("OnPlayerSpawn", function(playerid)
    local player = GetPlayer(playerid)
    if not player then return end

    UpdateKnife(player)
end)

events:on("OnRoundStart", function()
    server:ExecuteCommand("mp_t_default_melee \"\"")
    server:ExecuteCommand("mp_ct_default_melee \"\"")
    server:ExecuteCommand("mp_equipment_reset_rounds 0")
end)