import { Request, Response } from "express";
import { importPlayersFromApi } from "../services/playerImportService";

export async function importPlayers(req: Request, res: Response) {
  try {
    await importPlayersFromApi();
    res.json({ message: "Import completato con successo ✅" });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: "Errore durante l'import dei giocatori" });
  }
}
