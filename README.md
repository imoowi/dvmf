# dvmf
Distribute variables into multiple files
## Install
```go
go install github.com/imoowi/dvmf@latest
```
## Usage
Go to example folder, and then exec shell below
```sh
dvmf env
//or
dvmf env -c config.env
2025/01/24 14:30:07 project-one\config\settings.tpl => project-one\config\settings.yml
2025/01/24 14:30:07 project-two\jsonparser_config.tpl => project-two\jsonparser_config.json
2025/01/24 14:30:07 project-4\config\settings.tpl => project-4\config\settings.yml
2025/01/24 14:30:07 project-3\config\settings.tpl => project-3\config\settings.yml
```