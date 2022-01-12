local discordWebhook = {
    [" "] = {color = "1234521",logName = " ",webhookLink = " ",botAvatar = " ",iconLink = " "},
} 
  
function sendToDiscord(whereToSend,title,message)
    if discordWebhook[whereToSend] then
        local v = discordWebhook[whereToSend]
        local username = v.logName
    
        local embed = {
            {
                ["color"] = v.color,
                ["title"] = title,
                ["description"] = message,
                ["thumbnail"] = {
                    ["url"] = v.iconLink,
                },
                ["footer"] = {
                    ["text"] = "botzoicsde#3858 - Discord Logger",
                    ["icon_url"] = "https://cdn.discordapp.com/avatars/229302780765011968/2147cc14a2ee8f27e509931bd587f91d.jpg?size=1024"
                },
            }
        }
        PerformHttpRequest(v.webhookLink, function(err, text, headers) end, 'POST', json.encode({username = v.logName,embeds = embed, avatar_url = v.botAvatar}), { ['Content-Type'] = 'application/json' }) 
    end
end 