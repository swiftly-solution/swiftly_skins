if IsWindows() == 1 then return end

function LoadData(dataType)
    local request = http:CreateRequest("https://raw.githubusercontent.com")
    request:SetFollowRedirect(true)
    request:Get(string.format("/swiftly-solution/swiftly_skins_web/master/modules/%s/%s.json", dataType, dataType))

    if request:GetStatusCode() ~= 200 then return logger:Write(LogType.Error, "[Skin Changer] Couldn't load \""..dataType.."\" data. Status Code: "..request:GetStatusCode()) end

    local tbl = json.decode(request:GetBody())
    if not tbl then return end
    data[dataType] = {}

    for i=1,#tbl do 
        data[dataType][tbl[i].id] = tbl[i]
    end

    print("[Skin Changer] Succesfully loaded "..dataType..".")
end