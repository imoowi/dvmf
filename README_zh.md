# dvmf
将变量分布到多个文件中.  [[English]](README.md)

## 安装
```go
go install github.com/imoowi/dvmf@latest
```
## 使用
进入example文件夹，运行以下命令
```sh
dvmf env
//or
dvmf env -c config.env
2025/01/24 14:30:07 project-one\config\settings.tpl => project-one\config\settings.yml
2025/01/24 14:30:07 project-two\jsonparser_config.tpl => project-two\jsonparser_config.json
2025/01/24 14:30:07 project-4\config\settings.tpl => project-4\config\settings.yml
2025/01/24 14:30:07 project-3\config\settings.tpl => project-3\config\settings.yml
```