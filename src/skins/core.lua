if IsWindows() == 1 then return end

custom_names = {
    [500] = "weapon_bayonet",
    [503] = "weapon_knife_css",
    [505] = "weapon_knife_flip",
    [506] = "weapon_knife_gut",
    [507] = "weapon_knife_karambit",
    [508] = "weapon_knife_m9_bayonet",
    [509] = "weapon_knife_tactical",
    [512] = "weapon_knife_falchion",
    [514] = "weapon_knife_survival_bowie",
    [515] = "weapon_knife_butterfly",
    [516] = "weapon_knife_push",
    [517] = "weapon_knife_cord",
    [518] = "weapon_knife_canis",
    [519] = "weapon_knife_ursus",
    [520] = "weapon_knife_gypsy_jackknife",
    [521] = "weapon_knife_outdoor",
    [522] = "weapon_knife_stiletto",
    [523] = "weapon_knife_widowmaker",
    [525] = "weapon_knife_skeleton",
    [526] = "weapon_knife_kukri"
}

function UpdateSkins(player, slot)
    local weapon = player:weapons():GetWeaponFromSlot(slot)
    local currentweapon = player:weapons():GetWeaponFromSlot(WeaponSlot.CurrentWeapon)
    local active = (weapon:GetID() == currentweapon:GetID())
    local weaponname = custom_names[weapon:GetID()] or weapon:GetName()

    if playerSkinsData[steamid] then
        for i=1,#playerSkinsData[steamid].skins do 
            local skin = playerSkinsData[steamid].skins[i]
            if data["skins"][skin] then
                if data["skins"][skin].weapon == weaponname and 
                    (
                        weapon:GetPaintKit() ~= tonumber(playerSkinsData[steamid].data[skin].paint_index) or
                        weapon:GetSeed() ~= tonumber(playerSkinsData[steamid].data[skin].seed) or
                        weapon:GetWear() ~= tonumber(playerSkinsData[steamid].data[skin].wear) or
                        weapon:GetPaintKit() ~= tonumber(playerSkinsData[steamid].data[skin].paint_index)
                    ) 
                then
                    local name = weapon:GetName()
                    weapon:Remove()
                    player:weapons():GiveWeapons(name)

                    NextTick(function()
                        if active then player:ExecuteCommand("slot"..slot) end
                    end)
                end
            end
        end
    end
end

events:on("OnWeaponSpawned", function(playerid, weaponid)
    local player = GetPlayer(playerid)
    if not player then return end
    if player:IsFakeClient() == 1 then return end

    local weapon = player:weapons():GetWeapon(weaponid)
    if weapon:Exists() == 0 then return end
    if not data["skins"] then return end

    local weaponname = custom_names[weapon:GetID()] or weapon:GetName()
    local steamid = tostring(player:GetSteamID())



    if weaponname == "weapon_m4a1" and weapon:GetSilencerType() ==  1 then
        weaponname = "weapon_m4a1_silencer"
    end

    if weaponname == "weapon_hkp2000" and weapon:GetSilencerType() == 1 then
        weaponname = "weapon_usp_silencer"
    end

    if playerSkinsData[steamid] then
        for i=1,#playerSkinsData[steamid].skins do 
            local skin = playerSkinsData[steamid].skins[i]
            if data["skins"][skin] then
                if data["skins"][skin].weapon == weaponname then
                    local paint_index = data["skins"][skin].paint_index
                    local seed = playerSkinsData[steamid].data[skin].seed
                    local wear = playerSkinsData[steamid].data[skin].wear
                    local nametag = playerSkinsData[steamid].data[skin].nametag

                    weapon:SetPaintKit(tonumber(paint_index))
                    weapon:SetSeed(tonumber(seed))
                    weapon:SetWear(tonumber(wear))
                    if playerSkinsData[steamid].data[skin].nametag ~= data["skins"][skin].name then weapon:SetNametag(nametag) end
                    weapon:SetDefaultChangeSkinAttributes()

                    break
                end
            end
        end
    end
end)

events:on("OnPlayerSpawn", function(playerid)
    local player = GetPlayer(playerid)
    if not player then return end

    UpdateSkins(player, WeaponSlot.Rifle)
    UpdateSkins(player, WeaponSlot.Pistol)
end)