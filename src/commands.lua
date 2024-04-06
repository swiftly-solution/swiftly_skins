local skinsCmd = function(playerid, args, argsCount, silent)
    if playerid == -1 then return end
    local player = GetPlayer(playerid)
    if not player then return end
    
    player:SendMsg(MessageType.Chat, string.format(FetchTranslation("skins.website"), config:Fetch("skins.prefix"), config:Fetch("skins.skins_website")))
end

for i=1,config:FetchArraySize("skins.skin_commands") do 
    commands:Register(config:Fetch("skins.skin_commands["..(i-1).."]"), skinsCmd)
end

-- Delete skins from database of a specific player by SteamID (only for admins with z flag)
commands:Register("delskins", function(playerid, args, argc, silent)
    if not db then return end
    
    -- if server executed the command
    if playerid == -1 then
        --[[ server console logic ]]
        if argc < 1 then
            print(string.format(FetchTranslation("skins.usage_delskins"), config:Fetch("skins.prefix")))
            return
        end
        
        local target = args[1]
        -- Check if the target is a valid SteamID64 (just numbers)
        if target:match("^[0-9]+$") == nil and target:len() < 17 then
            print(string.format(FetchTranslation("skins.invalid_steamid"), config:Fetch("skins.prefix")))
            return
        end
        -- Check if the steamid is in the database.
        local result = db:Query("select steamid from sw_skins_users where steamid = '".. target .."'")
        if #result == 0 then
            print(string.format(FetchTranslation("skins.steamid_not_found"), config:Fetch("skins.prefix"), target))
            return
        end
        -- Delete the steamid from the database.
        db:Query("delete from sw_skins_users where steamid = '".. target .."'")
        print(string.format(FetchTranslation("skins.steamid_deleted"), config:Fetch("skins.prefix"), target))
    else
        --[[ player logic ]]
        local player = GetPlayer(playerid)
        if not player then return end
        if argc < 1 then
            player:SendMsg(MessageType.Chat, string.format(FetchTranslation("skins.usage_delskins"), config:Fetch("skins.prefix")))
            return
        end
        
        local isAdmin = exports["swiftly_admins"]:CallExport("HasFlags", playerid, "z")
        if isAdmin == 0 then
            player:SendMsg(MessageType.Chat, string.format(FetchTranslation("skins.no_access"), config:Fetch("skins.prefix")))
            return
        end
        
        if isAdmin == 1 then
            local target = args[1]
            -- Check if the target is a valid SteamID64 (just numbers)
            if target:match("^[0-9]+$") == nil and target:len() < 17 then
                player:SendMsg(MessageType.Chat, string.format(FetchTranslation("skins.invalid_steamid"), config:Fetch("skins.prefix")))
                return
            end
            -- Check if the steamid is in the database.
            local result = db:Query("select steamid from sw_skins_users where steamid = '".. target .."'")
            if #result == 0 then
                player:SendMsg(MessageType.Chat, string.format(FetchTranslation("skins.steamid_not_found"), config:Fetch("skins.prefix"), target))
                return
            end
            -- Delete the steamid from the database.
            db:Query("delete from sw_skins_users where steamid = '".. target .."'")
            player:SendMsg(MessageType.Chat, string.format(FetchTranslation("skins.steamid_deleted"), config:Fetch("skins.prefix"), target))
            return
        end
    end
end)
