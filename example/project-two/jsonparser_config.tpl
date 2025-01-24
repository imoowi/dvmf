{
	"TCPServerDevEnable" : 0,
	"TCPServerDevPort" : 5004,
	"TCPServerCtlEnable" : 0,
	"TCPServerCtlPort" : 5005,

	"MqttDevEnable" : 1,
	"MqttDevServerAddr" : "{{.JSON_PARSER_MQTT_ADDR}}",
	"MqttDevServerPort" : {{.JSON_PARSER_MQTT_PORT}},
	"MqttDevList" : [
		{
			"ClientID" : "{{.JSON_PARSER_MQTT_DEV_LIST_CLIENT_ID1}}",
			"SetTopic" : "{{.JSON_PARSER_MQTT_DEV_LIST_SET_TOPIC1}}",
			"DataTopic" : "{{.JSON_PARSER_MQTT_DEV_LIST_DATA_TOPIC1}}",
			"ProjectID" : "default",
			"ProcessScale" : 10,
			"DisableAutoQueryConfig" : [
				{
					"VarInfoFile" : "AutoQueryConfig1_9666511667548080484856539A224109.json",
					"Interval" : 300,
					"Delay" : 20,
					"QueryCode" : -100,
					"Condition" : {"CPNName" : "W"}
				},
				{
					"VarInfoFile" : "AutoQueryConfig2_9666511667548080484856539A224109.json",
					"Interval" : 60,
					"Delay" : 40,
					"QueryCode" : 9999,
					"Condition" : {"CPNType" : "0x15"}
				}
			]
		}
	],

	"MqttCtlEnable" : 1,
	"MqttCtlServerAddr" : "{{.DATA_SERVER_MQTT_ADDR}}",
	"MqttCtlServerPort" : {{.DATA_SERVER_MQTT_PORT}},
	"MqttCtlList" : [
		{
			"ClientID" : "{{.DATA_SERVER_MQTT_CLIENT_ID}}",
			"SetTopic" : "{{.DATA_SERVER_MQTT_REQUEST_TOPIC}}",
			"DataTopic" : "{{.DATA_SERVER_MQTT_RESPONSE_TOPIC}}",
			"ProjectID" : "default"
		}
	],

	"DevSendTimeout" : 6000,
	"DevResendTimeout" : 550,
	"DevResendCount" : 1,
    "TCPServerKeepAliveInterval" : 30,
	"TCPServerBandwidthLimit" : 0,
	"MqttBandwidthLimit" : 0,
    "MaxQueueLength" : 2000,
	"CpnNameEncodeMode":0,
	"DebugInfo" : 0,
	"TimeSetInterval" : 300,
	"Plugins" : ["LynkrosJsonParserPlugin_AppBase", "LynkrosJsonParserPlugin_CarData"]
}
