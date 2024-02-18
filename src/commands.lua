local skinsCmd = function(playerid, args, argsCount, silent)
    if playerid == -1 then return end
    local player = GetPlayer(playerid)
    if not player then return end
    
    player:SendMsg(MessageType.Chat, string.format(FetchTranslation("skins.website"), config:Fetch("skins.prefix"), config:Fetch("skins.skins_website")))
end

for i=1,config:FetchArraySize("skins.skin_commands") do 
    commands:Register(config:Fetch("skins.skin_commands["..(i-1).."]"), skinsCmd)
end