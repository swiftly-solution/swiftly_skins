commands:Register("wp", function(playerid, args, argc, silent)
    if playerid == -1 then return end
    local player = GetPlayer(playerid)
    if not player then return end
    if not db then return end

    local steamid = tostring(player:GetSteamID())
    if not cooldowns[steamid] then cooldowns[steamid] = os.time() end

    if cooldowns[steamid] - os.time() > 0 then
        return player:SendMsg(MessageType.Chat, string.format(FetchTranslation("skins.reset_cooldown"), config:Fetch("skins.prefix"), cooldowns[steamid] - os.time()))
    end

    cooldowns[steamid] = os.time() + 120

    SyncPlayerWithDB(player)
    UpdateSkins(player, gear_slot_t.GEAR_SLOT_RIFLE)
    UpdateSkins(player, gear_slot_t.GEAR_SLOT_PISTOL)
    UpdateKnife(player)
    UpdateMusicKit(player)
    CheckGloves(player)
    player:SendMsg(MessageType.Chat, string.format(FetchTranslation("skins.reset_success"), config:Fetch("skins.prefix")))
end)