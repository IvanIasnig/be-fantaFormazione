import express from "express";
import playerRoutes from "./routes/playerRoutes";
import { prisma } from "./lib/db";
import { importPlayersFromApi } from "./services/playerImportService";

const app = express();
app.use(express.json());
app.use("/players", playerRoutes);

const PORT = 3000;

app.listen(PORT, async () => {
  console.log(`🚀 Server attivo su http://localhost:${PORT}`);

  try {
    console.log("📥 Avvio import giocatori da API...");
    await importPlayersFromApi();
    console.log("✅ Import completato con successo!");
  } catch (err) {
    console.error("❌ Errore durante l'import:", err);
  } finally {
    await prisma.$disconnect();
  }
});
