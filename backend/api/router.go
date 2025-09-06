package api

import (
	"encoding/json"
	"net/http"

	"clash-tourney.com/api/handlers"
	"clash-tourney.com/db"
	"github.com/gorilla/mux"
)

func NewRouter(queries *db.Queries) *mux.Router {
	router := mux.NewRouter()

	apiRouter := router.PathPrefix("/api").Subrouter()

	apiRouter.HandleFunc("/health", func(w http.ResponseWriter, r *http.Request) {
		// an example API handler
		json.NewEncoder(w).Encode(map[string]bool{"ok": true})
	})

	apiRouter.HandleFunc("/tournaments", handlers.SetupTournamentHandler(queries)).Methods("POST")
	apiRouter.HandleFunc("/tournaments/{id}/enter", handlers.EnterTournamentHandler(queries)).Methods("POST")
	apiRouter.HandleFunc("/games/{id}", handlers.UpdateGameHandler(queries)).Methods("PUT")

	return router
}
