if IsWindows() == 1 then return end

glovesIndexTbl = {
    ["studded_bloodhound_gloves"] = 5027,
    ["studded_brokenfang_gloves"] = 4725,
    ["studded_hydra_gloves"] = 5035,
    ["sporty_gloves"] = 5030,
    ["leather_handwraps"] = 5032,
    ["slick_gloves"] = 5031,
    ["specialist_gloves"] = 5034,
    ["motorcycle_gloves"] = 5033
}

function CheckGloves(player)
    if not player then return end
    if player:IsFakeClient() == 1 then return end
    if player:team():Get() ~= TEAM_CT and player:team():Get() ~= TEAM_T then return end

    local steamid = tostring(player:GetSteamID())

    if playerSkinsData[steamid] then
        for i=1,#playerSkinsData[steamid].skins do 
            local skin = playerSkinsData[steamid].skins[i]
            if data["skins"][skin] and data["skins"][skin].defindex == "gloves" then
                player:SetGloves(glovesIndexTbl[data["skins"][skin].weapon], tonumber(data["skins"][skin].paint_index), tonumber(playerSkinsData[steamid].data[skin].seed), tonumber(playerSkinsData[steamid].data[skin].wear))
                break
            end
        end
    end
end