package api

import (
	"database/sql"
	"encoding/json"
	"net/http"

	"clash-tourney.com/api/handlers"
	"github.com/gorilla/mux"
)

func NewRouter(db *sql.DB) *mux.Router {
	router := mux.NewRouter()

	apiRouter := router.PathPrefix("/api").Subrouter()

	apiRouter.HandleFunc("/health", func(w http.ResponseWriter, r *http.Request) {
		// an example API handler
		json.NewEncoder(w).Encode(map[string]bool{"ok": true})
	})

	apiRouter.HandleFunc("/tournaments", handlers.SetupTournamentHandler(db)).Methods("POST")
	apiRouter.HandleFunc("/tournaments/{id}/enter", handlers.EnterTournamentHandler(db)).Methods("POST")
	apiRouter.HandleFunc("/games/{id}", handlers.UpdateGameHandler(db)).Methods("PUT")

	return router
}
