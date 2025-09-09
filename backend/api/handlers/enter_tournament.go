package handlers

import (
	"encoding/json"
	"net/http"

	"clash-tourney.com/db"
)

func EnterTournamentHandler(queries *db.Queries) http.HandlerFunc {
	return func(w http.ResponseWriter, r *http.Request) {
		// Placeholder implementation
		// In a real implementation, you would parse the request body
		// to get user and tournament details.

		// Example: Create a new player
		player, err := queries.CreatePlayer(r.Context(), db.CreatePlayerParams{
			// Fill with actual data from request
			
		})

		

		if err != nil {
			http.Error(w, "Failed to create player", http.StatusInternalServerError)
			return
		}

		w.WriteHeader(http.StatusCreated)
		json.NewEncoder(w).Encode(player)
	}
}
