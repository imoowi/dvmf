application: # dev开发环境 test测试环境 prod线上环境
  mode: dev
  name: lynkros-monitor # 服务名称
server:
  host: 0.0.0.0 # 服务器ip，默认使用 0.0.0.0
  port: {{.MONITOR_SERVER_PORT}} # 服务端口号
  readtimeout: 600 # 读超时时间
  writertimeout: 600 # 写超时时间
logger:
  path: runtime/logs/log # 日志存放路径
  stdout: "" # 日志输出，file：文件，default：命令行，其他：命令行
  level: trace # 日志等级, trace, debug, info, warn, error, fatal
  maxAge: 168h # 日志最长保存时间，7天, ns、us、ms、s、m、h
  rotationTime: 24h # 日志切割级别
ratelimit:
  # 每秒放多少个令牌
  cap: 1000
  # 每秒取多少个令牌
  quantum: 1000
jwt:
  secret: {{.JWT_SECRET}} # token 密钥，生产环境时及的修改
  timeout: 2h0m0s # token 过期时间 格式：0h0m0s
  refresh_token_timeout: 0h5m0s # token 过期时间减去的时间，用于刷新token
mysql:
  dsn: {{.MYSQL_USER}}:{{.MYSQL_PASSWORD}}@tcp({{.MYSQL_HOST}}:{{.MYSQL_PORT}})/{{.MONITOR_SERVER_MYSQL_DB_NAME}}?charset=utf8mb4&parseTime=True&loc=Local&timeout=1000ms
  casbin: {{.MYSQL_USER}}:{{.MYSQL_PASSWORD}}@tcp({{.MYSQL_HOST}}:{{.MYSQL_PORT}})/{{.MONITOR_SERVER_MYSQL_DB_NAME}}
redis:
  addr: {{.REDIS_HOST}}:{{.REDIS_PORT}}
  password: "{{.REDIS_PASSWORD}}"
  db: {{.REDIS_DB}}
cache:
  driver: redis
  prefix: "lynkros-monitor:cache"
dataserver:
  url: "http://{{.DATA_SERVER_HOST}}:{{.DATA_SERVER_PORT}}"
  appID: "lynkros"
  appSecret: "Ly2n0k2r2o#s@bim"
assets:
  baseDir: "assets/"
  uploadDir: "assets/upload"
  uploadProjectDir: "assets/upload/project"
export:
  path: "assets/export"
history:
  connection: influxdb
  query:
    # 查询频率，单位分钟 m
    frequency: 10
  connections:
    influxdb:
      type: influxdb
      addr: http://{{.INFLUXDB_HOST}}:{{.INFLUXDB_PORT}}
      token: {{.INFLUXDB_TOKEN}}
      org: {{.INFLUXDB_ORG}}
      bucket: {{.MONITOR_SERVER_INFLUXDB_BUCKET}}
      testSwitchOn: false
      logLevel: {{.MONITOR_SERVER_INFLUXDB_LOG_LEVEL}}

#中台地址  
service-center:
  addr: http://{{.SERVICE_CENTER_HOST}}:{{.SERVICE_CENTER_PORT}}
  client:
    appId: lynkros-monitor
    appSecret: Ly2n0k2r2o#s@bim2024