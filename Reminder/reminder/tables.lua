local tables = {}

---------------------------------
-- Создание таблиц для CMS
---------------------------------

box.once("create_table_reminder:v1", function ()
    ----------------------------
    -- Создаем таблицу REMINDER
    ----------------------------

    box.schema.sequence.create('s_u',{min=1, start=1})    

    local t = box.schema.space.create("reminder", {
        if_not_exists = true
    })
    -- Создаем индексы
    t:create_index("id", {
      type = "tree",
      parts = {1, "unsigned"},
      sequence='s_u',
      if_not_exists = true
    })
    t:create_index("chat_id", {
        type = "tree",
        parts = {2, "number"},
        unique = false,
        if_not_exists = true
    })
    t:create_index("user_id", {
      type = "tree",
      parts = {3, "number"},
      unique = false,
      if_not_exists = true
  })
    t:create_index("message", {
      type = "tree",
      parts = {4, "string", collation='unicode_ci'},
      unique = false,
      if_not_exists = true
    })
    t:create_index("timestamp", {
      type = "tree",
      parts = {5, "unsigned"},
      unique = false,
      if_not_exists = true
    })
    t:create_index("repeat", {
      type = "tree",
      parts = {6, "string", collation='unicode_ci'},
      unique = false,
      if_not_exists = true
    })
    t:create_index("created_time", {
      type = "tree",
      parts = {7, "unsigned"},
      unique = false,
      if_not_exists = true
    })
    t:create_index("x_request_id", {
      type = "tree",
      parts = {8, "string", collation='unicode_ci'},
      unique = false,
      if_not_exists = true
    })
end)

return tables