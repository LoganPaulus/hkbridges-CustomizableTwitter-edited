
RegisterNetEvent("dotweet")
AddEventHandler("dotweet", function()
   TriggerEvent("addTweet", fulluser, fullmessage)
end)

RegisterNetEvent("namelogging")
AddEventHandler("namelogging", function(tusername, logname)
   if webhook then
      PerformHttpRequest(webhookLink, function(err, text, headers) end, 'POST', json.encode({username = "Twitter Name Change", content = "```".. logname.. "" .. " set their handle to "..tusername .. "```", avatar_url = "https://i.imgur.com/HC5ViBC.png"}), { ['Content-Type'] = 'application/json' })
   end
end)

RegisterNetEvent("tweetlogging")
AddEventHandler("tweetlogging", function(tusername, message, loggingname)
   if webhook then
    local embed = {
      
        {
         
            ["color"] = embedColor,
            ["description"] = message,
            ["footer"] = {
               ["text"] = embedFooter,
           },

        },
      }
      PerformHttpRequest(webhookLink, function(err, text, headers) end, 'POST', json.encode({username = "From: " .. tusername .."", embeds = embed, avatar_url = "https://www.southernbank.com/wp-content/uploads/twitter.png" }), { ['Content-Type'] = 'application/json' })
  
   end
end)

function notify(msg)
   SetNotificationTextEntry("STRING")
   AddTextComponentString(msg)
   DrawNotification(true, false)
end

RegisterNetEvent("addTweet")
AddEventHandler("addTweet", function(fulluser, fullmessage)
   if symbolEnabled then
      TriggerClientEvent('chat:addMessage', -1, {
         templateId = 'tweet',
         color = prefixColor,
         multiline = true,
         args = {tweetPrefix.. " " .. fulluser, fullmessage}
      })
   else
      TriggerClientEvent('chat:addMessage', -1, {
         color = prefixColor,
         multiline = true,
         args = {tweetPrefix.. " " .. fulluser, fullmessage}
      })
   end
   
end)

