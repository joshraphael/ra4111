package main

import (
	"encoding/json"
	"fmt"
	"os"

	"github.com/joshraphael/go-retroachievements"
	"github.com/joshraphael/go-retroachievements/models"
)

func main() {
	client := retroachievements.New(retroachievements.ClientConfig{
		Host:      retroachievements.RetroAchievementHost,
		UserAgent: "go-retroachievements/v1.0.0",
	})
	notes, err := client.GetCodeNotes(models.GetCodeNotesParameters{
		GameID: 4111,
	})
	if err != nil {
		os.Exit(1)
		fmt.Println("error getting code notes")
		return
	}

	jsonNotes, err := json.Marshal(notes.CodeNotes)
	if err != nil {
		os.Exit(1)
		fmt.Println("error converting code notes to json")
		return
	}

	fmt.Println(string(jsonNotes))
}
