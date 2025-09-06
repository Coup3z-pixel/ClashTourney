package handlers

import (
	"encoding/json"
	"math/big"
	"net/http"

	"clash-tourney.com/db"
	"github.com/jackc/pgx/v5/pgtype"
)

func SetupTournamentHandler(queries *db.Queries) http.HandlerFunc {
	return func(w http.ResponseWriter, r *http.Request) {
		// Placeholder implementation
		// In a real implementation, you would parse the request body
		// to get tournament details.

		// Example: Create a new tournament
		tournament, err := queries.CreateTournament(r.Context(), pgtype.Numeric{
			Int: big.NewInt(10),
		})

		if err != nil {
			http.Error(w, "Failed to create tournament", http.StatusInternalServerError)
			return
		}

		w.WriteHeader(http.StatusCreated)
		json.NewEncoder(w).Encode(tournament)
	}
}
