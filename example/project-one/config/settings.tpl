appclient:
  config:
    addr: config/appclient.json
    #签名过期时间，毫秒级
    outoftime: 10000
  #ip白名单
  whiteip:
    - 172.17.0.1
    - 172.17.0.10
    - 172.17.0.0/24
    - ::0/24
    - ::1
  #ip黑名单
  blackip:
    - null
application:
    can_write_history: true
    mode: dev
    name: lynkros-data-server
cache:
    default_expire_time: 60
    driver: redis
    prefix: lynkros-data-server:cache
cors:
    allow: http://localhost:5173
cpn:
    config:
        addr: config/cpn
        control_feedbak_var: config/models/param/control-feedback-map.json
        transform: on
        transformapp: config/transform/app
        transformcpn: config/transform/cpn
        transformcpnmap: config/transform/cpnmap
        transformtype: config/transform/type
        versionchange: config/models/config.json
        mapping: config/models/rules
        cpndata: config/models/cpn/allcpn.json
        cpndatadir: config/models/cpn
        standardFileDir: config/models/standardfiles
        standard: config/models/standardfiles/v1
        originstand: config/models/standardfiles/v0
        origincpn: config/origin/cpn
        origincpnmap: config/origin/cpnmap
        originapp: config/origin/app  
        origintype: config/origin/type
        needtrans: config/models/needtrans
        controlspecial: config/models/param/control-special.json
        control-pattern: config/models/param/control-pattern.json
        cmd_msg_max_resend_times: 5
        cmd_msg_return_timeout: 5
        can_set: true
        
        
    query:
        by_cpn_switch: true
        # 需要按单个CPN发送请求的CPN类型
        by_cpn_in_cpn_types:
            - "0x10"
        init:
            twice_cmd_sleep_seconds: 5
        timeout: 30s
    sendto:
        - cpn_cpuid: 1466511656668680484852510C97020C
          type: 1
    set:
        sleep_before_2nd_query: 2
globalcache:
    exclude_path_reg:
        - /api/v1/data/version
        - /api/v1/data/history/getByParams
        - /api/v1/data/control/setByCpnNameAndParams
        - /api/v1/data/control/setAllByAppParams
        - /api/v1/data/control/setByCpnTypeAndParams
    expire_duration: 5
    purge_expired_per_min: 10
    switch: "off"
history:
    connection: influxdb
    connections:
        influxdb:
            addr: http://{{.INFLUXDB_HOST}}:{{.INFLUXDB_PORT}}
            bucket: {{.DATA_SERVER_INFLUXDB_BUCKET}}
            loglevel: 1
            org: {{.INFLUXDB_ORG}}
            testswitchon: false
            token: {{.INFLUXDB_TOKEN}}
            type: influxdb
    query:
        frequency: 10
jwt:
    refresh_token_timeout: 0h5m0s
    secret: {{.JWT_SECRET}} 
    timeout: 2h0m0s
logger:
    level: trace
    maxage: 168h
    mqtt_log_level: trace
    path: runtime/logs/log
    rotationtime: 24h
    stdout: ""
mqtt:
    addr: {{.DATA_SERVER_MQTT_ADDR}}
    clientid: {{.DATA_SERVER_MQTT_CLIENT_ID}}
    debug: false
    insecureskipverify: "yes"
    max_packet_size: 1
    mock: "off"
    password: {{.DATA_SERVER_MQTT_PASSWORD}}
    port: {{.DATA_SERVER_MQTT_PORT}}
    recvfrom: {{.DATA_SERVER_MQTT_RECVFROM}}
    requesttopic: {{.DATA_SERVER_MQTT_REQUEST_TOPIC}}
    responsetopic: {{.DATA_SERVER_MQTT_RESPONSE_TOPIC}}
    type: tcp
    username: {{.DATA_SERVER_MQTT_USERNAME}}
ratelimit:
    cap: 1000
    quantum: 1000
redis:
    addr: {{.REDIS_HOST}}:{{.REDIS_PORT}}
    db: {{.REDIS_DB}}
    password: {{.REDIS_PASSWORD}}
server:
    host: 0.0.0.0
    port: {{.DATA_SERVER_PORT}}
    readtimeout: 600
    writertimeout: 600
