package handlers

import (
	"database/sql"
	"net/http"
)

func UpdateGameHandler(db *sql.DB) http.HandlerFunc {
	return func(w http.ResponseWriter, r *http.Request) {
		// TODO: Implement handler
	}
}
