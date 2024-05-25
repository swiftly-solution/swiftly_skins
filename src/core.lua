events:on("OnPluginStart", function()
    if IsWindows() == 1 then return print("[Skin Changer] Windows is not supported.") end
    if config:Fetch("core.FollowCS2ServerGuidelines") == 1 then return print("[Skin Changer] This plugin is not following CS2 Server Guidelines. If you wish to start this plugin you must set FollowCS2ServerGuidelines to false.") end

    db = Database("skin_changer")
    if db:IsConnected() == 0 then return end

    VerifyDB()

    LoadData("agents")
    LoadData("musickits")
    LoadData("graffiti")
    LoadData("skins")
    LoadData("pins")        
        
    PreloadAgents()
    PreloadMusic()

    SyncPlayersWithDB()
    CheckPlayersConnection()
    RegisterLastConnections()
end)

function GetPluginAuthor()
    return "Swiftly Solutions"
end

function GetPluginVersion()
    return "1.0.0"
end

function GetPluginName()
    return "Skin Changer"
end

function GetPluginWebsite()
    return "https://github.com/swiftly-solution/swiftly_skins"
end
