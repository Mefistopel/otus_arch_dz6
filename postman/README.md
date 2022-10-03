{
	"info": {
		"_postman_id": "a2833a89-0286-4377-ad8b-2756a73f5850",
		"name": "OTUS",
		"schema": "https://schema.getpostman.com/json/collection/v2.1.0/collection.json"
	},
	"item": [
		{
			"name": "TgCMS",
			"item": [
				{
					"name": "to_tg_message",
					"request": {
						"method": "POST",
						"header": [],
						"body": {
							"mode": "raw",
							"raw": "{\n    \"chat_id\": -1001769617475,\n    \"message\": 'Код'\n}"
						},
						"url": {
							"raw": "http://localhost:3000/api/tg_cms/input_tg_handler",
							"protocol": "http",
							"host": [
								"localhost"
							],
							"port": "3000",
							"path": [
								"api",
								"tg_cms",
								"input_tg_handler"
							]
						}
					},
					"response": []
				},
				{
					"name": "tg_send_code_to_user",
					"request": {
						"method": "POST",
						"header": [],
						"body": {
							"mode": "raw",
							"raw": "{\n    \"chat_id\": -1001769617475,\n    \"message\": 'Код'\n}"
						},
						"url": {
							"raw": "http://localhost:3000/api/tg_cms/tg_send_code_to_user",
							"protocol": "http",
							"host": [
								"localhost"
							],
							"port": "3000",
							"path": [
								"api",
								"tg_cms",
								"tg_send_code_to_user"
							]
						}
					},
					"response": []
				},
				{
					"name": "send_reminde",
					"request": {
						"method": "POST",
						"header": [],
						"body": {
							"mode": "raw",
							"raw": "{\n    \"chat_id\": -1001769617475,\n    \"message\": 'Напоминалка'\n}"
						},
						"url": {
							"raw": "http://localhost:3000/api/tg_cms/tg_send_code_to_user",
							"protocol": "http",
							"host": [
								"localhost"
							],
							"port": "3000",
							"path": [
								"api",
								"tg_cms",
								"tg_send_code_to_user"
							]
						}
					},
					"response": []
				},
				{
					"name": "get_all_users",
					"request": {
						"method": "GET",
						"header": [],
						"url": {
							"raw": "http://localhost:3000/api/tg_cms/get_all_users",
							"protocol": "http",
							"host": [
								"localhost"
							],
							"port": "3000",
							"path": [
								"api",
								"tg_cms",
								"get_all_users"
							]
						}
					},
					"response": []
				},
				{
					"name": "get_all_chats",
					"request": {
						"method": "GET",
						"header": [],
						"url": {
							"raw": "http://localhost:3000/api/tg_cms/get_all_chats",
							"protocol": "http",
							"host": [
								"localhost"
							],
							"port": "3000",
							"path": [
								"api",
								"tg_cms",
								"get_all_chats"
							]
						}
					},
					"response": []
				}
			]
		},
		{
			"name": "Reminder",
			"item": [
				{
					"name": "save_reminde",
					"event": [
						{
							"listen": "test",
							"script": {
								"exec": [
									"pm.globals.set(\"baseUrl\", \"arch.homework\");",
									""
								],
								"type": "text/javascript"
							}
						}
					],
					"request": {
						"method": "POST",
						"header": [
							{
								"key": "x-user-id",
								"value": "123",
								"type": "text"
							},
							{
								"key": "x-request-id",
								"value": "qwe",
								"type": "text"
							}
						],
						"body": {
							"mode": "raw",
							"raw": "{\n    \"chat_id\": -1001769617475,\n    \"message\": \"Напоминалка\",\n    \"timestamp\": 1664552160,\n    \"repeat_reminde\": \"one\"\n}",
							"options": {
								"raw": {
									"language": "json"
								}
							}
						},
						"url": {
							"raw": "http://{{baseUrl}}/api/reminde/save_reminde",
							"protocol": "http",
							"host": [
								"{{baseUrl}}"
							],
							"path": [
								"api",
								"reminde",
								"save_reminde"
							]
						}
					},
					"response": []
				},
				{
					"name": "metrics",
					"request": {
						"method": "GET",
						"header": [],
						"url": {
							"raw": "http://localhost:3000/metrics",
							"protocol": "http",
							"host": [
								"localhost"
							],
							"port": "3000",
							"path": [
								"metrics"
							]
						}
					},
					"response": []
				},
				{
					"name": "get_reminders",
					"request": {
						"method": "GET",
						"header": [],
						"url": null
					},
					"response": []
				}
			]
		},
		{
			"name": "UserCMS",
			"item": [
				{
					"name": "reg_chat",
					"request": {
						"method": "POST",
						"header": [],
						"body": {
							"mode": "raw",
							"raw": "{\n    \"chat_id\": -1001769617475,\n    \"user_id\": 123,\n    \"title_chat\": \"Название чата\"\n}",
							"options": {
								"raw": {
									"language": "json"
								}
							}
						},
						"url": {
							"raw": "http://localhost:3000/api/user_cms/reg_chat",
							"protocol": "http",
							"host": [
								"localhost"
							],
							"port": "3000",
							"path": [
								"api",
								"user_cms",
								"reg_chat"
							]
						}
					},
					"response": []
				},
				{
					"name": "gen_code",
					"request": {
						"method": "GET",
						"header": [],
						"url": null
					},
					"response": []
				},
				{
					"name": "get_my_chats",
					"request": {
						"method": "GET",
						"header": [
							{
								"key": "x-user-id",
								"value": "123",
								"type": "text"
							}
						],
						"url": {
							"raw": "http://localhost:3000/api/tg_cms/get_my_chats",
							"protocol": "http",
							"host": [
								"localhost"
							],
							"port": "3000",
							"path": [
								"api",
								"tg_cms",
								"get_my_chats"
							],
							"query": [
								{
									"key": "",
									"value": "",
									"disabled": true
								}
							]
						}
					},
					"response": []
				}
			]
		},
		{
			"name": "login",
			"request": {
				"method": "GET",
				"header": [],
				"url": null
			},
			"response": []
		},
		{
			"name": "verification",
			"protocolProfileBehavior": {
				"disableBodyPruning": true
			},
			"request": {
				"method": "GET",
				"header": [],
				"body": {
					"mode": "raw",
					"raw": "{\n    \"active\": false,\n    \"count\": 50,\n    \"contactId\": {\n        \"value\": \"42123078\",\n        \"searchType\": \"EQUAL\"\n    }\n}"
				},
				"url": {
					"raw": "http://localhost:3000/api/auth/verification",
					"protocol": "http",
					"host": [
						"localhost"
					],
					"port": "3000",
					"path": [
						"api",
						"auth",
						"verification"
					]
				}
			},
			"response": []
		}
	]
}