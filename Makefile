SHELL := /bin/bash
export cwd = $(shell pwd)
export RATOOLS_DIR = ~/Installs/RATools-v1.15.0
export RALIBRETRO_DIR = ~/Installs/RALibretro-x64
export GAME_ID = 4111

compile:
	touch ${RALIBRETRO_DIR}/RACache/Data/${GAME_ID}.json
	wine ${RATOOLS_DIR}/rascript-cli.exe -i ${GAME_ID}.rascript -o ${RALIBRETRO_DIR}

notes:
	cd .github/ && go get -t ./... && go run main.go > ${RALIBRETRO_DIR}/RACache/Data/4111-Notes.json