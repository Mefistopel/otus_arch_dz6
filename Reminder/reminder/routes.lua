local routes = {}

function routes.start(http)
 local reminder_api = require('reminder.api')
 reminder_api.start()
 http:route({ path = '/api/reminde/save_reminde', method = 'POST' }, reminder_api.save_reminde)
 http:route({ path = '/api/reminde/get_reminders', method = 'GET' }, reminder_api.get_my_reminders)
 
end

return routes