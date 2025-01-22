package env

import (
	"bytes"
	"html/template"
	"log"
	"os"
	"path/filepath"
	"strings"

	"github.com/joho/godotenv"
)

func Do(configFile string) {
	if configFile == `` {
		configFile = `config.env`
	}
	envMap, err := godotenv.Read(configFile)
	if err != nil {
		log.Println(err.Error())
		return
	}
	// for key, value := range envMap {

	// 	log.Println(key, `=`, value)
	// }
	if tpl, ok := envMap[`TPL`]; ok {
		if target, ok2 := envMap[`TARGET`]; ok2 {
			// log.Println(`TPL:`, tpl)
			tpls := strings.Split(tpl, `,`)
			// log.Println(`tpls=`, tpls)
			targets := strings.Split(target, `,`)
			// log.Println(`targets=`, targets)
			if len(tpls) != len(targets) {
				log.Println(`TPL and TARGET length not match`)
				return
			}
			for k, _tpl := range tpls {
				// tplk := envMap[_tpl]
				// log.Println(`tplk=`, k, tplk)
				// log.Println(`targetk=`, k, envMap[targets[k]])
				genConfigFile(envMap[`ROOT`], envMap[_tpl], envMap[targets[k]], envMap)
			}
		} else {
			log.Println(`TARGET not found`)
			return
		}

	} else {
		log.Println(`TPL not found`)
	}
}

func genConfigFile(Root, tpl, tartet string, data map[string]string) {
	tplPath := filepath.Join(Root, tpl)
	// log.Println(`tplPath=`, tplPath)
	tartetPath := filepath.Join(Root, tartet)
	log.Println(tplPath, `=>`, tartetPath)
	tplBytes, err := os.ReadFile(tplPath)
	if err != nil {
		log.Println(err.Error())
		return
	}
	tplStr := string(tplBytes)
	t, err := template.New("template").Parse(tplStr)
	if err != nil {
		log.Fatal(err)
	}
	var doc bytes.Buffer
	err = t.Execute(&doc, data)
	if err != nil {
		log.Fatal(err)
	}
	err = os.WriteFile(tartetPath, doc.Bytes(), 0644)
	if err != nil {
		log.Println(`os.WriteFile`, err.Error())
		return
	}
}
