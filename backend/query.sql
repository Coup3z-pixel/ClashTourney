-- SQL Queries for ClashTourneyDB Player Queries
-- Based on "Enter Tournament" and "Set up tournament" flows which involve players.

-- name: CreatePlayer :one
-- Inserts a new player into the Player table.
INSERT INTO Player (userName, userTag, password_hash) 
VALUES ($1, $2, crypt($3, gen_salt('bf', 8)))
RETURNING *;

-- name: VerifyPlayer :one
-- Checks for if username and pasword are right
SELECT (password_hash = crypt($2, password_hash)) AS password_match
FROM Player
WHERE userName = $1;

-- name: GetPlayerByUserTag :one
-- Retrieves a player by their unique userTag. Used to check if a player exists.
SELECT * FROM Player 
WHERE userTag = $1;

-- name: ListPlayers :many
-- Lists all players. Used in "Set up tournament" to get all participants.
SELECT * FROM Player;


-- Tournament Queries
-- Based on "Set up tournament" flow.

-- name: CreateTournament :one
-- Creates a new tournament.
INSERT INTO Tournament (entryFee) 
VALUES ($1) 
RETURNING *;

-- name: GetTournament :one
-- Retrieves a tournament by its ID.
SELECT * FROM Tournament 
WHERE tournamentId = $1;


-- Game Queries
-- Based on all flows: "Set up tournament" (creates games), "Enter Tournament" (returns a game), "Update Game" (updates game state).

-- name: CreateGame :one
-- Creates a new game for a tournament.
INSERT INTO Game (title, player1Id, player2Id, tournamentId) 
VALUES ($1, $2, $3, $4) 
RETURNING *;

-- name: GetGame :one
-- Retrieves a game by its ID.
SELECT * FROM Game 
WHERE gameId = $1;

-- name: UpdateGame :one
-- Updates a game's title, potentially to reflect the game's outcome.
UPDATE Game 
SET title = $2 
WHERE gameId = $1 
RETURNING *;

-- name: GetGamesByTournament :many
-- Retrieves all games associated with a specific tournament.
SELECT * FROM Game 
WHERE tournamentId = $1;
