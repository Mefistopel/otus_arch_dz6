box.cfg {
  memtx_min_tuple_size = 16, -- Минимальный размер кортежей
  memtx_max_tuple_size = 1024 * 2, -- Максимальный размер кортежей
  memtx_memory = 512 * 1024 * 1024, -- 0,5 гига
}

-- Включаем фиберы
fiber = require("fiber")
json = require('json') 
crypto = require('crypto')
clock = require('clock')
uuid = require('uuid')
lib = require('lib')

--метрики
metrics = require('metrics')
metrics.enable_default_metrics()
prometheus = require('metrics.plugins.prometheus')

http_client = require('http.client').new({ max_connections = 5 })

--push = {}
reminder = {}   
reminder.DEBAG = {}
cfg = require('cfg')

function reminder.start()
  require('reminder.tables')
  reminder.routes = require('reminder.routes')
  reminder.routes.start(reminder.http)
end

-- Стартуем внутренний сервер
reminder.http = require('http.server').new('0.0.0.0', 3000, { log_requests = true,  display_errors = true })
reminder.http:route( { path = '/metrics' }, prometheus.collect_http)
reminder.http:start() 

-- Запускаем reminder-сервис
reminder.start()