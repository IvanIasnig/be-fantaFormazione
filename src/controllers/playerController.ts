import { Request, Response } from "express";
import { importPlayersFromApi } from "../services/playerImportService";
import { prisma } from "../lib/db";

// --- funzione GET /players/:id/stats ---
export async function importPlayers(_: Request, res: Response) {
  try {
    await importPlayersFromApi();
    res.json({ message: "Import completato con successo" });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: "Errore durante l'import dei giocatori" });
  }
}

// --- funzione GET /players/:id/stats ---
export async function getPlayerStats(req: Request, res: Response) {
  const id = Number(req.params.id);

  try {
    const player = await prisma.player.findUnique({
      where: { id },
      include: {
        statistics: {
          include: {
            games: true,
            substitutes: true,
            shots: true,
            goals: true,
            passes: true,
            tackles: true,
            duels: true,
            dribbles: true,
            fouls: true,
            cards: true,
            penalty: true,
            team: true,
            league: true,
          },
        },
      },
    });

    if (!player) {
      return res.status(404).json({ error: "Giocatore non trovato" });
    }
    return res.json(player);
  } catch (err) {
    console.error(err);
    return res.status(500).json({ error: "Errore interno del server" });
  }
}
