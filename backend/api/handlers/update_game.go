package handlers

import (
	"encoding/json"
	"fmt"
	"io"
	"net/http"

	"clash-tourney.com/db"
)

type UpdateGameBody struct {
	PlayerOne string `json:"playerOne"`
	PlayerTwo string `json:"playerTwo"`
}

type Battle struct {
	Type string
}

type BattleList struct {
	Battles []Battle
}

func UpdateGameHandler(queries *db.Queries) http.HandlerFunc {
	return func(w http.ResponseWriter, r *http.Request) {
		// Placeholder implementation
		// In a real implementation, you would parse the request body
		// to get game details to update.

		var updateGameBody UpdateGameBody
		json.NewDecoder(r.Body).Decode(updateGameBody)

		playerBattleLogResp, err := http.Get(fmt.Sprintf("https://developer.clashroyale.com/players/%s/battlelog", &updateGameBody.PlayerOne))

		if err != nil {
		}

	
		if playerBattleLogResp.StatusCode != http.StatusOK {
			fmt.Printf("Unexpected status code: %d\n", playerBattleLogResp.StatusCode)
			return
		}
		
		defer playerBattleLogResp.Body.Close()

		playerBattleLog, err := io.ReadAll(playerBattleLogResp.Body)

		fmt.Printf("Response Body:\n%s\n", playerBattleLog)		

		// Example: Update a game
		game, err := queries.UpdateGame(r.Context(), db.UpdateGameParams{
			// Fill with actual data from request
		})
		if err != nil {
			http.Error(w, "Failed to update game", http.StatusInternalServerError)
			return
		}

		w.WriteHeader(http.StatusOK)
		json.NewEncoder(w).Encode(game)
	}
}
