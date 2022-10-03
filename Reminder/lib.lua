local lib = {}

function lib.http200(contentType,body)
    return {
        status = 200,
        headers = {
            ['Content-Type'] = contentType,
            ['Access-Control-Allow-Credentials'] = true,
            ['Access-Control-Allow-Origin'] = '*',
            ['Access-Control-Allow-Methods'] = 'GET',
            ['Access-Control-Allow-Headers'] = 'application/json'
            -- Добавить отключение кеша на cloudflare
        },
        timeout = cfg.RESPONSE_TIMEOUT,
        body = body
    }
end

function lib.http404()
  return {
      status = 404,
      timeout = cfg.RESPONSE_TIMEOUT
  }
end

function lib.http500()
  return {
      status = 500,
      timeout = cfg.RESPONSE_TIMEOUT
  }
end

function lib.http409()
  return {
      status = 409,
      timeout = cfg.RESPONSE_TIMEOUT,
      body = json.encode({
        message = 'Уже есть'
      })
  }
end


return lib