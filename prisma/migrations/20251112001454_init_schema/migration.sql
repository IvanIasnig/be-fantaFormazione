/*
  Warnings:

  - You are about to drop the column `cardsRed` on the `Statistic` table. All the data in the column will be lost.
  - You are about to drop the column `cardsYellow` on the `Statistic` table. All the data in the column will be lost.
  - You are about to drop the column `cardsYellowRed` on the `Statistic` table. All the data in the column will be lost.
  - You are about to drop the column `dribblesAttempts` on the `Statistic` table. All the data in the column will be lost.
  - You are about to drop the column `dribblesPast` on the `Statistic` table. All the data in the column will be lost.
  - You are about to drop the column `dribblesSuccess` on the `Statistic` table. All the data in the column will be lost.
  - You are about to drop the column `duelsTotal` on the `Statistic` table. All the data in the column will be lost.
  - You are about to drop the column `duelsWon` on the `Statistic` table. All the data in the column will be lost.
  - You are about to drop the column `foulsCommitted` on the `Statistic` table. All the data in the column will be lost.
  - You are about to drop the column `foulsDrawn` on the `Statistic` table. All the data in the column will be lost.
  - You are about to drop the column `gamesAppearences` on the `Statistic` table. All the data in the column will be lost.
  - You are about to drop the column `gamesCaptain` on the `Statistic` table. All the data in the column will be lost.
  - You are about to drop the column `gamesLineups` on the `Statistic` table. All the data in the column will be lost.
  - You are about to drop the column `gamesMinutes` on the `Statistic` table. All the data in the column will be lost.
  - You are about to drop the column `gamesNumber` on the `Statistic` table. All the data in the column will be lost.
  - You are about to drop the column `gamesPosition` on the `Statistic` table. All the data in the column will be lost.
  - You are about to drop the column `gamesRating` on the `Statistic` table. All the data in the column will be lost.
  - You are about to drop the column `goalsAssists` on the `Statistic` table. All the data in the column will be lost.
  - You are about to drop the column `goalsConceded` on the `Statistic` table. All the data in the column will be lost.
  - You are about to drop the column `goalsSaves` on the `Statistic` table. All the data in the column will be lost.
  - You are about to drop the column `goalsTotal` on the `Statistic` table. All the data in the column will be lost.
  - You are about to drop the column `leagueCountry` on the `Statistic` table. All the data in the column will be lost.
  - You are about to drop the column `leagueFlag` on the `Statistic` table. All the data in the column will be lost.
  - You are about to drop the column `leagueLogo` on the `Statistic` table. All the data in the column will be lost.
  - You are about to drop the column `leagueName` on the `Statistic` table. All the data in the column will be lost.
  - You are about to drop the column `leagueSeason` on the `Statistic` table. All the data in the column will be lost.
  - You are about to drop the column `passesAccuracy` on the `Statistic` table. All the data in the column will be lost.
  - You are about to drop the column `passesKey` on the `Statistic` table. All the data in the column will be lost.
  - You are about to drop the column `passesTotal` on the `Statistic` table. All the data in the column will be lost.
  - You are about to drop the column `penaltyCommited` on the `Statistic` table. All the data in the column will be lost.
  - You are about to drop the column `penaltyMissed` on the `Statistic` table. All the data in the column will be lost.
  - You are about to drop the column `penaltySaved` on the `Statistic` table. All the data in the column will be lost.
  - You are about to drop the column `penaltyScored` on the `Statistic` table. All the data in the column will be lost.
  - You are about to drop the column `penaltyWon` on the `Statistic` table. All the data in the column will be lost.
  - You are about to drop the column `shotsOn` on the `Statistic` table. All the data in the column will be lost.
  - You are about to drop the column `shotsTotal` on the `Statistic` table. All the data in the column will be lost.
  - You are about to drop the column `subsBench` on the `Statistic` table. All the data in the column will be lost.
  - You are about to drop the column `subsIn` on the `Statistic` table. All the data in the column will be lost.
  - You are about to drop the column `subsOut` on the `Statistic` table. All the data in the column will be lost.
  - You are about to drop the column `tacklesBlocks` on the `Statistic` table. All the data in the column will be lost.
  - You are about to drop the column `tacklesInterceptions` on the `Statistic` table. All the data in the column will be lost.
  - You are about to drop the column `tacklesTotal` on the `Statistic` table. All the data in the column will be lost.
  - You are about to drop the column `teamLogo` on the `Statistic` table. All the data in the column will be lost.
  - You are about to drop the column `teamName` on the `Statistic` table. All the data in the column will be lost.
  - Added the required column `updatedAt` to the `Statistic` table without a default value. This is not possible if the table is not empty.
  - Made the column `leagueId` on table `Statistic` required. This step will fail if there are existing NULL values in that column.
  - Made the column `teamId` on table `Statistic` required. This step will fail if there are existing NULL values in that column.

*/
-- CreateTable
CREATE TABLE "Team" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "apiId" INTEGER NOT NULL,
    "name" TEXT NOT NULL,
    "logo" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "League" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "apiId" INTEGER NOT NULL,
    "name" TEXT NOT NULL,
    "country" TEXT NOT NULL,
    "logo" TEXT NOT NULL,
    "flag" TEXT NOT NULL,
    "season" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "Games" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "statisticId" INTEGER NOT NULL,
    "appearences" INTEGER,
    "lineups" INTEGER,
    "minutes" INTEGER,
    "number" INTEGER,
    "position" TEXT,
    "rating" TEXT,
    "captain" BOOLEAN,
    CONSTRAINT "Games_statisticId_fkey" FOREIGN KEY ("statisticId") REFERENCES "Statistic" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Substitutes" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "statisticId" INTEGER NOT NULL,
    "in_" INTEGER,
    "out" INTEGER,
    "bench" INTEGER,
    CONSTRAINT "Substitutes_statisticId_fkey" FOREIGN KEY ("statisticId") REFERENCES "Statistic" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Shots" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "statisticId" INTEGER NOT NULL,
    "total" INTEGER,
    "onTarget" INTEGER,
    CONSTRAINT "Shots_statisticId_fkey" FOREIGN KEY ("statisticId") REFERENCES "Statistic" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Goals" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "statisticId" INTEGER NOT NULL,
    "total" INTEGER,
    "conceded" INTEGER,
    "assists" INTEGER,
    "saves" INTEGER,
    CONSTRAINT "Goals_statisticId_fkey" FOREIGN KEY ("statisticId") REFERENCES "Statistic" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Passes" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "statisticId" INTEGER NOT NULL,
    "total" INTEGER,
    "key" INTEGER,
    "accuracy" INTEGER,
    CONSTRAINT "Passes_statisticId_fkey" FOREIGN KEY ("statisticId") REFERENCES "Statistic" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Tackles" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "statisticId" INTEGER NOT NULL,
    "total" INTEGER,
    "blocks" INTEGER,
    "interceptions" INTEGER,
    CONSTRAINT "Tackles_statisticId_fkey" FOREIGN KEY ("statisticId") REFERENCES "Statistic" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Duels" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "statisticId" INTEGER NOT NULL,
    "total" INTEGER,
    "won" INTEGER,
    CONSTRAINT "Duels_statisticId_fkey" FOREIGN KEY ("statisticId") REFERENCES "Statistic" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Dribbles" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "statisticId" INTEGER NOT NULL,
    "attempts" INTEGER,
    "success" INTEGER,
    "past" INTEGER,
    CONSTRAINT "Dribbles_statisticId_fkey" FOREIGN KEY ("statisticId") REFERENCES "Statistic" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Fouls" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "statisticId" INTEGER NOT NULL,
    "drawn" INTEGER,
    "committed" INTEGER,
    CONSTRAINT "Fouls_statisticId_fkey" FOREIGN KEY ("statisticId") REFERENCES "Statistic" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Cards" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "statisticId" INTEGER NOT NULL,
    "yellow" INTEGER,
    "yellowred" INTEGER,
    "red" INTEGER,
    CONSTRAINT "Cards_statisticId_fkey" FOREIGN KEY ("statisticId") REFERENCES "Statistic" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Penalty" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "statisticId" INTEGER NOT NULL,
    "won" INTEGER,
    "commited" INTEGER,
    "scored" INTEGER,
    "missed" INTEGER,
    "saved" INTEGER,
    CONSTRAINT "Penalty_statisticId_fkey" FOREIGN KEY ("statisticId") REFERENCES "Statistic" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Statistic" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "playerId" INTEGER NOT NULL,
    "teamId" INTEGER NOT NULL,
    "leagueId" INTEGER NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL,
    CONSTRAINT "Statistic_playerId_fkey" FOREIGN KEY ("playerId") REFERENCES "Player" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Statistic_teamId_fkey" FOREIGN KEY ("teamId") REFERENCES "Team" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Statistic_leagueId_fkey" FOREIGN KEY ("leagueId") REFERENCES "League" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Statistic" ("id", "leagueId", "playerId", "teamId") SELECT "id", "leagueId", "playerId", "teamId" FROM "Statistic";
