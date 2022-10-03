local reminder_api = {}

function reminder_api.save_reminde(req)
  local isok1, req_json = pcall(function()
    return req:json()
  end)

  if not isok1 then
    return lib.http500()
  end

  local user_id = tonumber(req.headers['x-user-id'])
  local chat_id = tonumber(req_json.chat_id)
  local message = req_json.message
  local timestamp = tonumber(req_json.timestamp)
  local repeat_reminde = req_json.repeat_reminde

  local x_request_id = req.headers['x-request-id'] or timestamp

  local response = { status = false }

  local isok, error_message = pcall(function ()
    local is_reminder = box.space.reminder.index.x_request_id:select(x_request_id)[1]
    if is_reminder then
      response.status = true
      response.code = 409
    else
      box.space.reminder:insert({ nil, tonumber(chat_id), tonumber(user_id), message, timestamp, repeat_reminde, os.time(), tostring(x_request_id) })
      response.status = true
      response.code = 200
    end
  end)

  if isok then
    if response.code == 409 then
      return lib.http409()
    end
    return lib.http200('json', json.encode({ result = true}))
  else
    return lib.http500()
  end
end

function reminder_api.get_my_reminders(req)
  local user_id = tonumber(req.headers['x-user-id'])
  
  if not user_id then
    return lib.http500()
  end

  -- local user_id = req_json.user_id

  local reminders
  local is_ok_get_chats, _ = pcall(function()
    reminders = box.space.reminder.index.user_id:select(user_id)
  end)

  if is_ok_get_chats then
    local data = {}

    for _, val in pairs(reminders) do
      table.insert(data, {
        id = val[1],
        chat_id = val[2],
        user_id = val[3],
        message = val[4],
        timestamp = val[5],
        repeat_reminde = val[6],
        created_time = val[7],
        x_request_id = val[8]
      })
    end

    return lib.http200('json', json.encode({ data = data }))
  else
    return lib.http500()
  end
end

local function send_reminde_to_chat(chat_id, message)
  local is_ok, _ = pcall(function () 
    local body = {
      ['chat_id'] = chat_id,
      ['message'] = message,
    }
    
    http_client:post(
      auth.cfg.TG_CMS_URL .. '/api/tg_cms/send_reminde', 
      json.encode(body)
    )
  end)
end


function reminder_api.start()
  fiber.create(function()
    while true do
        local current_time = os.time()
        local reminders = box.sce.reminder.index.timestamp:select(current_time,{iterator = 'LE', limit = 100})
        for _, val in pairs(reminders) do
          if (val[5] + 500) >= current_time then
            send_reminde_to_chat(val[2], val[4])
            local reminde_repeat = val[6]
              pcall(function()
                if reminde_repeat == 'one' then
                  box.space.reminder.index.id:delete({val[1]})
                end
              end)
           
          end
        end
        fiber.sleep(.3) 
    end
  end)
end

return reminder_api
