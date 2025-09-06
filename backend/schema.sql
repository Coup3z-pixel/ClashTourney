-- SQL Schema for ClashTourneyDB
-- Enable extension for UUID generation (optional but useful)
CREATE EXTENSION IF NOT EXISTS "pgcrypto";

-- Player Table
CREATE TABLE Player (
    userId UUID PRIMARY KEY DEFAULT gen_random_uuid(),
	userName VARCHAR(255) NOT NULL,
    userTag VARCHAR(255) UNIQUE NOT NULL,
	passwordHash TEXT NOT NULL
);

-- Tournament Table
CREATE TABLE Tournament (
    tournamentId UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    entryFee DECIMAL(10, 2)
);

-- Game Table
CREATE TABLE Game (
    gameId UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    title VARCHAR(255),
    player1Id UUID,
    player2Id UUID,
    tournamentId UUID,
    FOREIGN KEY (player1Id) REFERENCES Player(userId),
    FOREIGN KEY (player2Id) REFERENCES Player(userId),
    FOREIGN KEY (tournamentId) REFERENCES Tournament(tournamentId)
);
