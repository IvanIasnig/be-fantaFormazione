/*
  Warnings:

  - You are about to drop the column `assists` on the `Player` table. All the data in the column will be lost.
  - You are about to drop the column `goals` on the `Player` table. All the data in the column will be lost.
  - You are about to drop the column `position` on the `Player` table. All the data in the column will be lost.
  - You are about to drop the column `team` on the `Player` table. All the data in the column will be lost.
  - You are about to drop the column `totalPoints` on the `Player` table. All the data in the column will be lost.

*/
-- CreateTable
CREATE TABLE "Statistic" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "playerId" INTEGER NOT NULL,
    "teamId" INTEGER,
    "teamName" TEXT,
    "teamLogo" TEXT,
    "leagueId" INTEGER,
    "leagueName" TEXT,
    "leagueCountry" TEXT,
    "leagueLogo" TEXT,
    "leagueFlag" TEXT,
    "leagueSeason" INTEGER,
    "gamesAppearences" INTEGER,
    "gamesLineups" INTEGER,
    "gamesMinutes" INTEGER,
    "gamesNumber" INTEGER,
    "gamesPosition" TEXT,
    "gamesRating" TEXT,
    "gamesCaptain" BOOLEAN,
    "subsIn" INTEGER,
    "subsOut" INTEGER,
    "subsBench" INTEGER,
    "shotsTotal" INTEGER,
    "shotsOn" INTEGER,
    "goalsTotal" INTEGER,
    "goalsConceded" INTEGER,
    "goalsAssists" INTEGER,
    "goalsSaves" INTEGER,
    "passesTotal" INTEGER,
    "passesKey" INTEGER,
    "passesAccuracy" INTEGER,
    "tacklesTotal" INTEGER,
    "tacklesBlocks" INTEGER,
    "tacklesInterceptions" INTEGER,
    "duelsTotal" INTEGER,
    "duelsWon" INTEGER,
    "dribblesAttempts" INTEGER,
    "dribblesSuccess" INTEGER,
    "dribblesPast" INTEGER,
    "foulsDrawn" INTEGER,
    "foulsCommitted" INTEGER,
    "cardsYellow" INTEGER,
    "cardsYellowRed" INTEGER,
    "cardsRed" INTEGER,
    "penaltyWon" INTEGER,
    "penaltyCommited" INTEGER,
    "penaltyScored" INTEGER,
    "penaltyMissed" INTEGER,
    "penaltySaved" INTEGER,
    CONSTRAINT "Statistic_playerId_fkey" FOREIGN KEY ("playerId") REFERENCES "Player" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Player" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "apiId" INTEGER NOT NULL,
    "name" TEXT NOT NULL,
    "firstname" TEXT,
    "lastname" TEXT,
    "age" INTEGER,
    "birthDate" TEXT,
    "birthPlace" TEXT,
    "birthCountry" TEXT,
    "nationality" TEXT,
    "height" TEXT,
    "weight" TEXT,
    "injured" BOOLEAN,
    "photo" TEXT,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL
);
INSERT INTO "new_Player" ("apiId", "id", "name", "updatedAt") SELECT "apiId", "id", "name", "updatedAt" FROM "Player";
DROP TABLE "Player";
ALTER TABLE "new_Player" RENAME TO "Player";
CREATE UNIQUE INDEX "Player_apiId_key" ON "Player"("apiId");
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;
