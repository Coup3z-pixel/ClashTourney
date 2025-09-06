-- SQL Schema for ClashTourneyDB

-- Player Table
CREATE TABLE Player (
    userId INT PRIMARY KEY,
    userTag VARCHAR(255) UNIQUE NOT NULL
);

-- Tournament Table
CREATE TABLE Tournament (
    tournamentId INT PRIMARY KEY,
    entryFee DECIMAL(10, 2)
);

-- Game Table
CREATE TABLE Game (
    gameId INT PRIMARY KEY,
    title VARCHAR(255),
    player1Id INT,
    player2Id INT,
    tournamentId INT,
    FOREIGN KEY (player1Id) REFERENCES Player(userId),
    FOREIGN KEY (player2Id) REFERENCES Player(userId),
    FOREIGN KEY (tournamentId) REFERENCES Tournament(tournamentId)
);