DROP TABLE "Statistic";
ALTER TABLE "new_Statistic" RENAME TO "Statistic";
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;

-- CreateIndex
CREATE UNIQUE INDEX "Team_apiId_key" ON "Team"("apiId");

-- CreateIndex
CREATE UNIQUE INDEX "League_apiId_key" ON "League"("apiId");

-- CreateIndex
CREATE UNIQUE INDEX "Games_statisticId_key" ON "Games"("statisticId");

-- CreateIndex
CREATE UNIQUE INDEX "Substitutes_statisticId_key" ON "Substitutes"("statisticId");

-- CreateIndex
CREATE UNIQUE INDEX "Shots_statisticId_key" ON "Shots"("statisticId");

-- CreateIndex
CREATE UNIQUE INDEX "Goals_statisticId_key" ON "Goals"("statisticId");

-- CreateIndex
CREATE UNIQUE INDEX "Passes_statisticId_key" ON "Passes"("statisticId");

-- CreateIndex
CREATE UNIQUE INDEX "Tackles_statisticId_key" ON "Tackles"("statisticId");

-- CreateIndex
CREATE UNIQUE INDEX "Duels_statisticId_key" ON "Duels"("statisticId");

-- CreateIndex
CREATE UNIQUE INDEX "Dribbles_statisticId_key" ON "Dribbles"("statisticId");

-- CreateIndex
CREATE UNIQUE INDEX "Fouls_statisticId_key" ON "Fouls"("statisticId");

-- CreateIndex
CREATE UNIQUE INDEX "Cards_statisticId_key" ON "Cards"("statisticId");

-- CreateIndex
CREATE UNIQUE INDEX "Penalty_statisticId_key" ON "Penalty"("statisticId");
